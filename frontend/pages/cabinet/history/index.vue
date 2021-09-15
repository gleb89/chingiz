<template>
  <v-container style="padding-top: 4rem;padding-bottom: 4rem">
    <h2 class="mb-4">История заказов</h2>
    <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
    <span>История заказов</span>
   
       <div class="d-block d-lg-none">
    <v-dialog
    
      v-model="dialog"
      fullscreen
      hide-overlay
      transition="dialog-bottom-transition"
    >
      <template v-slot:activator="{ on, attrs }">
            <v-btn
            class="btn-mobile-filter"
            v-bind="attrs"
            v-on="on"
            text
            rounded
            style="height: 39px; margin: 0.7rem; border-color: white;margin-top: 3rem;"
            color="indigo"
            outlined
            dark
          >
          <img src="/mobapp.png" alt="">
            <span style="font-size: 12px; color: black"
              >Меню пользователя</span
            >
          </v-btn>
      </template>
      <v-card>
        <v-toolbar
          dark
          color="orange"
        >
          <v-btn
            icon
            dark
            @click="dialog = false"
          >
            <v-icon>mdi-close</v-icon>
          </v-btn>
          <v-toolbar-title>Меню пользователя</v-toolbar-title>
          <v-spacer></v-spacer>
          <v-toolbar-items>

   
          </v-toolbar-items>
        </v-toolbar>
                <v-card
          
          color="#F4F5F6"
          style="padding: 1rem;height: 100vh;"
          elevation="6"
        >
          <div class="text-center">
            <v-avatar size="60px">
              <img
                alt="Avatar"
                src="https://avatars0.githubusercontent.com/u/9064066?v=4&s=460"
              />
            </v-avatar>
          </div>
          <p class="text-center" style="color: #ff7a00;margin-top:2rem">780 бонусов</p>
          <div style="font-weight: bold;width:100%" class="text-center">El-Bazaar</div>
          <p class="text-center">Петров Олег Игоревич</p>
          <div class="box-profile">
            <div class="prof d-flex justify-space-between" @click="onPage('cabinet')">
              <p>Настройки профиля</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between" @click="onPage('cabinet/basket')">
              <p>Корзина</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between" @click="onPage('cabinet/history')">
              <p>История заказов</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between">
              <p>Бонусы</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between">
              <p>Выйти</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
            
          </div>
        </v-card>
      </v-card>
    </v-dialog>
    </div>
    <v-row justify="center" class="mt-4">
      <v-col class="d-none d-lg-block" cols="12" md="3" lg="3">
        <v-card
          class="rounded-xl"
          color="#F4F5F6"
          style="padding: 1rem"
          elevation="6"
        >
          <div class="text-center">
            <v-avatar size="60px">
              <img
                alt="Avatar"
                src="https://avatars0.githubusercontent.com/u/9064066?v=4&s=460"
              />
            </v-avatar>
          </div>
          <p class="text-center" style="color: #ff7a00;margin-top:2rem">780 бонусов</p>
          <div style="font-weight: bold;width:100%" class="text-center">El-Bazaar</div>
          <p class="text-center">Петров Олег Игоревич</p>
          <div class="box-profile">
            <div class="prof d-flex justify-space-between" @click="onPage('cabinet')">
              <p>Настройки профиля</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between" @click="onPage('cabinet/basket')">
              <p>Корзина</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between" @click="onPage('cabinet/history')">
              <p>История заказов</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between">
              <p>Бонусы</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
           <div class="prof d-flex justify-space-between">
              <p>Выйти</p>
              <img style="height: 10px;margin-top: .5rem;" src="/vect.png" alt="">
            </div>
            
          </div>
        </v-card>
      </v-col>
      <v-col cols="12" md="9" lg="9">
        <h2>История заказов</h2>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
      asyncData({ $axios,store}) {
    const headers = {
      "Content-Type": "application/json",
    };
    let user_id = store.state.localStorage.uid_auth_user
    return $axios
      .$get(`present/users/${user_id}`, {
        headers: headers,
      })
      .then((user_data) => {
        console.log(user_data);
        return { user_data };
      });
  },
  methods: {
    onPage(url){
      this.$router.push('/'+url)
    },
  },
  data() {
    return {
      dialog: false,
    };
  },
}
</script>

<style >
.prof{
  cursor: pointer;
}
</style>