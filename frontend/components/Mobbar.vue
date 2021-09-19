<template>
<div>
    <v-bottom-navigation
      fixed
      background-color="#494A51"
      
    >
     
     <!-- <v-btn text style="" @click="onPage('/')">
     <div>
       <img style="max-width:5rem;margin-top:.3rem" fluid src="/logobtn.png" alt="">
     </div>
     <div>
        <span style="color:white;font-size: 15px;" >Главная</span>
     </div>
        
      </v-btn> -->
      
      <v-btn icon @click="onCatalog">
        <span style="color:white" >Поиск</span>
        <img src="/searchbtn.png" alt="">
      </v-btn>
      

    
     <v-btn v-if="!userauth" icon @click="dialog = !dialog">
        <span style="color:white" >Войти</span>
        <img src="/userbtn.png" alt="">
      </v-btn>

       <v-btn @click="onsignout" v-if="userauth" icon >
      <div class="nav-link box-icon_text">
    <v-menu
    
        bottom
        offset-y
      >
        <template v-slot:activator="{ on, attrs }">
          <v-btn
            class=""
            v-bind="attrs"
            v-on="on"
            style="height: max-content;"
          >
        <div style="margin-right: 7px;margin-top: 1.2rem;">
        <img style="width: 1.5rem;" src="/login.svg" alt="" />
        <p style="color:white">
          кабинет
        </p>
        
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
      </v-btn>

      <v-btn icon style="position: relative;" @click="onBasket('basket/'+$store.state.localStorage.basket.id_basket)">
    
        <span style="color: #ff7a00;" >{{basket.summ_present.toLocaleString()}} тг</span>
        <img src="/baskbtn.png" alt="">
      </v-btn>

          <v-dialog
      v-model="dialog"
      persistent
      max-width="600px"
      
    >
    <v-card style="padding:1rem">
    <SignIn :dialog_exit="dialog_exit" :close="close"/>

    </v-card>
    </v-dialog>
    </v-bottom-navigation>
</div>
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
    onBasket(basket_id){
      if(this.$store.state.localStorage.basket.id_basket > 0){
        if(this.$store.state.localStorage.uid_auth_user){
        this.$router.push('/'+'cabinet/basket')
        }
        else{
        this.$router.push('/'+basket_id)
        }
        
      }
     
      
    },
    onCatalog(){
      this.$router.push("/"+'catalog/Все_продукты');
    },
    onCabinet(){
      this.$router.push('/cabinet')
    },
    close(){
      this.dialog = !this.dialog
    },
    dialog_exit(){
      this.dialog = false
    },
       onPage(url) {
           this.$router.push('/')
            
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

</style>
