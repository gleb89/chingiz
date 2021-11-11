<template>
  <v-container>
    <v-row justify="center" style="margin-top:5rem">
                          <div @click="gopage" class=""
           style="background: whitesmoke;width: 100%;padding:1rem;color:#7C7C7C;cursor:pointer">
            <fa style="font-size: 1rem;" icon="chevron-left"></fa>
             <span style="margin-left:1rem">вернуться</span>
          </div>
      <!-- box-img tovar and name-->
      <v-col cols="12" lg="6" class="box-formob">
        <div>
          <!-- {{compreting}} -->


        </div>
        <h2 class="mt-6">{{ product.prevue_name }}</h2>
        <h2 class="">"{{ product.name_precent }}"</h2>
        <div style="position: relative">
          <v-img
            fluid
            :lazy-src="product.image_precent"
            max-height="500"
            max-width="500"
            :src="product.image_precent"
          ></v-img>
        </div>
      </v-col>

      <!-- box-text-tovar -->
      <v-col cols="12" lg="6">
        <div class="mt-14">
          <!-- rating/otziv -->
          <!-- articul id -->
          <div class="d-flex mt-4">
            <span class="ml-1">Артикул </span>
            <img class="mr-3 ml-4" src="/barcode.png" alt="" />
            <span>{{ product.id }}</span>
          </div>
          <div style="padding-top: 1rem;">
            <span style="font-weight: bold;"  class="ml-1">Цена: {{ product.price.toLocaleString() }} тг</span>
          </div>
          <!-- nalicie -->
          <div class="d-flex mt-4">
            <span style="font-weight: bold;" class="ml-1">Наличие</span>
            <v-img
              class="mr-3 ml-4 mt-1"
              fluid
              lazy-src="/nal.png"
              max-height="16"
              max-width="16"
              src="/nal.png"
            ></v-img>
            <span>есть в наличии</span>
          </div>
          <p v-if="product.body.length > 4"  class="ml-1 mt-3" style="font-weight: bold;">Описание:</p>
          <p  v-if="product.body.length > 4" class="ml-1 mt-1">
            
            {{product.body }}
          </p>
          <div v-if="product.composition" >
            <p style="font-weight: bold;margin-top:2em">Состав корзины:</p>
            <p v-for="(comp,index) in product.composition.split(/\d[.]+/g)" :key="index">
            <span style="font-weight: bold;" v-if="index">{{index}}.</span> {{comp}}
            </p>
          </div>
          <!-- card basket -->


        </div>
      </v-col>
    </v-row>


  </v-container>
</template>

<script>
export default {
    layout: "admin",
  async asyncData({ route, $axios }) {
    const product_id = Number(route.params.id);
    let product = await $axios.get(
       `http://giftcity.kz:8001/api/v1/present/${product_id}`
    );
    
    return { product: product.data};
  },
  computed: {},
  async fetch({ store }) {
    if (store.getters["products/products"].length === 0) {
      await store.dispatch("products/fetch");
    }
  },
  computed: {
    listproducts() {
      if(this.count_present < 0){
        this.count_present = 0
      }
      this.products = this.products.filter((elem) => {
        return (
          elem.category[0].name_category ===
          this.product.category[0].name_category
        );
      });
      return this.products;
    },

  },
  data() {
    return {
      products: this.$store.getters["products/products"],
      count_present:0,
      reveal:false,
      comments_all:[]
    };
  },
  methods: {
    gopage(){
      this.$router.go(-1);
    },


 
  },
};
</script>

<style >
@media (max-width:500px) {
    .box-formob{
    margin-top: 4rem;
  }
}

</style>