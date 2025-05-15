<template>
    <main class="dashboard-main">
        <div class="card">
            <h3>Thêm danh mục</h3>

            <form class="settings-form" @submit.prevent="updateCategory">
                <div class="form-group">
                    <label for="storeName">Tên Danh Mục:</label>
                    <input type="text" id="storeName" v-model="nameCategory" placeholder="Nhập tên danh mục">
                </div>


                <button type="submit" class="btn-save-settings">Lưu thay đổi</button>
            </form>
        </div>
    </main>
    <div id="toast" v-if="toastMessage" v-html="toastContent"></div>
    <router-view></router-view>
</template>
<script>
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { useRoute } from 'vue-router';
export default {
    setup() {
        const route = useRoute()
        const categoryId = route.params.id;
        const dataCategoryById = ref([]);
        const nameCategory = ref('');
        const toastMessage = ref(false);
        const toastContent = ref("");

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
        console.log(dataCategoryById);
        const getCategoryById = () => {
            axios.get('http://127.0.0.1:8000/api/getcategory/' + categoryId)
            .then((response) => {
                console.log(response.data);
                dataCategoryById.value = response.data;
                nameCategory.value = response.data.name;
            })
            .catch((error) => {
                console.log(error);
            })
        }

        const updateCategory = () => {
            axios.put('http://127.0.0.1:8000/api/updatecategory/' + dataCategoryById.value.id, { name: nameCategory.value })
                .then((response) => {
                    console.log(response.data);
                    showToast('success', 'fas fa-check-circle', 'Thành Công', 'Cập nhật danh mục thành công');
                        setTimeout(() => {
                            toastMessage.value = false;
                            location.reload();
                        }, 3000);

                })
                .catch((error) => {
                    console.log(error);
                    showToast('error', 'fas fa-exclamation-circle', 'Thất Bại', 'Lỗi cập nhật danh mục');
                        setTimeout(() => {
                            toastMessage.value = false;
                           
                        }, 3000);
                })
        }

        onMounted(() => {
            getCategoryById()
        });
        return {
            nameCategory,
            updateCategory,
            toastContent,
            toastMessage,
            dataCategoryById,
        }
    }
}
</script>