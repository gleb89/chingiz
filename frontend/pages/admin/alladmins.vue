<template>
<div>
    <h2>Администраторы</h2>
         <div style="width: 100%; padding: 1rem">
            <v-btn
              @click="ondialog"
              class="mx-2"
              fab
              color="indigo"
            >
              <v-icon dark style="color:white"> mdi-plus </v-icon>
            </v-btn>
          </div>
          <v-dialog v-model="dialogcreate" persistent max-width="600px">
       <v-card>
          <v-card-title>
            
          </v-card-title>
          <v-card-text>
            <v-container class="">
              <v-row justify="start">
                <h2 class="text-start">Создать Администратора</h2>
               
                <v-col cols="12">
                  <v-form ref="form_com_children" lazy-validation>
                        <v-text-field
                          v-model="name"
                        :rules="[(v) => !!v || 'Не может быть пустым']"
                      required
                          label="Имя администратора"
                        ></v-text-field>
                        <v-text-field
                          v-model="email"
                        :rules="[(v) => !!v || 'Не может быть пустым']"
                      required
                          label="Email администратора"
                        ></v-text-field>
                    <v-text-field
                      v-model="password"
                      label="пароль"
                      :rules="[(v) => !!v || 'Не может быть пустым']"
                      required
                    ></v-text-field>
      
                    <v-btn
                      :disabled="!onlformdata"
                      class="mr-4"
                      @click="sendDataform"
                    >
                      Создать
                    </v-btn>
                  </v-form>
                </v-col>
              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>

            <v-btn color="blue darken-1" text @click="dialogcreate = false">
              Отмена
            </v-btn>
          </v-card-actions>
        </v-card>
          </v-dialog>
          <v-dialog v-model="dialogpassword" persistent max-width="600px">
       <v-card style="position: relative;">
          <v-card-title>
            
          </v-card-title>
          <v-card-text>
            <v-container class="">
              <v-row justify="start">
                <h2 class="text-start">Изменение пароля</h2>
               
                <v-col cols="12">
                  <v-form ref="form_com_children" lazy-validation>
                    <v-text-field
                      v-model="password"
                      label="пароль"
                      :rules="[(v) => !!v || 'Не может быть пустым']"
                      required
                    ></v-text-field>
                <v-alert
                      
                      style="position: absolute;z-index: 1;width: 90%;"
            v-model="alert"
            
              color="orange"
              elevation="13"
              type="success"
            >Пароль изменен!</v-alert>
                    <v-btn
                      :disabled="!onlformdatapassword"
                      class="mr-4"
                      @click="resetPassword"
                    >
                      Изменить
                    </v-btn>
                  </v-form>
                </v-col>
              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>

            <v-btn color="blue darken-1" text @click="dialogpassword = false">
              Отмена
            </v-btn>
          </v-card-actions>
        </v-card>
          </v-dialog>
    
                <v-dialog v-model="dialogDelete" max-width="500px">
              <v-card>
                <v-card-title class="text-h5"
                  >Вы действительно хотите удалить администратора?</v-card-title
                >
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="dialogDelete = false"
                    >Отмена</v-btn
                  >
                  <v-btn color="blue darken-1" text @click="deleteItemConfirm"
                    >Да</v-btn
                  >
                  <v-spacer></v-spacer>
                </v-card-actions>
              </v-card>
            </v-dialog>
      <v-simple-table class="">
    <template v-slot:default>
      <thead style="background: #ffbc7f;">
        <tr>
          <th style="color:#1F2128" class="text-left">
            имя админа
          </th>
          <th style="color:#1F2128" class="text-left">
            пароль админа
          </th>
          <th style="color:#1F2128" class="text-left">
            Email админа
          </th>
        <th style="color:#1F2128" class="text-left">
           Подарки
        </th>
          <th style="color:#1F2128" class="text-left">
            Фильтры(Категории и т.д)
          </th>
          <th style="color:#1F2128" class="text-left">
            Пользователи
          </th>
        <th style="color:#1F2128" class="text-left">
            Комментарии
          </th>
        <th style="color:#1F2128" class="text-left">
            Email подписки
          </th>
        <th style="color:#1F2128" class="text-left">
           Курьеры
        </th>
        <th style="color:#1F2128" class="text-left">
           Заказы
        </th>
        <th style="color:#1F2128" class="text-left">
           Банеры акций
        </th>
        <th style="color:#1F2128" class="text-left">
           Измененить пароль
        </th>

        <th style="color:#1F2128" class="text-left">
           Удалить администратора
        </th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(admin,index) in admins"
          :key="index"
        >
          <td>
              {{admin.name}}
          </td>
          <td>
            {{admin.normpassword}}
          </td>
          <td>
              {{admin.email}}
          </td>
          <td>
            
            <v-switch
            @click="updateReadChange(admin.id,key='present_read',admin.present_read)"
            color="success"
                label="Чтение"
                v-model="admin.present_read"
                ></v-switch>
            <v-switch
            color="info"
                @click="updateReadChange(admin.id,key='present_change',admin.present_change)"
                label="Изменение"
                v-model="admin.present_change"
                ></v-switch>

            <v-switch
            color="red"
                @click="updateReadChange(admin.id,key='present_delete',admin.present_delete)"
                label="Удаление"
                v-model="admin.present_delete"
                ></v-switch>
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                @click="updateReadChange(admin.id,key='filters_present_read',admin.filters_present_read)"
                v-model="admin.filters_present_read"
                ></v-switch>
            <v-switch
            color="info"
                label="Изменение"
                @click="updateReadChange(admin.id,key='filters_present_change',admin.filters_present_change)"
                v-model="admin.filters_present_change"
                ></v-switch>
            <v-switch
            color="red"
                label="Удаление"
                @click="updateReadChange(admin.id,key='filters_present_delete',admin.filters_present_delete)"
                v-model="admin.filters_present_delete"
                ></v-switch>
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                @click="updateReadChange(admin.id,key='users_read',admin.users_read)"
                v-model="admin.users_read"
                ></v-switch>
            <v-switch
            color="info"
                label="Изменение"
                @click="updateReadChange(admin.id,key='users_change',admin.users_change)"
                v-model="admin.users_change"
                ></v-switch>

          </td>

          <td>
            <v-switch
            @click="updateReadChange(admin.id,key='comments_read',admin.comments_read)"
            color="success"
                label="Чтение"
                v-model="admin.comments_read"
                ></v-switch>
            <v-switch
            color="info"
                @click="updateReadChange(admin.id,key='comments_change',admin.comments_change)"
                label="Изменение"
                v-model="admin.comments_change"
                ></v-switch>
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                @click="updateReadChange(admin.id,key='podpiska_read',admin.podpiska_read)"
                v-model="admin.podpiska_read"
                ></v-switch>
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                @click="updateReadChange(admin.id,key='courer_read',admin.courer_read)"
                v-model="admin.courer_read"
                ></v-switch>
            <v-switch
            color="info"
                label="Изменение"
                @click="updateReadChange(admin.id,key='courer_change',admin.courer_change)"
                v-model="admin.courer_change"
                ></v-switch>

            <v-switch
            color="red"
                label="Удаление"
                @click="updateReadChange(admin.id,key='courer_delete',admin.courer_delete)"
                v-model="admin.courer_delete"
                ></v-switch>
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                @click="updateReadChange(admin.id,key='history_basket_read',admin.history_basket_read)"
                v-model="admin.history_basket_read"
                ></v-switch>
            <v-switch
            color="info"
                label="Изменение"
                @click="updateReadChange(admin.id,key='history_basket_change',admin.history_basket_change)"
                v-model="admin.history_basket_change"
                ></v-switch>
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                @click="updateReadChange(admin.id,key='akcia_read',admin.akcia_read)"
                v-model="admin.akcia_read"
                ></v-switch>
            <v-switch
            color="info"
                label="Изменение"
                @click="updateReadChange(admin.id,key='akcia_change',admin.akcia_change)"
                v-model="admin.akcia_change"
                ></v-switch>

            <v-switch
            color="red"
                label="удаление"
                @click="updateReadChange(admin.id,key='akcia_delete',admin.akcia_delete)"
                v-model="admin.akcia_delete"
                ></v-switch>
          </td>

         <td class="text-center b">
           <v-icon  small class="mr-2" @click="dialogPassw(admin.id,index)">mdi-pencil</v-icon>
         </td>
         <td class="text-center">
           <v-icon small @click="DeleteOpen(admin.id,index)"> mdi-delete </v-icon>
         </td>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</div>
