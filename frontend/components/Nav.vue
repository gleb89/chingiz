<template>
  <nav
  class="text-center"
  style="position: fixed;top: 0;z-index: 1;width:100%;background: white;height: 5rem;"
    >
    <v-container class="d-flex justify-center">
    <div style="padding-right: 3rem">
      <img
      @click="onHome()"
        style="cursor:pointer;width: 9rem;"
        src="/Logo.png"
      >
    </div>

    <div class="nav-link box-icon_text">
      <div style="margin-right: 7px">
        <img src="/menu.png" alt="" />
      </div>
      <div @click="onPage('catalog/Все_продукты')">
        <span class="text-nav">Каталог</span>
      </div> 
    </div>
    <div style="min-width: 5rem;"  @click="onPage('o_nas')"  class="nav-link">
      <span class="text-nav">О нас</span>
    </div>
    <div style="min-width: 12rem;"  @click="onPage('for_work')" class="nav-link">
      <span class="text-nav">Доставка и оплата </span>
    </div>
    <div @click="onPage('for_bonus')" class="nav-link">
      <span class="text-nav">Бонусы</span>
    </div>
    <div style="min-width: 9rem;" @click="onPage('business')" class="nav-link">
      <span class="text-nav">Для Бизнеса</span>
    </div>
    <div class="nav-link">
      <span class="text-nav">Контакты</span>
    </div>
    <div class="nav-link" style="cursor:pointer" @click="onCatalog">
      <img style="width: 1rem" src="/search.svg" alt="" />
    </div>

    <div style="min-width: 14rem;" class="nav-link">
      <span class="text-nav">+7 (888) 777 77 88</span>
      <img style="width: 1rem;margin-left:.7rem" src="/tt.png" alt="" />
      <img style="width: 1rem;margin-left:.7rem" src="/ww.png" alt="" />
    </div>
            
    <div class="nav-link box-icon_text" v-if="!userauth">
      <div style="margin-right: 7px">
        <img src="/login.svg" alt="" />
      </div>
      <div  @click="onsign">
        <span class="text-nav">Войти</span>
      </div>
    </div>
  
      <div class="nav-link box-icon_text" v-if="userauth">
    <v-menu
    
        bottom
        offset-y
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
          text
            class=""
            v-bind="attrs"
            v-on="on"
            style="height: max-content;"
          >
        <div style="margin-right: 7px">
        <img src="/login.svg" alt="" />
      </div>
          </v-btn>
        </template>
        <v-list>
          <v-list-item
          @click="onCabinet"
          >
            <v-list-item-title>Кабинет</v-list-item-title>
          </v-list-item>
           <v-list-item
           @click="onsignout"
          >
            <v-list-item-title>Выйти</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
    </div>

    <div style="min-width: 8rem;" class="nav-link box-icon_text" @click="onBasket('basket/'+$store.state.localStorage.basket.id_basket)">
      <div style="margin-right: 7px">
        <img src="/bascket.svg" alt="" />
      </div>
      <div>
        <span class="text-nav">{{basket.summ_present.toLocaleString()}} тг</span>
      </div>
    </div>
    <v-dialog
      v-model="dialog"
      persistent
      max-width="600px"
      
    >
    <v-card style="padding:1rem">
    <SignIn :dialog_exit="dialog_exit" :close="close"/>

    
    </v-card>
    </v-dialog>
    </v-container>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      dialog: false,
    
    };
  },
  computed: {
    basket(){
      return this.$store.state.localStorage.basket
    },
    userauth() {
      return this.$store.state.localStorage.uid_auth_user
    },
  
  },

  methods: {
    onHome(){
      this.$router.push('/')
    },
    onCabinet(){
      this.$router.push('/cabinet')
    },
    onBasket(basket_id){
      if(this.$store.state.localStorage.basket.id_basket > 0){
        if(this.$store.state.localStorage.uid_auth_user){
        this.$router.push('/cabinet/basket')
        }
        else{
        this.$router.push('/'+basket_id)
        }
        
      }
     
      
    },
    close(){
      this.dialog = !this.dialog
    },
    dialog_exit(){
      this.dialog = false
    },
    onPage(url) {
      this.$router.push('/'+url)
    },
    onCatalog(){
      this.$router.push("/"+'catalog/Все_продукты');
    },
    onsign(){
     this.dialog = true
    },
    onsignout(){
      console.log('out');
      this.$store.commit("localStorage/setAuthuser", '');
      this.$store.commit("localStorage/set_summBasket",Number(0));
      this.$store.commit("localStorage/set_idBasket",Number(0));
    }
  },
}
</script>

<style >
.text-nav {
  font-size: 14px;
}
.nav-link {
  padding: 1rem;
  cursor: pointer;
}
.box-icon_text {
  display: flex;
  background: none;
}
/* @media (max-width:1890px) {
  .text-nav{
    font-size: .8rem;
  }
} */

</style>