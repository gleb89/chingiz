<template>
  <v-container>
    <v-row justify="center">
      <!-- box-filterss -->
      <v-col class="bocc-filter" cols="12" lg="2">
        <div class="mobp d-none d-lg-block d-md-block" style="margin-top: 6rem">
          <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
          <nuxt-link style="color: #303030" to="/catalog/all_presents"
            >Каталог</nuxt-link
          >
        </div>

         <!-- <Mobfilter
          class="d-block d-lg-none"
          :selected="selected"
          :maxprice="maxprice"
          :minprice="minprice"
          :categories="categories"
          :presents="products"
          :onfilterslug="onfilterslug"
          :listproducts="listproducts"
          :filter_name="filter_name"
          :clickselect="clickselect"
          :ads_select="ads_select"
          :reason_present="reason_present"
          :search="search"
          :onReason="onReason"
          :form="form"
          :type_precent="type_precent"
        />  -->

        <!-- desc filter -->

        <Filters2
          class="d-none d-lg-block"
          :listproducts="listproducts"
          :pageData="pageData"
          :selected="selected"
          :maxprice="maxprice"
          :minprice="minprice"
          :categories="categories"
          :presents="products"
          :onfilterslug="onfilterslug"
          :filter_name="filter_name"
          :clickselect="clickselect"
          :ads_select="ads_select"
          :reason_present="reason_present"
          :search="search"
          :onReason="onReason"
          :form="form"
          :type_precent="type_precent"
        />
      </v-col>

      <!-- box-productsr -->
      <v-col cols="12" lg="10" id="box-products" class="box-products">
        
        <div class="d-none d-lg-block">
          <h2 v-scroll="onScroll" class="nemepresent">

          
              {{filter_name}} ({{ len_items }})
          </h2>
        </div>
        <div class="d-flex flex-wrap mt-6 mb-6">
          <v-row>
            <v-col cols="12" lg="8" md="8">
              <div style="flex-grow: 3; position: relative; width: 100%">
                <img class="searc-inp" style="" src="/search .png" alt="" />
