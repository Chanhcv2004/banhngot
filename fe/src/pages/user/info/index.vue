<template>
    <section class="section-settings">
        <div class="settings-container">
            <!-- Sidebar Left -->
            <div class="settings-sidebar">
                <div class="user-icon">
                    <i class="fas fa-user"></i>
                    <p>{{ user.name }}</p>
                </div>
                <ul class="settings-menu">
                    <li><router-link :to="{ name: 'user-info' }">Thông Tin Cá Nhân</router-link></li>
                    <li><a href="#">Đổi Mật Khẩu</a></li>
                    <li><router-link :to="{ name: 'user-history' }">Lịch sử mua hàng</router-link></li>
                    <li><a href="#">Địa Chỉ Giao Hàng</a></li>
                    <li><a href="#">Đăng xuất</a></li>
                </ul>
            </div>
            
            <!-- Main Right Content -->
            <div class="settings-main">
                <form class="settings-form" method="post">
                    <label for="name">Họ và Tên:</label>
                    <input type="text" id="name" name="name" v-model="name" required>
            
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" v-model="email" required>
            
                    <label for="phone">Số Điện Thoại:</label>
                    <input type="text" id="phone" name="phone" v-model="phone" required>
            
                    <label for="age">Tuổi:</label>
                    <input type="number" id="age" name="age"  required>
            
                    <label for="address">Địa Chỉ:</label>
                    <input type="text" id="address" name="address" v-model="address" required>
            
                    <button type="submit" class="save-changes-btn">Lưu Thay Đổi</button>
                </form>
            </div>
            
        </div>
    </section>
</template>
<script>
import { ref, onMounted, watch, reactive, computed } from 'vue'
import axios from 'axios'
export default {
    setup() {
        const user = JSON.parse(localStorage.getItem('user'));

        const infoUser = reactive({
            name: user.name,
            email: user.email,
            phone: user.phone,
            address: user.address

        });

        
        onMounted(() => {
           
        });
        return {
            user,
            infoUser,
        }
    }
}
</script>