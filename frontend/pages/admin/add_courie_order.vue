<template>
    <v-container>
         <h2>Отправить заказ курьеру</h2>
    </v-container>
    
    
</template>

<script>
export default {
    layout:'admin',
    mounted: function () {
    if (!this.$store.state.localStorage.jwtToken.length) {
        console.log(55);
      this.$router.push('/admin')
    }
    
    },
}
</script>