<template>
    <main class="dashboard-main">
        <div class="card">
            <h3>Danh sách đơn hàng</h3>
    
            <div class="order-filters">
                <input type="text" placeholder="Tìm theo mã đơn hoặc tên khách hàng">
                <select>
                    <option value="">Tất cả trạng thái</option>
                    <option value="pending">Đang xử lý</option>
                    <option value="delivered">Đã giao</option>
                    <option value="cancelled">Đã hủy</option>
                </select>
            </div>
    
            <table class="order-table">
                <thead>
                    <tr>
                        <th>Mã đơn</th>
                        <th>Khách hàng</th>
                        <th>Ngày đặt</th>
                        <th>Trạng thái</th>
                        <th>Tổng tiền</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(dataItem, index) in dataCart" :key="index">
                        <td>DH{{ dataItem.id }}</td>
                        <td>{{ dataItem.user_name }}</td>
                        <td>{{ new Date(dataItem.created_at).toLocaleDateString() }}</td>
                        <td>
                            <span @click="changeStatus(dataItem)" class="status pending" v-if="dataItem.status === 'Chờ xác nhận' || dataItem.status === 'Giỏ hàng' || dataItem.status === 'Đang giao'">{{ dataItem.status }}</span>
                            <span @click="changeStatus(dataItem)" class="status delivered" v-else-if="dataItem.status === 'Giao hàng thành công'">{{ dataItem.status }}</span>
                            <span @click="changeStatus(dataItem)" class="status delivered" v-if="dataItem.status === 'Hủy đơn hàng'">{{ dataItem.status }}</span>
                        </td>
                        <td>{{ new Intl.NumberFormat('vi-VN').format(dataItem.total) }} ₫</td>
                        <td><button class="btn-view">Xem</button></td>
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
    <div id="toast" v-if="toastMessage" v-html="toastContent"></div>
    <router-view></router-view>
  </template>
  <script>
import { reactive, ref, onMounted } from 'vue';
import axios from 'axios';
import { useRouter } from 'vue-router';
export default {
    setup() {

        const dataCart = ref([]);
        const toastMessage = ref(false);
        const toastContent = ref("");
        const router = useRouter();

        const user = JSON.parse(localStorage.getItem('user'));

        const showToast = (type, icon, title, message) => {
            toastContent.value =
                `
                    <div class="toast toast--${type}">
                            <div class="toast__icon">
                                <i class="${icon}"></i>
                            </div>
                            <div class="toast__body">
                                <h3 class="toast__title">${title}</h3>
                                <p class="toast__msg">${message}</p>
                            </div>
                            <div class="toast__close" onclick="this.parentElement.remove()">
                                <i class="fa-solid fa-circle-xmark"></i>
                            </div>
                        </div>
                    `;
            toastMessage.value = true;
        }
        const getDataCartToAdmin = () => {
            axios.get('http://127.0.0.1:8000/api/getcarttoadmin')
            .then((response) => {
                console.log(response);
                dataCart.value = response.data;
            })
            .catch((error) => {
                console.log(error);
            })
        }
        const changeStatus = (dataItem) => {
            if(dataItem.status === 'Chờ xác nhận') 
            {
                axios.put('http://127.0.0.1:8000/api/adminchangestatus/' + dataItem.id, {
                    status: 'Đang giao'
                })
                .then((response) => {
                    console.log(response);
                    showToast('success', 'fas fa-check-circle', 'Thành Công', response.data.message);
                        setTimeout(() => {
                            toastMessage.value = false;
                            location.reload();
                        }, 3000);

                })
                .catch((error) => {
                    console.log(error);
                })
            }else if(dataItem.status === 'Đang giao') {
                axios.put('http://127.0.0.1:8000/api/adminchangestatus/' + dataItem.id, {
                    status: 'Giao hàng thành công'
                })
                .then((response) => {
                    console.log(response);
                    showToast('success', 'fas fa-check-circle', 'Thành Công', response.data.message);
                        setTimeout(() => {
                            toastMessage.value = false;
                            location.reload();
                        }, 3000);

                })
                .catch((error) => {
                    console.log(error);
                })
            }else if(dataItem.statuss === 'Giao hàng thành công') {
                showToast('error', 'fas fa-exclamation-circle', 'Thất Bại', 'Đơn hàng đã hoàn thành, không thể cập nhật');
                        setTimeout(() => {
                            toastMessage.value = false;
                            router.push({ name: 'admin-order' });
                        }, 3000);
            }else {
                showToast('error', 'fas fa-exclamation-circle', 'Thất Bại', 'Đơn hàng đã hủy, không thể cập nhật');
                        setTimeout(() => {
                            toastMessage.value = false;
                            router.push({ name: 'admin-order' });
                        }, 3000);
            }
        }

        onMounted(() => {
            getDataCartToAdmin()
        });
        return {
            dataCart,
            changeStatus,
            toastContent,
            toastMessage,
        }

    }
}
</script>
  