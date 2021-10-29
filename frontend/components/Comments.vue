<template>
  <div>
    <h3 class="mt-10 mb-8">Спасибо за ваши отзывы</h3>
    <div class="d-flex flex-wrap">
      <div class="napic-otz">
        <v-btn @click="onOtz" rounded color="#ff7a00" style="height: 39px" dark>
          <span style="font-size: 12px">написать отзыв</span>
        </v-btn>
      </div>
    </div>

    <!-- box-comments -->
    <div class="boxc-comment" style="overflow: auto; max-height: 60vh;">
     
    <div v-for="comment in comments_list" :key="comment.id" id="comments">
      <v-container>
        <v-row justify="center">
          <v-col v-if="comment.moderation" cols="12">
            <div class="card-comments-user">
              <div class="d-flex flex-wrap">
                <div style="flex-grow: 1">
                  <span>{{comment.name_user}} | {{new Date(comment.timestamp).toLocaleDateString()}}</span>
                </div>
              </div>
              <div class="text-comment">
                <p>
                 {{comment.body}}
                </p>
              </div>
            </div>
          </v-col>
        </v-row>
      </v-container>
    </div>
    </div>


 <div id="form-comments" class="mt-10" >
    
      <h2>Написать отзыв</h2>
      <div>
        <p class="mt-3" style="max-width: 70%">
          Ваш отзыв очень важен для нас и поможет другим сделать правильный
          выбор. Авторизируйтесь и получайте бонусы за каждый отзыв. Подробнее о
          бонусах можно узнать в разделе Бонусы.
        </p>
      </div>

      <div class="form-otziv pt-6 rounded-xl" style="padding: 2rem">
        <h3 class="text-center">Ваш  отзыв:</h3>
  
        <!-- form -->
        <div>
          <v-form ref="form" lazy-validation>
            <v-container>
              <v-row>
                <v-col class="namephone" cols="12" md="6">
                  <v-text-field
                  v-model="name_user"
                    class="rounded-xl"
                    label="Ваше имя"
                    placeholder="Ваше имя"
                    outlined
                    :rules="[(v) => !!v || 'Не может быть пустым']"
                    required
                  ></v-text-field>

                  <v-text-field
                  v-model="phone_user"
                    class="rounded-xl"
                    label="Номер телефона"
                    v-mask="'+7 (###) ###-##-##'"
                    :rules="[rulesphone.required,rulesphone.counter]"
                    placeholder="Номер телефона"
                    outlined
                   
                    required
                  ></v-text-field>

                  <v-text-field
                  v-model="email_user"
                    class="rounded-xl"
                    label="E-mail"
                    placeholder="E-mail"
                    outlined
                    :rules="[rules.required, rules.email]"
                    required
                  ></v-text-field>
                </v-col>

                <v-col class="textotz" cols="12" md="6">
                  <v-textarea
                    v-model="body"
                    class="rounded-xl"
                    solo
                   :rules="[(v) => !!v || 'Не может быть пустым']"
                    style="width: 32rem; max-width: 100%"
                    label="Напишите ваш отзыв здесь"
                  ></v-textarea>
                  <!-- <recaptcha /> -->
                </v-col>
              </v-row>
            </v-container>

            <p class="text-center">
              Нажимая кнопку “Оставить отзыв” вы соглашаетесь с нашей политикой
              конфиденциальности
            </p>
            <div class="text-center" style="position: relative;">
            <v-alert
        v-model="alert"
          style="position: absolute;z-index: 2;width: 90%;top: -6rem;"
            color="orange"
            elevation="13"
            type="success"
          >
          <p class="text-center">Спасибо за коментарий!</p>
          <p class="text-center">{{text_alert}}</p>
          </v-alert>
              <v-btn
              
              @click="sendComment"
                rounded
                color="#ff7a00"
                style="height: 39px; margin: 0.7rem"
                dark
              >
                <span style="font-size: 12px">оставить отзыв</span>
              </v-btn>
            </div>
          </v-form>
        </div>
      </div>
      </div>
  </div>
</template>

<script>
      const headers = {
        "Content-Type": "application/json"
      };
export default {
  props:['comments_list','product_id','add_comment'],
  computed: {
  
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
  data() {
    return {
      text_alert:'',
      body:'',
            rules: {
          required: value => !!value || 'Не может быть пустым.',
          counter: value => value.length <= 20 || 'Максимум 20 символов',
          email: value => {
            const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
            return pattern.test(value) || 'Невалидный e-mail.'
          },
        },
     rulesphone: {
          required: value => !!value || 'Не может быть пустым.',
          counter: value => value.length === 18 || 'Минимум 11 цифр',
         
        },
      email_user:'',
      phone_user:'',
      name_user:'',
      alert:false
    };
  },
  methods: {
    sendComment(){
      if(this.onlformdata){

     
      let data = {
          "present_id": this.product_id,
          "name_user": this.name_user,
          "phone_user": this.phone_user,
          "email_user": this.email_user,
          "body": this.body
        }
      this.$axios
        .$post(`https://giftcity.kz/api/v1/present/comments/`, data, {
          headers: headers,
        })
        .then((resp) => {
          this.add_comment(resp)
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
        }, 2000);
        })
        .catch(function (error) {
          console.log("error");
        });
         }
    },
    onOtz() {
      this.$router.push('#form-comments')
    },
  },
};
</script>


<style>
.boxc-comment{
       
  transition-delay: .5s;
  transition: .5s linear .5s; 
    }
.listgroup1-dwizh33{
  padding-top: 20rem;
  transition: .5s linear .5s; 
}
.form-otziv {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  background-image: url("/bgform.png");
  min-height: 100vh;
}
.napic-otz {
  flex-grow: 1;
  text-align: right;
}
@media (max-width: 500px) {
  .napic-otz {
    text-align: left;
    width: 100%;
    margin-top: 2rem;
  }
}

.card-comments-user {
  /* border-top: 1px solid; */
  border-bottom: 1px solid;
  border-color: #676767e6;
  padding-top: 2rem;
  padding-bottom: 2rem;
}

.theme--light.v-input {
  width: max-content;
  margin-top: 1rem;
}
.textotz {
  text-align: start;
  padding: 4rem;
}
.namephone {
  text-align: -moz-right;
  padding: 4rem;
}

@media (max-width: 500px) {
  .namephone {
    text-align: center;
    padding: 0;
  }
  .textotz {
    text-align: center;
    padding: 0;
  }
  .theme--light.v-input {
    width: 100%;
  }
}
</style>