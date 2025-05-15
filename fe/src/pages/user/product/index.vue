<template>
    <!-- danh muc -->
    <div class="category-section">
        <h2 class="section-title">Danh Mục</h2>
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
        <h2 class="section-title">Sản Phẩm</h2>
        <div class="product-list">
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Cam.jpg" alt="Bánh Kem Dâu">
                <h3>Bánh Kem Dâu</h3>
                <p class="price">120.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Dau.jpg" alt="Bánh Chocolate">
                <h3>Bánh Chocolate</h3>
                <p class="price">140.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Khoai-Mon.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Thom.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Banh-Kem-Tira-2.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Banh-Kem-Tira-2.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Khoai-Mon.jpg" alt="Bánh Kem Dâu">
                <h3>Bánh Kem Dâu</h3>
                <p class="price">120.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Dau.jpg" alt="Bánh Chocolate">
                <h3>Bánh Chocolate</h3>
                <p class="price">140.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Khoai-Mon.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Thom.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Banh-Kem-Tira-2.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Banh-Kem-Tira-2.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Khoai-Mon.jpg" alt="Bánh Kem Dâu">
                <h3>Bánh Kem Dâu</h3>
                <p class="price">120.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Dau.jpg" alt="Bánh Chocolate">
                <h3>Bánh Chocolate</h3>
                <p class="price">140.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Khoai-Mon.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Thom.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Banh-Kem-Tira-2.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Banh-Kem-Tira-2.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Khoai-Mon.jpg" alt="Bánh Kem Dâu">
                <h3>Bánh Kem Dâu</h3>
                <p class="price">120.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Dau.jpg" alt="Bánh Chocolate">
                <h3>Bánh Chocolate</h3>
                <p class="price">140.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Khoai-Mon.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Bk-Thom.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Banh-Kem-Tira-2.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
            <div class="product-card">
                <img src="../../../assets/upload/Banh-Kem-Tira-2.jpg" alt="Bánh Mousse Trái Cây">
                <h3>Bánh Mousse Trái Cây</h3>
                <p class="price">135.000đ</p>
                <router-link :to="{ name: 'product-detail' }" class="add-to-cart">thêm vào giỏ</router-link>
            </div>
        </div>
    </section> 
    <!-- pagination -->
    <section>
        <div class="pagination">
            <a href="#" class="page active">1</a>
            <a href="#" class="page">2</a>
            <a href="#" class="page">3</a>
            <a href="#" class="page">›</a>
        </div>        
    </section>
</template>