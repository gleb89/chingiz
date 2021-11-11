
<template>
  <v-container style="padding-top: 6rem">
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
             <span style="margin-left:1rem">назад</span>
          </div>
   
           <div class="d-block d-lg-none">

    </div>
    <v-row  justify="center" class="mt-4">
      <v-col class="d-none d-lg-block" cols="12" md="3" lg="3">
      <CardUser :user_data="user_data"/>
      
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
          <nuxt-link  style="color:black" to="/catalog/all_presents">продолжить покупки на сайте</nuxt-link> 
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
  async asyncData({ $axios, store }) {
    const presents_in_basket = await $axios.get(
      `http://giftcity.kz:8001/api/v1/present/users/basket/${store.state.localStorage.basket.id_basket}`
    );

    return { presents_in_basket: presents_in_basket.data };
  },
  computed: {
    basket() {
      return this.$store.state.localStorage.basket;
    },
        user_data(){
        return this.$store.state.user.user
      },
    presents() {
      try {
      this.data_present = this.presents_in_basket.count_present_item.presents;
        
      } catch (error) {
        if(process.client){
        if (this.coun === 0){
          this.onhist()
        }
          
      }
      }
      return this.data_present;
    },
  },
  data() {
    return {
      data_present: [],
      ws: null,
      index: null,
      dialog: false,
      coun:0
    };
  },
  mounted: function () {
    let self = this;
    this.ws = new WebSocket("wss://giftcity.kz/ws/present/basket");
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

      async onhist(){
      console.log(44,this.$store.state.localStorage.basket.id_basket);

          await this.$axios.get(
     `http://giftcity.kz:8001/api/v1/present/users/basket/${this.$store.state.localStorage.basket.id_basket}`
    )
    .then((resp) =>{
      this.data_present = resp.data.count_present_item.presents
      this.coun = 1
    }),
      (error) => {
        console.log('error');
      }
  },
            onsignout(){
      console.log('out');
      this.$store.commit("localStorage/setAuthuser", '');
      this.$store.commit("localStorage/set_summBasket",Number(0));
      this.$store.commit("localStorage/set_idBasket",Number(0));
      this.$router.push("/");
   
    },
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
          basket_id: this.$store.state.localStorage.basket.id_basket,
          present_id: pres_id,
        })
      );
    },
    item_remove_count(pres_id, index) {
      this.index = index;
      this.ws.send(
        JSON.stringify({
          message: "remove_count",
          basket_id: this.$store.state.localStorage.basket.id_basket,
          present_id: pres_id,
        })
      );
    },
    remove() {
      this.ws.send(
        JSON.stringify({
          message: "remove_all",
          basket_id: this.$store.state.localStorage.basket.id_basket,
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
          basket_id: this.$store.state.localStorage.basket.id_basket,
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