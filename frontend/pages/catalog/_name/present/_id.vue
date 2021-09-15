<template>
  <v-container>
    <v-row justify="center">
      <!-- box-img tovar and name-->
      <v-col cols="12" lg="6" class="box-formob">
        <div>
          <!-- {{compreting}} -->
          <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
          <nuxt-link style="color: #303030" to="/catalog/Все_продукты"
            >Каталог</nuxt-link
          >/
          <span>{{ product.name_precent }}</span>
        </div>
        <h2 class="mt-6">{{ product.name_precent }}</h2>
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
            <span  class="ml-1">Цена: {{ product.price.toLocaleString() }} тг</span>
          </div>
          <!-- nalicie -->
          <div class="d-flex mt-4">
            <span class="ml-1">Наличие</span>
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
          <p class="ml-1 mt-3">
            {{product.body}}
          </p>
          <!-- card basket -->
          <div
            class="d-flex justify-start"
            style="
              width: 50%;
              height: 39px;
              margin-top: 0.7rem;
              margin-right: 1rem;
            "
          >
            <div style="flex-grow: 1; text-align: center; background: #f4f5f6">
              <v-btn block depressed @click="count_present-=1 "> - </v-btn>
            </div>
            <div
              style="
                flex-grow: 2;
                text-align: center;
                border: 1px solid whitesmoke;
              "
            >
              {{count_present}}
            </div>
            <div style="flex-grow: 1; text-align: center; background: #f4f5f6">
              <v-btn block depressed @click="count_present+=1"> + </v-btn>
            </div>
          </div>
          <div class="mt-14">
            <p>
              Внимание! Товар может отличаться по размеру и цвету от
              представленного на фото. Срочные заказы принимаются за сутки.
              Возможна замена 1-2х товаров в зависимости от наличия на складе.
            </p>
          </div>
        </div>
      </v-col>
    </v-row>
    <div class="mt-6">
      <h2>Похожие товары</h2>
      <Listcart class="d-lg-block d-none" :listproducts="listproducts" />
      <Listcartmob class="d-lg-none d-block" :listproducts="listproducts" />
    </div>
    <!-- <div class="mt-14">
      <Comments />
    </div> -->
  </v-container>
</template>

<script>
export default {
  asyncData({ $axios, route, error }) {
    const headers = {
      "Content-Type": "application/json",
    };
    const product_id = Number(route.params.id);
    return $axios
      .$get(`present/${product_id}`, {
        headers: headers,
      })
      .then((product) => {
        return { product };
      });
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
      count_present:1,
    };
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