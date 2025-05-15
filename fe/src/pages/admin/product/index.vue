<template>
   <main class="dashboard-main">
        <div class="card">
            <h3>Quản lý Sản phẩm</h3>

            <!-- Phần tìm kiếm và thêm mới sản phẩm -->
            <div class="product-filters">
                <input type="text" placeholder="Tìm kiếm sản phẩm">
                <button class="btn-search-product">Tìm kiếm</button>
                <button class="btn-add-product">Thêm sản phẩm mới</button>
            </div>

            <!-- Bảng sản phẩm -->
            <table class="product-table">
                <thead>
                    <tr>
                        <th>Mã sản phẩm</th>
                        <th>Hình ảnh</th>
                        <th>Tên sản phẩm</th>
                        <th>Danh mục</th>
                        <th>Giá</th>
                        <th>Số lượng</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#SP001</td>
                        <td><img src="../../../assets/upload/Bk-Cam.jpg" alt="Bánh mousse dâu" width="50"></td>
                        <td>Bánh kem sữa</td>
                        <td>Bánh kem</td>
                        <td>150,000đ</td>
                        <td>50</td>
                        <td>
                            <button class="btn-edit-product">Sửa</button>
                            <button class="btn-delete-product">Xóa</button>
                        </td>
                    </tr>
                    <tr>
                        <td>#SP002</td>
                        <td><img src="../../../assets/upload/Bk-Cam.jpg" alt="Bánh mousse dâu" width="50"></td>
                        <td>Bánh mousse dâu</td>
                        <td>Bánh ngọt</td>
                        <td>180,000đ</td>
                        <td>30</td>
                        <td>
                            <button class="btn-edit-product">Sửa</button>
                            <button class="btn-delete-product">Xóa</button>
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
  
 