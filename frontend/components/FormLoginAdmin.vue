<template>
<v-container id="forml">
 <v-form @submit.prevent="sendLogin"  ref="form_com_children" lazy-validation style="padding: 1rem;">
     <h3>Вход в админ панель</h3>
          <v-text-field
            v-model="email"
            label="email"
            :rules="[(v) => !!v || 'Не может быть пустым']"
            counter
            maxlength="30"
            required
          >
          </v-text-field>
          <v-text-field
            v-model="password"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            :rules="[(v) => !!v || 'Не может быть пустым']"
            :type="show1 ? 'text' : 'password'"
            name="input-10-1"
            label="Введите пароль"
            @click:append="show1 = !show1"
          ></v-text-field>
          <v-btn
            :disabled="!onloginform"
            class="mr-4"
            @click="sendLogin"
          >
             Войти
          </v-btn>

        </v-form>
</v-container>
</template>


<script>
    const headers = {
      "Content-Type": "application/json",
    };
import { mapState } from "vuex";
  export default {
    data: () => ({
      valid: true,
      email: '',
      password:'',
      show1:false
    }),
  computed: {
    onloginform() {
      if (this.email && this.password) {
        return true;
      } else {
        return false;
      }
    },

  },
    methods: {
    sendLogin(){
        let data = {
          "email": this.email,
          "password": this.password
        }
        this.$axios
        .$post(`/api/present/admin/token-auth`, data, {
          headers: headers
        })
        .then((token) => {
          this.$store.commit("localStorage/setAuthadmin", `Bearer ${token.access_token}`);
          this.$store.commit("localStorage/setAuthadmindata", token.admin_data);
         this.$store.commit("localStorage/setAuthadminId", token.admin_data.id);
          this.$router.push('/admin/list_presents')
        })
        .catch(function (error) {
        console.log('error');
      });
        
     },

    },
  }
</script>

<style scoped>
  #forml{
    display: flex;
    justify-content: center;
    min-height: 100vh;
    align-items: center;
  }
</style>