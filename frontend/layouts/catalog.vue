<template>
  <v-app>
    <div class="nav-dnav">
      <Nav />
    </div>
    <div class="nav-mnav">
      <Navmobile />
    </div>
form
    <v-container class="cont-filter"> 
      <v-row justify="center">
        <!-- box-filterss -->
        <v-col class="bocc-filter" cols="12" lg="2">
          <!-- desc filter -->
          <FiltersCatalog
            :onForm="onForm"
            :onfilterslugPage="onfilterslugPage"
            :onReason="onReason"
            class="d-none d-lg-block d-md-block mt-15"
          />
            <FiltersCatalogMobile
            :onForm="onForm"
            :onfilterslugPage="onfilterslugPageM"
            :onReason="onReasonM"
            class="d-block d-lg-none d-md-none "
          />
        </v-col>

        <!-- box-productsr -->
        <v-col
          cols="12"
          lg="10"
          style=""
          id="box-products"
          class="box-products addheaich"
        >
          <div class="">
            <h2 class="nemepresent">{{ name_category }} ({{ count }})</h2>
          </div>
          <v-col cols="12">
            <div class="d-flex flex-wrap">
              <v-row>
                <v-col class="for-saerch" cols="12" lg="8" md="8">
                  
                  <v-autocomplete
                  style="width:100%;min-width:100%"
      v-model="model"
      :items="items"
      :loading="isLoading"
      :search-input.sync="search"
        class="appends"
      append-icon="mdi-magnify"
      rounded
      no-data-text="Ничего не найдено"
      solo
      clearable
      hide-details
      hide-selected
      item-text="name_precent"
      item-value="symbol"
      label="Поиск"
     
    >
      <template v-slot:no-data>
        <v-list-item >
          <v-list-item-title>
            Введите название,повод или форму
          </v-list-item-title>
        </v-list-item>
      </template>
      <template v-slot:selection="{ attr, on, item, selected }" >
      </template>
      <template v-slot:item="{ item }" >
        <v-list-item-avatar
        @click="onPage(item.id)"
          color="orange"
          class="text-h5 font-weight-light white--text"
        >
          <img width="46" height="46" :src="item.image_precent" alt="">
        </v-list-item-avatar>
        <v-list-item-content @click="onPage(item.id)">
          <v-list-item-title v-text="item.name_precent"></v-list-item-title>
          <v-list-item-subtitle v-text="item.prevue_name"></v-list-item-subtitle>
        </v-list-item-content>
        <v-list-item-action>
           
        </v-list-item-action>
      </template>
    </v-autocomplete>         
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
                <v-col class="d-lg-none d-md-none d-block col-12">
                  <v-dialog  v-model="dialogres">
                            <v-card class="open" style="">
          <v-toolbar dark color="orange">
            <v-btn icon dark @click="dialogres = false">
              <v-icon>mdi-close</v-icon>
            </v-btn>
            <v-toolbar-title>Фильтры</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items> </v-toolbar-items>
          </v-toolbar>
          <div style="margin-top: 4rem;padding: 1rem;">
            <v-alert
            v-model="alert"
              style="position: fixed;z-index: 2;width: 90%;"
              color="orange"
              elevation="13"
              type="success"
              >Фильтр применен</v-alert
            >

            <div style="margin-top: 2rem">
              <h3>Форма:</h3>
              <div class="mt-4">
                <v-checkbox
                @click="onForm(n.id,n.name_form)"
                  v-for="n in form"
                  :key="n.id"
                  style="height: 1.3rem; width: 20rem"
                  color="orange"
                  v-model="name_form"
                  :label="`${n.name_form}`"
                  :value="n.id"
                ></v-checkbox>
              </div>
            </div>

            <div style="margin-top: 2rem">
              <h3>Цена</h3>
              <!-- forms-price-filter -->
              <div class="mt-4">
                <div>
                  <span>от</span>
                  <v-text-field
                    v-model="minprice"
                    style="width: 100%"
                    type="number"
                    single-line
                    outlined
                  ></v-text-field>
                </div>
                <div>
                  <span>до</span>
                  <v-text-field
                    v-model="maxprice"
                    style="width: 100%"
                   type="number"
                    single-line
                    outlined
                  ></v-text-field>
                </div>
              </div>

              <!-- form-check-filter -->

              <!-- button reset filters -->
              <div class="text-center mt-8">
                <v-btn
                  @click="onReset()"
                  rounded
                  color="#ff7a00"
                  style="height: 39px; margin: 0.7rem"
                  dark
                >
                  <span style="font-size: 12px">сбросить фильтры</span>
                </v-btn>
              </div>
            </div>
          </div>
        </v-card>
      </v-dialog>
            <div
            style="width:100%;background: #F4F5F6;padding-left:.5rem;align-items: center;"
            class="d-flex"
          >
            <div class="ned">
              <v-select
                style="margin-top:1rem"
                :items="['сначала недорогие','более дорогие']"
                solo
                dense
                v-model="sort_price"
                :label="sort_price ||'сначала недорогие'"
              ></v-select>
            </div>

            <div>
              <v-btn @click="dialogres = true"  color="indigo" text>
                <span style="color:#676767">Фильтры</span>
                <img src="/filter.png" alt="" />
              </v-btn>
            </div>

          </div>
          </v-col>
              </v-row>
            </div>
          </v-col>
          <div class="d-flex flex-wrap"></div>
          <v-container class="box-scrol">
            <v-row justify="start">
              <v-container>
              <div class="" style="width: 100%; text-align: end; position: relative">
                <v-btn
                @click="toTop"
                v-scroll="onScroll"
                v-show="fab"
                  style="position: fixed;
              right: 1em;
              z-index: 1;
              bottom: 6em;"
                  fab
                  dark
                  color="orange"
                >
                <fa style="font-size:1.4em" icon="angle-up"></fa>
                </v-btn>
              </div>
                <v-main>

                  <Nuxt />

                </v-main>
              </v-container>
            </v-row>
          </v-container>
        </v-col>
      </v-row>
    </v-container>
     <div class="nav-mnav">
      <Mobbar />
    </div>
  </v-app>
