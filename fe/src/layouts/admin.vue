<template>
    <TheAdminHeader />
    <TheAdminMenu />
    <router-view></router-view>
</template>
<script>
import TheAdminHeader from '../components/TheAdminHeader.vue';
import TheAdminMenu from '../components/TheAdminMenu.vue';
export default {
    components: {
        TheAdminHeader,
        TheAdminMenu
    },
    setup() {
        const user = JSON.parse(localStorage.getItem('user'));
        return {
            user
        }
    }
}


</script>