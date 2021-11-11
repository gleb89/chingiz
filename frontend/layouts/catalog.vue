<template>
  <v-app>
    <div class="nav-dnav">
      <Nav />
    </div>
    <div class="nav-mnav">
      <Navmobile />
    </div>

    <v-container style="margin-top: 3em">
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
        <v-col
          cols="12"
          lg="10"
          style=""
          id="box-products"
          class="box-products addheaich"
        >
          <div class="d-none d-lg-block">
            <h2 class="nemepresent">{{ name_category }} ({{ count }})</h2>
          </div>
          <v-col cols="12">
            <div class="d-flex flex-wrap">
              <v-row>
                <v-col class="for-saerch" cols="12" lg="8" md="8">
                  <div style="flex-grow: 3; position: relative; width: 100%">
                    <!-- <v-autocomplete
                    class="appends"
                    append-icon="mdi-magnify"
                    rounded
                    no-data-text="Ничего не найдено"
                    solo
                    ></v-autocomplete> -->
                    <v-autocomplete
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
                    <!-- <img class="searc-inp" style="" src="/search .png" alt="" /> -->

                    <!-- <v-text-field
                      style="
                        border: 1px solid #989898;
                        width: 100%;
                        height: 3.5rem;
                      "
                      placeholder="Введите повод, форму, категорию или название "
                      rounded
                    ></v-text-field> -->
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
          <div class="d-flex flex-wrap"></div>
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
      isLoading: false,
      items: [],
      model: null,
      search: null,
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
        fetch('http://giftcity.kz:8001/api/v1/present/catalog')
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
      return this.$store.state.categories.name_category;
    },
    count() {
      if (this.sort_price) {
        this.sortPriceNav(this.sort_price);
      }
      return this.$store.state.categories.count_present;
    },
  },

  methods: {
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
.appends .v-icon.v-icon {
    color: orange;
}

</style>
