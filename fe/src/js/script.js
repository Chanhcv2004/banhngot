let userMenu;
let bellMenu;

function toggleUserMenu(e) {
    e.stopPropagation();
    userMenu.classList.toggle('active');
}

function closeUserMenu() {
    userMenu.classList.remove('active');
}

function initUserMenuDropdown() {
    userMenu = document.getElementById('userMenu');
    if (!userMenu) return;

    userMenu.addEventListener('click', toggleUserMenu);
    document.addEventListener('click', closeUserMenu);
}


function toggleBellMenu(e) {
    e.stopPropagation();
    bellMenu.classList.toggle('active');
}

function closeBellMenu() {
    bellMenu.classList.remove('active');
}

function initBellDropdown() {
    bellMenu = document.getElementById('bellMenu');
    if (!bellMenu) return;

    bellMenu.addEventListener('click', toggleBellMenu);
    document.addEventListener('click', closeBellMenu);
}

// Gọi tất cả khi DOM sẵn sàng
document.addEventListener('DOMContentLoaded', () => {
    initUserMenuDropdown();
    initBellDropdown();
});
function startBackgroundSlider(slides, intervalTime) {
    let currentIndex = 0;
    const sliderItem = document.querySelector('.slider-item');

    // Hàm thay đổi background
    function changeBackground() {
        currentIndex = (currentIndex + 1) % slides.length; // Tăng index và quay lại đầu khi hết ảnh
        sliderItem.style.backgroundImage = `url(${slides[currentIndex]})`; // Thay đổi background
    }

    // Đặt interval để thay đổi background mỗi intervalTime
    setInterval(changeBackground, intervalTime);
}

// Gọi hàm với mảng ảnh và thời gian 3000ms
// startBackgroundSlider([
//     '../Upload/slider1.png',
//     '../Upload/slider2.png',
//     '../Upload/slider3.png'
// ], 3000);
// function renderOrderChart() {
//     const ctx = document.getElementById('orderChart').getContext('2d');

//     const labels = ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7', 'CN'];
//     const data = [5, 7, 6, 8, 4, 10, 9];

//     const orderChart = new Chart(ctx, {
//         type: 'bar',
//         data: {
//             labels: labels,
//             datasets: [{
//                 label: 'Số đơn hàng',
//                 data: data,
//                 backgroundColor: '#ffb3b3',
//                 borderColor: '#ff6666',
//                 borderWidth: 1
//             }]
//         },
//         options: {
//             responsive: true,
//             scales: {
//                 y: {
//                     beginAtZero: true,
//                     ticks: {
//                         stepSize: 2
//                     }
//                 }
//             }
//         }
//     });

//     // Tính ngày bắt đầu và kết thúc dựa trên hôm nay
//     // const today = new Date();
//     // const startDate = new Date(today);
//     // startDate.setDate(today.getDate() - 6); // lùi lại 6 ngày

//     // const formatDate = (date) => {
//     //     return date.toLocaleDateString('vi-VN', {
//     //         day: '2-digit', month: '2-digit', year: 'numeric'
//     //     });
//     // };

//     // const dateRange = `${formatDate(startDate)} - ${formatDate(today)}`;
//     // document.getElementById('chart-date-range').textContent = dateRange;
// }

// window.addEventListener('DOMContentLoaded', renderOrderChart);