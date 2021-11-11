<template>
  <v-container style="padding-top: 6rem">
    <h2 class="mb-4 d-lg-block d-none">Корзина</h2>
    <div class="d-flex">
      <nuxt-link class="d-lg-block d-none" style="color: #303030" to="/"
        >Главная/</nuxt-link
      >
      <nuxt-link
        class="d-lg-block d-none"
        style="color: #303030"
        to="/cabinet/basket"
        >Корзина/</nuxt-link
      >
      <span style="color: #222121a1"> оформление заказа</span>
    </div>
    <div>
      <h2>Оформление заказа</h2>
    </div>
    <div
      @click="gopage"
      class="d-lg-none d-block"
      style="background: whitesmoke;width: 100%;padding:1rem;color:#7C7C7C"
    >
      <fa style="font-size: 1rem;" icon="chevron-left"></fa>
      <span style="margin-left:1rem">Продолжить покупки</span>
    </div>

    <v-row justify="center" class="mt-4">
      <v-col class="d-none d-lg-block" cols="12" md="3" lg="3">
        <CardUser :user_data="user_data"/>
      </v-col>
      <v-col cols="12" md="9" lg="9">
        <v-tabs color="orange" left>
         
          <v-tab @click="onofizplata">Для физ. лиц</v-tab>
          <v-tab @click="onourplata">Для юр. лиц</v-tab>
         
          <v-tab-item v-if="presents_in_basket.count_present_item ">
  
            <Oplatafiz
             :presents_in_basket="presents_in_basket"
              :user_data="user_data"
               :oplatacheck="oplatacheck"
              :retbonus="retbonus"
              />
          </v-tab-item>
          <v-tab-item v-if="presents_in_basket.count_present_item ">
            <Oplataur
             :presents_in_basket="presents_in_basket"
              :user_data="user_data"
              :retbonus="retbonus"
               :oplatacheck="oplatacheck"/>
          </v-tab-item>
        </v-tabs>
      </v-col>
              
    </v-row>
  </v-container>
</template>

<script>
export default {
  async asyncData({ $axios, store }) {
    const presents_in_basket = await $axios.get(
      `http://giftcity.kz:8001/api/v1/present/users/basket/${store.state.localStorage.basket.id_basket}`
    );

    return { presents_in: presents_in_basket.data};
  },
  computed: {
    basket() {
      return this.$store.state.localStorage.basket;
    },
    user_data(){
        return this.$store.state.user.user
      },
    presents_in_basket(){
      if(process.browser){
        if (this.coun === 0){
          this.onhist()
        }
      }
      else{
        this.presents_indata = []
      }
      return this.presents_indata
    }
  },

  data() {
    return {
      fizoplata:true,
      uroplata:false,
      tab: null,
      data_present: [],
      ws: null,
      index: null,
      dialog: false,
      presents_indata:[],
      coun:0
      
      
    };
  },

  methods: {
    async onhist(){
      console.log(44,this.$store.state.localStorage.basket.id_basket);
    if(this.$store.state.localStorage.basket.id_basket){
          await this.$axios.get(
    `http://giftcity.kz:8001/api/v1/present/users/basket/${this.$store.state.localStorage.basket.id_basket}`
    )
    .then((resp) =>{
      this.presents_indata= resp.data
      this.coun = 1
    }),
      (error) => {
            console.log(error);
      }
      }
  },
      retbonus() {
        this.$axios
        .$get(`http://giftcity.kz:8001/api/v1/present/users/${this.$store.state.localStorage.uid_auth_user}`,{
        })
        .then((resp) => {
          console.log(resp);
        this.$store.commit("user/setusers",resp);
        })
        .catch(function (error) {
         console.log(error);
        });

  },
    onofizplata(){
      this.fizoplata = true
      this.uroplata = false
    },
    onourplata(){
      this.fizoplata = false
      this.uroplata = true
    },
    oplatacheck(){
      if(this.fizoplata){
       

      }
      else{
        console.log('ur');
      }
    },
      onsignout(){
      console.log('out');
      this.$store.commit("localStorage/setAuthuser", '');
      this.$store.commit("localStorage/set_summBasket",Number(0));
      this.$store.commit("localStorage/set_idBasket",Number(0));
      this.$router.push("/");
   
    },
    gopage() {
      this.$router.go(-1);
    },
    onPage(url) {
      this.$router.push("/" + url);
    }
  }
};
</script>

<style>
.prof {
  cursor: pointer;
}
</style>
