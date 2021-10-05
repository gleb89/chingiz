<template>
  <v-container style="padding-top: 6rem;padding-bottom: 4rem">
    <h2 class="mb-4">История заказов</h2>
    <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
    <nuxt-link style="color: #303030" to="/cabinet/history">История заказов</nuxt-link> /
    <span>Заказ N {{$route.params.id}}</span>
   

    <v-row justify="center" class="mt-4">
      
             <v-col class="d-none d-lg-block" cols="12" md="3" lg="3">
      <CardUser :user_data="user_data"/>
      </v-col>
      <v-col class="" cols="12" md="8" lg="8">
        <h2>Заказ N {{$route.params.id}}</h2>
        <HistOne :items="history"/>
        <div style="text-align: end;">
          <h4>
            Итого: {{history.summa}} тг
          </h4>
        </div>
      </v-col>


 
    </v-row>
  </v-container>
</template>

<script>
export default {

    async asyncData({ $axios,route, store }) {

    const pk = route.params.id;
    const  history = await $axios.get(
      `http://api-booking.ru/api/v1/present/history/onehistory/${pk}`
    );
    return {history : history.data };
  },
  computed: {
      user_data(){
        return this.$store.state.user.user
      },
  
  },
}
</script>


