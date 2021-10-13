<template>
  <v-row justify="center">
    <v-dialog
    transition="dialog-bottom-transition"
      v-model="otziv"
      persistent
      max-width="600px"
    >
      <v-card class="form-o" style="position: relative;">
        <v-card-title>
          <span style="font-weight: bold;" class="text-h5">НАПИСАТЬ ОТЗЫВ</span>
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col
                cols="12"
                sm="6"
                md="6"
              >
                  <v-text-field
                  v-model="name_user"
                    class="rounded-xl"
                    label="Ваше имя"
                    placeholder="Ваше имя"
                    outlined
                    :rules="[(v) => !!v || 'Не может быть пустым']"
                    required
                  ></v-text-field>
              </v-col>
              <v-col
                cols="12"
                sm="6"
                md="6"
              >
                  <v-text-field
                  v-model="phone_user"
                    class="rounded-xl"
                    label="Номер телефона"
                    placeholder="Номер телефона"
                    outlined
                    :rules="[(v) => !!v || 'Не может быть пустым']"
                    required
                  ></v-text-field>
              </v-col>
              <v-col
                cols="12"
                sm="6"
                md="6"
              >
              <div v-if="alert" class="text-center" style="position: absolute;z-index: 2;top:50%;width: 80%;padding:2em">
          <v-alert
        
         
            color="orange"
            elevation="13"
            type="success"
          >
          <p class="text-center">Спасибо за коментарий!</p>
          <p class="text-center">{{text_alert}}</p>
          </v-alert>
          </div>
                    <v-text-field
                  v-model="email_user"
                    class="rounded-xl"
                    label="E-mail"
                    placeholder="E-mail"
                    outlined
                    :rules="[v => !v || /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(v) || 'Введите E-mail']"
                    required
                  ></v-text-field>
              </v-col>
              <v-col cols="12" sm="12"
                md="12">
                  <v-textarea
                    v-model="body"
                    class="rounded-xl"
                    solo
                   :rules="[(v) => !!v || 'Не может быть пустым']"
                    
                    label="Напишите ваш отзыв здесь"
                  ></v-textarea>
              </v-col>

            </v-row>
          </v-container>
          <small>*обязательные поля</small>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            style="color: black;"
            text
            @click="otzivclick"
          >
            Закрыть
          </v-btn>
          <v-btn
           class="rounded-lg"
            depressed
             color="#ff7a00"
              
            style="height: 49px;min-width: 20%; margin: 0.7rem;border: 2px solid #ff7a00;color:white"
            @click="sendOtz"
          >
            Отправить
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
      const headers = {
        "Content-Type": "application/json"
      };
export default {
    props:['otzivclick','otziv'],
    data() {
      return {
      body:'',
      email_user:'',
      phone_user:'',
      name_user:'',
      alert:false,
      text_alert:'',
      };
    },
    methods: {
      sendOtz() {

        if(this.onlformdata()){
          this.Send()
          
        }
        else{
          console.log(444);
        }
        
      },
      Send(){
        let data = {
          "name_user": this.name_user,
          "phone_user": this.phone_user,
          "email_user": this.email_user,
          "body": this.body
        }
 this.$axios
        .$post(`https://giftcity.kz/api/v1/present/commentsservice/`, data, {
          headers: headers,
        })
        .then((resp) => {
          console.log(resp.user_id);
          if(resp.user_id){
            this.text_alert = 'Вам начисленно 500 бонусных балов'
          }
          else{
            this.text_alert = ''
          }
          this.alert = true
        setTimeout(() => {
          this.alert = false
          this.otzivclick()
        }, 4000);
        })
        .catch(function (error) {
          console.log("error");
        });
      },
      onlformdata() {
      if (
      this.email_user == !this.email_user || /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/.test(this.email_user) &&
      this.phone_user &&
      this.email_user &&
      this.name_user &&
      this.body
      ) {
        return true;
      } else {
        return false;
      }
    },
    },
}
</script>

<style >
 .form-o{
     background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  background-image: url("/bgform.png");
 } 
</style>