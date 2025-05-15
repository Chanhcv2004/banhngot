<template>
     <nav class="dashboard-nav">
        <router-link :to="{ name: 'admin-dashboard' }" exact-active-class="active">
           Tổng quan
        </router-link>
        <router-link :to="{ name: 'admin-order' }" exact-active-class="active">
            Đơn hàng
        </router-link>
        <router-link :to="{ name: 'admin-category' }" exact-active-class="active">
            Danh mục
        </router-link>
        <router-link :to="{ name: 'admin-product' }" exact-active-class="active">
            Sản phẩm
        </router-link>
        <router-link :to="{ name: 'admin-discount' }" exact-active-class="active">
            Mã giảm giá
        </router-link>
        <router-link :to="{ name: 'admin-custumer' }" exact-active-class="active">
            Khách hàng
        </router-link>
        <router-link :to="{ name: 'admin-setting' }" exact-active-class="active">
            Cài đặt
        </router-link>
    </nav>
</template>
<style scoped>
.active:focus {
    background-color: #ffd6d6;
    outline: none;
}
</style>
