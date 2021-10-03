<template>
  <div>
    hello
  </div>
</template>

<script>
export default {
  mounted() {
    setTimeout(() => {
      this.$router.push('/admin')
    }, 500);
  },
  
}
</script>

