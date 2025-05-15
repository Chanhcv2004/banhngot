<template>
    <main class="product-detail-section">
        <div class="product-detail-container">
            <!-- Hình ảnh sản phẩm -->
            <div class="product-image">
                <img :src="'/src/assets/upload/' + product.image" alt="..." />
            </div>

            <!-- Thông tin sản phẩm -->
            <div class="product-info">
                <h1 class="product-title">{{ product.name }}</h1>
                <p class="product-price">Giá: <strong>{{ product.price }} ₫</strong> <span
                        style="text-decoration: line-through;">{{ Number(product.price) + 50000 }} ₫</span></p>
                <p class="product-description">
                    {{ product.description }}
                </p>

                <p class="product-description">Kho: <span>{{ product.quantity }}</span></p>
                <label for="quantity">Số lượng:</label>
                <div class="quantity">
                    <button class="qty-btn" @click="decreaseQty">-</button>
                    <input type="number" min="1" v-model="quantity" id="quantity" />
                    <button class="qty-btn" @click="increaseQty">+</button>

                </div>
                <button class="add-to-cart-btn" @click="addToCarted"><i class="fas fa-cart-plus"></i>
                    Thêm vào giỏ hàng
                </button>

            </div>
        </div>
        <!-- SẢN PHẨM LIÊN QUAN -->
        <section class="featured-products">
            <h2 class="section-title">Sản Phẩn Liên Quan</h2>
            <div class="product-list">
                <div class="product-card" v-for="(relatedproduct, index) in relatedProduct" :key="index">
                    <img :src="'/src/assets/upload/' + relatedproduct.image" alt="Bánh Kem Dâu">
                    <h3>{{ relatedproduct.name }}</h3>
                    <p class="price">{{ relatedproduct.price }}</p>
                    <router-link :to="{ name: 'product-detail', params: { id: relatedproduct.id } }"
                        @click.prevent="changePages(relatedproduct.id)" class="add-to-cart">Mua Ngay</router-link>
                </div>
            </div>
        </section>
        <hr>
        <!-- BÌNH LUẬN SẢN PHẨM -->
        <section class="product-comments">
            <h2 class="section-title">Bình Luận Sản Phẩm</h2>

            <!-- Danh sách bình luận -->
            <div class="comment-list">
                <div class="hasntcomment" v-if="commentsed < 1">
                    <p>Chưa có bình luận nào</p>
                </div>
                <div class="comment-item" v-else v-for="(comment, index) in commentsed" :key="index">
                    <p class="comment-author">
                        <i class="fas fa-user-circle"></i>
                        <strong>{{ comment.name }}</strong>
                    </p>
                    <p class="comment-date">{{ formatDate(comment.created_at) }}</p>
                    <p class="comment-text">{{ comment.content }}</p>
                </div>
            </div>

            <!-- Form nhập bình luận -->
            <form class="comment-form" @submit.prevent="sendComment" method="post">
                <label for="comment-text">Nội dung bình luận:</label>
                <textarea id="comment-text" name="comment" rows="4" v-model="content"
                    placeholder="Nhập bình luận của bạn..." required></textarea>

                <button type="submit">Gửi bình luận</button>
            </form>
        </section>
        <div id="toast" v-if="toastMessage" v-html="toastContent"></div>
    </main>
