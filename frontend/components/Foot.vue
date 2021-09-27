<template>
  <div>
    <section class="box-email">
      <v-container>
        <v-row justify="center">
          <v-col cols="12" md="6" lg="1" class="box-phone"></v-col>
          <v-col cols="12" lg="4" style="padding-top: 3rem">
            <h2 style="font-size: 2.3rem">
              Новости <span style="color: #ff7a00"> и акции</span>
            </h2>
            <p style="padding-top: 1.4rem">
              Подпишитесь и получайте выгодные предложения первыми
            </p>
          </v-col>
          <v-col cols="12" lg="6" style="padding-top: 3rem">
            <div class="box-form">
              <div class="input-box-email">
                <v-text-field
                  label="E-mail"
                  class="text-green"
                  outlined
                  dense
                ></v-text-field>
              </div>

              <div class="box-btn-podpic" style="">
                <v-btn rounded color="#ff7a00" style="height: 39px" dark>
                  начать покупки
                </v-btn>
              </div>
            </div>
            <p style="font-size: 0.8rem">
              Нажимая кнопку "подписаться", вы даёте согласие на обработку
              персональных данных
            </p>
          </v-col>
        </v-row>
      </v-container>
    </section>
    <section id="contacts" style="background: white; padding-top: 2rem;min-height:20vh">
      <v-container>
        <v-row justify="center">
          <v-col cols="12" md="6" class="box-p" lg="1"></v-col>
          <v-col cols="12" md="6" lg="2">
            <nuxt-link to="/oferta"><span>Публичная оферта</span></nuxt-link>
            
          </v-col>
          <v-col cols="12" md="6" lg="2">
            <span>Хочу в вашу команду</span>
          </v-col>
            <v-col cols="12" md="6" lg="2">
            <nuxt-link to="/contacts"><span>Контакты</span></nuxt-link>
            
          </v-col>
          <v-col cols="12" md="6" lg="2" class="box-phone">
            <span>+7 (888) 777 77 88</span>
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
      <div class="text-center" style="position: absolute;bottom: 0;width: 100%;background: #f2f2f2;">
        <p class="text-center">© 2021 сервис оригинальных подарков.bota-boutique </p>
      </div>
    </section>
  </div>
</template>

<style>
#contacts span {
  font-weight: bold;
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
  background-image: url("/footeremail.png");
  width: 100%;
  padding-bottom: 2rem;
}
.box-form {
  display: flex;
  flex-wrap: nowrap;
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