<template>
  <v-container style="padding-top: 6rem;padding-bottom: 4rem">
    <h2 class="mb-4">Настройки профиля</h2>
    <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
    <span>кабинет профиля</span>
   <div class="d-block d-lg-none">

    </div>
    <v-row justify="center" class="mt-4">
      <v-col class="d-none d-lg-block" cols="12" md="3" lg="3">
      <CardUser :user_data="user_data"/>
      </v-col>
      <v-col cols="12" md="9" lg="9">
        <h2 class="text-center">Настройки профиля</h2>
        {{property}}
<div style="width:100%" class="d-flex justify-center">
    <form  @submit.prevent="onNAme">
        <v-text-field
          v-model="name"
          :counter="10"
            required
          label="Имя"
        ></v-text-field>
        <div class="text-center pt-4 pb-7 mb-6" style="width: 100%;">
            <v-btn
             
            type="submit"
            
            rounded
            color="#ff7a00"
            style="min-width: 30%;height: 3rem;"
            dark
          >
            <span style="font-size: .6rem">сохранить</span>
          </v-btn>
            </div>
      </form>
      </div>
      <div style="width:100%" class="d-flex justify-center">
      <!-- <form  v-if="!ph"  @submit.prevent="onPhone">
        <v-text-field
          v-model="phoneNumber"
          :counter="12"
          
          label="Номер телефона"
          required
        ></v-text-field>
        <div class="text-center pt-4 pb-7 mb-6" style="width: 100%;">
            <v-btn
            type="submit"
            
            rounded
            color="#ff7a00"
            style="min-width: 30%;height: 3rem;"
            dark
          >
            <span style="font-size: .6rem">сохранить</span>
          </v-btn>
            </div>
      
     </form> -->
     </div>
      <div style="width:100%" class="d-flex justify-center">
     <!-- <form v-if="!em"  @submit.prevent="onEmail">
        <v-text-field
          v-model="email"
          label="E-mail"
          required
        ></v-text-field>
        <div class="text-center pt-4 pb-7 mb-6" style="width: 100%;">
            <v-btn
            type="submit"
            
            rounded
            color="#ff7a00"
            style="min-width: 30%;height: 3rem;"
            dark
          >
            <span style="font-size: .6rem">сохранить</span>
          </v-btn>
            </div>
      </form>  -->
     <form   @submit.prevent="onAvatar">
      <v-file-input
      required
      v-model="avatar"
      accept="image/png, image/jpeg, image/bmp,image/jpg,"
      placeholder="аватар"
      prepend-icon="mdi-camera"
      label="аватар"
      ></v-file-input>
        <div class="text-center pt-4 pb-7 mb-6" style="width: 100%;">
            <v-btn
            type="submit"
            
            rounded
            color="#ff7a00"
            style="min-width: 30%;height: 3rem;"
            dark
          >
            <span style="font-size: .6rem">сохранить</span>
          </v-btn>
            </div>
      </form> 
  </div>

      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
      asyncData({ $axios,store, error }) {
    const headers = {
        "Content-Type": "application/json"
      };
      
       return $axios
        .$get(`http://82.148.17.12:8080/api/v1/present/users/${store.state.localStorage.uid_auth_user}`, {
          headers: headers
        })
        .then(
          user_data => {
            return {user_data}
          })
      },
  computed: {
    property() {
      if(this.user_data){
      this.em = this.user_data.email
      this.name = this.user_data.firstname
      this.ph= this.user_data.phone
      }
    },
  
  },
  data() {
    return {
      dialog: false,
      em:'',
      ph:'',
      email:'',
      avatar:null,
      name:'',
      phoneNumber:'',
      errors:'поле не может быть пустым'
    };
  },
  methods: {
    onAvatar(){
  let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken,
      };
      let bodyFormData = new FormData();
      bodyFormData.append("image", this.avatar);
      this.$axios
        .$post(`http://82.148.17.12:8080/api/v1/present/users/upload_avatar/${this.$store.state.localStorage.uid_auth_user}`, bodyFormData, {
          headers: headers,
        })
        .then((resp) => {
          this.user_data.avatar= resp.avatar
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    onNAme(){
        let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken,
      };

      this.$axios
        .$post(`http://82.148.17.12:8080/api/v1/present/users/upload_firstname/${this.name}/${this.$store.state.localStorage.uid_auth_user}`, {
          headers: headers,
        })
        .then((resp) => {
          this.user_data.firstname = resp.firstname
        })
        .catch(function (error) {
          console.log(error);
        });
    },
    onEmail(){
      console.log('email');
    },
    onPhone(){
      console.log('phone');
    },
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
}
</script>

<style >
.prof{
  cursor: pointer;
}
</style>