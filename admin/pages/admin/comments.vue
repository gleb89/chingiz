
        
<template>
  <v-card>
      <h2>Комментарии</h2>
    <v-card-title>
      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table
      :headers="headers"
      :items="comments"
      :search="search"
    >
          <template v-slot:item.moderation="{ item }">
              <v-checkbox
              @click="onmoderComment(item.id,item.moderation)"
                v-model="item.moderation"
                
                ></v-checkbox>

        </template>
    </v-data-table>
  </v-card>
</template>
<script>
export default {
    layout: "admin",
  async asyncData({ route, $axios }) {
    const comments = await $axios.get(
      `https://api-booking.ru/api/v1/present/comments/`
    );
    return {comments:comments.data};
  },
  data() {
      return {
        headers: [
        { text: 'к подарку(артикул)', value: 'present_id' },
          { text: 'id пользователя', value: 'user_id' },
           { text: 'имя', value: 'name_user' },
           { text: 'телефон', value: 'phone_user' },
           { text: 'email', value: 'email_user' },
          { text: 'текст комм', value: 'body' },
          { text: 'дата комм.', value: 'timestamp' },
          { text: 'допущен?', value: 'moderation' },
         
        ],
        search: '',
      };
  },
  methods: {
      onmoderComment(id,moderation){
                let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken,
      };


      this.$axios
        .$post(
          `https://api-booking.ru/api/v1/present/comments/moderation/${id}/${moderation}`,
          {
            headers: headers,
          }
        )
        .then((resp) => {
          console.log(resp);
        })
        .catch(function (error) {
          console.log(error);
        });
      },
  },
}
</script>