<template>
    <main class="dashboard-main">
        <div class="card">
            <h3>Quản lý Mã Giảm Giá</h3>

            <!-- Phần tìm kiếm và thêm mã -->
            <div class="discount-filters">
                <input type="text" placeholder="Tìm mã giảm giá">
                <button class="btn-search-discount">Tìm kiếm</button>
                <button class="btn-add-discount">Thêm mã mới</button>
            </div>

            <!-- Bảng mã giảm giá -->
            <table class="discount-table">
                <thead>
                    <tr>
                        <th>Mã</th>
                        <th>Giá trị (%)</th>
                        <th>Ngày bắt đầu</th>
                        <th>Ngày kết thúc</th>
                        <th>Giới hạn sử dụng</th>
                        <th>Trạng thái</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>SALE20</td>
                        <td>20%</td>
                        <td>01/04/2025</td>
                        <td>30/04/2025</td>
                        <td>100 lượt</td>
                        <td>Đang hoạt động</td>
                        <td>
                            <button class="btn-edit-discount">Sửa</button>
                            <button class="btn-delete-discount">Xóa</button>
                        </td>
                    </tr>
                    <tr>
                        <td>MOIBANH50</td>
                        <td>50%</td>
                        <td>10/03/2025</td>
                        <td>20/03/2025</td>
                        <td>50 lượt</td>
                        <td>Hết hạn</td>
                        <td>
                            <button class="btn-edit-discount">Sửa</button>
                            <button class="btn-delete-discount">Xóa</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <section>
            <div class="pagination">
                <a href="#" class="page active">1</a>
                <a href="#" class="page">2</a>
                <a href="#" class="page">›</a>
            </div>        
        </section>
    </main>
  
    <router-view></router-view>
  </template>
  
  