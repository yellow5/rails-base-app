import * as Vue from 'vue';
import axios from 'axios';
import VueAxios from 'vue-axios';

import App from '@/apps/website/MainLayout.vue';
import router from '@/routers/website';
import '@/assets/css/style.scss';

const app = Vue.createApp(App);
app.use(VueAxios, axios);
app.axios.defaults.headers.common['X-CSRF-Token'] =
  document.querySelector('meta[name="csrf-token"]').content;
app.$http.defaults.headers.common['X-CSRF-Token'] =
  document.querySelector('meta[name="csrf-token"]').content;

app.use(router);

app.mount('#app');
