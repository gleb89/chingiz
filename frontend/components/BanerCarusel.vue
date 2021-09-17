<template>
  <v-carousel hide-delimiters style="position:relitative">
    <v-carousel-item v-for="(item, i) in items" :key="i" :src="item.src">
      <div class="box-text-carusel">
        <h3 style="font-size:2.5rem">Акция 
на день учителя*</h3>
        <p style="margin-top: 1rem;">
          Закажите оригинальный букет с бесплатной доставкой!
        </p>
              <v-btn
              @click="onCatalog"
            rounded
            color="#ff7a00"
            style="height: 39px; margin-top: 1rem;margin-bottom: 1.7rem;font-weight: bold;"
            dark
          >
            <span style="font-size: 12px">начать покупки</span>
          </v-btn>
          <p style="font-size:0.7rem">
            * Акция действует весь сентябрь. При покупке от 10 000 тг.
          </p>
      </div>
    </v-carousel-item>
  </v-carousel>
</template>

<script>
export default {
  data() {
    return {
      items: [
        {
          src: "slide1.png",
        },
        {
          src: "https://cdn.vuetifyjs.com/images/carousel/sky.jpg",
        },
        {
          src: "https://cdn.vuetifyjs.com/images/carousel/bird.jpg",
        },
        {
          src: "https://cdn.vuetifyjs.com/images/carousel/planet.jpg",
        },
      ],
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
  background: rgba(0, 0, 0, 0.3);
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
</style>