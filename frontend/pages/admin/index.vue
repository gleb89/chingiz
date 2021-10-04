<template>
    <v-container>
        <div class="d-flex justify-center">
            <v-card class="login-form">
                <FormLoginAdmin/>
            </v-card>
        </div>
         
    </v-container>
    
    
</template>

<script>
export default {
  layout: "loginadmin",
        mounted: function () {
    if (!this.$store.state.localStorage.jwtToken.length) {
        console.log(55);
      this.$router.push('/admin')
    }
    if (this.$store.state.localStorage.jwtToken.length) {
        console.log(88);
        this.$router.push('/admin/list_presents')
      }
    
    },
}
</script>