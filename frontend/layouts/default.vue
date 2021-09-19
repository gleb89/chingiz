<template>
<v-app >
  <header>
    <div class="d-lg-block d-none">
      <Nav />
      </div>
      <div class="d-lg-none d-block" >
        <Navmobile />
      </div>
  </header>
    <main style="min-height:100vh">
      <Nuxt />
    </main>
    <footer id="contact" style="background: #f6f6f6">
      <Foot/>
    </footer>
    <div class="d-block d-lg-none ">
      <Mobbar/>
    </div>
  </v-app>
</template>

<script>
export default {
  head(){
    return{
      link:[{rel:"canonical",href:`https://el-bazaar.kz/${this.$route.path}`}]
    }
  },
  data() {
    return {
      drawer: false,
      group: null,
    };
  },
  methods: {
      onHome(){ 
      this.$router.push('/')
    },
    onCatalog(){
      this.$router.push("/"+'catalog/Все_продукты');
    },
    drawerclick() {
      this.drawer = !this.drawer
    },

  },
   
}
</script>

<style >

.nav-d {
  display: none;
}
@media (min-width: 1260px) {
  .nav-d {
    display: block;
  }
}

.nav-m {
  display: none;
}
@media (max-width: 1259px) {
  .nav-m {
    display: block;
  }
}


  
</style>