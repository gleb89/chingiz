
        
<template>
  <v-card>
      <h2>Подписки на email</h2>
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
      :items="podpiska"
      :search="search"
    >
    </v-data-table>
  </v-card>
</template>
<script>
export default {
    layout: "admin",
  async asyncData({ route, $axios }) {
    const podpiska = await $axios.get(
      `/api/present/mailing/`
    );

    return {podpiska:podpiska.data};
  },
  data() {
      return {
        headers: [
        { text: 'id', value: 'id' },
          { text: 'email', value: 'email_user' }
         
        ],
        search: '',
      };
  },

}
</script>