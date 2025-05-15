<template>
    <section class="checkout-section">
        <div class="checkout-container">
            <h2>Thông Tin Thanh Toán</h2>
            <form action="#" method="POST" class="checkout-form" @submit.prevent="pays">
                <!-- Thông Tin Giao Hàng -->
                <h3>Thông Tin Giao Hàng</h3>
                <label for="id-order">Mã Đơn Hàng</label>
                <input type="text" id="id-order" name="full-name" :value="order_code" disabled>

                <label for="full-name">Họ và Tên:</label>
                <input type="text" id="full-name" name="full-name" v-model="name_user" required
                    placeholder="Nhập tên đầy đủ">

                <label for="address">Địa Chỉ:</label>
                <input type="text" id="address" name="address" v-model="address" required
                    placeholder="Nhập địa chỉ giao hàng">

                <label for="phone">Số Điện Thoại:</label>
                <input type="tel" id="phone" name="phone" v-model="phoneNumber" required
                    placeholder="Nhập số điện thoại">

                <!-- Phương Thức Thanh Toán -->
                <h3>Phương Thức Thanh Toán</h3>
                <label for="payment-method">Chọn Phương Thức:</label>
                <select id="payment-method" name="payment-method" v-model="payment_method" required>
                    <option value="Thanh Toán Khi Nhận Hàng">Thanh Toán Khi Nhận Hàng</option>
                    <option value="Paypal">Paypal</option>
                    <option value="Thẻ Tín Dụng">Thẻ Tín Dụng</option>
                </select>

                <!-- <div id="credit-card-info" class="payment-method-info" style="display:none;">
                    <label for="card-number">Số Thẻ Tín Dụng:</label>
                    <input type="text" id="card-number" name="card-number" placeholder="Nhập số thẻ" required>

                    <label for="expiry-date">Ngày Hết Hạn:</label>
                    <input type="month" id="expiry-date" name="expiry-date" required>

                    <label for="cvv">CVV:</label>
                    <input type="text" id="cvv" name="cvv" required placeholder="Nhập mã CVV">
                </div> -->

                <!-- Tóm Tắt Giỏ Hàng -->
                <h3>Tóm Tắt Đơn Hàng</h3>
                <table class="checkout-summary-table">
                    <tbody>
                        <tr>
                            <td><strong>Tổng Tiền:</strong></td>
                            <td>{{ new Intl.NumberFormat('vi-VN').format(totalPrice) }} ₫</td>
                        </tr>
                        <tr>
                            <td><strong>Phí Vận Chuyển:</strong></td>
                            <td>{{ new Intl.NumberFormat('vi-VN').format(shipping) }} ₫</td>
                        </tr>
                        <tr>
                            <td><strong>Giảm giá:</strong></td>
                            <td>0</td>
                        </tr>
                        <tr>
                            <td><strong>Tổng Cộng:</strong></td>
                            <td>{{ new Intl.NumberFormat('vi-VN').format(total_amount) }} ₫</td>
                        </tr>
                    </tbody>
                </table>

                <button type="submit" class="checkout-btn">Hoàn Tất Thanh Toán</button>
            </form>
        </div>
    </section>
    <div id="toast" v-if="toastMessage" v-html="toastContent"></div>
</template>
<script>
import { ref, onMounted, watch, reactive, computed } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router';
export default {
    setup() {
        const router = useRouter();
        const dataOrder = ref([]);
        const order_code = ref();
        const shipping = ref(30000);
        const name_user = ref("");
        const address = ref("");
        const phoneNumber = ref();
        const payment_method = ref("");
        const toastMessage = ref(false);
        const toastContent = ref("");

        const user = JSON.parse(localStorage.getItem('user'));

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
        const getDataCart = () => {
            axios.get('http://127.0.0.1:8000/api/getdatatocart/' + user.id)
                .then((response) => {
                    console.log(response.data);

                    dataOrder.value = response.data;

                    order_code.value = dataOrder.value[0].id;
                })
                .catch((error) => {
                    console.log(error);
                })
        }
        const pays = () => {
            const data = {
                order_code: dataOrder.value[0].id,
                name_user: name_user.value,
                address: address.value,
                phone: phoneNumber.value,
                payment_method: payment_method.value,
                total_amount: total_amount.value
            };
            console.log(data);
        
            axios.post('http://127.0.0.1:8000/api/addpay', data)
            .then((response) => {
                console.log(response.data.message);
                updateStatus();
                showToast('success', 'fas fa-check-circle', 'Thành Công', response.data.message);
                        setTimeout(() => {
                            toastMessage.value = false;
                            router.push({ name: 'user-home' });
                        }, 3000);
            })
            .catch((error) => {
                console.log(error);
                showToast('error', 'fas fa-exclamation-circle', 'Lỗi', 'Đơn hàng không tồn tại');
                        setTimeout(() => {
                            toastMessage.value = false

                        }, 3000);
            })
        }
        const updateStatus = () => {
            const order_code = dataOrder.value[0].id;
            console.log(order_code)
            if (user && user.id) {
                axios.put('http://127.0.0.1:8000/api/updatestatus/' + order_code + '/' + user.id, {
                    status: 'Chờ xác nhận'
                })
                    .then((response) => {
                        console.log(response);
                    })
                    .catch((error) => {
                        console.log(error);
                        
                    })
            }


        }
        const totalPrice = computed(() => {
            return dataOrder.value.reduce((sum, item) => {
                return sum + Number(item.price) * Number(item.quantity)
            }, 0)
        });
        const total_amount = computed(() => {
  return totalPrice.value + shipping.value;
});
        onMounted(() => {
            getDataCart()
        });
        return {
            order_code,
            totalPrice,
            shipping,
            name_user,
            address,
            phoneNumber,
            pays,
            total_amount,
            payment_method,
            toastContent,
            toastMessage,
        }
    }
}
</script>