<v-text-field
                  v-model="search"
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
        <v-container class="box-scrol">
          <v-row justify="start">
            <v-col
              cols="12"
              lg="12"
              md="12"
              style="min-height: 4em; position: relative"
            >
              <v-slide-group
                class="grop"
                v-if="categories_for_sub.length > 0"
                multiple
                show-arrows
              >
                <v-slide-item
                  v-for="sub in categories_for_sub"
                  :key="sub.id"
                  v-slot="{ active, toggle }"
                >
                  <v-btn
                    style="background: white;color: #505050;border: 1px solid #ff7a00;min-width:10em:padding:1em"
                    class="mx-2"
                    :input-value="sub_id.includes(sub.id)"
                    active-class="orange white--text"
                    depressed
                    rounded
                    @click="onPodSub(sub.id)"
                  >
                    <span style="font-size: 0.8em">{{
                      sub.name_subcategory
                    }}</span>
                  </v-btn>
                </v-slide-item>
              </v-slide-group>
            </v-col>

            <v-container>
              <div class="d-lg-none d-md-none d-block" style="width: 100%; text-align: end; position: relative">
                <v-btn
                @click="toTop"
                v-show="fab"
                  style="position: fixed; right: 3em; bottom: 7em; z-index: 1"
                  fab
                  dark
                  color="orange"
                >
                <fa style="font-size:1.4em" icon="angle-up"></fa>
                </v-btn>
              </div>
              <v-row class="mobile-hei" style="">
                <v-col
                  class="boxs-cardprod"
                  v-for="present in listproducts"
                  :key="present.id"
                  cols="12"
                  lg="6"
                  md="6"
                  sm="6"
                >
                  <div
                    style="
                      width: 98%;
                      justify-content: center;
                      display: flex;
                      max-width: 98%;
                      padding: 0.5em;
                    "
                  >
                    <CardProduct :present="present" />
                    
                  </div>
                </v-col>
                <div style="width:100%;text-align: center;" v-if="client && this.productsfetch.total > this.productsfetch.items.length" v-intersect="onIntersect">
                     <v-progress-circular
      indeterminate
      color="amber"
    ></v-progress-circular>
                </div>
              </v-row>
            </v-container>
          </v-row>
        </v-container>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  async asyncData({ route, $axios }) {
    const product_id = Number(route.params.id);
    let products = await $axios.get(
       `https://giftcity.kz/api/v1/present/catalog/paginations?page=1&size=20`
    );

    return { productsfetch: products.data};
  },
  async fetch({ store }) {

    if (store.getters["allfilter/allfilter"].length === 0) {
      await store.dispatch("allfilter/fetch");
    }
  },
  mounted: function () {
    setTimeout(() => {
      this.client = true
    }, 2000);
    // let self = this;
    // this.ws = new WebSocket("wss://giftcity.kz/ws/present/search");
    // this.ws.onmessage = (event) => {
    //   console.log("message");
    //   self.products = JSON.parse(event.data);
    // };
  },
  computed: {
    listproducts() {
      this.products = this.productsfetch.items
      this.len_items = this.productsfetch.total
      return this.products
        // this.ws.onopen;
        // this.ws.send(this.search);

    },
  },
  data() {
    return {
      age: null,
      sort_price: "",
      len_items:null,
      fab: false,
      client:false,
      ws: null,
      categories_for_sub: [],
      categories: this.$store.getters["allfilter/allfilter"].categories,
      reason_present:
        this.$store.getters["allfilter/allfilter"].reason_for_precent,
      products: this.$store.getters["products/products"],
      search: "",
      upd_serch: [],
      search_element: [],
      form_id: null,
      type_precent: [],
      form: this.$store.getters["allfilter/allfilter"].form_precent,
      maxprice: null,
      minprice: null,
      type_id: null,
      isIntersecting :false,
      pk_category:0,
      reason_pk:0,
      reason_id: null,
      list_products: [],
      filter_name:'Все подарки',
      categoriesfilter: [],
      selected: [],
      page: 1,
      sub_id: [],
    };
  },
  methods: {
    onScroll (e) {
      
      if (typeof window === 'undefined') return
      const top = window.pageYOffset ||   e.target.scrollTop || 0
      this.fab = top > 160
    },
    toTop () {
 this.$vuetify.goTo(0)
    },
        onIntersect (entries, observer) {
        // More information about these options
        // is located here: https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API
        this.isIntersecting = entries[0].isIntersecting
        if(this.isIntersecting ){
          if(this.filter_name === 'Все подарки'){
          this.pageData()
          }
          
          else{
            if(this.pk_category){
          this.pageDataCategory()
          }
          if(this.reason_pk){
          this.pageDataReason()
            
          }
        }
        }
        },
    onPodSub(sub_id) {
      this.form_id = null;
      this.search = "";
      if (this.sub_id.includes(sub_id)) {
        for (var i = 0; i < this.sub_id.length; i++) {
          if (this.sub_id[i] === Number(sub_id)) {
            this.sub_id.splice(i, 1);
          }
        }
        this.products = this.$store.getters["products/products"].filter(
          (elem) => {
            for (let i of elem.subcategory) {
              if (this.sub_id.includes(i.id)) {
                return elem;
              }
            }
          }
        );
      } else {
        this.sub_id.push(sub_id);
        this.products = this.$store.getters["products/products"].filter(
          (elem) => {
            for (let i of elem.subcategory) {
              if (this.sub_id.includes(i.id)) {
                return elem;
              }
            }
            // return elem.id === pk
          }
        );
      }
      if (this.sub_id.length === 0) {
        this.products = this.$store.getters["products/products"].filter(
          (elem) => {
            if (elem.category[0].name_category === this.filter_name) {
              for (let i of this.categories) {
                if (i.name_category === this.filter_name) {
                  this.categories_for_sub = i.subcategory;
                } else {
                }
              }
              return elem;
            }
          }
        );
      }
    },
    onresSearch(i) {
      this.search = i;
    },
    reasonsearch(elem) {
      for (let i of elem.reason_for_precent) {
        if (i.name_reason.toLowerCase().includes(this.search.toLowerCase())) {
          return elem;
        }
      }
    },
    onReason(pk, name_reason) {
      this.pk_category = 0
      this.page = 0
    this.client = false
      setTimeout(() => {
        this.client = true
      }, 1000);
       this.productsfetch.items = []
       this.reason_pk = pk
        this.filter_name = name_reason
        this.pageDataReason()
        
    },
    ads_select(minp, maxp, form_id, sort_price) {
      this.minprice = minp;
      this.maxprice = maxp;
      this.form_id = form_id;
      this.sort_price = sort_price;
    },
    minmaxPrice() {
      let list_price = [];
      for (let i of this.products) {
        list_price.push(Number(i.price));
      }
      return list_price;
    },
    clickselect() {
      this.search = "";
      this.filter_name = "";
      this.products = this.$store.getters["products/products"];
    },
    onsearch() {
      this.list_products.filter((elem) => {
        return elem.name_product
          .toLowerCase()
          .includes(this.search.toLowerCase());
      });
    },
    onfilterslug(slug, pk, name) {
      this.reason_pk = 0
      this.client = false
      setTimeout(() => {
        this.client = true
      }, 1000);
      this.pk_category = pk
      this.page = 0
      if(slug === 'all_presents'){
        this.productsfetch.items = []
        this.filter_name = 'Все подарки'
        this.pageData()    
      }else{
        
        this.productsfetch.items = []
        this.filter_name = name
        this.pageDataCategory()
        console.log(this.page);
      }
      
    },
    pageDataReason(){
      this.page = this.page +1
          console.log('page',this.page);
        this.$axios
        .$get(`https://giftcity.kz/api/v1/present/catalog/paginations/reason?pk=${this.reason_pk}&page=${this.page}&size=20`,{
          
        })
        .then((resp) => {
    console.log(resp.total);
          
          for (let i of resp.items){
            
            this.productsfetch.items.push(i)
          }
          
          this.page = resp.page
          this.productsfetch.total = resp.total
        })
        .catch(function (error) {
        console.log('error');
      });
    },
        pageDataCategory(){
          this.page = this.page +1
          console.log('page',this.page);
        this.$axios
        .$get(`https://giftcity.kz/api/v1/present/catalog/paginations/categories?pk=${this.pk_category}&page=${this.page}&size=20`,{
          
        })
        .then((resp) => {
    console.log(resp.total);
          
          for (let i of resp.items){
            
            this.productsfetch.items.push(i)
          }
          
          this.page = resp.page
          this.productsfetch.total = resp.total
        })
        .catch(function (error) {
        console.log('error');
      });
        
     },
          pageData(){
          this.page = this.page +1
          console.log(this.page);
        this.$axios
        .$get(`https://giftcity.kz/api/v1/present/catalog/paginations?page=${this.page}&size=20`,{
          
        })
        .then((resp) => {
          
          for (let i of resp.items){
            this.productsfetch.items.push(i)
          }
          
           this.page = resp.page
          this.productsfetch.total = resp.total
        })
        .catch(function (error) {
        console.log('error');
      });
        
     },
    onselectfilter() {
      this.form_id = null;
      this.search = "";
      if (this.selected.length === 1) {
        if (this.selected[0] === "availability") {
          this.list_products = this.list_products.filter((elem) => {
            return elem.availability === true;
          });
        }
        if (this.selected[0] === "stock") {
          this.list_products = this.list_products.filter((elem) => {
            return elem.stock === true;
          });
        }
      }
      if (this.selected.length === 2) {
        this.list_products = this.list_products.filter((elem) => {
          return elem.stock === true && elem.availability === true;
        });
      }
    },
  sortedProductForm() {
      this.search = "";
      this.products = this.$store.getters["products/products"].filter(
        (elem) => {
          if (elem.form_precent.length > 0) {
            return elem.form_precent[0].id === Number(this.form_id);
          }
        }
      );
    },
    sortedProductType() {
      this.list_products = this.list_products.filter((elem) => {
        return elem.type_precent[0].id === Number(this.type_id);
      });
    },
    sortedProductReason() {
      this.search = "";
      this.form_id = null;
      this.list_products = this.list_products.filter((elem) => {
        return elem.reason_for_precent.id === Number(this.reason_id);
      });
    },
  },
};
</script>

<style>
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