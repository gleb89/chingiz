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
    <div v-for="i in 3" :key="i" id="comments">
      <v-container>
        <v-row justify="center">
          <v-col cols="12">
            <div class="card-comments-user">
              <div class="d-flex flex-wrap">
                <div style="flex-grow: 1">
                  <span>Виктор | 05.06.2021</span>
                </div>
              </div>
              <div class="text-comment">
                <p>
                  Отличные яблоки - сочные, сладкие, свежие! Мои дети их
                  обожают. Сервис и стоимость приятно порадовали. Заказ приняли
                  быстро, вежливо. Единственные момент - нашёл в одном яблоке
                  червячка, поэтому снизил оценку, но определённо буду брать
                  ещё!
                </p>
              </div>
            </div>
          </v-col>
        </v-row>
      </v-container>
    </div>
    <div id="all-comments" class="text-center mt-3">
      <a style="color: black; border-bottom: 1px solid; border-color: black"
        >показать все отзывы</a
      >
    </div>

 <div id="form-comments" class="mt-10">
      <h2>Написать отзыв</h2>
      <div>
        <p class="mt-3" style="max-width: 70%">
          Ваш отзыв очень важен для нас и поможет другим сделать правильный
          выбор. Авторизируйтесь и получайте бонусы за каждый отзыв. Подробнее о
          бонусах можно узнать в разделе Бонусы.
        </p>
      </div>

      <div class="form-otziv pt-6 rounded-xl" style="padding: 2rem">
        <h3 class="text-center">Ваша оценка:</h3>
  
        <!-- form -->
        <div>
          <v-form ref="form" lazy-validation>
            <v-container>
              <v-row>
                <v-col class="namephone" cols="12" md="6">
                  <v-text-field
                    class="rounded-xl"
                    label="Ваше имя"
                    placeholder="Ваше имя"
                    outlined
                  ></v-text-field>

                  <v-text-field
                    class="rounded-xl"
                    label="Номер телефона"
                    placeholder="Номер телефона"
                    outlined
                  ></v-text-field>

                  <v-text-field
                    class="rounded-xl"
                    label="E-mail"
                    placeholder="E-mail"
                    outlined
                  ></v-text-field>
                </v-col>

                <v-col class="textotz" cols="12" md="6">
                  <v-textarea
                    class="rounded-xl"
                    solo
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
            <div class="text-center">
              <v-btn
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
export default {
  data() {
    return {
    
      
    };
  },
  methods: {
    onOtz() {
      console.log(this.$router.history._startLocation);
      this.$router.push(this.$router.history._startLocation+'#form-comments')
    },
  },
};
</script>


<style>
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