<template>
  <div id="onas">
    <v-container>
      <v-row justify="center">
        <v-col cols="12">
          <div>
            <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
            <span style="color: #222121a1">Для бизнеса</span>
          </div>
          <div class="mt-4">
            <h2 style="font-size:2rem;margin-top: 2rem;">Для бизнеса </h2>
          </div>
        </v-col>
        <v-col cols="12" md="6" lg="6">
          <div class="d-flex flex-nowrap" style="align-items: center;">
            <img src="/g1.png" alt="">
            <h5 style="color:#676767" class="pl-3">Персонализация</h5>
          </div>
          <p class="mt-5" >
            <ul style="color:#ff7b03">
              <li><span style="color:#676767">Добавление вашего логотипа</span> </li>
              <li><span style="color:#676767">Добавление имени получателя</span> </li>
            </ul>
    
          </p>
          </v-col>
        <v-col cols="12" md="6" lg="6">
            <div class="d-flex flex-nowrap" style="align-items: center;">
            <img src="/g2.png" alt="">
            <h5 style="color:#676767"  class="pl-3">Индивидуальный менеджер</h5>
          </div>
          <p class="mt-5"  style="color:#676767" >
            От начала заказа и до полного получения
            всех подарков у вас будет одно окно коммуникации
            для вашего удобства.
          </p>
          </v-col>

        <v-col cols="12" md="6" lg="6">
         <div class="d-flex flex-nowrap" style="align-items: center;">
            <img src="/g3.png" alt="">
            <h5 style="color:#676767"  class="pl-3">Прозрачность</h5>
          </div>
          <p class="mt-5"  style="color:#676767" >
            Мы предоставляем полный пакет закрывающей документации
            в день получения всех подарков.
          </p>
          </v-col>

        <v-col cols="12" md="6" lg="6">
         <div class="d-flex flex-nowrap" style="align-items: center;">
            <img src="/g4.png" alt="">
            <h5 style="color:#676767"  class="pl-3">Спец Заказ</h5>
          </div>
          <p class="mt-5"  style="color:#676767" >
            Не нашли, что искали?
            Дайте нам свои идеи и мы воплотим их в реальность.
          </p>
          </v-col>

      </v-row>
    </v-container>
 
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