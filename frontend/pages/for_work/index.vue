<template>
<div>
  <v-container id="section-work" style="margin-top:4rem">
    <v-row justify="center">
      <v-col cols="12">
        <div>
          <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
          <span style="color: #222121a1">Доставка и оплата</span>
        </div>
        <div class="mt-4">
          <h2 style="font-size: 2rem; margin-top: 2rem">Доставка и оплата</h2>
        </div>
          <div class="d-flex mt-6" style="align-items: center;margin-bottom:2rem">
            <v-avatar color="#FF7A00" size="32">
              <span class="white--text text-h5">1</span>
            </v-avatar>
            <h3 class="ml-4">Доставка до двери:</h3>
          </div>
      </v-col>
      
        <v-col cols="12" md="6" lg="6">
            <div class="d-flex flex-nowrap" style="align-items: center;">
            <img src="/d1.png" alt="">
            <div class="f-flex flex-column ">
              <div>
                <h3 style="color:#676767"  class="pl-3">стандартная - бесплатно</h3>
              </div>
            <div class="mt-6">
              <span class="pl-3">(доставка на следующий день)</span>
            </div>
            
            </div>
          </div>
          <p class="mt-5"  style="color:#676767" >
            Стандартная доставка в черте административных
            границ города. Доставка бесплатная.
          </p>
          <br>
          <p style="color:#676767" >
            Остальные случаи рассчитываются индивидуально.
          </p>
          </v-col>
        <v-col cols="12" md="6" lg="6">
            <div class="d-flex flex-nowrap" style="align-items: center;">
            <img src="/d2.png" alt="">
            <div class="f-flex flex-column ">
              <div>
                <h3 style="color:#676767"  class="pl-3">быстрая - платно</h3>
              </div>
            <div class="mt-6">
              <span class="pl-3">(доставка день в день)</span>
            </div>
            
            </div>
          </div>
          <p class="mt-5"  style="color:#676767" >
            <ul style="color:#ff7b03">
              <li><span style="color:#676767">В черте улиц Саина - Достык - Аль-Фараби - Райымбек - 1 000 тг</span> </li>
              <li><span style="color:#676767">В черте административных границ города - 1 500 тг</span> </li>
            </ul>
          </p>
          <br>
          <p style="color:#676767" >
            Остальные случаи по запросу.
          </p>
          </v-col>
    </v-row>
    </v-container>
    <section style="background: #F4F5F6;" class="pb-6">
      <v-container id="" style="">
      <div class="d-flex mt-6" style="align-items: center;margin-bottom:2rem">
            <v-avatar color="#FF7A00" size="32">
              <span class="white--text text-h5">2</span>
            </v-avatar>
            <h3 class="ml-4">Способы оплаты:</h3>
          </div>
          <v-row justify="center">
            <v-col class="d-flex justify-center" cols="12" md="4" lg="4">
                    <v-card style="width: 20rem;height: 13rem;" class="rounded-xl">
        <v-card-title>
          <span class="text-h6" style="color:#676767;font-size: 1rem;">kaspi.kz, Kaspi Pay</span>
        </v-card-title>
        <div class="pl-4">
           <img src="/oot.png" alt="">
        </div>
        <v-card-text>
          После выбора подарка мы выставим вам счёт прямо в приложении Kaspi.kz
           и вы сможете мгновенно его оплатить.
        </v-card-text>
                    </v-card>
            </v-col>
            <v-col class="d-flex justify-center"  cols="12" md="4" lg="4">
                    <v-card style="width: 20rem;height: 13rem;" class="rounded-xl">
        <v-card-title>
          <span class="text-h6" style="color:#676767;font-size: 1rem;">visa, master card</span>
        </v-card-title>
        <div class="pl-4">
           <img src="/oot.png" alt="">
        </div>
        <v-card-text>
      При выборе оплаты банковской картой вы
      сможете оплатить счёт прямо на нашем сайте.
        </v-card-text>
                    </v-card>
            </v-col>
            <v-col class="d-flex justify-center"  cols="12" md="4" lg="4">
                    <v-card style="width: 20rem;height: 13rem;" class="rounded-xl">
        <v-card-title>
          <span class="text-h6" style="color:#676767;font-size: 1rem;">Безналичный расчёт</span>
        </v-card-title>
        <div class="pl-4">
           <img src="/oot.png" alt="">
           <span class="ml-4" style="color:#676767;font-size.4rem">(Для юридических лиц)</span>
           
        </div>
        <v-card-text>
          Мы предоставляем полный пакет документов.
          Выберите на странице оплаты “Юридическое лицо” и оформите заказ.
        </v-card-text>
                    </v-card>
            </v-col>
          </v-row>
          </v-container>
    </section>
    <section style="height:20vh;">

    </section>
  </div>
</template>

<style >
.box-flex-start{
    padding-left: 15rem;
}
.box-flex-end{
    padding-right: 25rem;
}
.nums {
  color: #ff7a00;
  font-size: 3rem;
}
.text {
  font-size: 18px;
}
.img-bg{
 
}
.box-text {
  /* padding: 1rem;
  display: flex;
  align-items: center; */
}
.box-nums {
  padding: 3rem;
  display: flex;
  align-items: center;
}
.box-items{
    position: relative;
}
#section-work{
    
}
</style>