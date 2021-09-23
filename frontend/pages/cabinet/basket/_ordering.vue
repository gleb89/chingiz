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
          <p class="text-center" style="color: #ff7a00;margin-top:2rem">
            780 бонусов
          </p>
          <div style="font-weight: bold;width:100%" class="text-center">
            El-Bazaar
          </div>
          <p class="text-center">Петров Олег Игоревич</p>
          <div class="box-profile">
            <div
              class="prof d-flex justify-space-between"
              @click="onPage('cabinet')"
            >
              <p>Настройки профиля</p>
              <img
                style="height: 10px;margin-top: .5rem;"
                src="/vect.png"
                alt=""
              />
            </div>
            <div
              class="prof d-flex justify-space-between"
              @click="onPage('cabinet/basket')"
            >
              <p>Корзина</p>
              <img
                style="height: 10px;margin-top: .5rem;"
                src="/vect.png"
                alt=""
              />
            </div>
            <div
              class="prof d-flex justify-space-between"
              @click="onPage('cabinet/history')"
            >
              <p>История заказов</p>
              <img
                style="height: 10px;margin-top: .5rem;"
                src="/vect.png"
                alt=""
              />
            </div>
            <div @click="onPage('cabinet/bonus')" class="prof d-flex justify-space-between">
              <p>Бонусы</p>
              <img
                style="height: 10px;margin-top: .5rem;"
                src="/vect.png"
                alt=""
              />
            </div>
            <div @click="onsignout"  class="prof d-flex justify-space-between">
              <p>Выйти</p>
              <img
                style="height: 10px;margin-top: .5rem;"
                src="/vect.png"
                alt=""
              />
            </div>
          </div>
        </v-card>
      </v-col>
      <v-col cols="12" md="9" lg="9">
        <v-tabs color="orange" left>
         
          <v-tab @click="onofizplata">Для физ. лиц</v-tab>
          <v-tab @click="onourplata">Для юр. лиц</v-tab>
          <v-tab-item>
            <Oplatafiz :presents_in_basket="presents_in_basket" />
          </v-tab-item>
          <v-tab-item>
            <Oplataur :presents_in_basket="presents_in_basket" />
          </v-tab-item>
        </v-tabs>
      </v-col>
              <div class="text-center pt-4 pb-7">
              <v-btn
               
                @click="oplatacheck"
            rounded
            color="#ff7a00"
            style="min-width: 30%;height: 3rem;"
            dark
          >
            <span style="font-size: .6rem">перейти к оформлению</span>
          </v-btn>
            </div>
    </v-row>
  </v-container>
</template>

<script>
let headers = {
  "Content-Type": "application/json"
};
export default {
  asyncData({ $axios, route, store }) {
    const headers = {
      "Content-Type": "application/json"
    };
    const id_basket = store.state.localStorage.basket.id_basket;
    return $axios
      .$get(`present/users/basket/${id_basket}`, {
        headers: headers
      })
      .then(presents_in_basket => {
        return { presents_in_basket };
      });
  },
  computed: {
    basket() {
      return this.$store.state.localStorage.basket;
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
      dialog: false
    };
  },

  methods: {
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
        let basket_id = this.$store.state.localStorage.basket.id_basket
        window.location.href = `http://82.148.17.12:8080/api/v1/present/history/oplata/for_end/${basket_id}`

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
