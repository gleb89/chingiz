<template>
  <v-container>
    <h2>Все заказы</h2>
    <v-row>
      <v-col>
        <v-tabs color="orange" left>
          <v-tab @click="news = true">Физ.оплата</v-tab>
          <v-tab @click="news = false">Юр.оплата</v-tab>

          <v-tab-item>
            <ZacazFiz :data_history_fiz="data_history_fiz" :curers="curers" />
          </v-tab-item>
          <v-tab-item>
            <ZacazUr :data_history_ur="data_history_ur" :curers="curers" />
          </v-tab-item>
        </v-tabs>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  layout: "admin",
  async asyncData({ route, $axios }) {
    let history_data = await $axios.get(
      `https://api-booking.ru/api/v1/present/history/`
    );
    let curers = await $axios.get(`https://api-booking.ru/api/v1/couriers/`);

    return { history_data: history_data.data, curers: curers.data };
  },
  computed: {
    data_history_fiz() {
      this.data_fiz = this.history_data.filter(elem => {
        return elem.fiz_oplata === true;
      });
      return this.data_fiz;
    },
    data_history_ur() {
      this.data_ur = this.history_data.filter(elem => {
        return elem.ur_oplata === true;
      });
      return this.data_ur;
    }
  },
  mounted: function() {
    if (!this.$store.state.localStorage.jwtToken.length) {
      console.log(55);
      this.$router.push("/admin");
    }
  },
  data() {
    return {
      news: false,
      data_fiz: [],
      data_ur: []
    };
  }
};
</script>
