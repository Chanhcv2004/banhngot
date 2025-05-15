<template>
    <main class="dashboard-main">
      <div class="card-container">
        <div class="card">
          <h3>Doanh thu hôm nay</h3>
          <p>1,200,000đ</p>
        </div>
        <div class="card">
          <h3>Đơn hàng mới</h3>
          <p>8 đơn</p>
        </div>
        <div class="card">
          <h3>Sản phẩm bán chạy</h3>
          <p>Bánh mousse dâu</p>
        </div>
      </div>
  
      <div class="card note-card">
        <h3>Ghi chú nhanh</h3>
        <p>✔️ Kiểm tra nguyên liệu còn tồn</p>
        <p>✔️ Cập nhật ảnh sản phẩm mới</p>
      </div>
  
      <div class="card">
        <h3>Thống kê đơn hàng trong tuần: <span id="chart-date-range" style="font-size: 14px; font-weight: normal;"></span></h3>
        <canvas ref="orderChart" width="400" height="200"></canvas> <!-- Sử dụng ref thay vì id cho canvas -->
      </div>
    </main>
  
    <router-view></router-view>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import { Chart } from 'chart.js/auto';
  
  
  // Tham chiếu tới canvas sử dụng ref
  const orderChart = ref(null);
  
  // Hàm vẽ biểu đồ
  const renderOrderChart = () => {
    const ctx = orderChart.value.getContext('2d');  // Sử dụng ref để lấy đối tượng canvas
  
    const labels = ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7', 'CN'];
    const data = [5, 7, 6, 8, 4, 10, 9];
  
    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: labels,
        datasets: [{
          label: 'Số đơn hàng',
          data: data,
          backgroundColor: '#ffb3b3',
          borderColor: '#ff6666',
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true,
            ticks: {
              stepSize: 2
            }
          }
        }
      }
    });
  };
  
  // Gọi hàm vẽ biểu đồ khi component đã được render
  onMounted(() => {
    renderOrderChart();
  });
  </script>
  
  <style scoped>
  /* Thêm kiểu dáng tùy ý */
  </style>
  