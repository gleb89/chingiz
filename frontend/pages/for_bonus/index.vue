<template>
  <div id="bonus">
    <v-container>
      <v-row justify="center">
        <v-col cols="12">
          <div>
            <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
            <span style="color: #222121a1">бонусы</span>
          </div>
          <div class="mt-4">
            <h2 style="font-size:2rem;margin-top: 2rem;">Бонусы</h2>
          </div>
        </v-col>
      </v-row>
    </v-container>
    <section id="foto-bonus">
          <v-container>
      <v-row justify="center">
          <v-col cols="12"  class="mt-6">
            <div
              class="text-center"
              style="display: flex; justify-content: center"
            >
                <div class="text-center logo-onas">
                <p class="lozung">Скидки
                    <br>
                    за отзывы</p>
                <p class="box-orange" style="color: "></p>
              </div>
              
            </div>
                 
                  <p class="text-center mt-6">
                      Зачем нам отдавать свои деньги за ваши отзывы?
                  </p>
                  
              
              </v-col>
              <v-col cols="12" lg="4" md="4"  class="mt-6">
                  <div >
                      <h5 class="text-center nums">01</h5>
                      <h4 class="h4_text text-center">Улучшение сервиса</h4>
                      <p class="text-center other-text">Ваш отзыв и оценка помогает нам улучшить качество продукта</p>
                  </div>
          <v-img fluid src="/b1.png"></v-img>
          
        </v-col>
        <v-col cols="12" lg="4" md="4" class="mt-6">
                        <div>
                      <h5 class="text-center nums">02</h5>
                      <h4 class="h4_text text-center">Прозрачность бизнеса</h4>
                      <p class="text-center other-text">Мы за полную прозрачность нашего бизнеса который мы ведем</p>
                  </div>
          <v-img fluid src="/b2.png"></v-img>
          
        </v-col>
        <v-col cols="12" lg="4" md="4" class="mt-6">
                                    <div>
                      <h5 class="text-center nums">03</h5>
                      <h4 class="h4_text text-center">Социальная ответственность</h4>
                      <p class="text-center other-text">Вы можете повлиять на решение других наших клиентов</p>
                  </div>
          <v-img fluid src="/b3.png"></v-img>
         
        </v-col>
                 <v-col cols="12"  class="mt-6">
            <div
              class="text-center"
              style="display: flex; justify-content: center"
            >
                <div class="text-center logo-onas">
                <p class="lozung">Как
                    <br>
                    это работает</p>
                <p class="box-orange" style="left: -2rem;"></p>
              </div>
              
            </div>
                 <div style="margin-top:2rem">
                     <div class="text-center">
                         <img style="width: 3rem;" fluid src="/b5.png">
                         
                     </div>
                     
                  <p class="text-center mt-6">
                      Заказав продукты, вы оставляете отзыв <br> и оценку по каждому продукту
                  </p>
                  </div>
                                 <div style="margin-top:2rem">
                     <div class="text-center">
                         <img style="width: 3rem;" fluid src="/b5.png">
                         
                     </div>
                     
                  <p class="text-center mt-6">
                      Следующий ваш заказ будет посчитан 
                      <br>
                    с 5% скидкой на общую сумму заказа
                  </p>
                  </div>
              
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
      property: [],
    };
  },
  methods: {},
};
</script>

<style>
.nums{
    color: #FF7A00;
    font-size: 3rem;
}
.box-bon{
    min-height: 7rem;
}
.h4_text{
    font-size: 1.5rem;
    color: #676767;
}
@media (max-width: 1260px) {
  .h4_text{
    font-size: 1.2rem;
}  
}
.other-text{
    color: #676767;
    margin-top: 1rem;
    margin-bottom: 1rem;
}
.lozung {
  position: relative;
  z-index: 1;
  color: white;
  font-size: 24px;
}
.logo-onas {
  font-size: 1.4rem;
  z-index: 1;
  position: relative;
  color: black;
  font-weight: bold;
}
.box-orange {
    height: 4.8rem;
    background: #ff7a00;
    color: #ff7a00;
    width: 13rem;
    position: absolute;
    top: 0;
    left: -2.5rem;
    transform: rotate(-5deg);
}
</style>