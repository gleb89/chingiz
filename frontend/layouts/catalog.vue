<template>
<v-app >
      
    
    <div class="nav-dnav">
      <Nav />
      </div>
      <div class="nav-mnav" >
        <Navmobile />
      </div>
 
 

  <v-container style="margin-top: 3em;">
    <v-row justify="center">
      <!-- box-filterss -->
      <v-col class="bocc-filter" cols="12" lg="2">
        <!-- desc filter -->
                <FiltersCatalog
                :onfilterslugPage="onfilterslugPage"
                :onReason="onReason"
          class="d-none d-lg-block"
       

        />
      </v-col>

      <!-- box-productsr -->
      <v-col cols="12" lg="10" style="margin-top: 2em;" id="box-products" class="box-products addhid">
        
        <div class="d-none d-lg-block">
          <h2  class="nemepresent">
              {{name_category}} ({{count}})
          </h2>
        </div>
        <div class="d-flex flex-wrap ">
        </div>
        <v-container class="box-scrol">
          <v-row justify="start">
            <v-container>
              <v-main>
                  <Nuxt />
             </v-main>
            </v-container>
          </v-row>
        </v-container>
      </v-col>
    </v-row>
  </v-container>
  </v-app>
</template>
<script>
export default {
mounted() {
    
    
},
computed: {
    name_category(){
      return this.$store.state.categories.name_category
    },
    count(){
      return this.$store.state.categories.count_present
    }

},

  methods: {
    onfilterslugPage(pk,name,cat_or_reason) {
      
      if(pk === 0){
        
        this.$router.push('/catalog')
      }
      else{
        this.$router.push('/catalog/category/'+pk)
      }
      this.$store.commit("categories/setcategoriesname",name); 

    },
    onReason(pk,name) {
      

        this.$router.push('/catalog/reason/'+pk)
     
      this.$store.commit("categories/setcategoriesname",name); 

    },
  },
};
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
.active {
  color: #ff7a00;
}
.box-products h2 {
  margin-top: 5.2rem;
}

.box-filter {
  margin-top: 1rem;
  margin-bottom: 0.7rem;
  display: flex;
  cursor: pointer;
}
.box-filter span {
  margin-left: 1rem;
}
.searc-inp {
  position: absolute;
  top: 1.3em;
  z-index: 1;
  right: 1rem;
}
@media (max-width: 500px) {
  .box-products h2 {
    margin-top: 1rem;
  }
  .grop {
    position: absolute;
    left: 0;
  }
  .mobile-hei {
    min-height: 80vh;
  }
  .boxs-cardprod {
    margin-bottom: 4em;
  }
  .mobp {
    margin-top: 4rem;
  }
}
@media (min-width: 500px) {
  .box-products {
    padding-left: 3rem;
  }
}

@media (min-width: 1259px) {
  .box-products {
    overflow-x: hidden;
    min-height: 100vh;
    height: 100vh;
  }
  .bocc-filter {
    overflow-x: hidden;
    min-height: 100vh;
    height: 100vh;
  }
}

::-webkit-scrollbar {
  display: none;
}

.v-text-field.v-text-field--enclosed:not(.v-text-field--rounded)
  > .v-input__control
  > .v-input__slot,
.v-text-field.v-text-field--enclosed .v-text-field__details {
  padding: 0 12px;
  max-width: 100%;
}
.v-input__slot {
  width: 90%;
}
.result-search {
  position: absolute;
  z-index: 1;
  overflow: scroll;
  height: 20vh;
  background: white;
  box-shadow: -1px 1px 2px 2px rgb(0 0 0 / 11%);
  padding: 1em;
  width: 100%;
}
</style>