<template>
  <v-container>
    <v-row justify="center" style="margin-top:5rem">
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
          <div>
            <p>Состав корзины:</p>
            <p>{{product.composition}}</p>
          </div>
          <!-- card basket -->
          <div class="d-flex flex-wrap">
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
          <div>
        <v-btn
        @click="addBasket(product.id)"
        style="color:white;margin-top:.7rem"
        rounded
        color="#ff7a00"
        ><span v-if="reveal">в корзине</span> <span v-if="!reveal">купить</span>
        <img style="width: 1.5rem;cursor:pointer" src="/shopcart.png" alt="" />
        </v-btn>
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
              <div class="b1" style="text-align: center;margin-bottom:2rem">
 <v-btn
            @click="oncatalog()"
            rounded
            
            style="height: 39px; margin: 0.7rem;background: white;color: #505050;border: 2px solid #ff7a00;"
            dark
          >
            <span style="font-size: 12px;">перейти в каталог</span>
          </v-btn>
        </div>
    </div>
    <div class="mt-14">
      <Comments :comments_list="comments_list" :product_id="product_id" :add_comment="add_comment"/>
    </div>
  </v-container>
</template>

<script>
export default {
  async asyncData({ route, $axios }) {
    const product_id = Number(route.params.id);
    let product = await $axios.get(
       `present/${product_id}`
    );
    const comments = await $axios.get(
      `present/comments/all/${product_id}`
    );
    return { product: product.data,comments:comments.data,product_id};
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
    comments_list(){
      this.comments_all = this.comments
      return this.comments_all
    }
  },
  data() {
    return {
      products: this.$store.getters["products/products"],
      count_present:1,
      reveal:false,
      comments_all:[]
    };
  },
  methods: {
        oncatalog() {
      this.$router.push("/"+'catalog/Все_продукты');
    },
    add_comment(data){
      this.comments_all.push(data)
    },
    addBasket(present_id){
      let headers = {
        "Content-Type": "application/json"
      };
     if(this.$store.state.localStorage.uid_auth_user){
      let data = {
        'id_user':this.$store.state.localStorage.uid_auth_user,
        'precent_id':present_id
      }
        this.$axios
        .$post(`present/users/basket/user_basket/add`,data, {
          headers: headers,
        })
        .then((resp) => {
          console.log(resp);
          console.log(resp.basket_id);
          if(this.$store.state.localStorage.basket.id_basket > 0){
            this.$store.commit("localStorage/set_summBasket",Number(resp.summa));
          }
          else{
            this.$store.commit("localStorage/set_summBasket",Number(resp.summa));
            this.$store.commit("localStorage/set_idBasket",Number(resp.basket_id));
          }
          this.reveal = true
          this.count_present = this.count_present +1
          
          
        })
        .catch(function (error) {
          console.log(error);
        });
        
      }

      else{
      let data = {
        'id_basket':this.$store.state.localStorage.basket.id_basket,
        'precent_id':present_id
      }
      this.$axios
        .$post(`present/users/basket/anonim_basket/add`,data, {
          headers: headers,
        })
        .then((resp) => {
          console.log(resp.basket_id);
          if(this.$store.state.localStorage.basket.id_basket > 0){
            this.$store.commit("localStorage/set_summBasket",Number(resp.summa));
          }
          else{
            this.$store.commit("localStorage/set_summBasket",Number(resp.summa));
            this.$store.commit("localStorage/set_idBasket",Number(resp.basket_id));
          }
          this.reveal = true
          this.count_present = this.count_present +1
          
        })
        .catch(function (error) {
          console.log(error);
        });
        } 
    }
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