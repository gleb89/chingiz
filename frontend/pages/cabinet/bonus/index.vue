<template>
  <v-container style="padding-top: 6rem;padding-bottom: 4rem">
    <h2 class="mb-4">Бонусы</h2>
    <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
    <span>Бонусы</span>
   <div class="d-block d-lg-none">

    </div>
    <v-row justify="center" class="mt-4">
      <v-col class="d-none d-lg-block" cols="12" md="3" lg="3">
      <CardUser :user_data="user_data"/>
      </v-col>
      <v-col cols="12" md="9" lg="9">
        <h2 class="d-lg-block d-none">Бонусы</h2>
        <div v-if="bonus_data.length > 0">
        <Bonus :bonus_data="bonus_data"/>
        </div>
        <div v-if="bonus_data.length === 0">
        <h3 class="text-center">У вас еще нет бонусных баллов</h3>
        </div>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {

  async asyncData({ $axios, store }) {

    const bonus_data  = await $axios.get(
      `http://80.249.151.147/api/v1/present/bonus/${store.state.localStorage.uid_auth_user}`
    );
    return {bonus_data : bonus_data.data };
  },
  computed: {
      user_data(){
        return this.$store.state.user.user
      },
  
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