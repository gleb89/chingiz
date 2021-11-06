<template>
<div>
<v-app-bar
  id="app-fot"
      fixed
      color="white"
    >
      <v-btn  @click="openMenu()" icon>
        <img  width="23" height="12"  fluid src="/mobapp.png">
      </v-btn>

      <v-toolbar-title><img style="width: 8em;margin-top: .3em;" @click="onHome" src="/giftcity.svg"></v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon>
               <a  href="tel:+77071015157" style="font-weight: bold;color: #676767;text-decoration: none; color: black"
            >
            <img  style="width:23px" fluid src="/Telephone.png">
            </a
          >
      </v-btn>

      <v-btn icon > 
               <a style=" text-decoration: none;color:black ;    display: flex;
    align-items: center;" href="https://wa.me/77071015157/" target="blank">
                
               <img width="23" height="auto" fluid src="/whatsapp.svg">
                   
                    </a>
       
 
      </v-btn>
    </v-app-bar>
<nav  id="nav" class="nav">
        <v-list-item-group
        style="width: 100%;"
          active-class="deep-purple--text text--accent-4"
        >
          <v-list-item @click="onHome">
            <v-list-item-icon>
              <fa style="color:#FF7A00;width: 1.5rem;font-size: 1rem;"  icon="home"></fa>
            </v-list-item-icon>
            <v-list-item-title>Главная</v-list-item-title>
            <fa style="font-size: 1rem;color: #ff8b20;" icon="chevron-right"></fa>
          </v-list-item>

          <v-list-item @click="onPage('catalog/Все_продукты')">
            <v-list-item-icon>
             <fa style="color:#FF7A00;width: 1.5rem;font-size: 1rem;"  icon="th-list"></fa>
            </v-list-item-icon>
            <v-list-item-title>Каталог</v-list-item-title>
            <fa style="font-size: 1rem;color: #ff8b20;" icon="chevron-right"></fa>
          </v-list-item>



            <v-list-item @click="onPage('for_work')">
            <v-list-item-icon>
             <fa style="color:#FF7A00;width: 1.5rem;font-size: 1rem;"  icon="network-wired"></fa>
            </v-list-item-icon>
            <v-list-item-title> Доставка и оплата  </v-list-item-title>
            <fa style="font-size: 1rem;color: #ff8b20;" icon="chevron-right"></fa>
          </v-list-item>

            <v-list-item @click="onPage('for_bonus')">
            <v-list-item-icon>
             <fa style="color:#FF7A00;width: 1.5rem;font-size: 1rem;" icon="coins"></fa>
            </v-list-item-icon>
            <v-list-item-title> Бонусы</v-list-item-title>
            <fa style="font-size: 1rem;color: #ff8b20;" icon="chevron-right"></fa>
          </v-list-item>

             <v-list-item @click="onPage('business')">
            <v-list-item-icon>
             <fa style="color:#FF7A00;width: 1.5rem;font-size: 1rem;" icon="chart-pie"></fa>
            </v-list-item-icon>
            <v-list-item-title>Для Бизнеса</v-list-item-title>
            <fa style="font-size: 1rem;color: #ff8b20;" icon="chevron-right"></fa>
          </v-list-item>

            <v-list-item @click="onPage('contacts')">
            <v-list-item-icon>
             <fa style="color:#FF7A00;width: 1.5rem;font-size: 1rem;" icon="address-book"></fa>
            </v-list-item-icon>
            <v-list-item-title>Контакты</v-list-item-title> 
            <fa style="font-size: 1rem;color: #ff8b20;" icon="chevron-right"></fa>
          </v-list-item>
          <hr style="border: none;color: #ffa5008c;background-color: #ffa5008c;height: 2px;">
                     <div >
                <span style="margin-left:1rem;font-size:1rem;width:100%">Мы в мессенджерах:</span>
                <div style="width:100%">
             
             </div>
              </div>
            <v-list-item  @click="closeMenu"> 
   
              
              <v-list-item-icon>
              <img style="width: 1.2rem;" src="/tt.png" alt="" />
              </v-list-item-icon>
              <v-list-item-title>Telegram</v-list-item-title> 
                <fa style="font-size: 1rem;color: #ff8b20;" icon="chevron-right"></fa>
          </v-list-item>
            <v-list-item  @click="closeMenu"> 
              
              <v-list-item-icon>
              <img style="width: 1.2rem;" src="/ww.png" alt="" />
              </v-list-item-icon>
              <v-list-item-title>WhatsApp</v-list-item-title> 
               <fa style="font-size: 1rem;color: #ff8b20;" icon="chevron-right"></fa>
          </v-list-item>
        </v-list-item-group>
    </nav>
    </div>
</template>

<script>
export default {
  
  data(){
    return {
  
    }
  },
  methods: {
     onHome(){
      let nav = document.querySelector('#nav')
       nav.classList.remove("expanded");
      this.$router.push('/')
      this.$vuetify.goTo(0)
      
    },
    onCatalog(){
      let nav = document.querySelector('#nav')
       nav.classList.remove("expanded");
      this.$router.push("/"+'catalog/Все_продукты');
    },
    onPage(url){
      this.openMenu()
      this.$router.push('/'+url)
    },
   
    openMenu() {
      let nav = document.querySelector('#nav')
       if (nav.classList.value.includes("expanded")) {
        nav.classList.remove("expanded");
        
       }
      else{
      nav.classList.add("expanded");
      
      }
    },
    closeMenu(args = null) {
      this.openMenu()
    },
  },
};
</script>


<style scoped>
.nots{
  display: none;
}

.lang-dialog{
  background: white;
  position: absolute;
  top: 3rem;
  right: 5rem;
  box-shadow: 2px 2px 2px 2px #00000063;
  width: max-content;
  transition: .5s linear .5s; 
}
  .nav {
    background: white;
    color: black;
    cursor: pointer;
    display: flex;
    font-size: 2rem;
    height: 100vh;
    left: -20rem;
    padding: 6rem 2rem 2rem 2rem;
    position: fixed;
    top: 0;
    transition: all 0.5s;
    width: 20rem;
    z-index: 2;
    overflow: hidden;
  }
  .nav.expanded {
    left: 0;
    width: 100%;
}
</style>