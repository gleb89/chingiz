<template>
  <v-container style="padding-top: 6rem;padding-bottom: 4rem">
    <h2 class="mb-4">История заказов</h2>
    <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
    <span>История  заказов</span>
   
       <div class="d-block d-lg-none">

    </div>
    <v-row justify="center" class="mt-4">
      <v-col class="d-none d-lg-block" cols="12" md="3" lg="3">
      <CardUser :user_data="user_data"/> 
      </v-col>

      <v-col v-if="history_data" cols="12" md="9" lg="9">
        <h2 class="d-lg-block d-none">История оплаченных заказов</h2>
            <History :data_history="history_data" :onPageHistory="onPageHistory"/>
      </v-col>
      <v-col v-if="!history_data" cols="12" md="9" lg="9">
        <h2 class="text-center">История заказов отсутсвует</h2>
          
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  // async asyncData({ $axios, store }) {
  //   const user_data = await $axios.get(
  //     `/api/present/users/${store.state.localStorage.uid_auth_user}`
  //   );
  //   return {user_data :  user_data.data};
  
  // },
  
  computed: {
    user_data(){
        return this.$store.state.user.user
      },
    history_data() {
      if(process.browser){
        if (this.coun === 0){
          this.onhist()
        }
          
      }
      else{
      this.history_da = []
      }
      return this.history_da.filter((elem) => {
        return elem.succes_oplata  === true
      });
    },
  
  },
  methods: {
    async onhist(){
      console.log(44,this.$store.state.localStorage.basket.id_basket);
    if(this.$store.state.localStorage.basket.id_basket){
          await this.$axios.get(
     `/api/present/history/${this.$store.state.localStorage.basket.id_basket}`
    )
    .then((resp) =>{
      this.history_da= resp.data
      this.coun = 1
    }),
      (error) => {
            console.log(error);
      }
      }
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
      history_da:[],
      coun :0
    };
  },
}
</script>

<style >
.prof{
  cursor: pointer;
}
</style>