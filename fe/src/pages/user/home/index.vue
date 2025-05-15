<template>
    <!-- slider -->
    <div class="slider-container">
        <div class="slider">
            <div class="slider-item" ref="sliderRef">
                <div class="slider-content">
                    <input type="text" class="search-bar" placeholder="Tìm kiếm sản phẩm...">
                    <button class="search-btn">Tìm kiếm</button>
                </div>
            </div>
        </div>
        <!-- <button class="prev" onclick="moveSlide(-1)">&#10094;</button>
        <button class="next" onclick="moveSlide(1)">&#10095;</button> -->
    </div>
    <!-- danh muc -->
    <div class="category-section">
        <h2 class="section-title">Danh Mục Bánh Ngọt</h2>
        <div class="category-list">
            <div class="category-item">
                <i class="fas fa-birthday-cake"></i>
                <p>Bánh Kem</p>
            </div>
            <div class="category-item">
                <i class="fas fa-cookie"></i>
                <p>Cookie</p>
            </div>
            <div class="category-item">
                <i class="fas fa-bread-slice"></i>
                <p>Bánh Mì Ngọt</p>
            </div>
            <div class="category-item">
                <i class="fas fa-gift"></i>
                <p>Quà Tặng</p>
            </div>
            <div class="category-item">
                <i class="fas fa-mug-hot"></i>
                <p>Đồ Uống</p>
            </div>
        </div>
    </div>
    <!-- SẢN PHẨM BÁN CHẠY -->
    <section class="featured-products">
        <h2 class="section-title">Bán Chạy Nhất</h2>
        <div class="product-list">
            <div class="product-card" v-for="(product, index) in products" :key="index">
                <img :src="'/src/assets/upload/' + product.image" alt="Bánh Kem Dâu">
                <h3>{{ product.name }}</h3>
                <p class="price">{{ product.price.toLocaleString('vi-VN') }} ₫</p>
                <router-link :to="'/product/detail/' + product.id" @click.prevent="changePages(product.id)"
                    class="add-to-cart">
                    Mua Ngay
                </router-link>
            </div>
        </div>
    </section>

    <!-- ƯU ĐÃI -->
    <section class="promotion-banner">
        <h2>Ưu Đãi Hôm Nay</h2>
        <p>Giảm ngay <strong>20%</strong> cho đơn hàng từ 200.000đ!</p>
        <a href="#" class="btn">Xem Ngay</a>
    </section>
    <!-- SẢN PHẨM HOT -->
    <section class="featured-products">
        <h2 class="section-title">Sản Phẩm Hot Nhất</h2>
        <div class="product-list">
            <div class="product-card" v-for="(product, index) in products" :key="index">
                <img :src="'/src/assets/upload/' + product.image" alt="Bánh Kem Dâu">
                <h3>{{ product.name }}</h3>
                <p class="price">{{ product.price }} ₫</p>
                <button @click="changePages(product.id)" class="add-to-cart">Mua Ngay</button>
            </div>
        </div>
    </section>


    <!-- CẢM NHẬN KHÁCH HÀNG -->
    <section class="testimonials">
        <h2 class="section-title">Khách hàng nói gì?</h2>
        <div class="testimonial-list">
            <div class="testimonial-card">
                <div class="user-info">
                    <i class="fas fa-user-circle"></i>
                    <h4>Linh Nguyễn</h4>
                </div>
                <p>"Bánh siêu ngon, nhân viên dễ thương, giao hàng đúng giờ!"</p>
            </div>
            <div class="testimonial-card">
                <div class="user-info">
                    <i class="fas fa-user-circle"></i>
                    <h4>Minh Anh</h4>
                </div>
                <p>"Tôi đặt sinh nhật cho bé, bánh đẹp và ăn rất vừa miệng."</p>
            </div>
            <div class="testimonial-card">
                <div class="user-info">
                    <i class="fas fa-user-circle"></i>
                    <h4>Tuấn Trần</h4>
                </div>
                <p>"Giao hàng nhanh, bánh không bị hỏng, rất ưng ý."</p>
            </div>
            <div class="testimonial-card">
                <div class="user-info">
                    <i class="fas fa-user-circle"></i>
                    <h4>Tuấn Trần</h4>
                </div>
                <p>"Giao hàng nhanh, bánh không bị hỏng, rất ưng ý."</p>
            </div>
        </div>

        <!-- Thêm form nhập ý kiến -->
        <div class="testimonial-form">
            <h3>Để lại ý kiến của bạn</h3>
            <form action="#" method="post">
                <div class="form-group">
                    <label for="user-name">Tên:</label>
                    <input type="text" id="user-name" name="user-name" placeholder="Nhập tên của bạn" required>
                </div>
                <div class="form-group">
                    <label for="user-feedback">Ý kiến của bạn:</label>
                    <textarea id="user-feedback" name="user-feedback" rows="4"
                        placeholder="Chia sẻ ý kiến của bạn về bánh ngọt" required></textarea>
                </div>
                <button type="submit" class="submit-btn">Gửi Ý Kiến</button>
            </form>
        </div>
    </section>
    <hr>
</template>
<script>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router'

export default {
    setup() {
        const products = ref([]);
        const router = useRouter()
        const getAllProduct = () => {
            axios.get('http://127.0.0.1:8000/api/product')
                .then((response) => {
                    console.log(response);
                    products.value = response.data.slice(0, 14);
                })
                .catch((error) => {
                    console.log(error);
                });
        }
        const changePages = (id) => {
            setTimeout(() => {
                router.push({ name: 'product-detail', params: { id: id } });
            }, 2000); // Chuyển trang sau 2 giây
        }
        onMounted(() => {
            getAllProduct()
        });
        return {
            products,
            changePages
        }
    }
}


</script>