<template>
  <div>
    <section class="box-email">
      <v-container>
        <v-row>
          <v-col cols="12" md="6" lg="1" class="box-phone"></v-col>
          <v-col cols="12" lg="4" style="padding-top: 3rem">
            <h2 style="font-size: 2.3rem">
              Новости <span style="color: #ff7a00"> и акции</span>
            </h2>

            <p style="padding-top: 1.4rem">
              Подпишитесь и получайте выгодные предложения первыми
            </p>
          </v-col>
          <v-col cols="12" lg="6" style="padding-top: 3rem;position: relative;">
            <v-alert
              v-if="alert"
              style="position: absolute;z-index: 1;width: 90%;"
              v-model="alert"
              color="orange"
              elevation="13"
              type="success"
              >Вы успешно подписались!</v-alert
            >
            <div class="box-form">
              <div class="input-box-email">
                <v-text-field
                  label="E-mail"
                  :rules="[rules.required, rules.email]"
                  class="text-green"
                  v-model="email"
                  outlined
                  dense
                ></v-text-field>
              </div>

              <div class="box-btn-podpic" style="">
                <v-btn
                  @click="onPodpiska"
                  rounded
                  color="#ff7a00"
                  style="height: 39px"
                  dark
                >
                  начать покупки
                </v-btn>
              </div>
            </div>
            <p style="font-size: 0.8rem;padding-top: 1em;">
              Нажимая кнопку "подписаться", вы даёте согласие на обработку
              персональных данных
            </p>
          </v-col>
        </v-row>
      </v-container>
    </section>
    <section
      id="contacts"
      style="background: white; padding-top: 2rem;min-height:20vh"
    >
      <v-container>
        <v-row justify="center">
          <v-col cols="12" md="6" class="box-p" lg="1"></v-col>
          <v-col cols="12" md="6" lg="2">
            <nuxt-link to="/oferta"><span>Публичная оферта</span></nuxt-link>
          </v-col>
          <v-dialog
            v-model="comand_dialog"
            persistent
            transition="dialog-bottom-transition"
          >
            <div style="text-align: end;color:white;">
              <span style="cursor:pointer" @click="comand_dialog = false"
                >закрыть</span
              >

              <v-btn @click="comand_dialog = false" style="color:white" text
                ><v-icon>mdi-close</v-icon></v-btn
              >
            </div>
            <v-card
              class="box-comand d-flex"
              style="padding:2rem;align-items: center;"
            >
              <v-form
               @submit.prevent="validate"
               lazy-validation
                style=" width: 100%;position: relative;"
                ref="form"
                
              >
                <v-row justify="center">
                  <v-col cols="12" class="text-center">
                    <h4 style="color: white;font-size: 2rem;">
                      Хочу в вашу команду!
                    </h4>
                  </v-col>
                  <v-col cols="12" md="4" lg="4" class="mt-2">
                    <v-text-field
                    v-model="name"
                      :rules="[v => !!v || 'Не может быть пустым']"
                      label="ФИО"
                      solo
                      style="min-width:100%"
                    ></v-text-field>
                    <v-text-field
                      v-model="email"
                      label="E-mail"
                      placeholder="E-mail"
                      solo
                      :rules="[rules.required, rules.email]"
                      required
                    ></v-text-field>
                    <v-text-field
                      class="mt-9"
                      label="Номер телефона"
                      v-mask="'+7 (###) ###-##-##'"
                      v-model="phone"
                      :rules="[rulesphone.required, rulesphone.counter]"
                      solo
                      style="min-width:100%"
                    ></v-text-field>
                  </v-col>
                <v-alert
              v-model="alert_succes"
              style="top: 50%;position: absolute;z-index: 1;width: 100%;"
              
              color="orange"
              elevation="13"
              type="success"
              >Успешно отправлено!</v-alert
            >
                  <v-col cols="12" md="4" lg="4" style="padding: 1rem;">
                    <div style="width:100%">
                      <v-textarea
                        solo
                        v-model="text"
                        name="input-7-4"
                        label="Комментарий"
                      ></v-textarea>
                    </div>
                    <v-file-input
                      style="margin-top:2rem"
                      class="append "
                      v-model="fileres"
                      accept=".pdf"
                      label="Прикрепить резюме(PDF-формат)"
                      solo
                      prepend-icon=""
                      append-icon="mdi-cloud-upload"
                    ></v-file-input>
                  </v-col>
                  <v-col cols="12" class="text-center">

                    <v-btn
                      @click="validate"
                      rounded
                      color="#ff7a00"
                      style="height: 3rem;"
                      dark
                    >
                      <span style="font-size: .6rem">перейти к оформлению</span>
                    </v-btn>

                    <p style="font-size:.7rem" class="pt-6">
                      Указывая свои данные, Вы соглашаетесь с нашей <br />
                      Политикой конфиденциальности
                    </p>
                  </v-col>
                </v-row>
              </v-form>
            </v-card>
          </v-dialog>
          <v-col cols="12" md="6" lg="2">
            <span @click="comand_dialog = !comand_dialog"
              >Хочу в вашу команду</span
            >
          </v-col>
          <v-col cols="12" md="6" lg="2">
            <nuxt-link to="/contacts"><span>Контакты</span></nuxt-link>
          </v-col>
          <v-col cols="12" md="6" lg="2" class="box-phone">
                   <a  href="tel:+77071015157" style="font-weight: bold;color: #676767;text-decoration: none; color: black"
            >
            <span  style="color: #676767;">+7 (707) 101 51 57</span>
            
            </a
          >
          </v-col>

          <v-col cols="12" md="6" lg="3" class="box-phone">
            <img style="height: 14px; width: 20px" src="/vk.png" />
            <img
              style="height: 14px; width: 14px; margin-left: 3px"
              src="/faseb.png"
            />
            <img
              style="height: 16; width: 14px; margin-top: 3px; margin-left: 3px"
              src="/insta.png"
            />
          </v-col>
        </v-row>
      </v-container>
      <div
        class="text-center"
        style="position: absolute;bottom: 0;width: 100%;background: #f2f2f2;"
      >
        <p class="text-center">
          © 2021 сервис оригинальных подарков.GIFTCITY
        </p>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      comand_dialog: false,
      rulesphone: {
        required: value => !!value || "Не может быть пустым.",
        counter: value => value.length === 18 || "Минимум 11 цифр"
      },
      phone: "",
      name:'',
      fileres : null,
      text : '',
      rules: {
        required: value => !!value || "Не может быть пустым.",
        counter: value => value.length <= 20 || "Максимум 20 символов",
        email: value => {
          const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
          return pattern.test(value) || "Невалидный e-mail.";
        }
      },
      email: "",
      alert_succes:false,
      alert: false
    };
  },
  methods: {
    validate() {
      this.$refs.form.validate();
      if (this.$refs.form.validate()) {
        let bodyFormData = new FormData();
        bodyFormData.append("name", this.name);
        bodyFormData.append("email", this.email);
        bodyFormData.append("phone", this.phone);
        if(this.fileres ){
          bodyFormData.append("fileres", this.fileres);
        }
        if(this.text){
          bodyFormData.append("text ", this.text);
        }
        this.alert_succes = true
        setTimeout(() => {
         this.alert_succes = false;
        this.comand_dialog = false;
        }, 2000);
     this.$axios
        .$post(`https://giftcity.kz/api/v1/present/email/commands`,bodyFormData, {
        })
        .then((resp) => {
        this.email = ''
        this.phone = ''
        this.fileres = null
        this.text = ''
        this.name = ''
       
          return 
        });
      } else {
        console.log("0000");
      }
    },
    onPodpiska() {
      const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      if (!pattern.test(this.email)) {
        console.log(1);
      } else {
        let headers = {
          "Content-Type": "application/json"
        };
        let data = {
          email_user: this.email
        };
        if (this.email) {
          this.$axios
            .$post(`https://giftcity.kz/api/v1/present/mailing/`, data, {
              headers: headers
            })
            .then(resp => {
              this.alert = true;
              this.email = ''
              setTimeout(() => {
                this.alert = false;
              }, 2000);
            })
            .catch(function(error) {
              console.log(error);
            });
        }
      }
    }
  }
};
</script>

