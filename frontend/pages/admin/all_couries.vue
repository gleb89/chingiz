<template>
  <v-card>
    <h2>Курьеры</h2>
    <v-dialog v-model="dialog" persistent max-width="600px">
      <v-card>
        <v-card-title>
          
        </v-card-title>
        <v-card-text>
          <v-container>
            <v-row>
              <v-col cols="12">
                <v-text-field v-model="name" label="Имя"></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field v-model="password" label="пароль"></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field v-model="email" label="email"></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field
                  v-model="adress_propiski"
                  label="адресс прописки"
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field
                  v-model="adress_prozjivania"
                  label="адресс проживания"
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field
                  v-model="phone_courier"
                  label="номер телефона"
                ></v-text-field>
              </v-col>
              <v-col cols="12">
                <v-text-field
                  v-model="phone_family_people"
                  label="номер телефона бл.родственника"
                ></v-text-field>
              </v-col>
            </v-row>
          </v-container>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>

          <v-btn color="blue darken-1" text @click="dialog = false">
            Отмена
          </v-btn>
          <v-btn color="blue darken-1" text @click="createCurier">
            Сохранить
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <div v-if="admin_data.courer_change" style="width: 100%;padding: 1rem;">
      <v-btn @click="dialog = true" class="mx-2" fab dark color="indigo">
        <v-icon dark style="color:white"> mdi-plus </v-icon>
      </v-btn>
    </div>
    <v-card-title>
      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table :headers="headers" :items="curers" :search="search">
    </v-data-table>
  </v-card>
</template>

<script>
export default {
  layout: "admin",

  async asyncData({ route, $axios }) {
    const product_id = Number(route.params.id);
    let curers = await $axios.get(`https://giftcity.kz/api/v1/couriers/`);

    return { curers: curers.data };
  },
computed: {
     admin_data(){
       return this.$store.state.localStorage.admin_data
       },

},
  data() {
    return {
      headers: [
        { text: " id курьера", value: "id" },
        { text: "Имя", value: "name" },
        { text: "email", value: "email" },
        { text: "телефон", value: "phone_courier" },
        { text: "Тел.бл.родственника", value: "phone_family_people" },
        { text: "адр.прописки", value: "adress_propiski" },
        { text: "адр.проживания", value: "adress_prozjivania" }
      ],
      search: "",
      dialog: false,
      name: "",
      password: "",
      email: "",
      adress_propiski: "",
      adress_prozjivania: "",
      phone_courier: "",
      phone_family_people: ""
    };
  },
  methods: {
    createCurier() {
      let data = {
        name: this.name,
        password: this.password,
        email: this.email,
        adress_propiski: this.adress_propiski,
        adress_prozjivania: this.adress_prozjivania,
        phone_courier: this.phone_courier,
        phone_family_people: this.phone_family_people
      };
      console.log(data);
this.$axios
        .$post(`https://giftcity.kz/api/v1/couriers/`, data, {
    
        })
        .then((data) => {
            console.log(data);
            this.curers.push(data)
            this.dialog = false
        })
        .catch(function (error) {
        console.log('error');
      });
      
    }
  }
};
</script>
