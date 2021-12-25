<template>
  <v-container>
    <v-row justify="center" class="rrow" style="">
      
      <!-- box-img tovar and name-->
      <v-col cols="12" lg="6" class="box-formob">
        <div>
          <!-- {{compreting}} -->
          <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
          <nuxt-link style="color: #303030" to="/catalog"
            >Каталог</nuxt-link
          >/
          <span>{{ product.present.name_precent }} {{property}}</span>
        </div>
        <Goend/>
        <h2 class="namep mt-6" style="font-weight: 400;" >{{ product.present.prevue_name }}</h2>
        <h2 class="namep" style="font-weight: 900;" >"{{ product.present.name_precent }}"</h2>
        <div style="position: relative" class="mt-4">
          <v-img
          v-if="product.present.image_origin"
            fluid
            :lazy-src="product.present.image_precent"
            max-height="500"
            max-width="500"
            :src="product.present.image_origin"
          ></v-img>
                    <v-img
          v-if="!product.present.image_origin"
            fluid
            :lazy-src="product.present.image_precent"
            max-height="500"
            max-width="500"
            :src="product.present.image_precent"
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
            <span>{{ product.present.id }}</span>
          </div>
          <div style="padding-top: 1rem;">
            <span style="font-weight: bold;"  class="ml-1">Цена: {{ product.present.price.toLocaleString() }} тг</span>
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
          
          <p v-if="product.present.body.length > 4"  class="ml-1 mt-3" style="font-weight: bold;">Описание:</p>
          <p  v-if="product.present.body.length > 4" class="ml-1 mt-1">
            
            {{product.present.body }}
          </p>
                        <div v-if="product.present.composition">
                          <p class="ml-1 mt-7" style="font-weight: bold;font-size:1.3em">Состав:</p>
                    <p
                      v-for="(comp, index) in product.present.composition.split(/\d[.]+/g)"
                      :key="index"
                    >
                      <span style="font-weight: bold;" v-if="index"
                        >{{ index }}.</span
                      >
                      <span style="" v-if="['1','2','3','4','5','6','7','8','9'].includes(comp.charAt(comp.length - 1))" >{{ comp.slice(0,-1) }}</span>
                      <span style=""  v-if="!['1','2','3','4','5','6','7','8','9'].includes(comp.charAt(comp.length - 1))">{{ comp }}</span>
                      
                    </p>
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
        @click="addBasket(product.present.id)"
        style="color:white;margin-top:.7rem"
        rounded
        color="#ff7a00"
        ><span v-if="reveal">в корзине</span> <span v-if="!reveal">купить</span>
        <img style="width: 1.5rem;cursor:pointer" src="/shopcart.png" alt="" />
        </v-btn>
          </div>
          </div>
          <div class="mt-14">
            <div>
<span style="font-weight: 500;
    ">Внимание!</span>  <br> <p style="margin-top: 1.4em;font-size: .8em;"><span v-if="onCa(product.present.category)">Возможна замена одного или нескольких элементов на равнозначный, в зависимости от наличия на складе.</span> 
Заказы принятые до 17.00 доставляются день-в-день, в ином случае на следующий день ! Минимальное время заказа до доставки: за 2 часа.

</p>
<p>Хороших покупок! Подарки в каждый дом!</p>
            </div>
            <p></p>
          </div>
        </div>
      </v-col>
    </v-row>
    <div class="mt-6">
      <h2>Похожие товары</h2>
        <Listcart class="d-lg-block d-none" :listproducts="product.edit_presents" />
        <CaruselProduct class="d-lg-none d-block" :listproducts="product.edit_presents" />
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
      <Comments :comments_list="product.comments" :product_id="product_id" :add_comment="add_comment"/> 
    </div>
  </v-container>
</template>

