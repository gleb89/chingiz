<template>
    <v-container style="margin-top:8rem">
         <div class="d-flex">
        <nuxt-link class="d-lg-block d-none" style="color: #303030" to="/">Главная/</nuxt-link> 
          <span class="d-lg-block d-none" style="color: #303030" 
            >Корзина</span 
          >
          </div>
        <div @click="gopage" class=""
           style="background: whitesmoke;width: 100%;padding:1rem;color:#7C7C7C;cursor:pointer">
            <fa style="font-size: 1rem;" icon="chevron-left"></fa>
             <span style="margin-left:1rem">Продолжить покупки</span>
          </div>
        <h4 style="margin-top:8rem" class="text-center" >Корзина еще пуста</h4>
    </v-container>
</template>


<script>
export default {
    methods: {
        gopage(){
      this.$router.go(-1);
    },
    },
}
</script>