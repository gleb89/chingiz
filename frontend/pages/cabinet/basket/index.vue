<template>
  <v-container style="padding-top: 5rem">
    <h2 class="mb-4 d-lg-block d-none">Корзина</h2>
     <div class="d-flex">
        <nuxt-link class="d-lg-block d-none" style="color: #303030" to="/">Главная/</nuxt-link> 
          <span class="d-lg-block d-none" style="color: #303030" 
            >Корзина</span 
          >
          </div>

          <div @click="gopage" class="d-lg-none d-block"
           style="background: whitesmoke;width: 100%;padding:1rem;color:#7C7C7C">
            <fa style="font-size: 1rem;" icon="chevron-left"></fa>
             <span style="margin-left:1rem">Продолжить покупки</span>
          </div>
   
           <div class="d-block d-lg-none">
    <v-dialog
    
      v-model="dialog"
      fullscreen
      hide-overlay
      transition="dialog-bottom-transition"
    >
      <template v-slot:activator="{ on, attrs }">
            <v-btn
            class="btn-mobile-filter"
            v-bind="attrs"
            v-on="on"
            text
            rounded
            style="height: 39px; margin: 0.7rem; border-color: white;margin-top: 3rem;"
            color="indigo"
            outlined
            dark
          >
          <img src="/mobapp.png" alt="">
            <span style="font-size: 12px; color: black"
              >Меню пользователя</span
            >
          </v-btn>
      </template>
      <v-card>
        <v-toolbar
          dark
          color="orange"
        >
          <v-btn
            icon
            dark
            @click="dialog = false"
          >
            <v-icon>mdi-close</v-icon>
          </v-btn>
          <v-toolbar-title>Меню пользователя</v-toolbar-title>
          <v-spacer></v-spacer>
          <v-toolbar-items>

   
          </v-toolbar-items>
        </v-toolbar>
                <v-card
          
          color="#F4F5F6"
          style="padding: 1rem;height: 100vh;"
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
           <div class="prof d-flex justify-space-between">
              <p>Бонусы</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between">
              <p>Выйти</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
            
          </div>
        </v-card>
      </v-card>
    </v-dialog>
    </div>
    <v-row  justify="center" class="mt-4">
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
           <div class="prof d-flex justify-space-between">
              <p>Корзина</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between" @click="onPage('cabinet/history')">
              <p>История заказов</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between">
              <p>Бонусы</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between">
              <p>Выйти</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
            
          </div>
        </v-card>
           <v-card
              class="rounded-xl text-center"
              color="#F4F5F6"
              style="padding:1rem;margin-top: 3rem;margin-bottom: 3rem;"
                elevation="6"
              >
              <p>
                Итого: {{basket.summ_present.toLocaleString()}} тг.
              </p>
              <span style="font-size: .9rem;">Товаров в корзине: {{presents.length}} шт</span>
              <div style="margin-top:1rem">
             <div>
                <v-btn
                @click="remove"
            rounded
            
            style="height: 39px; margin-top: 1.3rem; background: #f4f5f6;color: black;border: 1px solid #ff7a00;"
            dark
          >
            <span style="font-size: .6rem">очистить корзину</span>
          </v-btn>
              </div>
  
             
              </div>
              </v-card>
      </v-col>
      <v-col v-if="presents.length" cols="12" md="9" lg="9">
        <Basket
          :presents="presents"
          :delete_present_in_basket="delete_present_in_basket"
          :item_add_count="item_add_count"
          :item_remove_count="item_remove_count"
        />
                   <v-card
              class="rounded-xl text-center d-lg-none d-block"
              color="#F4F5F6"
              style="padding:1rem;margin-top: 3rem;margin-bottom: 3rem;"
                elevation="6"
              >
              <p>
                Итого: {{basket.summ_present.toLocaleString()}} тг.
              </p>
              <span style="font-size: .9rem;">Товаров в корзине: {{presents.length}} шт</span>
              <div style="margin-top:1rem">
             <div>
                <v-btn
                @click="remove"
            rounded
            
            style="height: 39px; margin-top: 1.3rem; background: #f4f5f6;color: black;border: 2px solid #ff7a00;"
            dark
          >
            <span style="font-size: .6rem;color:676767">очистить корзину</span>
          </v-btn>
              </div>
  
             
              </div>
              </v-card>
            <div class="text-center" style="padding-top:3rem">
                <v-btn
                @click="onformuser"
                
            rounded
            color="#ff7a00"
            style="min-width: 30%;height: 3rem;"
            dark
          >
            <span style="font-size: .6rem">перейти к оформлению</span>
          </v-btn>
          <p style="margin-top:3rem;">
          <nuxt-link  style="color:black" to="/catalog/Все_продукты">продолжить покупки</nuxt-link> 
              </p>
              </div>
        <div style="font-size: 0.9rem; margin-top: 4rem">
          <p>
            За каждую покупку в личном кабинете вам начисляются бонусы. 1 бонус
            = 1 тенге. Оплачивайте до 100% суммы покупок бонусами. Подробнее в
            разделе Бонусы.
          </p>
          <p>
            Если у вас остались вопросы позвоните нам по номеру, указанному в
            шапке профиля.
          </p>
        </div>
      </v-col>
      <v-col v-if="!presents.length" cols="12" md="9" lg="9">
        <h4 class="text-center">Корзина пуста</h4>
        </v-col>
    </v-row>

  </v-container>
