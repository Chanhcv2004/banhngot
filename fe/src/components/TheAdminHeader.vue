<template>
    <header class="dashboard-header">
      <h1>Dashboard Quản Lý Bánh Ngọt</h1>
      <!-- Gắn class active vào phần tử .header-with-user -->
      <div class="header-with-user" :class="{ active: showUserMenu }" @click.stop="toggleUserMenu">
        <a href="#">
          <i class="fas fa-user"></i>
          <p></p>
        </a>
        <div class="user-dropdown">
          <a href="#">Đăng Nhập</a>
          <a href="#">Thông tin cá nhân</a>
          <a href="#">Đơn hàng</a>
          <a href="#">Cài đặt</a>
          <a href="#">Đăng xuất</a>
        </div>
      </div>
    </header>
  
  </template>
  
  <script setup>
  import { ref, onMounted, onBeforeUnmount } from 'vue';
  
  const showUserMenu = ref(false);
  
  // Hàm toggle menu
  const toggleUserMenu = (e) => {
    e.stopPropagation();
    showUserMenu.value = !showUserMenu.value;  // Đảo ngược trạng thái hiển thị menu
  };
  
  // Hàm đóng menu khi click bên ngoài
  const closeUserMenu = (e) => {
    if (!e.target.closest('.header-with-user')) {
      showUserMenu.value = false;
    }
  };
  
  onMounted(() => {
    document.addEventListener('click', closeUserMenu);
  });
  
  onBeforeUnmount(() => {
    document.removeEventListener('click', closeUserMenu);
  });

  
  </script>
  
  <!-- <style scoped>
  .user-dropdown {
    display: none;  /* Ẩn menu mặc định */
  }
  
  .header-with-user.active .user-dropdown {
    display: block;  /* Hiển thị menu khi .header-with-user có class active */
  }
  </style>
   -->