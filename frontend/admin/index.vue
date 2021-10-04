<template>
    <div>
        
    </div>
</template>

<script>
export default {
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