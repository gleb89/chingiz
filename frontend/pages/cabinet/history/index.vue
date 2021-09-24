<template>
  <v-container style="padding-top: 6rem;padding-bottom: 4rem">
    <h2 class="mb-4">История заказов</h2>
    <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
    <span>История заказов</span>
   
       <div class="d-block d-lg-none">

    </div>
    <v-row justify="center" class="mt-4">
      <v-col class="d-none d-lg-block" cols="12" md="3" lg="3">
      <CardUser :user_data="user_data"/> 
      </v-col>
      <span v-if="count === 0"> {{onHistory()}}</span>

      <v-col v-if="history_data.length > 0" cols="12" md="9" lg="9">
        <h2>История заказов</h2>
            <History :data_history="history_data[0].history" :onPageHistory="onPageHistory"/>
      </v-col>
      <v-col v-if="history_data.length ===0" cols="12" md="9" lg="9">
        <h2 class="text-center">История заказов отсутсвует</h2>
          
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  async asyncData({ $axios, store }) {
    // const history_data = await $axios.get(
    //   `present/history/${store.state.localStorage.basket.id_basket}`
    // );
    const user_data = await $axios.get(
      `present/users/${store.state.localStorage.uid_auth_user}`
    );

    
    return {user_data: user_data.data };
  },
  methods: {
    onHistory(){
        this.$axios
        .$get(`present/history/${this.$store.state.localStorage.basket.id_basket}`,{
          
        })
        .then((resp) => {
         this.history_data  = resp
         this.count = 1

        })
        .catch(function (error) {
         console.log(error);
        });
    },
    onPageHistory(zakaz_num){
          this.$router.push('/cabinet/history/'+zakaz_num)
          console.log(zakaz_num);
        },
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
  data() {
    return {
      dialog: false,
      history_data:[],
      count:0
    };
  },
}
</script>

<style >
.prof{
  cursor: pointer;
}
</style>