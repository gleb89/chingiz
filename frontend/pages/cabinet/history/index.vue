<template>
  <v-container style="padding-top: 6rem;padding-bottom: 4rem">
    <h2 class="mb-4">История заказов</h2>
    <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
    <span>История заказов</span>
   
       <div class="d-block d-lg-none">

    </div>
    <v-row justify="center" class="mt-4">
      <v-col class="d-none d-lg-block" cols="12" md="3" lg="3">
        <v-card
          class="rounded-xl"
          color="#F4F5F6"
          style="padding: 1rem"
          elevation="6"
        >
          <div class="text-center">
            <v-avatar size="60px">
              <img
                alt="Avatar"
                src="https://avatars0.githubusercontent.com/u/9064066?v=4&s=460"
              />
            </v-avatar>
          </div>
          <p class="text-center" style="color: #ff7a00;margin-top:2rem">780 бонусов</p>
          <div style="font-weight: bold;width:100%" class="text-center">El-Bazaar</div>
          <p class="text-center">Петров Олег Игоревич</p>
          <div class="box-profile">
            <div class="prof d-flex justify-space-between" @click="onPage('cabinet')">
              <p>Настройки профиля</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between" @click="onPage('cabinet/basket')">
              <p>Корзина</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between" @click="onPage('cabinet/history')">
              <p>История заказов</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div @click="onPage('cabinet/bonus')" class="prof d-flex justify-space-between">
              <p>Бонусы</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div @click="onsignout" class="prof d-flex justify-space-between">
              <p>Выйти</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
            
          </div>
        </v-card>
      </v-col>
 
      <v-col v-if="history_data[0].history.length" cols="12" md="9" lg="9">
        <h2>История заказов</h2>
            <History :data_history="history_data[0].history"/>
      </v-col>
      <v-col v-if="!history_data[0].history.length" cols="12" md="9" lg="9">
        <h2 class="text-center">История заказов отсутсвует</h2>
          
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
      asyncData({ $axios,store}) {
    const headers = {
      "Content-Type": "application/json",
    };
    let basket_id = store.state.localStorage.basket.id_basket
    return $axios
      .$get(`present/history/${basket_id}`, {
        headers: headers,
      })
      .then((history_data) => {
     
        return { history_data };
      });
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
  data() {
    return {
      dialog: false,
    };
  },
}
</script>

<style >
.prof{
  cursor: pointer;
}
</style>