<template>
    <section class="section-login">
        <div class="login-container">
            <h2>Đăng Ký Tài Khoản</h2>
            <form class="login-form" action="#" @submit.prevent="createUsers" method="post">
                <label for="name">Tên của bạn:</label>
                <input type="text" id="name" name="name" placeholder="Nhập tên của bạn" v-model="name" required>
    
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Nhập email" v-model="email" required>
    
                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" v-model="password" placeholder="Nhập mật khẩu" required>
    
                <label for="confirm-password">Xác nhận mật khẩu:</label>
                <input type="password" id="confirm-password" name="confirm-password" v-model="password_confirmation" placeholder="Xác nhận mật khẩu" required>
    
                <button type="submit" class="login-btn">Đăng Ký</button>
    
                <div class="login-extra">
                    <p>Đã có tài khoản? <router-link :to="{ name: 'user-login' }">Đăng nhập ngay</router-link></p>
                    <a href="#">Chính sách bảo mật</a>
                </div>
            </form>
        </div>
    </section>
    <div id="toast" v-if="toastMessage" v-html="toastContent"></div>
</template>
<script>
import axios from 'axios';
import { defineComponent, ref, reactive, toRefs } from 'vue';
import router from '../../../router';
import { useRouter } from 'vue-router';
export default {
    setup() {
        const router = useRouter();
        const users = reactive({
            name: "",
            email: "",
            password: "",
            password_confirmation: ""
        });
        const errors = ref({});
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
        const createUsers = () => {
            axios.post('http://127.0.0.1:8000/api/register', users)
            .then((response) => {
                    showToast('success', 'fas fa-check-circle', 'Thành công', response.data.message);
                    setTimeout(() => {
                        toastMessage.value = false;
                        router.push({ name: 'user-login' })
                    }, 3000);
            })
            .catch((error) => {
                
                if(error) {
                    errors.value = error.response.data.errors;
                    showToast('error', 'fas fa-exclamation-circle', 'Thất bại', Object.values(errors.value)[0][0]);
                    setTimeout(() => {
                        toastMessage.value = false;
                    }, 3000);
                }

            });
        }
        return {
            ...toRefs(users),
            createUsers,
            errors,
            toastMessage,
            toastContent
        }
    }
}
</script>