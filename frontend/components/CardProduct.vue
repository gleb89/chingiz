<template>
<v-hover v-slot="{ hover }">
  <v-card
    style="box-shadow: none;max-height:500px;position: relative;"
    class="ma-4"
    :class="{ 'on-hover': hover }"
    width="285"
    
  >
  <div style="text-align: start;" @click="onPageProduct(present.id,present.category[0].slug_category)">
    </div>
    <v-img  :src="present.image_precent" height="200px"></v-img>
    <div v-if="hover"  class="text-center" style="position:absolute;left: 5rem;top: 6rem;opacity:1;">
                    <v-btn
                    @click="onPageProduct(present.id,present.category[0].slug_category)"
                       style="color:white;opacity:1"
                        
                        color="#ff7a00"
                        >
                          подробнее
                        </v-btn>
    </div>
    <v-card-title >
      <h4 style="font-size: 0.9rem">{{present.name_precent}}</h4>
    </v-card-title>

    <v-card-subtitle >

    </v-card-subtitle>

    <v-card-actions class="d-flex justify-start">
      <div style="min-width: 40%;">
        <img v-if="reveal" src="/checbasket.png" alt="" />
        <span style="">{{present.price.toLocaleString()}} тг</span>
      </div>
      <div style="width: 50%; text-align: end">
        <v-btn
        @click="addBasket(present.id)"
        style="color:white"
        rounded
        color="#ff7a00"
        ><span v-if="reveal">в корзине</span> <span v-if="!reveal">купить</span>
        <img style="width: 1.5rem;cursor:pointer" src="/shopcart.png" alt="" />
        </v-btn>
        
        
      </div>
    </v-card-actions>
  </v-card>
  </v-hover>
</template>

<script>
export default {
  props:['present'],
  data: () => ({
    show: false,
    reveal: false,
    //  transparent: 'rgba(255, 255, 255, 0)',
   
  }),
  methods: {
    onPageProduct(id,name_slug) {
      this.$router.push(`/catalog/${name_slug}/present/${id}`)
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
          this.reveal =! this.reveal
          
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
  
.v-card {
  transition: opacity .4s ease-in-out;
  opacity: 0.5;
}

.v-card:not(.on-hover) {
  opacity: 1;
 }

.show-btns {
  color: rgb(26, 24, 24) !important;
}

</style>