</template>

<script>
export default {
    layout: "admin",

  async asyncData({ route, $axios }) {
   
    let admins = await $axios.get(
       `https://giftcity.kz/api/v1/present/admin/`
    );

    return { admins_list:admins.data};
  },
  data() {
      return {
        dialogcreate:false,
        name:'',
        password:'',
        email:'',
        admin_pk:null,
        dialogpassword:false,
        dialogDelete:false,
        ind:null,
        alert:false
      };
  },
  methods: {
    resetPassword(){
      const headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken,
      };
    let bodyFormData = new FormData();
    bodyFormData.append('password',this.password);
      this.$axios
        .$put(`https://giftcity.kz/api/v1/present/admin/password/${this.admin_pk}`, bodyFormData, {
          headers: headers,
        })
        .then((resp) => {
          
          this.admins_list[this.ind].normpassword = resp.normpassword
          this.alert = true
          this.ind = null
          setTimeout(() => {
            this.alert = false
            this.dialogpassword = false
            this.password = ''
          }, 2000);
          
        })
        .catch(function (error) {
          console.log("error");
        });
    
      
    },
  deleteItemConfirm(){
    console.log(this.admin_pk);
        const headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken,
      };
    this.$axios
        .$delete(`https://giftcity.kz/api/v1/present/admin/${this.admin_pk}`, {
          headers: headers,
        })
        .then((resp) => {
          console.log(resp);
          this.admins_list.splice(this.ind, 1);
          this.dialogDelete = false
          this.ind= null
        })
        .catch(function (error) {
          console.log("error");
        });
    
  },
    DeleteOpen(pk,index){
      this.admin_pk = pk
      this.ind = index
      this.dialogDelete = true
      
    },
    dialogPassw(pk,index){
      this.admin_pk = pk
      this.ind = index
      this.dialogpassword = true
      
    },
    deleteAdmin(pk){
      console.log(pk);
    },

    updateReadChange(admin_id,key_admin,val){
    const headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken,
      };
    console.log(key_admin,val);
    let bodyFormData = new FormData();
    bodyFormData.append(key_admin,val);
    this.$axios
        .$put(`https://giftcity.kz/api/v1/present/admin/${admin_id}`, bodyFormData, {
          headers: headers,
        })
        .then((resp) => {
          console.log(resp);
         this.admins_list = resp
        })
        .catch(function (error) {
          console.log("error");
        });
    
    },
    ondialog(){
      this.dialogcreate = true
    },
    sendDataform() {
    const headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken,
      };
    let data = {
      "name":this.name,
      "password":this.password,
      "normpassword":this.password,
      "email":this.email
    }

    this.$axios
        .$post(`https://giftcity.kz/api/v1/present/admin/`, data, {
          headers: headers,
        })
        .then((resp) => {
          console.log(resp);
          this.dialogcreate = false
         this.admins_list.push(resp)
         this.dialogCreate = false
        })
        .catch(function (error) {
          console.log("error");
        });
      
    },
  },
  computed: {
    admins() {
      this.admins_list = this.admins_list.filter((elem) => {
        return elem.superuser == false
      });
      return this.admins_list 
    },
    onlformdatapassword(){
      if (
        this.password

      ) {
        return true;
      } else {
        return false;
      }
    },
    onlformdata() {
      if (
        this.name &&
        this.email &&
        this.password

      ) {
        return true;
      } else {
        return false;
      }
  
  },
}
}
</script>