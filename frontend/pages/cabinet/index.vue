<template>
  <v-container style="padding-top: 6rem;padding-bottom: 4rem">
    <h2 class="mb-4">Настройки профиля</h2>
    <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
    <span>кабинет профиля</span>
   <div class="d-block d-lg-none">

    </div>
    <v-row justify="center" class="mt-4">
      <v-col class="d-none d-lg-block" cols="12" md="3" lg="3">
      <CardUser :user_data="user_data"/>
      </v-col>
      <v-col cols="12" md="9" lg="9">
        <h2>Настройки профиля</h2>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  async asyncData({ $axios, store }) {

    const user_data = await $axios.get(
      `http://82.148.17.12:8080/api/v1/present/users/${store.state.localStorage.uid_auth_user}`
    );
    return {user_data: user_data.data };
  },
  data() {
    return {
      dialog: false,
    };
  },
  methods: {
    onPage(url){
      this.$router.push('/'+url)
    },
        onsignout(){
      console.log('out');
      this.$store.commit("localStorage/setAuthuser", '');
      this.$store.commit("localStorage/set_summBasket",Number(0));
      this.$store.commit("localStorage/set_idBasket",Number(0));
      this.$router.push("/");
      
    }
  },
}
</script>

<style >
.prof{
  cursor: pointer;
}
</style>