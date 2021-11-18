<template>
  <v-container style="padding-top: 6rem;padding-bottom: 4rem">
    <h2 class="mb-4">Настройки профиля</h2>
    <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
    <span>Кабинет профиля</span>
   <div class="d-block d-lg-none">

    </div>
    <v-row justify="center" class="mt-4">
      <v-col class="d-none d-lg-block" cols="12" md="3" lg="3">
      <CardUser :user_data="user_data"/>
      </v-col>
      <v-col cols="12" md="9" lg="9">
        <h2 class="text-center d-lg-block d-none">Отмечайте нас в Инстаграм и получайте бонусы!</h2>
        <p class="mt-6">
            Мы стараемся публиковать интересный контент для вас и надееямся на живую обратную связь!

Прямо сейчас вы можете отметить нашу страничку у себя в инстаграм и получить приятные бонусы:
        </p>
<div>
    <h3>Что необходимо для получения бонусов?</h3>
    <div style="width:100%">
                         <a style=" text-decoration: none;color:black ; display: flex;font-weight: 400;
    margin-top: 2em;
    align-items: center;" href="https://www.instagram.com/giftcity_podarki_kz/" target="blank">
                    <span style="font-size: 1.3em;
    color: #f96f08;" > 1. </span>Отметить наш профиль у себя в инстаграм  giftcity_podarki_kz
                    <img width="30" src="/insta.png" alt="">
                    </a>
    </div>

    <div style="width:100%" class="mt-4">
        <p>
                 <span style="font-size: 1.3em;
    color: #f96f08;" > 2. </span> Отправить ссылку на отметку в вашем профиле нам на проверку
        </p>
      <v-form  
  @submit.prevent="validate"
  lazy-validation  
    ref="form"
    v-model="valid">
     <v-row>
        <v-col cols="12" sm="12" md="12">
               <v-text-field
           label="ссылка на отметку"
            class="prep"
              prepend-inner-icon="*"
           v-model="linkinsta"
           :rules="[(v) => !!v || 'Не может быть пустым']"
            solo style="min-width:100%"
            ></v-text-field>
        </v-col>
     </v-row>
                 <v-btn
               
            
            
            @click="validate"
            rounded
            color="#ff7a00"
            style="min-width: 30%;height: 3rem;"
            dark
          >
            <span style="font-size: .6rem">Отправить</span>
          </v-btn>
    </v-form>
    </div>
    <div style="width:100%" class="mt-4">
        <p>
                 <span style="font-size: 1.3em;
    color: #f96f08;" > 3. </span> Получить бонусы
        </p>

    </div>
</div>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
    //   asyncData({ $axios,store, error }) {
    // const headers = {
    //     "Content-Type": "application/json"
    //   };
      
    //    return $axios
    //     .$get(`/api/present/users/${store.state.localStorage.uid_auth_user}`, {
    //       headers: headers
    //     })
    //     .then(
    //       user_data => {
    //         return {user_data}
    //       })
    //   },
  computed: {
      user_data(){
        return this.$store.state.user.user
      },
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
        linkinsta:'',
        valid: true,
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
       validate () {
        this.$refs.form.validate()
        if(this.$refs.form.validate()){
          this.onInsta()
        }
        else{
          console.log('0000');
        }
      },
    onAvatar(){
  let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken,
      };
      let bodyFormData = new FormData();
      bodyFormData.append("image", this.avatar);
      this.$axios
        .$post(`/api/present/users/upload_avatar/${this.$store.state.localStorage.uid_auth_user}`, bodyFormData, {
          headers: headers,
        })
        .then((resp) => {
          // this.user_data.avatar= resp.avatar
          this.$store.commit("user/setusers",resp);
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
        .$post(`/api/present/users/upload_firstname/${this.name}/${this.$store.state.localStorage.uid_auth_user}`, {
          headers: headers,
        })
        .then((resp) => {
          // this.user_data.firstname = resp.firstname
          this.$store.commit("user/setusers",resp);
        })
        .catch(function (error) {
          console.log(error);
        });
    },
     onInsta(){
        let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken,
      };
        let bodyFormData = new FormData();
      bodyFormData.append("insta_link", this.linkinsta);
      this.$axios
        .$post(`/api/present/insta/${this.$store.state.localStorage.uid_auth_user}`,bodyFormData,{
          headers: headers,
        })
        .then((resp) => {
          // this.user_data.firstname = resp.firstname
         this.$router.push('/cabinet')
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
@media (max-width: 500px) {
  .forms{
    width: 100%;
  }
}
</style>