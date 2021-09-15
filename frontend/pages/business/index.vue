<template>
  <div id="onas">
    <v-container>
      <v-row justify="center">
        <v-col cols="12">
          <div>
            <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
            <span style="color: #222121a1">для бизнеса</span>
          </div>
          <div class="mt-4">
            <h2 style="font-size:2rem;margin-top: 2rem;">Для бизнес-клиентов </h2>
          </div>
           
               <p class="text-left mt-4">
                   Для наших бизнес-клиентов мы подготовили специальное предложение.
                    Закажите фрукты для урашения холла гостиницы, свежайшие ягоды
                     для кондитерской, овощную корзину для вашего офисного фуршета 
                     или круктовую корзину в качестве подарка для ваших сотрудников.
                      Для наших бизнес-клиентов мы подготовили специальное предложение.
                       Закажите фрукты для урашения холла гостиницы, свежайшие ягоды
                        для кондитерской, овощную корзину
                для вашего офисного фуршета или круктовую корзину
                 в качестве подарка для ваших сотрудников.
               </p>
           
        </v-col>
      </v-row>
    </v-container>
    <section id="for-busness">
          <v-container>
      <v-row justify="center">
                            <v-col cols="12" lg="4" md="4"  class="mt-6">
                                 <v-img fluid src="/bz1.png"></v-img>
                  <div style="margin-top:2rem">
                      <h5 class="text-center nums">01</h5>
                      <h4 class="h4_text text-center">HoReCa</h4>
                      <p class="text-center other-text">Мы соединяем наш опыт, экспертизу, энергию и навыки с цифровыми технологиями для создания лучшей цены, качества и сервиса.</p>
                  </div>
         
          
        </v-col>
        <v-col cols="12" lg="4" md="4" class="mt-6">
            <v-img fluid src="/bz2.png"></v-img>
                        <div style="margin-top:2rem">
                      <h5 class="text-center nums">02</h5>
                      <h4 class="h4_text text-center">Доставка в офис</h4>
                      <p class="text-center other-text">Мы соединяем наш опыт, экспертизу, энергию и навыки с цифровыми технологиями для создания лучшей цены, качества и сервиса.</p>
                  </div>
          
          
        </v-col>
        <v-col cols="12" lg="4" md="4" class="mt-6">
             <v-img fluid src="/bz3.png"></v-img>
                                    <div style="margin-top:2rem">
                      <h5 class="text-center nums">03</h5>
                      <h4 class="h4_text text-center">Фруктовые корзины на подарок</h4>
                      <p class="text-center other-text">Мы соединяем наш опыт, экспертизу, энергию и навыки с цифровыми технологиями для создания лучшей цены, качества и сервиса.</p>
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
</style>