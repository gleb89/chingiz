<template>
<v-app >
  <header>
    
    <div class="nav-dnav">
      <Nav />
      </div>
      <div class="nav-mnav" >
        <Navmobile />
      </div>
      
  </header>
    <main style="min-height:100vh">
      <Nuxt />
      
    </main>
    
    <footer v-if="$route.params.name != 'Все_продукты'"  id="contact" style="background: #f6f6f6">
      <Foot/>
    </footer>
    <div class="nav-mnav">
      <Mobbar />
    </div>
  </v-app>
</template>

<script>

export default {
  head(){
    return{
      link:[{rel:"canonical",href:`http://giftcity.kz/${this.$route.path}`}]
    }
  },


  data() {
    return {
      drawer: false,
      group: null,
     
    };
  },
  mounted() {

    if(!process.client) return;
    let deferredPrompt;

    window.addEventListener('beforeinstallprompt', (e) => {
      // Prevent the mini-infobar from appearing on mobile
      e.preventDefault();
      // Stash the event so it can be triggered later.
      deferredPrompt = e;
      // Update UI notify the user they can install the PWA
      showInstallPromotion();
      // Optionally, send analytics event that PWA install promo was shown.
      console.log(`'beforeinstallprompt' event was fired.`);
    });
    const id_basket = localStorage.getItem('id_basket')
    const uid_auth_user = localStorage.getItem('uid_auth_user')
    const summ_present =  localStorage.getItem('summ_present')
     const city =  localStorage.getItem('city')
     const date =  localStorage.getItem('date')
    
    
    if(id_basket){
      console.log('id basket');
      this.$store.commit("localStorage/set_idBasket",Number(id_basket));
   }
   if(uid_auth_user){
     console.log('uid_auth_user');
    this.$store.commit("localStorage/setAuthuser",String(uid_auth_user));
    this.retbonus()
    
 }
 if(summ_present){
   console.log('summ_present');
  this.$store.commit("localStorage/set_summBasket",Number(summ_present));
}
 if(city){
   console.log(city);
  this.$store.commit("localStorage/set_Sity",String(city));
}
 if(date){
   console.log('date',date);
  this.$store.commit("localStorage/set_Date",String(date));
}
   },
  methods: {

    retbonus() {
        this.$axios
        .$get(`http://giftcity.kz/api/v1/present/users/${this.$store.state.localStorage.uid_auth_user}`,{
        })
        .then((resp) => {
          console.log(resp);
        this.$store.commit("user/setusers",resp);
        })
        .catch(function (error) {
         console.log(error);
        });

  },
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


@media (max-width: 2800px) {
  .nav-dnav {
    display: block;
  }
  .nav-mnav {
  display: none;
}
}


@media (max-width: 1460px) {
  .nav-mnav {
    display:block;
  }
  .nav-dnav {
  display: none;
}
}


  
</style>