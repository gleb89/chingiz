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
        <span style="color:white;margin-top:.2em" >Подарки</span>
        <!-- <img width="26" height="28" src="/searchbtn.png" alt=""> -->
        <fa style="color: #f67a04;
    font-size: 2em;" icon="gift"></fa>
        
      </v-btn>
      

    
     <v-btn v-if="!userauth" icon @click="dialog = !dialog">
        <span style="color:white" >Войти</span>
        <img width="26" height="26"  src="/userbtn.png" alt="">
      </v-btn>
 <v-btn @click="dialogcabinet = !dialogcabinet" v-if="userauth" icon
            class=""
            style="height: max-content;"
          >
        <div style="margin-right: 7px;margin-top: 0.32rem;">
        <img width="26" height="26"  style="width: 1.5rem;" src="/login.svg" alt="" />
        <p style="color:white">
          кабинет
        </p>
        
      </div>
          </v-btn>
  
      <v-dialog
    
      v-model="dialogcabinet"
      fullscreen
      hide-overlay
      transition="dialog-bottom-transition"
    >
      <v-card>
        <v-toolbar
          dark
          color="#494A51"
        >
          <v-btn
            icon
            dark
            @click="dialogcabinet = false"
          >
            <v-icon color="white">mdi-close</v-icon>
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
            <v-avatar size="60px" color='white'>
                <fa v-if="!user_data.avatar" icon="user"></fa>
                <img
              v-if="user_data.avatar"
                alt="Avatar"
                :src="user_data.avatar"
              />
            </v-avatar>
          </div>
         
          
          <p class="text-center" style="color: #ff7a00;margin-top:2rem">{{user_data.points}} бонусов</p>
          <div style="font-weight: bold;width:100%" class="text-center">El-Bazaar</div>

           <p v-if="user_data.firstname" class="text-center">{{user_data.firstname}}</p>
          <p v-if="!user_data.firstname" class="text-center"><NuxtLink to="/cabinet" >Имя еще не предоставлено</NuxtLink></p>
          <div class="box-profile">
                      <div v-if="user_data.insta">
          
            <v-btn 
             v-if="!user_data.insta.length" 
            @click="onInsta" 
            rounded
            color="white"
            style="min-width: 20%;height: 2rem;">
              получить бонусы  <img class="ml-3" width="23" src="/insta.png" alt="">
            </v-btn>
         </div>
            <div class="prof d-flex justify-space-between mt-4" @click="onPagecabinet('cabinet')">
              <p>Настройки профиля</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between" @click="onPagecabinet('cabinet/basket')">
              <p>Корзина</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between" @click="onPagecabinet('cabinet/history')">
              <p>История заказов</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div @click="onPagecabinet('cabinet/bonus')" class="prof d-flex justify-space-between">
              <p>Бонусы</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div @click="onsignout" class="prof d-flex justify-space-between">
              <p>Выйти</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
            
          </div>
        </v-card>
      </v-card>
    </v-dialog>
     
      

      <v-btn icon style="position: relative;" @click="onBasket">
    
        <span style="color: #ff7a00;" >{{basket.summ_present.toLocaleString()}} тг</span>
        <img width="26" height="26" src="/baskbtn.png" alt="">
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
      dialogcabinet :false,
      bonus_count:0,
      user_data_list:[],
     
      resp_data:0
    };
  },

  
    computed: {
      user_data(){
        return this.$store.state.user.user
      },
      basket(){
      return this.$store.state.localStorage.basket
    },
    userauth() {
      return this.$store.state.localStorage.uid_auth_user
    },
  
  },

    methods: {
      onInsta(){
        this.$router.push('/cabinet/insta')
        this.dialogcabinet = false
      },
      onPagecabinet(url){
      this.$router.push('/'+url)
      this.dialogcabinet = false
    },
    onBasket(basket_id){
 if(this.$store.state.localStorage.basket.id_basket > 0){
        if(this.$store.state.localStorage.uid_auth_user){
        this.$router.push('/'+'cabinet/basket')
        }
        else{
        this.$router.push('/basket/'+this.$store.state.localStorage.basket.id_basket)
        }
        
      }
          else{
        this.$router.push('/basket')
        }
     
      
    },


    onCatalog(){
      this.$router.push("/"+'catalog');
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
      localStorage.removeItem('id_basket');
      localStorage.removeItem('uid_auth_user');
      localStorage.removeItem('summ_present');
      this.dialogcabinet = false
      this.$router.push('/')
    }
    },
}
</script>
<style >

</style>
