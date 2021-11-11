<template>
  <div>
    <v-container class="mt-6">
      <v-row justify="center">
        <v-col cols="12">
          <div class="mt-4" style="padding-top: 3rem;">
            <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
            <span style="color: #222121a1"> Контакты</span>
          </div>
          <div class="mt-4">
            <h2 style="font-size:2rem;margin-top: 2rem;">Контакты</h2>
          </div>
        </v-col>
      </v-row>
    </v-container>
    <section
      style="background: #F4F5F6;min-height: 30vh;display: flex;align-items: center;"
    >
      <v-container class="">
        <v-row justify="center">
          <v-col cols="12" md="4" lg="4">
            <div class="d-flex" style="align-items: last baseline;">
              <div>
                <img style="width: 2rem;" src="/c2.png" alt="" />
              </div>
              <div class="ml-3">
                <span style="color:#B2B2B2">телефон</span>
                <p style="font-weight: bold;">                   <a  href="tel:+77071015157" style="font-weight: bold;color: #676767;text-decoration: none; color: black"
            >
            <span  style="color: #676767;">+7 (707) 101 51 57</span>
            
            </a></p>
              </div>
            </div>
          </v-col>
          <v-col cols="12" md="4" lg="4">
            <div class="d-flex" style="align-items: last baseline;">
              <div>
                <img style="width: 2rem;" src="/c1.png" alt="" />
              </div>
              <div class="ml-3">
                <span style="color:#B2B2B2">электронная почта</span>
                <p style="font-weight: bold;">botaboutique@gmail.com</p>
              </div>
            </div>
          </v-col>
          <v-col cols="12" md="4" lg="4">
            <div class="d-flex" style="align-items: center;">
              <div>
                <img style="width: 2rem;" src="/c3.png" alt="" />
              </div>
              <div class="ml-3">
                <span style="color:#B2B2B2">мы в мессенджерах</span>
                <div class="d-flex">
                  <div class="d-flex " style="cursor:pointer">
                    <span>Telegram</span>
                 
                                                       <a style=" text-decoration: none;color:black ;    display: flex;
    align-items: center;" href="#" target="blank">
                
              
                     
                    <img src="/ts.png" alt="">
                    </a>
                    
                  </div>
                   <div class="d-flex ml-3">
                                   <a style=" text-decoration: none;color:black ;    display: flex;
    align-items: center;" href="https://wa.me/77071015157/" target="blank">
                
              
                     <span>WhatsApp</span>
                    <img src="/ws.png" alt="">
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </v-col>
        </v-row>
      </v-container>
    </section>
    <section class="mt-6">
      <v-container class="">
        <v-row justify="center">
          <v-col cols="12" md="12" lg="12">
            <h4>ул. Назарбаева 36, Алматы, Казахстан</h4>
            <h5 style="color:#B2B2B2">
              Мы работаем: ПН-ПТ: с 9.00-21.00 СБ: с 10.00-18.00 ВС: выходной
            </h5>
          </v-col>
          <v-col cols="12" md="8" lg="8"> 
              <iframe
               src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2905.1632571444343!2d76.94312591578596!3d43.26895547913633!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x38836f581bba36cb%3A0x6c74ca5e0538685f!2z0L_RgC3Rgi4g0J3QsNC30LDRgNCx0LDQtdCy0LAgMzYsINCQ0LvQvNCw0YLRiyAwNTAwMDAsINCa0LDQt9Cw0YXRgdGC0LDQvQ!5e0!3m2!1sru!2sru!4v1632245723485!5m2!1sru!2sru"
                width="100%"
                height="620"
                style="border:0;"
                allowfullscreen=""
                loading="lazy">
                </iframe>
          </v-col>
          <v-col cols="12" md="4" lg="4">
            <v-card
            height="620"
              style="background: #F4F5F6;width:100%;padding:2rem"
            >
              <h4 style="font-size: 1.5rem;" class="text-center mb-4">
                Задать вопрос
              </h4>
                            <v-form
                style=" width: 100%;position: relative;"
                ref="form"
                
              >
              <v-text-field
              
              class="rounded-lg"
                label="Ваше имя"
                v-model="name"
                :rules="[v => !!v || 'Не может быть пустым']"
                
                solo
                style="min-width:100%"
              ></v-text-field>
              <v-text-field
              class="rounded-lg"
                label="Телефон"
                  v-mask="'+7 (###) ###-##-##'"
                      v-model="phone"
                      :rules="[rulesphone.required, rulesphone.counter]"
                solo
                style="min-width:100%"
              ></v-text-field>
                              <v-alert
              v-model="alert_succes"
              style="top: 50%;position: absolute;z-index: 1;width: 100%;"
              
              color="orange"
              elevation="13"
              type="success"
              >Успешно отправлено!</v-alert
            >
              <v-textarea
              class="rounded-lg"
                solo
                v-model="text"
                
                :rules="[v => !!v || 'Не может быть пустым']"
                style="min-width:100%"
                name="input-7-4"
                label="Ваше сообщение или вопрос"
              ></v-textarea>
              <div class="text-center">
                              <v-btn
                              @click="validate"
              rounded
              color="#ff7a00"
              style="height: 49px;color: white;;margin-bottom:1.8rem;width: 50%;"
              dark
            >
              <span style="font-size: 12px;">отправить</span>
            </v-btn>
              </div>
              <div class="text-center">
                  <p class="text-center" style="font-size: .9rem;">
                      Нажимая кнопку “Отправить”, <br> Вы даёте 
                    согласие на обработку персональных данных
                  </p>
              </div>
              </v-form>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      text: '',
      phone:'',
      alert_succes:false,
      name:'',
      rulesphone: {
        required: value => !!value || "Не может быть пустым.",
        counter: value => value.length === 18 || "Минимум 11 цифр"
      },
    };
  },
  methods: {
    validate() {
      this.$refs.form.validate();
      if (this.$refs.form.validate()) {
        let data = {
          
        "name": this.name,
        "phone": this.phone,
        "text": this.text
      }
        
        this.$axios
        .$post(`https://giftcity.kz/api/v1/present/email/contact`,data, {
        })
        .then((resp) => {
        this.alert_succes = true
        setTimeout(() => {
        this.alert_succes = false;
        this.phone = ''
        this.text = ''
        this.name = ''
        }, 2000);
          return 
        });
      } else {
        console.log("0000");
      }
    },
  },
}
</script>