<style scoped>
.v-application a {
  cursor: pointer;
  text-decoration: none;
  color: #676767;
}
@media (max-width: 1000px) {
  #contacts {
    margin-bottom: 5rem;
  }
}

#contacts span {
  font-weight: bold;
}
.box-comand {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  background-image: url("/coms.png");
  min-height: 60vh;
  min-width: 90%;
}
.dop-col {
  display: none;
}
.box-p {
  display: none;
}
@media (min-width: 1260px) {
  .box-p {
    display: block;
  }
}
@media (min-width: 1260px) {
  .dop-col {
    display: block;
  }
}
.box-phone {
  text-align: center;
}
.box-btn-podpic {
  padding-left: 1rem;
}
@media (max-width: 1260px) {
  .box-phone {
    text-align: left;
  }
}
@media (max-width: 600px) {
  .box-btn-podpic {
    padding-left: 0;
    margin-bottom: 1rem;
  }
  .input-box-email {
    width: 100%;
  }
  .box-phone {
    text-align: left;
  }
}
.box-email {
  /* min-height: 30vh; */
  /* height: 50vh; */
  background-repeat: no-repeat;
  /* background-position: center; */
  /* background-size: ;  */
  background-image: url("/footeremail.webp");
  width: 100%;
  padding-bottom: 2rem;
}
.box-form {
  display: flex;
  flex-wrap: nowrap;
  align-items: baseline;
}
@media (max-width: 600px) {
  .box-form {
    text-align: center;
    flex-wrap: wrap;
  }
}
.v-input__slot {
  background: white !important;
  width: 23rem;
}
@media (max-width: 600px) {
  .v-input__slot {
    width: 100%;
  }
}

/* span{
    font-weight: bold;
}
@media (max-width:500px) {
    .box-soc{
    justify-content: center;
}
} */
</style>