</template>

<script>
let headers = {
  "Content-Type": "application/json",
};
export default {
  asyncData({ $axios, route, store }) {
    const headers = {
      "Content-Type": "application/json",
    };
    const id_basket = store.state.localStorage.basket.id_basket;
    return $axios
      .$get(`present/users/basket/${id_basket}`, {
        headers: headers,
      })
      .then((presents_in_basket) => {
        return { presents_in_basket };
      });
  },
  computed: {
    basket() {
      return this.$store.state.localStorage.basket;
    },
    presents() {
      this.data_present = this.presents_in_basket.count_present_item.presents;
      return this.data_present;
    },
  },
  data() {
    return {
      data_present: [],
      ws: null,
      index: null,
      dialog: false,
    };
  },
  mounted: function () {
    let self = this;
    this.ws = new WebSocket("ws://82.148.17.12:8080/ws/present/basket");
    this.ws.onmessage = (event) => {
      let response = JSON.parse(event.data);
      if (response.message === "remove_all") {
        self.data_present.splice(0, self.data_present.length);
        self.$store.commit(
          "localStorage/set_summBasket",
          Number(response.summa)
        );
      }
      if (response.message === "one_remove") {
        self.data_present.splice(self.index, 1);
        self.data_present = response.presents;
        self.$store.commit(
          "localStorage/set_summBasket",
          Number(response.summa)
        );
      }
      if (response.message === "add_count") {
        self.data_present[self.index].count = response.item.count;
        self.data_present[self.index].price = response.item.price;
        self.$store.commit(
          "localStorage/set_summBasket",
          Number(response.summa)
        );
      }
      if (response.message === "remove_count") {
        self.data_present[self.index].count = response.item.count;
        self.data_present[self.index].price = response.item.price;
        self.$store.commit(
          "localStorage/set_summBasket",
          Number(response.summa)
        );
      }
    };
  },
  methods: {
    onformuser(){
      this.$router.push('/cabinet/basket/'+'ordering')
    },
    gopage(){
      this.$router.go(-1);
    },
    onPage(url){
      this.$router.push('/'+url)
    },
    item_add_count(pres_id, index) {
      this.index = index;
      this.ws.send(
        JSON.stringify({
          message: "add_count",
          basket_id: this.presents_in_basket.id,
          present_id: pres_id,
        })
      );
    },
    item_remove_count(pres_id, index) {
      this.index = index;
      this.ws.send(
        JSON.stringify({
          message: "remove_count",
          basket_id: this.presents_in_basket.id,
          present_id: pres_id,
        })
      );
    },
    remove() {
      this.ws.send(
        JSON.stringify({
          message: "remove_all",
          basket_id: this.presents_in_basket.id,
          present_id: 0,
          clear: "remove",
        })
      );
    },
    delete_present_in_basket(pres_id, index) {
      this.index = index;
      this.ws.send(
        JSON.stringify({
          message: "remove_one",
          basket_id: this.presents_in_basket.id,
          present_id: pres_id,
        })
      );
    },
  },
};
</script>

<style >
.prof{
  cursor: pointer;
}
</style>