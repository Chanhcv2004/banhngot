<template>
    <section class="section-login">
        <div class="login-container">
            <h2>Đăng Nhập Tài Khoản</h2>
            <form class="login-form" action="#" @submit.prevent="loginUser" method="post">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" v-model="email" placeholder="Nhập email" required>

                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" v-model="password" placeholder="Nhập mật khẩu"
                    required>

                <button type="submit" class="login-btn">Đăng Nhập</button>

                <div class="login-extra">
                    <a href="#">Quên mật khẩu?</a>
                    <p>Chưa có tài khoản? <router-link :to="{ name: 'user-register' }">Đăng ký ngay</router-link></p>
                </div>
            </form>
        </div>
    </section>
    <div id="toast" v-if="toastMessage" v-html="toastContent"></div>
</template>
<script>
import axios from 'axios';
import { defineComponent, ref, reactive, toRefs } from 'vue';
import { useRouter } from 'vue-router';
export default {
    setup() {
        const userData = ref(null);
        const router = useRouter();
        const users = reactive({
            email: "",
            password: ""
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
        const loginUser = () => {
            axios.post('http://127.0.0.1:8000/api/login', users)
                .then((response) => {
                    // Gán user vào biến
                    userData.value = response.data.user;

                    // Lưu vào localStorage để tái sử dụng ở nơi khác
                    localStorage.setItem('user', JSON.stringify(response.data.user));

                    showToast('success', 'fas fa-check-circle', 'Thành công', response.data.message);

                    setTimeout(() => {
                        window.dispatchEvent(new Event('user-logged-in'));
                        toastMessage.value = false;
                        router.push({ name: 'user-home' });
                    }, 3000);
                })
                .catch((error) => {
                    console.log(error.response); // Debug xem dữ liệu lỗi thực sự là gì
                    if (error.response && error.response.data.errors) {
                        errors.value = error.response.data.errors;
                        showToast('error', 'fas fa-exclamation-circle', 'Thất bại', Object.values(errors.value)[0][0]);
                    } else {
                        showToast('error', 'fas fa-exclamation-circle', 'Thất bại', 'Đăng nhập không thành công.');
                    }
                    setTimeout(() => {
                        toastMessage.value = false;
                    }, 3000);
                });
        }
        return {
            ...toRefs(users),
            loginUser,
            errors,
            toastMessage,
            toastContent
        }
    }
}
</script>