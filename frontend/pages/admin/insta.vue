<template>
    <v-container>
<v-data-table
      :headers="headers"
      :items="all_insta"
      item-key="id"
      class="elevation-1"
      :search="search"
      :custom-filter="filterOnlyCapsText"
    >
    <template v-slot:item.moderation="{ item }">
        <span v-if="item.moderation">Да</span>
        <span v-if="!item.moderation">Нет</span>
      </template>
    <template v-slot:item.fair="{ item }">
       {{item.self_user[0].uid_firebase}}
      </template>
    <template v-slot:item.otm="{ item }">
        <div v-if="item.moderation">
            <span>Подтверждено</span>
        </div>
     
            <div v-if="!item.moderation">
            <v-btn @click="onInst(item.id,item.self_user[0].uid_firebase)">
                 подтвердить
            </v-btn>
        </div>
      </template>

    </v-data-table>
    </v-container>
</template>

<script>
export default {
      layout: "admin",
  async asyncData({ params, $axios }) {
    // We can use async/await ES6 feature
    const data_presents = await $axios.get(
      `/api/present/insta/`
    );

    return { data_insta: data_presents.data };
  },
  computed: {
      all_insta(){
          return this.data_insta
      }
  
  },
data() {
    return {
        search: '',
         headers: [
        { text: " id отметки", value: "id" },
        { text: "ссылка на отметку", value: "link" },
        { text: "проверено?", value: "moderation" },
        { text: "дата создания", value: "timestamp" },
        { text: "подтвердить отметку", value: "otm" },
         { text: "id firebase пользователя", value: "fair" }
      ],
    };
},
   methods: {
       onInst(insta_id,user_id){
 let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken
      };
      
      this.$axios
        .$post(`/api/present/insta/bonus/${user_id}/${insta_id}`, {
          headers: headers
        })
        .then((resp) => {
          
          this.data_insta = resp
        })
        .catch(function (error) {
          console.log("error");
        });
       },
      filterOnlyCapsText (value, search, item) {
        return value != null &&
          search != null &&
          typeof value === 'string' &&
          value.toString().toLocaleUpperCase().indexOf(search) !== -1
      },
    },
}
</script>