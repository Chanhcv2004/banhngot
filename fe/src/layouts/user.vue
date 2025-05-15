<template>
    <TheUserHeader :user="user" />
    <router-view>
    </router-view>
    <TheUserFooter />
</template>
<script>
import TheUserHeader from '../components/TheUserHeader.vue';
import TheUserFooter from '../components/TheUserFooter.vue';
import { ref, onMounted } from 'vue';
import { useStore } from 'vuex';

export default {
    components: {
        TheUserHeader,
        TheUserFooter
    },
    setup() {
        const user = ref(null);

    const loadUser = () => {
        const data = JSON.parse(localStorage.getItem('user'));
        user.value = data;
    };

    onMounted(loadUser);

    window.addEventListener('user-logged-in', loadUser);
    window.addEventListener('user-logged-out', () => {
         user.value = null;
        });
    return { user };
    }
}
</script>