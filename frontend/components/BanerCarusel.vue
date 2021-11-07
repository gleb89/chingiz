<template>
  <v-carousel hide-delimiters style="position:relitative">
    <v-carousel-item v-for="(item, i) in stocks" :key="i" :src="item.image">
      <div class="box-text-carusel2">
        <h3 style="font-size:2.5rem;color:white">{{item.name_stock}}</h3>
        <p style="margin-top: 1rem;color:white;font-weight: 500;margin-top: 2em;">
          {{item.body_stock}}
        </p>
              <v-btn
              class="bn"
              @click="onCatalog"
            rounded
            color="#ff7a00"
            style="height: 39px;margin-bottom: 1.7rem;font-weight: bold;"
            dark
          >
            <span style="font-size: 12px">начать покупки</span>
          </v-btn>
          <p class="pv" style="font-size:0.7rem">
            {{item.conditions}}
          </p>
      </div>
    </v-carousel-item>
  </v-carousel>
</template>

<script>
export default {
  props:['stocks'],
  data() {
    return {
    };
  },
  methods: {
      onCatalog(){
      this.$router.push("/"+'catalog/all_presents');
    },
  },

};
</script>

<style scoped>
.v-window__prev {
background: white;
  
}
.v-window__next, .v-window__prev {
    background: rgba(0,0,0,.3);
    border-radius: 50%;
    position: absolute;
    margin: 0 16px;
    top: 50%;
    z-index: 1;
}
.box-text-carusel2{
 
    width: 100%;
    position: absolute;
    left: 0;
    height: 100%;
    padding-left: 4rem;
    top: 2em;

}
.bn{

    margin-top: 4rem;
}
.pv{
  margin-top: 11em;
}

@media (max-width: 560px) {
  .bn{

    margin-top: 0em;
}
.pv{
  margin-top: 1em;
}
}
</style>