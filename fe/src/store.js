// src/store.js
import { createStore } from 'vuex';

const store = createStore({
  state: {
    user: JSON.parse(localStorage.getItem('user')) || null, // Đọc từ localStorage
  },
  mutations: {
    setUser(state, user) {
      state.user = user;
      localStorage.setItem('user', JSON.stringify(user)); // Lưu vào localStorage
    },
    clearUser(state) {
      state.user = null;
      localStorage.removeItem('user'); // Xóa thông tin user khỏi localStorage
    },
  },
  actions: {
    login({ commit }, user) {
      commit('setUser', user); // Sau khi đăng nhập thành công, set user vào state
    },
    logout({ commit }) {
      commit('clearUser'); // Đăng xuất và xóa thông tin khỏi state và localStorage
    },
  },
  getters: {
    getUser(state) {
      return state.user;
    },
  },
});

export default store;
