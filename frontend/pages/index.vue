<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="8" md="6">
      {{listproducts}}
      <v-btn @click="onPage()">66666</v-btn>
    </v-col>
  </v-row>
</template>
<script>
export default {
  asyncData({ $axios, route, error }) {
    const headers = {
      "Content-Type": "application/json",
    };

    return $axios
      .$get(`present/`, {
        headers: headers,
      })
      .then((presents) => {
        return { presents };
      });
  },
  computed: {
    listproducts() {
      
      return this.presents;
    },
    methods: {
      monPage() {
        this.$router.push('/666')
      },
    },
  }
}
</script>