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
                :onForm="onForm"
                :onfilterslugPage="onfilterslugPage"
                :onReason="onReason"
          class="d-none d-lg-block mt-15"
       

        />
      </v-col>

      <!-- box-productsr -->
      <v-col cols="12" lg="10" style="" id="box-products" class="box-products addhid">
        
        <div class="d-none d-lg-block">
          <h2  class="nemepresent">
              {{name_category}} ({{count}}) 
          </h2>
        </div>
                                                   <v-col cols="12">
                      <!-- <Search
                      :sortPriceNav="sortPriceNav"
                      :sort_price="sort_price"
                      /> -->
                                  <div class="d-flex flex-wrap  ">
          <v-row>
            <v-col cols="12" lg="8" md="8">
              <div style="flex-grow: 3; position: relative; width: 100%">
                <img class="searc-inp" style="" src="/search .png" alt="" />

                <v-text-field
                  
                  style="border: 1px solid #989898; width: 100%; height: 3.5rem"
                  placeholder="Введите повод, форму, категорию или название "
                  rounded
                ></v-text-field>
                <!-- <div class="result-search" style="">
              <p @click="onresSearch(i)" v-for="i in upd_serch" :key="i">{{i}}</p>
              
      
            </div> -->
              </div>
            </v-col>
            <v-col
              lg="3"
              md="3"
              class="d-lg-block d-md-block d-none"
              style="align-items: center; display: flex"
            >
              <v-select
                :items="['сначала недорогие', 'более дорогие']"
                :label="sort_price || 'Cначала недорогие'"
                v-model="sort_price"
                single-line
              ></v-select>
            </v-col>
          </v-row>
        </div>
                    </v-col>
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
  data() {
    return {
      sort_price: "",
    };
  },
mounted() {

    
},
computed: {
    name_category(){
      return this.$store.state.categories.name_category
    },
    count(){
      if(this.sort_price){
            
      this.sortPriceNav(this.sort_price);
    }
      return this.$store.state.categories.count_present
    }

},

  methods: {
    onfilterslugPage(pk,name,cat_or_reason) {
      this.sort_price = ''

      if(pk === 0){
        console.log(11);
        this.$router.push('/catalog')
      }
      else{
        this.$router.push('/catalog/category/'+pk)
      }
      this.$store.commit("categories/setcategoriesname",name); 

    },
    onReason(pk,name) {
      
        this.sort_price = ''
        setTimeout(() => {
         this.$store.commit("products/setpresents",[]); 
      }, 100);
        this.$router.push('/catalog/reason/'+pk)
     
      this.$store.commit("categories/setcategoriesname",name); 

    },
        onForm(pk,name) {
          this.sort_price = ''
          this.$router.push('/catalog/forms/'+pk)
      this.$store.commit("categories/setcategoriesname",name); 
     
    },
    sortPriceNav(sort_price){
      this.$store.commit("products/SetSortPriceNav",sort_price); 

    }
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
  margin-top: 2em;
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