<template>
  <v-container style="padding-top: 6rem;padding-bottom: 4rem">
    <h2 class="mb-4">История заказов</h2>
    <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
    <nuxt-link style="color: #303030" to="/cabinet/history">История заказов</nuxt-link> /
    <span>Заказ N {{$route.params.id}}</span>
   
       <div class="d-block d-lg-none">

    </div>
    <v-row justify="center" class="mt-4">
      <v-col class="d-none d-lg-block" cols="12" md="3" lg="3">
   
      </v-col>
 
    </v-row>
  </v-container>
</template>


