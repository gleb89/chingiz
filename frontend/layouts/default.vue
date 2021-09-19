<template>
<v-app >
  <header>
    <div class="nav-d">
      <Nav />
      </div>
      <div class="nav-m" >
        <Navmobile :drawerclick="drawerclick"/>
        <v-navigation-drawer
      v-model="drawer"
      absolute
      temporary
    >
      <v-list
        nav
        dense
      >
        <v-list-item-group
          v-model="group"
          active-class="deep-purple--text text--accent-4"
        >
          <v-list-item @click="onhome()">
            <v-list-item-icon>
              <fa style="color:#FF7A00"  icon="home"></fa>
            </v-list-item-icon>
            <v-list-item-title>Главная</v-list-item-title>
          </v-list-item>

          <v-list-item @click="onPage('catalog/Все_продукты')">
            <v-list-item-icon>
             <fa style="color:#FF7A00"  icon="th-list"></fa>
            </v-list-item-icon>
            <v-list-item-title>Каталог</v-list-item-title>
          </v-list-item>

              <v-list-item @click="onPage('o_nas')">
            <v-list-item-icon>
             <fa style="color:#FF7A00"  icon="people-arrows"></fa>
            </v-list-item-icon>
            <v-list-item-title>О нас</v-list-item-title>
          </v-list-item>

            <v-list-item @click="onPage('for_work')">
            <v-list-item-icon>
             <fa style="color:#FF7A00"  icon="network-wired"></fa>
            </v-list-item-icon>
            <v-list-item-title> Доставка и оплата  </v-list-item-title>
          </v-list-item>

            <v-list-item @click="onPage('for_bonus')">
            <v-list-item-icon>
             <fa style="color:#FF7A00" icon="coins"></fa>
            </v-list-item-icon>
            <v-list-item-title> Бонусы</v-list-item-title>
          </v-list-item>

             <v-list-item @click="onPage('business')">
            <v-list-item-icon>
             <fa style="color:#FF7A00" icon="chart-pie"></fa>
            </v-list-item-icon>
            <v-list-item-title>Для Бизнеса</v-list-item-title>
          </v-list-item>

            <v-list-item @click="onPage('#contact')">
            <v-list-item-icon>
             <fa style="color:#FF7A00" icon="address-book"></fa>
            </v-list-item-icon>
            <v-list-item-title>Контакты</v-list-item-title> 
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
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
    onhome(){
      this.$router.push('/')
    },
    drawerclick() {
      this.drawer = !this.drawer
    },
    onPage(url){
      this.drawer = false
      this.$router.push('/'+url)
    }
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