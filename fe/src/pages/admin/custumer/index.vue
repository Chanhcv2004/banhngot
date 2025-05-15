<template>
     <main class="dashboard-main">
        <div class="card">
            <h3>Quản lý Khách hàng</h3>

            <!-- Tìm kiếm khách hàng -->
            <div class="customer-filters">
                <input type="text" placeholder="Tìm kiếm khách hàng">
                <button class="btn-search-customer">Tìm kiếm</button>
            </div>

            <!-- Bảng khách hàng -->
            <table class="customer-table">
                <thead>
                    <tr>
                        <th>Mã KH</th>
                        <th>Tên khách hàng</th>
                        <th>Email</th>
                        <th>Số điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>Ngày đăng ký</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#KH001</td>
                        <td>Nguyễn Văn A</td>
                        <td>vana@gmail.com</td>
                        <td>0901234567</td>
                        <td>123 Lê Lợi, Q.1</td>
                        <td>01/01/2024</td>
                        <td>
                            <!-- <button class="btn-edit-customer">Sửa</button>
                            <button class="btn-delete-customer">Xóa</button> -->
                            Hoạt động
                        </td>
                    </tr>
                    <tr>
                        <td>#KH002</td>
                        <td>Trần Thị B</td>
                        <td>tranb@gmail.com</td>
                        <td>0987654321</td>
                        <td>456 Nguyễn Trãi, Q.5</td>
                        <td>15/02/2024</td>
                        <td>
                            <!-- <button class="btn-edit-customer">Sửa</button>
                            <button class="btn-delete-customer">Xóa</button> -->
                            Hoạt động
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <section>
            <div class="pagination">
                <a href="#" class="page active">1</a>
                <a href="#" class="page">2</a>
                <a href="#" class="page">3</a>
                <a href="#" class="page">›</a>
            </div>        
        </section>
    </main>
  
    <router-view></router-view>
  </template>
  
