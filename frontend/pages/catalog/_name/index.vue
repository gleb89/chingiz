<template>
  <v-container>
    <v-row justify="center">
      <!-- box-filters -->
      <v-col class="bocc-filter" cols="12" lg="2">
        <div class="mobp " style="margin-top:6rem">
          <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
          <nuxt-link style="color: #303030" to="/catalog/Все_продукты"
            >Каталог</nuxt-link
          >/
          <span v-if="!filter_name" style="color: #222121a1">Все корзины</span>
          <span v-if="filter_name" style="color: #222121a1">{{ filter_name }}</span>
        </div>

        <Mobfilter 
            class="d-block d-lg-none"     
            :selected="selected"
            :maxprice="maxprice"
            :minprice="minprice"
            :categories="categories"
            :presents="products"
            :onfilterslug="onfilterslug"
            :filter_name="filter_name"
            :clickselect="clickselect"
            :listproducts="listproducts"
            :ads_select="ads_select"
            :form="form"
         />

        <!-- desc filter -->
            
            <Filters
            class="d-none d-lg-block"
            :selected="selected"
            :maxprice="maxprice"
            :minprice="minprice"
            :categories="categories"
            :presents="products"
            :onfilterslug="onfilterslug"
            :filter_name="filter_name"
            :clickselect="clickselect"
            :listproducts="listproducts"
            :ads_select="ads_select"
            :form="form"
            
            />
            
       
      </v-col>

      <!-- box-products -->
      <v-col cols="12" lg="10" class="box-products">
        <h2 >
          <span v-if="!filter_name && !search">Все корзины ({{ listproducts.length }})</span>
          <span v-if="filter_name && !search">
            {{ filter_name }} ({{ listproducts.length }})</span
          >
          <span v-if="search"
            >Результат поиска ({{ listproducts.length }})</span
          >
        </h2>
        <div class="d-flex flex-wrap mt-6 mb-6">
          <div style="flex-grow: 3; position: relative;width:100%">
            <img
              style="position: absolute; top: 2.2rem; z-index: 1; right: 1rem"
              src="/search .png"
              alt=""
            />

            <v-text-field
              v-model="search"
              style="border: 1px solid #989898; width: 100%; height: 3.5rem"
              placeholder="Например, яблоки"
              rounded
            ></v-text-field>
          </div>
          <div style="flex-grow: 1">
  
          </div>
        </div>
        <v-container class="box-scrol" >
          <v-row justify="center">
            <v-col
              class="boxs-cardprod"
              v-for="present in listproducts"
              :key="present.id"
              cols="12"
              lg="6"
              md="6"
              sm="6"
            >
            <div style="width:100%;justify-content: center;display: flex;">
              <CardProduct :present ="present " />
              </div>
            </v-col>
          </v-row>
        </v-container>
      </v-col>
    </v-row>

  </v-container>
</template>

<script>
export default {
  transition: "fade",
  asyncData({ $axios, route, error, $http }) {
    const headers = {
      "Content-Type": "application/json",
    };
    const name_slug = route.params.name;
    if (name_slug === "Все_продукты") {
      return $axios
        .$get(`present/`, {
          headers: headers,
        })
        .then((products) => {
          return { products, name_slug };
        });
    } else {
      return $axios
        .$get(
          `present/?slug_category=${encodeURIComponent(name_slug)}`,
          {
            headers: headers,
          }
        )
        .then((products) => {
          return { products, name_slug };
        });
    }
  },
  async fetch({ store }) {
    if (store.getters["categories/categories"].length === 0) {
      await store.dispatch("categories/fetch");
    }
      if (store.getters["form/form"].length === 0) {
      await store.dispatch("form/fetch");
    }
  },
  mounted: function () { 
    let self = this;
    this.ws = new WebSocket("ws://82.148.17.12:8080/ws/present/search");
    this.ws.onmessage = (event) => {
      console.log("message");
      self.list_products = JSON.parse(event.data);
    };
  },
  computed: {
    listproducts() {
      this.filter_name = this.name_slug_get();
      let self = this;
      if (this.search) {
        this.ws.onopen;
        this.ws.send(this.search);
      } else {
        this.list_products = this.products;
      }
      if (this.selected.length > 0) {
        this.onselectfilter();
      }
      if (this.maxprice && this.minprice) {
        this.sortedProductPrice();
      }
      if (this.form_id) {
        this.sortedProductForm();
      }
      if (this.type_id) {
        this.sortedProductType();
      }
      if (this.reason_id) {
        this.sortedProductReason();
      }
      
      return this.list_products;
    },
  },
  data() {
    return {
      age: null,
      ws: null,
      categories: this.$store.getters["categories/categories"],
      form: this.$store.getters["form/form"],
      search: "",
      maxprice: null,
      minprice: null,
      form_id: null,
      type_id: null,
      reason_id: null,
      list_products: [],
      filter_name: "",
      categoriesfilter: [],
      selected: [],
      page: 1,
    };
  },
  methods: {
    ads_select(list_s,maxp,minp,form_id,type_id,reason_id){  
      this.selected = list_s
      this.maxprice = maxp
      this.minprice = minp
      this.form_id = form_id
      this.type_id = type_id
      this.reason_id = reason_id
    },
    name_slug_get() {
      let cat;
      for (let i of this.categories) {
        if (i.slug_category === this.name_slug) {
          cat = i.name_category;
        }
      }
      return cat;
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
    },
    onsearch() {
      this.list_products.filter((elem) => {
        return elem.name_product
          .toLowerCase()
          .includes(this.search.toLowerCase());
      });
    },
    onfilterslug(slug) {
      this.$router.push("/catalog/" + slug);
    },
    onselectfilter() {
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
    sortedProductPrice() {
      this.list_products = this.list_products.filter((elem) => {
        return (
          elem.price >= Number(this.minprice) &&
          elem.price <= Number(this.maxprice)
        );
      });
    },
    sortedProductForm(){
       this.list_products = this.list_products.filter((elem) => {
        return (
          elem.form_precent[0].id === Number(this.form_id) 
        );
      });
    },
    sortedProductType(){
       this.list_products = this.list_products.filter((elem) => {
         
         
        return (
          elem.type_precent[0].id === Number(this.type_id) 
        );
      });
    },
    sortedProductReason(){
       this.list_products = this.list_products.filter((elem) => {
        return (
          elem.reason_for_precent[0].id === Number(this.reason_id) 
        );
      });
    }
  },
};
</script>

<style>
.active {
  color: #ff7a00;
}
.box-products h2{
  margin-top: 5.2rem;
}
@media (max-width:500px){
    .box-products h2{
  margin-top: 1rem;
}
  .mobp{
  margin-top: 4rem;
  }
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
@media (min-width: 500px) {
  .box-products {
    padding-left: 3rem;
  }

}
  .box-products{
  overflow-x: hidden;
  height: 100vh;
  }
    .bocc-filter{
  overflow-x: hidden;
  height: 100vh;
  }

::-webkit-scrollbar {display:none;}
  
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
</style>