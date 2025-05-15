    <template>
        <section class="section-settings">
            <div class="settings-container">
                <!-- Sidebar Left -->
                <div class="settings-sidebar">
                    <div class="user-icon">
                        <i class="fas fa-user"></i>
                        <p>{{ user.name }}</p>
                    </div>
                    <ul class="settings-menu">
                        <li><router-link :to="{ name: 'user-info' }">Thông tin cá nhân</router-link></li>
                        <li><a href="#">Đổi Mật Khẩu</a></li>
                        <li><router-link :to="{ name: 'user-history' }">Lịch sử mua hàng</router-link></li>
                        <li><a href="#">Địa Chỉ Giao Hàng</a></li>
                    </ul>
                </div>

                <!-- Lịch Sử Mua Hàng -->
                <div class="settings-main">
                    <h2>Lịch Sử Mua Hàng</h2>
                    <table class="order-history-table">
                        <thead>
                            <tr>
                                <th>Mã Đơn Hàng</th>
                                <th>Ngày Mua</th>
                                <th>Số Lượng Sản Phẩm</th>
                                <th>Tổng Tiền</th>
                                <th>Trạng Thái</th>
                                <th>Chi Tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(item, index) in dataHistory" :key="index">
                                <td>DH{{ item.id }}</td>
                                <td>{{ new Date(item.updated_at).toLocaleDateString() }}</td>
                                <td>{{ item.quantity }}</td>
                                <td>{{ new Intl.NumberFormat('vi-VN').format(item.total) }} ₫</td>
                                <td>{{ item.status }}</td>
                                <td><a href="#">Xem</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

            </div>
        </section>
    </template>
<script>
import { ref, onMounted, watch, reactive, computed } from 'vue'
import axios from 'axios'
export default {
    setup() {
        const dataHistory = ref([]);

        const user = JSON.parse(localStorage.getItem('user'));

        const getDataHistory = () => {
            axios.get('http://127.0.0.1:8000/api/getdatahisory/' + user.id)
                .then((response) => {
                    console.log(response.data);
                    dataHistory.value = response.data;
                })
                .catch((error) => {
                    console.log(error);
                })
        }
       

        onMounted(() => {
            getDataHistory()
        });
        return {
            dataHistory,
            user
        }

    }
}
</script>