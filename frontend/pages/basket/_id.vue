<template>
    <v-container style="padding-top:5rem">
        <h2  class="mb-4 d-lg-block d-none">Корзина</h2>
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
        <v-row justify="center" class="mt-4">
          <v-col v-if="presents.length" cols="12" md="9" lg="9">
              <Basket
              :presents="presents"
              :delete_present_in_basket="delete_present_in_basket"
              :item_add_count="item_add_count"
              :item_remove_count="item_remove_count"
              />
              <div  style="font-size: .9rem;margin-top:4rem">
              <p>
                За каждую покупку в личном кабинете вам начисляются бонусы. 1 бонус = 1 тенге. Оплачивайте до 100% суммы покупок бонусами. Подробнее в разделе Бонусы.
              </p>
              <p>Если у вас остались вопросы позвоните нам по номеру, указанному в шапке профиля.</p>
          </div>
          </v-col>
          <v-col v-if="!presents.length" cols="12" md="9" lg="9">
        <h4 class="text-center">Корзина пуста</h4>

        </v-col>
          <v-col cols="12" md="3" lg="3">
              <v-card
              class="rounded-xl"
              color="#F4F5F6"
              style="padding:1rem"
                elevation="6"
              >
              <p>
                Итого: {{basket.summ_present.toLocaleString()}} тг.
              </p>
              <span style="font-size: .9rem;">Товаров в корзине: {{presents.length}} шт</span>
              <div style="margin-top:1rem">
              <span style="color:#FF7A00">Внимание!</span>
              <div>
                <span style="font-weight: bold;">
                 Авторизуйтесь, чтобы продолжить оформление и получить бонусы
                </span>
              </div>
              <div>
                <v-btn
                @click="dialog = true"
            rounded
            color="#ff7a00"
            style="height: 39px; margin-top: 1.3rem"
            dark
          >
            <span style="font-size: .6rem">перейти к оформлению</span>
          </v-btn>
              </div>

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
          <v-dialog
      v-model="dialog"
      persistent
      max-width="600px"
      
    >
    <v-card style="padding:1rem">
    <SignIn :dialog_exit="dialog_exit" :close="close"/>

    
    </v-card>
    </v-dialog>
                 </v-row>
      </v-container>
   
</template>

<script>
      let headers = {
        "Content-Type": "application/json"
      };
export default {
     asyncData({ $axios, route, error, $http }) {
    const headers = {
      "Content-Type": "application/json",
    };
    const id_basket = route.params.id;
      return $axios
        .$get(`/api/present/users/basket/${id_basket}`, {
          headers: headers,
        })
        .then((presents_in_basket) => {
          return {presents_in_basket};
        });
  
  },
  computed: {
    basket(){
      if(this.$store.state.localStorage.uid_auth_user){
        this.$router.push('/cabinet/basket')
      }
      return this.$store.state.localStorage.basket
    },
    presents(){
      this.data_present = this.presents_in_basket.count_present_item.presents
      return this.data_present
    }
  
  },
  data() {
    return {
      data_present:[],
      ws: null,
      index:null,
      dialog: false
    };
  },
  mounted: function () {
    let self = this; 
    this.ws = new WebSocket("wss://giftcity.kz/ws/present/basket");
    this.ws.onmessage = (event) => {
      let response = JSON.parse(event.data)
      if (response.message === 'remove_all'){
            self.data_present.splice(0,self.data_present.length)
            self.$store.commit("localStorage/set_summBasket",Number(response .summa)); 
      }
      if (response.message === 'one_remove'){
            self.data_present.splice(self.index, 1);
            self.data_present = response.presents
            self.$store.commit("localStorage/set_summBasket",Number(response.summa)); 
      }
      if (response.message === 'add_count'){
            self.data_present[self.index].count=response.item.count
            self.data_present[self.index].price =response.item.price
            self.$store.commit("localStorage/set_summBasket",Number(response.summa)); 
      }
      if (response.message === 'remove_count'){
            self.data_present[self.index].count=response.item.count
            self.data_present[self.index].price =response.item.price
            self.$store.commit("localStorage/set_summBasket",Number(response.summa)); 
      }
    };
  },
  methods: {
    close(){
      this.dialog = !this.dialog
    },
    dialog_exit(){
      this.dialog = false
    },
        gopage(){
      this.$router.go(-1);
    },
    item_add_count(pres_id,index){
      this.index = index
      this.ws.send(JSON.stringify(
        {
          'message':'add_count',
          'basket_id':this.presents_in_basket.id,
          'present_id':pres_id
          }
        )
        ); 
    },
    item_remove_count(pres_id,index){
      this.index = index
      this.ws.send(JSON.stringify(
        {
          'message':'remove_count',
          'basket_id':this.presents_in_basket.id,
          'present_id':pres_id
          }
        )
        ); 
    },
    remove(){
      this.ws.send(JSON.stringify(
        {
          'message':'remove_all',
          'basket_id':this.presents_in_basket.id,
          'present_id':0,
          'clear':'remove'
          }
        )
        );
    },
      delete_present_in_basket(pres_id,index){
        this.index = index
        this.ws.send(JSON.stringify(
        {
          'message':'remove_one',
          'basket_id':this.presents_in_basket.id,
          'present_id':pres_id
          }
        )
        ); 
    },
  },
  
}
</script>