<script>
export default {
  
    head() {
      return {
    title: `Подарок-${this.product.present.name_precent} (Нур-Султан,Алматы)`,
    meta: [
      {
        hid: `подарок-${this.product.present.id} (Нур-Султан,Алматы)`,
        name: 'description',
        content:
          `Купить ${this.product.present.name_precent},${this.product.body} (Нур-Султан,Алматы)`,
      },
      {
        hid: `подарок-${this.product.present.name_precent} (Нур-Султан,Алматы)`,
        name: 'keywords',
        content:
          `Подарок на праздник ${this.product.present.name_precent},${this.product.body} (Нур-Султан,Алматы)`,
      },
       {
          hid: 'og:image',
          property: 'og:image',
          content: `${this.product.present.image_precent}`
        },
        {
          hid: 'og:image:secure_url',
          property: 'og:image:secure_url',
          content: `${this.product.present.image_precent}`
        },
        {
          hid: 'og:image:alt',
          property: 'og:image:alt',
          content: 'GIFTCITY'
        }
     
    ],
    }
    },
  async asyncData({ route, $axios }) {
    const product_id = Number(route.params.id);
    let product = await $axios.get(
       `/api/present/forsite/${product_id}`
    );

    return { product: product.data,product_id};
  },
  computed: {
     property() {
      if(this.count_present < 0){
        this.count_present = 0
      }
    },
  },

 

  data() {
    return {
     
      count_present:0,
      reveal:false,
      comments_all:[]
    };
  },
  methods: {
    onCa(cat){
      let tt = []
      for(let i of cat){
        if(i.slug_category === "Подарочныекорзины" || i.slug_category === "Подарочныебоксы"){
          tt.push(1)
        }
      }
      return tt.length
    },
        oncatalog() {
      this.$router.push("/"+'catalog');
    },
    add_comment(data){
      this.comments_all.push(data)
    },
    addBasket(present_id){
      let headers = {
        "Content-Type": "application/json"
      };
     if(this.$store.state.localStorage.uid_auth_user){
       if(!this.reveal){
         if (this.count_present === 0){
           this.count_present = 1
         }
          if (this.count_present > 0){
           this.count_present = this.count_present 
         }
      let data = {
        'id_user':this.$store.state.localStorage.uid_auth_user,
        'precent_id':present_id
      }
        this.$axios
        .$post(`/api/present/users/basket/user_basket/add/${this.count_present}`,data, {
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
          
          
          
        })
        .catch(function (error) {
          console.log(error);
        });
        
      }
      else{
        this.$router.push('/cabinet/basket')
      }
     }
      else{
        

      if(!this.reveal){
              let data = {
        'id_basket':this.$store.state.localStorage.basket.id_basket,
        'precent_id':present_id
      }
          if (this.count_present === 0){
           this.count_present = 1
         }
          if (this.count_present > 0){
           this.count_present = this.count_present 
         }
      this.$axios
        .$post(`/api/present/users/basket/anonim_basket/add/${this.count_present}`,data, {
          headers: headers,
        })
        .then((resp) => {
          console.log(11111,resp.basket_id);
          if(this.$store.state.localStorage.basket.id_basket > 0){
            this.$store.commit("localStorage/set_summBasket",Number(resp.summa));
          }
          else{
            this.$store.commit("localStorage/set_summBasket",Number(resp.summa));
            this.$store.commit("localStorage/set_idBasket",Number(resp.basket_id));
          }
          this.reveal = true
          
          
        })
        .catch(function (error) {
          console.log(error);
        });
        }
        else{
          this.$router.push('/basket/'+this.$store.state.localStorage.basket.id_basket)
        }
        } 
    }
  },
};
</script>

<style >
.namep{
    max-width: 50%;
    text-align: center;
    
}
.rrow{
  margin-top:5rem
}
@media (max-width:500px) {
    .box-formob{
    margin-top: 4rem;
  }
  .rrow{
  margin-top:2rem
}
  .namep{
    max-width: 100%;
    text-align: left;
    
}
}

</style>