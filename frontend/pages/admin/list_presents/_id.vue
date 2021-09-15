<template>
    <div>
        одна корзина
    </div>
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