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
    if (!localStorage.getItem('Jwt')) {
        
      this.$router.push('/admin')
    }
    if (localStorage.getItem('Jwt')) {
      this.$store.commit("localStorage/setAuthadmin", localStorage.getItem('Jwt'));
        this.auth = true
        this.$router.push('/admin/list_presents')
      }
    
    },
  methods: {
    sendLogin(){
        let data = {
          "email": this.email,
          "password": this.password
        }
        this.$axios
        .$post(`http://giftcity.kz/api/v1/present/admin/token-auth`, data, {
          headers: headers
        })
        .then((token) => {
          this.$store.commit("localStorage/setAuthadmin", `Bearer ${token.access_token}`);
          this.$store.commit("localStorage/setAuthadmindata", token.admin_data);
        })
        .catch(function (error) {
        console.log('error');
      });
        
     },
  },
}
</script>