</template>
<script>
import { ref, onMounted, watch, reactive } from 'vue'
import axios from 'axios'
import { useRoute, useRouter } from 'vue-router';
export default {
    setup() {
        const user = JSON.parse(localStorage.getItem('user'));
        const product = ref({});
        const content = ref('');
        const relatedProduct = ref([]);
        const route = useRoute();
        const router = useRouter();
        const commentsed = ref([]);
        const toastMessage = ref(false);
        const toastContent = ref("");
        const quantity = ref(1);
        const addToCart = ref([]);
        const increaseQty = () => {
            quantity.value++;
        };

        const decreaseQty = () => {
            if (quantity.value > 1) {
                quantity.value--;
            }
        };
        // decreaseQty();
        // increaseQty();
        console.log("Số lượng là: " + quantity.value);
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

        const getProductbyId = () => {
            const productId = route.params.id;
            axios.get('http://127.0.0.1:8000/api/product/' + productId)
                .then((response) => {
                    // console.log(response);
                    product.value = response.data;
                })
                .catch((error) => {
                    console.log(error);
                })
        }
        const relateProduct = () => {
            const productId = route.params.id;
            axios.get('http://127.0.0.1:8000/api/relatedproduct/' + productId)
                .then((response) => {

                    relatedProduct.value = response.data.slice(0, 6);
                    // console.log(response);
                })
                .catch((error) => {
                    console.log(error);
                })
        }
        const sendComment = () => {
            const productId = route.params.id;
            if (user && user.id && productId) {  // Ensure user and user.id exist
                axios.post(`http://127.0.0.1:8000/api/sendcomment/${productId}/${user.id}`, {
                    content: content.value
                })
                    .then((response) => {
                        // console.log("Gửi bình luận thành công:", response);
                        content.value = '';
                        showToast('success', 'fas fa-check-circle', 'Thành Công', response.data.message);
                        setTimeout(() => {
                            toastMessage.value = false;
                            location.reload();
                        }, 3000);
                    })
                    .catch((error) => {
                        console.log("Lỗi khi gửi bình luận:", error);
                        showToast('error', 'fas fa-exclamation-circle', 'Lỗi', 'Có lỗi khi gửi bình luận.');
                        setTimeout(() => {
                            toastMessage.value = false
                        }, 3000);
                    });
            } else {
                console.log("Thiếu thông tin người dùng hoặc sản phẩm");
                showToast('error', 'fas fa-exclamation-circle', 'Thất bại', 'Vui lòng đăng nhập trước khi gửi bình luận.');
                setTimeout(() => {
                    toastMessage.value = false
                }, 3000);
            }
        }
        const addToCarted = async () => {
            const productId = route.params.id;

            if (user && user.id && productId) {
                try {
                    // Kiểm tra xem đã có giỏ hàng chưa
                    const cartRes = await axios.get(`http://127.0.0.1:8000/api/getCartByUser/${user.id}`);
                    let order = cartRes.data.data;

                    if (!order) {
                        // Nếu chưa có giỏ hàng, tạo mới giỏ hàng
                        const createRes = await axios.post(`http://127.0.0.1:8000/api/addCartByUser/${user.id}`);
                        order = createRes.data.data;
                    }

                    // Lấy thông tin sản phẩm
                    const getInfoProduct = await axios.get(`http://127.0.0.1:8000/api/product/${productId}`);
                    const productInfo = getInfoProduct.data;
                    console.log('sdsfs', productInfo.quantity);

                    // Kiểm tra xem sản phẩm đã có trong giỏ hàng chưa
                    const getProductDetail = await axios.get(`http://127.0.0.1:8000/api/getorderdetail/${order.id}`);
                    const productInCart = getProductDetail.data.find(item => item.product_code === parseInt(productId));

                    console.log("Số lượng hiện tại trong giỏ:", productInCart ? productInCart.quantity : 'Không có');
                    console.log("Số lượng thêm:", quantity.value);

                    if (productInCart) {
                        // Nếu sản phẩm đã có trong giỏ hàng, cập nhật số lượng
                        const updateItemRes = await axios.put('http://127.0.0.1:8000/api/updateproductincart', {
                            order_code: order.id,
                            product_code: productInfo.id,
                            quantity: productInCart.quantity + quantity.value,
                        });
                        console.log('Sản phẩm đã được cập nhật vào giỏ hàng:', updateItemRes.data);
                    } else {
                        // Nếu sản phẩm chưa có trong giỏ hàng, thêm mới
                        const addItemRes = await axios.post('http://127.0.0.1:8000/api/addproducttocart', {
                            order_code: order.id,
                            product_code: productInfo.id,
                            quantity: quantity.value,
                            price: productInfo.price,
                        });
                        console.log('Sản phẩm đã được thêm vào giỏ hàng:', addItemRes.data);
                    }

                    // Hiển thị thông báo thành công
                    showToast('success', 'fas fa-check-circle', 'Thành Công', 'Đã thêm vào giỏ hàng!');
                    setTimeout(() => (toastMessage.value = false), 3000);

                } catch (error) {
                    console.error(error);
                    showToast('error', 'fas fa-exclamation-circle', 'Lỗi', 'Không thể thêm vào giỏ hàng!');
                    setTimeout(() => (toastMessage.value = false), 3000);
                }
            } else {
                // Nếu người dùng chưa đăng nhập
                showToast('error', 'fas fa-user-slash', 'Thất bại', 'Vui lòng đăng nhập trước!');
                setTimeout(() => (toastMessage.value = false), 3000);
            }
        };


        console.log("àhafjk", product.value);
        const getCommented = () => {
            axios.get('http://127.0.0.1:8000/api/comment')
                .then((response) => {
                    // console.log(response);
                    const productId = parseInt(route.params.id);
                    const filteredComments = response.data.filter(comment => comment.product_code === productId);
                    // console.log(filteredComments);
                    // console.log(productId);
                    if (filteredComments.length > 0) {
                        commentsed.value = filteredComments;
                    } else {
                        commentsed.value = [];
                    }

                })
                .catch((error) => {
                    console.log(error);
                })
        }
        const changePages = (id) => {
    // Ngừng hành động mặc định của sự kiện và thực hiện chuyển trang sau 2 giây
        setTimeout(() => {
            router.push({ name: 'product-detail', params: { id: id } });
        }, 2000);
    }


        const formatDate = (dateString) => {
            const date = new Date(dateString);
            return date.toLocaleDateString('vi-VN', {
                day: '2-digit',
                month: '2-digit',
                year: 'numeric',
                hour: '2-digit',
                minute: '2-digit',
            });
        };
        onMounted(() => {
            getProductbyId();
            relateProduct();
            getCommented();
        });

        return {
            product,
            relatedProduct,
            content,
            sendComment,
            commentsed,
            formatDate,
            toastMessage,
            toastContent,
            quantity,
            increaseQty,
            decreaseQty,
            addToCarted,
            changePages,
        }
    }
}
</script>