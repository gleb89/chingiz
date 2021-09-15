<template>
    <v-container>
         <h2>Отправка заказа курьеру</h2>
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