<template>
  <v-app id="inspire">
   <AdminMenu/>
    <v-main>
      <Nuxt />
    </v-main>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      auth: false,
    };
  },
  mounted: function () {
    if (!this.$store.state.localStorage.jwtToken.length) {
        
      this.$router.push('/admin')
    }
    if (this.$store.state.localStorage.jwtToken.length) {
        this.auth = true
        this.$router.push('/admin/list_presents')
      }
    
    },
}
</script>

