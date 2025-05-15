<template>
    <section class="cart-section">
        <div class="cart-container">
            <h2>Giỏ Hàng</h2>
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Hình Ảnh</th>
                        <th>Sản Phẩm</th>
                        <th>Đơn Giá</th>
                        <th>Số Lượng</th>
                        <th>Tổng Cộng</th>
                        <th>Thao Tác</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Sản phẩm 1 -->
                    <tr v-for="(item, index) in data" :key="index">
                        <td>{{ index + 1 }}</td>
                        <td>
                            <img :src="'/src/assets/upload/' + item.image" alt="Bánh Ngọt 1" class="cart-product-img">
                        </td>
                        <td>
                            <p>{{ item.name }}</p>
                        </td>
                        <td>{{ (item.price).toLocaleString('vi-VN') }} ₫</td>
                        <td>
                            <div class="quantity">
                                <button class="qty-btn" @click="decreaseQty(item)">-</button>
                                <input type="number" :value="item.quantity" min="1">
                                <button class="qty-btn" @click="increaseQty(item)">+</button>
                            </div>
                        </td>
                        <td>{{ (item.price * item.quantity).toLocaleString('vi-VN') }} ₫</td>
                        <td>
                            <button class="remove-btn" @click="deleteProductCart(item)">Xóa</button>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="discount-code">
                <h4>Nhập mã giảm giá</h4>
                <div class="discount-input-group">
                    <input type="text" v-model="discount" placeholder="Nhập mã...">
                    <button class="apply-discount-btn" @click="addDiscount">Áp dụng</button>
                </div>
            </div>
            <div class="cart-summary">
                <p><strong>Tổng Tiền: </strong>{{ totalPrice.toLocaleString('vi-VN') }} ₫</p><button></button>
                <!-- <router-link :to="{ name: 'cart-pay' }" class="checkout-btn">Thanh Toán</router-link> -->
                <!-- <button class="checkout-btn" @click="updateStatus">Thanh Toán</button> -->
                 <router-link :to="{name: 'cart-pay'}" class="checkout-btn" disabled>Thanh toán</router-link>
            </div>
        </div>
    </section>
    <div id="toast" v-if="toastMessage" v-html="toastContent"></div>
    <!-- <input type="number" :value="item.quantity" min="1" @input="handleQuantityChange($event, item)"> -->

</template>
<script>
import { ref, onMounted, watch, reactive, computed } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router';

export default {
    setup() {
        const router = useRouter();
        const data = ref([]);
        const toastMessage = ref(false);
        const toastContent = ref("");
        const discount = ref('');
        // console.log(data.quantity);
        const user = JSON.parse(localStorage.getItem('user'));

        const getDataCart = () => {
            axios.get('http://127.0.0.1:8000/api/getdatatocart/' + user.id)
                .then((response) => {
                    console.log(response.data);

                    data.value = response.data;
                    updateOrder();
                })
                .catch((error) => {
                    console.log(error);
                })
        }
        const increaseQty = (item) => {
            item.quantity = Number(item.quantity);  // Đảm bảo quantity là số
            item.quantity++;
            axios.put(`http://127.0.0.1:8000/api/updateproductincart`, {
                order_code: item.id,
                product_code: item.product_id,
                quantity: item.quantity
            })
                .then(response => {
                    console.log('Cập nhật thành công:', response.data.message);
                })
                .catch(error => {
                    console.error('Lỗi khi cập nhật:', error);
                });
        };

        const decreaseQty = (item) => {
            if (item.quantity > 1) {
                item.quantity--;
                axios.put(`http://127.0.0.1:8000/api/updateproductincart`, {
                    order_code: item.id,
                    product_code: item.product_id,
                    quantity: item.quantity
                })
                    .then(response => {
                        console.log('Cập nhật thành công:', response.data.message);
                    })
                    .catch(error => {
                        console.error('Lỗi khi cập nhật:', error);
                    });
            }
        };
        // console.log(data.id.value);
        const deleteProductCart = (item) => {
            axios.delete('http://127.0.0.1:8000/api/deleteproductcart/' + item.id + '/' + item.product_id)
                .then((response) => {
                    console.log(response.data.message);
                    showToast('success', 'fas fa-check-circle', 'Thành Công', response.data.message);
                        setTimeout(() => {
                            toastMessage.value = false;
                            updateOrder();
                            location.reload();
                        }, 3000);
                })
                .catch((error) => {
                    console.log(error);
                })
        }
        const updateOrder = () => {
    const order_code = data.value[0].id;

        // Có sản phẩm trong giỏ hàng => cập nhật bình thường
        axios.put(`http://127.0.0.1:8000/api/updateorder/${order_code}`, {
            quantity: totalQuantity.value,
            total: totalPrice.value
        })
        .then(response => {
            console.log('Cập nhật đơn hàng thành công:', response.data);
        })
        .catch(error => {
            console.error('Lỗi cập nhật đơn hàng:', error);
        });

}

        const showToast = (type, icon, title, message) => {
            toastContent.value =
                `
                    <div class="toast toast--${type}">
                            <div class="toast__icon">
                                <i class="${icon}"></i>
                            </div>
                            <div class="toast__body">
                                <h3 class="toast__title">${title}</h3>
                                <p class="toast__msg">${message}</p>
                            </div>
                            <div class="toast__close" onclick="this.parentElement.remove()">
                                <i class="fa-solid fa-circle-xmark"></i>
                            </div>
                        </div>
                    `;
            toastMessage.value = true;
        }
        // const updateStatus = () => {
        //     const order_code = data.value[0].id;
        //     if (user && user.id) {
        //         axios.put('http://127.0.0.1:8000/api/updatestatus/' + order_code + '/' + user.id, {
        //             status: 'Chờ xác nhận'
        //         })
        //             .then((response) => {
        //                 showToast('success', 'fas fa-check-circle', 'Thành Công', response.data.message);
        //                 setTimeout(() => {
        //                     toastMessage.value = false;
        //                     router.push({ name: 'user-home' });
        //                 }, 3000);
        //             })
        //             .catch((error) => {
        //                 console.log(error);
        //                 showToast('error', 'fas fa-exclamation-circle', 'Lỗi', error.response.data.message);
        //                 setTimeout(() => {
        //                     toastMessage.value = false

        //                 }, 3000);
        //             })
        //     } else {
        //         showToast('error', 'fas fa-exclamation-circle', 'Thất bại', 'Vui lòng đăng nhập trước khi thanh toán.');
        //         setTimeout(() => {
        //             toastMessage.value = false
        //         }, 3000);
        //     }


        // }
        const addDiscount = () => {
            axios.put('');
        }
        const totalPrice = computed(() => {
            return data.value.reduce((sum, item) => {
                return sum + Number(item.price) * Number(item.quantity)
            }, 0)
        });
        const totalQuantity = computed(() => {
            return data.value.reduce((sum, item) => {
                return sum + Number(item.quantity);  // Đảm bảo item.quantity là số hợp lệ
            }, 0);
        });
        console.log("Total Quantity:", totalQuantity.value);
        onMounted(() => {
            getDataCart()
        });
        return {
            data,
            totalPrice,
            deleteProductCart,
            totalQuantity,
            // updateStatus,
            toastContent,
            toastMessage,
            // quantity,
            increaseQty,
            decreaseQty,
            discount,
            addDiscount,
        }
        //         const handleQuantityChange = (event, item) => {
        //     const newQty = Number(event.target.value);
        //     if (newQty >= 1) {
        //         item.quantity = newQty;
        //         // Gửi API cập nhật nếu cần
        //     }
        // }

    }
}

</script>