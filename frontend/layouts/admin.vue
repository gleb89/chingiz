<template>
  <v-app id="inspire">
   <AdminMenu />
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
      this.sendLogin()
        this.auth = true
        this.$router.push('/admin/list_presents')
      }
    
    },
  methods: {
    sendLogin(){

        this.$axios
        .$get(`http://giftcity.kz/api/v1/present/admin/email/${localStorage.getItem('id_admin')}`, {
          
        })
        .then((admin_data) => {
          this.$store.commit("localStorage/setAuthadmindata", admin_data);
          this.$store.commit("localStorage/setAuthadminId", admin_data.id);
          
        })
        .catch(function (error) {
        console.log('error');
      });
        
     },
  },
}
</script>

