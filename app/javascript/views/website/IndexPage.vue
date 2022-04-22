<template>
  <h2 class="text-center">You are visiting the {{ pageName }} page!</h2>

  <h5 class="text-center">{{ message }}</h5>
  <p class="text-center error">{{ errors }}</p>
</template>

<script>
/*import Vue from 'vue';*/
//import * as Vue from 'vue';
//import axios from 'axios';
//import VueAxios from 'vue-axios';

//Vue.use(VueAxios, axios);
//this.use(VueAxios, axios);

export default {
  data() {
    return {
      pageName: 'Index',
      message: '',
      errors: '',
    };
  },
  mounted() {
    //this.$http
    this.axios
      .post('/api/greetings')
      .then((response) => {
        this.message = response.data.message;
      })
      .catch((e) => {
        this.errors = e;
      });
  },
};
</script>

<style>
.error {
  color: red;
}
</style>
