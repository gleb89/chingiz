<template>
  <nav
  class="text-center"
  style="position: fixed;top: 0;z-index: 1;width:100%;background: white;height: 5rem;"
    >
    <v-container >
      <v-row justify="center">
    <v-col class="mr-lg-8" lg="2" md="1" xl="3" style="text-align: start;">
      <img
      @click="onHome()"
      width="200" height="80"
        style="cursor:pointer;"
        src="/giftcity.svg"
      >
    </v-col>

   <v-col class="d-flex justify-center nav-li">
      <div style="margin-right: 7px">
        <img  width="14" height="12" src="/menu.png" alt="" />
      </div>
      <div @click="onPage('catalog')">
        <span class="text-nav">КАТАЛОГ</span>
      </div> 
    </v-col>
    <v-col @click="onPage('for_work')" class="d-flex justify-center nav-li" >
   
      <span class="text-nav">ДОСТАВКА И ОПЛАТА </span>
   </v-col>
   <v-col @click="onPage('for_bonus')"  class="d-flex justify-center nav-li">
      <span class="text-nav">БОНУСЫ</span>
      </v-col>
      <v-col @click="onPage('business')"  class="d-flex justify-center nav-li">
      <span class="text-nav">ДЛЯ БИЗНЕСА</span>
    </v-col>
    <v-col @click="onPage('contacts')"  class="d-flex justify-center nav-li" style="margin-right: .7em;">
    
      <span class="text-nav">КОНТАКТЫ</span>
   </v-col>
   <v-col @click="onPage('catalog')" class="d-flex justify-center nav-li" style="margin-left: .7em;">
    
      <img width="32" height="32" style="width: 1.5rem;" src="/search.svg" alt="" />
    </v-col>

   <v-col  class="d-flex justify-center nav-li" style="margin-left: 1em;">
       <a  href="tel:+77071015157" style="font-weight: bold;color: #676767;text-decoration: none; color: black"
            >
            <span class="d-xl-block d-lg-none" style="color: #676767;">+7 (707) 101 51 57</span>
            <img width="23" height="23" class="d-xl-none d-lg-block" style="width:23px" fluid src="/Telephone.png">
            </a
          >
      <img width="23" height="23" style="margin-left:.7rem;width:23px" src="/telegram.svg" alt="" />
       <a style=" text-decoration: none;color:black ;    display: flex;
    align-items: center;" href="https://wa.me/77071015157/" target="blank">
                
              <img width="23" height="23" style="margin-left:.7rem;width:23px" src="/whatsapp.svg" alt="" />
                   
                    </a>
      
    </v-col>
      <v-col v-if="!userauth"  class="d-flex flex-nowrap justify-center nav-li" style="margin-left: .7em;">
    
      <div style="margin-right: 7px">
        <img src="/login.svg" alt="" />
      </div>
      <div  @click="onsign">
        <span class="text-nav">Войти</span>
      </div>
    </v-col>
  
  <v-col v-if="userauth"  class="d-flex justify-center nav-li" style="margin-left: .7em;">
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
        <img width="24" height="24"  src="/login.svg" alt="" />
      </div>
          </v-btn>
        </template>
        <v-list>
          <v-list-item
          @click="onCabinet"
          >
            <v-list-item-title>  Кабинет</v-list-item-title>
          </v-list-item>
           <v-list-item
           @click="onsignout"
          >
            <v-list-item-title>Выйти</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
    </v-col>
<v-col style="min-width: 2em;" @click="onBasket('basket/'+$store.state.localStorage.basket.id_basket)"  class="d-flex flex-nowrap justify-center nav-li">
   
      <div style="margin-right: 7px">
        <img width="24" height="24" src="/bascket.svg" alt="" />
      </div>
      <div>
        <span class="text-nav">{{basket.summ_present.toLocaleString()}} тг</span>
      </div>
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
      this.$vuetify.goTo(0)
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
      else{
        this.$router.push('/'+'basket')
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
      this.$router.push("/"+'catalog/all_presents');
    },
    onsign(){
     this.dialog = true
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

.text-nav {
  
  color: #676767;
  font-weight: 500;
}
@media (max-width: 1906px) {
  .text-nav {
    font-size: .8em;
}
}
.nav-link {
  padding: 1rem;
  cursor: pointer;
}
.box-icon_text {
  display: flex;
  background: none;
}
.nav-li{
  align-items: center;
  cursor:pointer;
  min-width: max-content;
  max-width: max-content;
}
/* @media (max-width:1890px) {
  .text-nav{
    font-size: .8rem;
  }
} */

</style>