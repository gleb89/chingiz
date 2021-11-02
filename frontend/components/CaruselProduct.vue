<template>
  <v-carousel  hide-delimiters style="position:relitative">
    <v-carousel-item v-for="(present, i) in listproducts" :key="i" >
      <CardCar :present="present"/>
    </v-carousel-item>
  </v-carousel>
</template>

<script>
export default {
    props:['listproducts'],
  data() {
    return {
  
    };
  },
  methods: {
      onCatalog(){
      this.$router.push("/"+'catalog/Все_продукты');
    },
  },

};
</script>

<style>
.v-window__next {
  background: #FFFFFF;
  border-radius: 50%;
  position: absolute;
  margin: 0 16px;
  top: calc(50% - 20px);
  z-index: 1;
  right: 0;
}
.box-text-carusel{
  /* background: aliceblue; */
  width: 100%;
  position: absolute;
  left: 0;
  height: 100%;
  padding-left: 4rem;
  top: 10rem;

}
.v-responsive__content {
    flex: 1 0 0px;
    max-width: 100%;
    display: flex;
    justify-content: center;
}
</style>