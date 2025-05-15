<template>
    <main class="dashboard-main">
        <div class="card">
            <h3>Quản lý Danh mục Sản phẩm</h3>
    
            <!-- Phần tìm kiếm và thêm mới danh mục -->
            <div class="category-filters">
                <input type="text" placeholder="Tìm kiếm danh mục">
                <button class="btn-search">Tìm kiếm</button>
                <button class="btn-add" @click="changePageAddCategory">Thêm danh mục mới</button>
            </div>
    
            <!-- Bảng danh mục -->
            <table class="category-table">
                <thead>
                    <tr>
                        <th>Stt</th>
                        <th>Tên danh mục</th>
                        <th>Ngày thêm</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(dataItem, index) in dataCategory" :key="index">
                        <td>{{ index + 1 }}</td>
                        <td>{{ dataItem.name }}</td>
                        <td>{{ new Date(dataItem.created_at).toLocaleDateString() }}</td>
                        <td>
                            <button class="btn-edit" @click="updateCategory(dataItem)">Sửa</button>
                            <button class="btn-delete" @click="deleteCategory(dataItem)">Xóa</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </main>
    <div id="toast" v-if="toastMessage" v-html="toastContent"></div>
    <router-view></router-view>
  </template>
  <script>
import { ref, onMounted, watch, reactive, computed } from 'vue'
import axios from 'axios'
import { useRouter } from 'vue-router';
export default {
    setup() {
        const dataCategory = ref([]);
        const router = useRouter();
        const toastMessage = ref(false);
        const toastContent = ref("");

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

        const getDataCategory = () => {
            axios.get('http://127.0.0.1:8000/api/getallcategories')
            .then((response) => {
                console.log(response.data);
                dataCategory.value = response.data;
            })
            .catch((error) => {
                console.log(error);
            })
        }
        const changePageAddCategory = () => {
            router.push({name : 'admin-addcategory'});
        }
        const updateCategory = (dataItem) => {
            router.push({name: 'admin-updatecategory', params: {id: dataItem.id}});
        }
        const deleteCategory = (dataItem) => {
            axios.delete('http://127.0.0.1:8000/api/deletecategory/' + dataItem.id)
            .then((response) => {
                console.log(response.data.message);
                showToast('success', 'fas fa-check-circle', 'Thành Công', response.data.message);
                        setTimeout(() => {
                            toastMessage.value = false;
                            location.reload()
                        }, 3000);
            })
            .catch((error) => {
                console.log(error);
                showToast('error', 'fas fa-exclamation-circle', 'Thất Bại', 'Danh mục không tồn tại');
                        setTimeout(() => {
                            toastMessage.value = false;
                        }, 3000);
            })
        }

        onMounted(() => {
            getDataCategory()
        }); 
        return {
            dataCategory,
            changePageAddCategory,
            updateCategory,
            deleteCategory,
            toastContent,
            toastMessage
        }
    }
    

}

</script>
