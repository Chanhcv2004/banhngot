<template>
     <header>
        <div class="header-with-logo">
            <img src="../assets/upload/logoshop.png" alt="...">
        </div>
        <div class="header-with-navbar">
            <li><router-link :to="{ name: 'user-home' }">Trang Chủ</router-link></li>
            <li><router-link :to="{ name: 'user-product' }">Sản Phẩm</router-link></li>
            <li><router-link :to="{ name: 'user-about' }">Giới Thiệu</router-link></li>
            <li><router-link :to="{ name: 'user-contact' }">Liên Hệ</router-link></li>
        </div>
        <div class="header-with-icons">
            <div class="header-with-cart">
                <router-link :to="{ name: 'user-cart' }">
                    <i class="fas fa-shopping-cart"></i>
                </router-link>
                <a href="#">
                    
                </a>
            </div>
            <div class="header-with-bell" id="bellMenu" :class="{ active: showBellMenu }" @click.stop="toggleBellMenu">
                <a href="#">
                    <i class="fas fa-bell"></i>
                </a>
                <div class="bell-dropdown">
                    <div class="notify-item">
                        <p class="notify-title">Đơn hàng mới</p>
                        <p class="notify-desc">Bạn có 1 đơn hàng vừa được xác nhận.</p>
                    </div>
                    <div class="notify-item">
                        <p class="notify-title">Ưu đãi hôm nay</p>
                        <p class="notify-desc">Giảm 20% cho đơn hàng từ 200k.</p>
                    </div>
                    <div class="notify-item">
                        <p class="notify-title">Sản phẩm mới</p>
                        <p class="notify-desc">Check ngay mẫu bánh mới vừa cập bến!</p>
                    </div>
                    <a href="#" class="see-all">Xem tất cả thông báo</a>
                </div>
            </div>
            <div class="header-with-user" id="userMenu" :class="{ active: showUserMenu }" @click.stop="toggleUserMenu">
                <a href="#">
                    <i class="fas fa-user"></i>
                    <p>{{ user ? 'Hi, '+user.name : 'Đăng Nhập' }}</p>
                </a>
                <div class="user-dropdown" v-if="user">
                    <router-link :to="{ name: 'user-info' }">Thông tin cá nhân</router-link>
                    <router-link :to="{ name: 'admin-dashboard' }">Admin</router-link>
                    <router-link :to="{ name: 'user-history' }">Đơn hàng</router-link>
                    <a href="#">Cài đặt</a>
                    <a href="#"  @click.prevent="logoutUser">Đăng xuất</a>
                </div>
                <div class="user-dropdown" v-else>
                    <router-link :to="{ name: 'user-login' }">Đăng Nhập</router-link>
                    <router-link :to="{ name: 'user-info' }">Thông tin cá nhân</router-link>
                    <router-link :to="{ name: 'user-history' }">Đơn hàng</router-link>
                    <a href="#">Cài đặt</a>
                    <a href="#">Đăng xuất</a>
                </div>
            </div>
        </div>
    </header>
    
</template>
<script setup>
  import { ref, onMounted, onBeforeUnmount } from 'vue';
  
  defineProps({
    user: {
      type: Object,
      default: null
    }
  });

  const showUserMenu = ref(false);
  const showBellMenu = ref(false);
  // Hàm toggle menu
  const toggleUserMenu = (e) => {
    e.stopPropagation();
    showUserMenu.value = !showUserMenu.value;  // Đảo ngược trạng thái hiển thị menu
  };
  const toggleBellMenu = (e) => {
    e.stopPropagation();
    showBellMenu.value = !showBellMenu.value;
  };
  
  // Hàm đóng menu khi click bên ngoài
  const closeUserMenu = (e) => {
    if (!e.target.closest('.header-with-user')) {
      showUserMenu.value = false;
    }
  };
  const closeBellMenu = (e) => {
    if(!e.target.closest('.header-with-bell')) {
        showBellMenu.value = false;
    }
  }
  
  onMounted(() => {
    document.addEventListener('click', closeUserMenu);
    document.addEventListener('click', closeBellMenu);
  });
  
  
  onBeforeUnmount(() => {
    document.removeEventListener('click', closeUserMenu);
    document.removeEventListener('click', closeBellMenu);
  });
  const logoutUser = () => {
    localStorage.removeItem('user');
    setTimeout(() => {
    window.dispatchEvent(new Event('user-logged-out'));
    router.push({ name: 'user-home' });
  }, 3000);
  
};
  </script>