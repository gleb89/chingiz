      <template>
  <v-card>
      <h2>Пользователи</h2>
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
      :items="users"
      :search="search"
    >
              <template v-slot:item.avatar="{ item }">
          <img   style="width: 10rem;" :src="item.avatar" alt="">

        </template>
    </v-data-table>
  </v-card>
</template>

<script>
export default {
    layout: "admin",

  async asyncData({ route, $axios }) {
    const product_id = Number(route.params.id);
    let users = await $axios.get(
       `https://api-booking.ru/api/v1/present/users/`
    );

    return { users:users.data};
  },
  data() {
      return {
        headers: [
        { text: 'аватар', value: 'avatar' },
          { text: 'email', value: 'email' },
          { text: 'телефон', value: 'phone' },
          { text: 'Имя', value: 'firstname' },
          { text: 'id firebase', value: 'uid_firebase' },
          { text: 'Бонусы', value: 'points' },
          { text: 'Дата рег.', value: 'timestamp' },
        ],
        search: '',
      };
  },
}
</script>