</template>
<script>
export default {
  data() {
    return {
      sort_price: "",
      isLoading: false,
      items: [],
      alert:false,
      dialogres:false,
      fab:false,
      model: null,
      search: null,
      name_form : '',
      minprice : null,
      maxprice : null,
      tab: null,
    };
  },
  mounted() {
   
  },
  watch: {
      model (val) {
        if (val != null) this.tab = 0
        else this.tab = null
      },
      search (val) {
        // Items have already been loaded
        if (this.items.length > 0) return

        this.isLoading = true

        // Lazily load input items
        fetch('/api/present/catalog')
          .then(res => res.clone().json())
          .then(res => {
            this.items = res
          })
          .catch(err => {
            console.log(err)
          })
          .finally(() => (this.isLoading = false))
      },
    },
  computed: {
    name_category() {
                  if (this.minprice && this.maxprice) {
              this.$store.commit("products/setpresentsPrice",this.minprice); 
               this.$store.commit("products/setpresentsMaxs",this.maxprice); 
                
      }else{
        this.$store.commit("products/setpresentsPrice",0); 
        this.$store.commit("products/setpresentsMaxs",0); 
      }
      return this.$store.state.categories.name_category;
    },
    form(){
        return this.$store.state.allfilter.allfilter.form_precent
    },
    count() {
      if (this.sort_price) {
        this.sortPriceNav(this.sort_price);
      }
      return this.$store.state.categories.count_present;
    },
  },

  methods: {
        onReset(){
          this.alert = true
          setTimeout(() => {
             this.alert = false
          }, 1000);
      this.dialogres = false
      this.name_form = ''
      this.minprice = null
      this.maxprice = null
      this.$store.commit("products/setpresentsPrice",0 ,0); 
      this.onfilterslugPage(0,'Все подарки','')
    },
          toTop () {
 this.$vuetify.goTo(0)
    },
          onScroll (e) {
     
      if (typeof window === 'undefined') return
      const top = window.pageYOffset ||   e.target.scrollTop || 0
      this.fab = top > 160
    },
    onfilterslugPage(pk, name, cat_or_reason) {
      this.sort_price = "";
      let doc = document.querySelector(".box-products");
      if (pk === 0) {
        console.log(11);
        doc.classList.remove("addheaich");
        this.$router.push("/catalog");
        setTimeout(() => {
          doc.classList.add("addheaich");
        }, 100);
      } else {
        doc.classList.remove("addheaich");
        this.$router.push("/catalog/category/" + pk);
        setTimeout(() => {
          doc.classList.add("addheaich");
        }, 100);
      }
      this.$store.commit("categories/setcategoriesname", name);
    },
    onReason(pk, name) {
      let doc = document.querySelector(".box-products");
      this.sort_price = "";
      //   setTimeout(() => {
      //    this.$store.commit("products/setpresents",[]);
      // }, 100);
      doc.classList.remove("addheaich");
      this.$router.push("/catalog/reason/" + pk);
      setTimeout(() => {
        doc.classList.add("addheaich");
      }, 100);

      this.$store.commit("categories/setcategoriesname", name);
    },
        onfilterslugPageM(pk, name, cat_or_reason) {
      this.sort_price = "";
      let doc = document.querySelector(".box-products");
      if (pk === 0) {
        console.log(11);
        doc.classList.remove("addheaich");
        this.$router.push("/catalog");
      } else {
        this.$store.commit("categories/setcategoriesname", name);
        this.$router.push("/catalog/category/" + pk);

      }
      
    },
        onReasonM(pk, name) {
    
      this.sort_price = "";
       this.$store.commit("categories/setcategoriesname", name);
      this.$router.push("/catalog/reason/" + pk);


     
    },
    onForm(pk, name) {
      let doc = document.querySelector(".box-products");
      this.sort_price = "";
      doc.classList.remove("addheaich");
      this.$router.push("/catalog/forms/" + pk);
      setTimeout(() => {
        doc.classList.add("addheaich");
         
      }, 100);
      this.$store.commit("categories/setcategoriesname", name);
    },
    sortPriceNav(sort_price) {
      this.$store.commit("products/SetSortPriceNav", sort_price);
    },
    onPage(item_id){
      this.$router.push(`/catalog/all_presents/present/${item_id}`);
    }
  },
};
</script>

<style>
.cont-filter{
  margin-top: 3em;
  }
@media (max-width: 2800px) {
  .nav-dnav {
    display: block;
  }
  .nav-mnav {
    display: none;
  }
  .searc-inp {
    position: absolute;
    top: 1em;
    z-index: 1;
    right: 5em;
}
}
@media (max-width: 1900px) {

  .searc-inp {
    position: absolute;
    top: 1em;
    z-index: 1;
    right: 5em;
}
}
@media (max-width: 600px) {

  .searc-inp {
    position: absolute;
    top: 1em;
    z-index: 1;
    right: 4em;
}
.cont-filter{
  margin-top: 0;
  }
}
.addheaich {
  height: 100vh;
}

@media (max-width: 1460px) {
  .nav-mnav {
    display: block;
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
    top: 1em;
    z-index: 1;
    right: 7em;
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

/* .v-text-field.v-text-field--enclosed:not(.v-text-field--rounded)
  > .v-input__control
  > .v-input__slot,
.v-text-field.v-text-field--enclosed .v-text-field__details {
  padding: 0 12px;
  max-width: 100%;
}
.v-input__slot {
  width: 90%;
} */
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
.appends .v-icon.v-icon {
    color: orange;
}

</style>
