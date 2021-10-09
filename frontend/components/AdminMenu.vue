<template>
<div>
     <v-navigation-drawer
      v-model="drawer"
      app
    >
       <v-list
        nav
        dense
        
      >
        <v-list-item-group
          v-model="group"
          active-class="deep-purple--text text--accent-4"
        >


          <v-list-item v-if="admin_data.admins_read" @click="onadminPage('/admin/alladmins')">
            <v-list-item-icon>
              <fa class="mt-1" icon='list-alt'></fa>
            </v-list-item-icon>
            <v-list-item-title>Администраторы</v-list-item-title>
          </v-list-item>
          <v-list-item v-if="admin_data.present_read" @click="onadminPage('/admin/list_presents')">
            <v-list-item-icon>
              <fa class="mt-1" icon='list-alt'></fa>
            </v-list-item-icon>
            <v-list-item-title>подарочные корзины</v-list-item-title>
          </v-list-item>

          <v-list-item v-if="admin_data.filters_present_read" @click="onadminPage('/admin/form')">
            <v-list-item-icon>
              <fa class="mt-1" icon='list-alt'></fa>
            </v-list-item-icon>
            <v-list-item-title>Формы подарков</v-list-item-title>
          </v-list-item>

           <v-list-item v-if="admin_data.filters_present_read" @click="onadminPage('/admin/type')">
            <v-list-item-icon>
              <fa class="mt-1" icon='folder-plus'></fa>
            </v-list-item-icon>
            <v-list-item-title>Типы подарков</v-list-item-title>
          </v-list-item>

           <v-list-item v-if="admin_data.filters_present_read" @click="onadminPage('/admin/povod')">
            <v-list-item-icon>
              <fa class="mt-1" icon='folder-plus'></fa>
            </v-list-item-icon>
            <v-list-item-title>Поводы подарков</v-list-item-title>
          </v-list-item>

           <v-list-item v-if="admin_data.filters_present_read" @click="onadminPage('/admin/categories')">
            <v-list-item-icon>
              <fa class="mt-1" icon='folder-plus'></fa>
            </v-list-item-icon>
            <v-list-item-title>Категории подарков</v-list-item-title>
          </v-list-item>

           <v-list-item v-if="admin_data.users_read" @click="onadminPage('/admin/users')">
            <v-list-item-icon>
              <fa class="mt-1" icon='list-ol'></fa>
            </v-list-item-icon>
            <v-list-item-title>Пользователи</v-list-item-title>
          </v-list-item>

           <v-list-item v-if="admin_data.comments_read" @click="onadminPage('/admin/comments')">
            <v-list-item-icon>
              <fa class="mt-1" icon='list-ol'></fa>
            </v-list-item-icon>
            <v-list-item-title>Комментарии к подаркам</v-list-item-title>
          </v-list-item>

           <v-list-item v-if="admin_data.podpiska_read" @click="onadminPage('/admin/podpiska')">
            <v-list-item-icon>
              <fa class="mt-1" icon='list-ol'></fa>
            </v-list-item-icon>
            <v-list-item-title>Подписки</v-list-item-title>
          </v-list-item>

           <v-list-item v-if="admin_data.comments_read" @click="onadminPage('/admin/commentserv')">
            <v-list-item-icon>
              <fa class="mt-1" icon='list-ol'></fa>
            </v-list-item-icon>
            <v-list-item-title>Комментарии к сервису</v-list-item-title>
          </v-list-item>

           <v-list-item v-if="admin_data.history_basket_read" @click="onadminPage('/admin/orders')">
            <v-list-item-icon>
              <fa class="mt-1" icon='list-ol'></fa>
            </v-list-item-icon>
            <v-list-item-title>Заказы</v-list-item-title>
          </v-list-item>


           <v-list-item v-if="admin_data.courer_read" @click="onadminPage('/admin/all_couries')">
            <v-list-item-icon>
              <fa class="mt-1" icon='people-carry'></fa>
            </v-list-item-icon>
            <v-list-item-title>Курьеры</v-list-item-title> 
          </v-list-item>


        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app>
      <v-app-bar-nav-icon @click="drawer = !drawer">
          
      </v-app-bar-nav-icon>

      <v-toolbar-title >Админ-панель</v-toolbar-title>
      <div style="width: 100%;" class="text-right">
        <v-btn @click="onExit"><fa icon="sign-out-alt"></fa></v-btn>
      </div>
      
    </v-app-bar>
    </div>
</template>

<script>
  export default {
    data: () => ({ 
        drawer: null ,
        group:null
        }),
computed: {
    admin_data(){
       return this.$store.state.localStorage.admin_data
       },

},
    methods: {
      onadminPage(url){
        this.$router.push(url)
      },
      onExit(){
        this.$store.commit("localStorage/setAuthadmin", '');
        this.$store.commit("localStorage/setAuthadmindata", {});
        this.$router.push('/admin')
      }
    },
  }
</script>

<style >
  
</style>