<template>
            <v-card
          class="rounded-xl"
          color="#F4F5F6"
          style="padding: 1rem"
          elevation="6"
        >
          <div class="text-center">
            <v-avatar size="60px" color='white'>
                <fa v-if="!user_data.avatar" icon="user"></fa>
                <img
              v-if="user_data.avatar"
                alt="Avatar"
                :src="user_data.avatar"
              />
            </v-avatar>
          </div>
          <p class="text-center" style="color: #ff7a00;margin-top:2rem">
            {{user_data.points}} бонусов
          </p>
          <div style="font-weight: bold;width:100%" class="text-center">
            El-Bazaar
          </div>
          <p v-if="user_data.firstname" class="text-center">{{user_data.firstname}}</p>
          <p v-if="!user_data.firstname" class="text-center"><NuxtLink to="/cabinet" >Имя еще не предоставлено</NuxtLink></p>
          <div class="box-profile">
            <div
              class="prof d-flex justify-space-between"
              @click="onPage('cabinet')"
            >
              <p>Настройки профиля</p>
              <img
                style="height: 10px;margin-top: .5rem;"
                src="/vect.png"
                alt=""
              />
            </div>
            <div
              class="prof d-flex justify-space-between"
              @click="onPage('cabinet/basket')"
            >
              <p>Корзина</p>
              <img
                style="height: 10px;margin-top: .5rem;"
                src="/vect.png"
                alt=""
              />
            </div>
            <div
              class="prof d-flex justify-space-between"
              @click="onPage('cabinet/history')"
            >
              <p>История заказов</p>
              <img
                style="height: 10px;margin-top: .5rem;"
                src="/vect.png"
                alt=""
              />
            </div>
            <div @click="onPage('cabinet/bonus')" class="prof d-flex justify-space-between">
              <p>Бонусы</p>
              <img
                style="height: 10px;margin-top: .5rem;"
                src="/vect.png"
                alt=""
              />
            </div>
            <div @click="onsignout"  class="prof d-flex justify-space-between">
              <p>Выйти</p>
              <img
                style="height: 10px;margin-top: .5rem;"
                src="/vect.png"
                alt=""
              />
            </div>
          </div>
        </v-card>
</template>

<script>
export default {
  props:['user_data'],
    methods: {
      onsignout(){
      console.log('out');
      this.$store.commit("localStorage/setAuthuser", '');
      this.$store.commit("localStorage/set_summBasket",Number(0));
      this.$store.commit("localStorage/set_idBasket",Number(0));
      this.$router.push("/");
      localStorage.removeItem('id_basket');
      localStorage.removeItem('uid_auth_user');
      localStorage.removeItem('summ_present');
   
    },
    onPage(url) {
      this.$router.push("/" + url);
    }
    },
}
</script>