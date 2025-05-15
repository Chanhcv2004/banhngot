<template>
    <main class="dashboard-main">
        <div class="card">
            <h3>Cài đặt hệ thống</h3>

            <form class="settings-form">
                <div class="form-group">
                    <label for="storeName">Tên cửa hàng:</label>
                    <input type="text" id="storeName" placeholder="Nhập tên cửa hàng" value="Bánh Ngọt Linh Chi">
                </div>

                <div class="form-group">
                    <label for="storeEmail">Email cửa hàng:</label>
                    <input type="email" id="storeEmail" placeholder="Nhập email" value="banhngot@example.com">
                </div>

                <div class="form-group">
                    <label for="storePhone">Số điện thoại:</label>
                    <input type="tel" id="storePhone" placeholder="Nhập số điện thoại" value="0909123456">
                </div>

                <div class="form-group">
                    <label for="adminPassword">Mật khẩu quản trị:</label>
                    <input type="password" id="adminPassword" placeholder="Đổi mật khẩu">
                </div>

                <div class="form-group">
                    <label for="theme">Giao diện:</label>
                    <select id="theme">
                        <option value="light">Sáng</option>
                        <option value="dark">Tối</option>
                    </select>
                </div>

                <button type="submit" class="btn-save-settings">Lưu thay đổi</button>
            </form>
        </div>
    </main>
  
    <router-view></router-view>
  </template>
  
  