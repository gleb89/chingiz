<template>
  <div>
    <div id="sign-in-button"></div>
    <div v-if="!phone_form_sign">
      <div v-if="!sign">
        <v-btn @click="googleSignin()" class="btn">
          вход с Google <img src="/google.png" alt="" />
        </v-btn>
        <p></p>
        <v-btn @click="phone_form_sign = !phone_form_sign" class="btn">
          вход по номеру телефона
          <fa class="phone-icon" icon="mobile-alt"></fa>
        </v-btn>
        
      </div>
      <div v-if="sign">
        <v-alert
          class="hello-alert"
          style="box-shadow: 4px 4px 4px #0000004f"
          type="success"
          >Вход выполнен успешно!</v-alert
        >
      </div>
    </div>
    <div v-if="phone_form_sign">
      <v-form ref="form" v-model="valid" lazy-validation>
        <v-text-field
          v-model="phone"
          :rules="phonerules"
          label="Phone"
          required
        ></v-text-field>
        
        <p v-if="error_num_phone" class="error-phone" >{{message_error}}</p> 
        <v-btn
          v-if="code_sign_time === 0"
          :disabled="!valid"
          color="success"
          class="mr-4"
          @click="validate"
        >
          {{ onrecapcha }}
          получить код
        </v-btn>
        <v-btn  v-if="code_sign_time <= 60 && code_sign_time > 0">
          повторно через {{ code_sign_time }} с
        </v-btn>
      </v-form>
      <v-form v-if="code_form" ref="form_code" v-model="valid" lazy-validation>
        <v-text-field
          v-model="code"
          :rules="coderules"
          label="code"
          required
        ></v-text-field>
        <p class="error-code" v-if="error_cod">Неверный код!</p>
        <v-btn
          :disabled="!valid"
          color="success"
          class="mr-4"
          @click="validate_code"
        >
          вход
        </v-btn>
        
      </v-form>
    </div>
        <div style="text-align: end;margin-top:2rem" >
      <v-btn text @click="close_dialog">Закрыть</v-btn>
    </div>
  </div>
</template>

