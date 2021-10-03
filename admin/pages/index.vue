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
    layout:'loginadmin',
    computed: {

    
    },
    mounted: function () {
    if (!this.$store.state.localStorage.jwtToken.length) {
        console.log(55);
      this.$router.push('/')
    }
    if (this.$store.state.localStorage.jwtToken.length) {
        console.log(88);
        this.$router.push('/admin/list_presents')
      }
    
    },
}
</script>

<style >
.login-form{
    display: flex;
    justify-content: center;
    width: max-content;
    padding: 1rem;
}
@media (max-width: 500px){
   .login-form{
    padding: auto;
    width: 100%;
  
} 
}
</style>