<script>
var intervalId
import firebase from "firebase";
var provider = new firebase.auth.GoogleAuthProvider();
export default {
  props:['dialog_exit','close'],
  computed: {
    onrecapcha() {
      if (process.browser) {
        console.log("kkk");
        window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier(
          "sign-in-button",
          {
            size: "invisible",
            callback: (response) => {
              // reCAPTCHA solved, allow signInWithPhoneNumber.
              onSignInSubmit();
            },
          }
        );
      }
    },
  },

  data() {
    return {
      code_sign_time: 0,
      valid: true,
      message_error:'',
      stoptime: true,
      error_cod:false,
      phonerules: [
        (v) => v.length > 1 || "номер обязателен",
        (v) => v[0] == "+" || "+ обязателен",
      ],
      coderules: [
        (v) => v.length == 6 || "должно быть 6 знаков",
        (v) => !!v || "не может быть пустым!",
      ],
      sign: false,
      google_name: "",
      phone_form_sign: false,
      code_form: false,
      error_num_phone:false, 
      phone: "+",
      code: "",
    };
  },
  methods: {
    retbonus() {
        this.$axios
        .$get(`http://giftcity.kz/api/v1/present/users/${this.$store.state.localStorage.uid_auth_user}`,{
        })
        .then((resp) => {
          console.log(111111,resp);
        this.$store.commit("user/setusers",resp);
        })
        .catch(function (error) {
         console.log(error);
        });

  },
    createUser_googleauth(uid_user,email){
      let headers = {
        "Content-Type": "application/json"
      };
      if(this.$store.state.localStorage.basket.id_basket > 0){
        let data = {
          "id": 0,
          "uid_firebase":uid_user ,
          "email": email

      }
      this.$axios
        .$post(`http://giftcity.kz/api/v1/present/users/anonim/${this.$store.state.localStorage.basket.id_basket}`, data, {
          headers: headers,
        })
        .then((resp) => {
          this.$store.commit("localStorage/setAuthuser", String(resp.user.uid_firebase));
          this.$store.commit("localStorage/set_summBasket",Number(resp.summa));
          this.$store.commit("localStorage/set_idBasket",Number(resp.basket_id));
          this.retbonus()
          return true
        })
        .catch(function (error) {
          console.log(error);
          return false
        });
      }
      else{
      let data = {
          "id": 0,
          "uid_firebase":uid_user ,
          "email": email

      }
      this.$axios
        .$post(`http://giftcity.kz/api/v1/present/users/`, data, {
          headers: headers,
        })
        .then((resp) => {
          this.$store.commit("localStorage/setAuthuser", String(resp.user.uid_firebase));
          this.$store.commit("localStorage/set_summBasket",Number(resp.summa));
          this.$store.commit("localStorage/set_idBasket",Number(resp.basket_id));
          this.retbonus()
          return true
        })
        .catch(function (error) {
          console.log(error);
          return false
        });
        }
      
    },
    createUser_phoneauth(uid_user,phone){
      let headers = {
        "Content-Type": "application/json"
      };
      if(this.$store.state.localStorage.basket.id_basket > 0){
      let data = {
          "id": 0,
          "uid_firebase":uid_user ,
          "phone": phone

      }
      this.$axios
        .$post(`http://giftcity.kz/api/v1/present/users/anonim/${this.$store.state.localStorage.basket.id_basket}`, data, {
          headers: headers,
        })
        .then((resp) => {
          this.$store.commit("localStorage/setAuthuser", String(resp.user.uid_firebase));
          this.$store.commit("localStorage/set_summBasket",Number(resp.summa));
          this.$store.commit("localStorage/set_idBasket",Number(resp.basket_id));
          this.retbonus()
          return true
        })
        .catch(function (error) {
          console.log(error);
          return false
        });
      }
      else{
      let data = {
          "id": 0,
          "uid_firebase":uid_user ,
          "phone": phone

      }
      this.$axios
        .$post(`http://giftcity.kz/api/v1/present/users/`, data, {
          headers: headers,
        })
        .then((resp) => {
          this.$store.commit("localStorage/setAuthuser", String(resp.user.uid_firebase));
          this.$store.commit("localStorage/set_summBasket",Number(resp.summa));
          this.$store.commit("localStorage/set_idBasket",Number(resp.basket_id));
          this.retbonus()
          return true
        })
        .catch(function (error) {
          console.log(error);
          return false
        });
        }
      
    },
    close_dialog(){
      this.close()
      this.phone_form_sign = false
      this.sign = false;
    },
    stopSec_time() {
        if(this.code_sign_time <=1){
        clearInterval(intervalId);
        this.code_form = false
        this.code_sign_time = 0
      }
      else{
        this.code_sign_time = this.code_sign_time - 1;
      }
 
    },
    timecode() {
     
      intervalId = setInterval(this.stopSec_time, 1000);
  
    },
    validate() {
      this.$refs.form.validate();
      if (this.$refs.form.validate()) {
        this.phoneSign();
      }
    },
    validate_code() {
      this.$refs.form_code.validate();
      if (this.$refs.form.validate()) {
        this.codeSignin();
      }
    },
    phoneSign() {
      var self = this;
      let appVerifier = window.recaptchaVerifier;
      firebase
        .auth()
        .signInWithPhoneNumber(this.phone, appVerifier)
        .then((confirmationResult) => {
          window.confirmationResult = confirmationResult;
          self.code_form = true;
          self.code_sign_time = 60;
          self.timecode();
        })
        .catch((error) => {
          console.log(error);
          if(error.code === 'auth/invalid-phone-number'){
            self.message_error = 'Неверный номер'
          }
          else{
            self.message_error = "Проблемы, попробуйте позже"
          }
          self.error_num_phone = true
          setTimeout(() => {
            self.error_num_phone = false
          }, 2000);
          console.log("eeror");
          console.log(error.code);
        });
    },
    codeSignin() {
      var self = this;
      // const code = getCodeFromUserInput();
      // const code = getCodeFromUserInput();
      confirmationResult
        .confirm(this.code)
        .then((result) => {
          // User signed in successfully.
          const user = result.user;
          self.code_form = false;
          // отправка uid на сервер
          self.phone_form_sign = false;
          self.sign = true;
          self.dialog = false
          self.createUser_phoneauth(user.uid,self.phone)
          setTimeout(() => {
            self.phone_form_sign = false
            self.sign = false;
            self.dialog_exit()
          }, 2000);
          self.google_name = user.uid;
          self.code_sign_time = 0;
        })
        .catch((error) => {
          self.error_cod = true
          setTimeout(() => {
            self.error_cod = false
          }, 1000);
          console.log("error", error);
        });
    },
    googleSignin() {
      var self = this;
      firebase
        .auth()
        .signInWithPopup(provider)
        .then(function (result) {
          var token = result.credential.accessToken;
          var user = result.user;
          self.sign = true;
          self.google_name = user.displayName;
          console.log(user.email);
          setTimeout(() => {
            self.phone_form_sign = false
            self.sign = false;
            self.dialog_exit()
          }, 2000);
          self.createUser_googleauth(user.uid,user.email)   
        })
        .catch(function (error) {
          var errorCode = error.code;
          var errorMessage = error.message;
          console.log(error.code);
          console.log(error.message);
        });
    },
    googleSignout() {
      firebase
        .auth()
        .signOut()
        .then(
          function () {
            console.log("Signout Succesfull");
          },
          function (error) {
            console.log("Signout Failed");
          }
        );
    },
  },
};
</script>

<style scoped>
img {
  width: 2rem;
}
.phone-icon{
  font-size: 1.3rem;
  margin-left: 0.3rem;
  color: orange;
}
.btn {
  width: 100%;
  background: white;
  font-size: 0.6rem;
}
@media (max-width: 500px) {
  .hello-alert {
    font-size: 0.6rem;
  }
}
.error-code{
  color: red;
  position: absolute;
  z-index: 1;
  top: 62%;
  right: 20%;
}
.error-phone{
  position: absolute;
  top: 0;
  color: red;
}
</style>