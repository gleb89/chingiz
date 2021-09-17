<template>
  <v-carousel class="cars" height="600"  hide-delimiters style="position:relitative;">
    <v-carousel-item  >
      <v-container>
        <v-row justify="center" class="text-center">
          <v-col class="text-center d-flex justify-center"  cols="4"  md="4" lg="4"  v-for="present in listproducts.slice(0, 3)" :key="present.id">
            <CardProduct :present="present"/>
          </v-col>
        </v-row>
      </v-container>
    </v-carousel-item>

     <v-carousel-item  >
      <v-container>
        <v-row justify="center" class="text-center">
          <v-col class="text-center d-flex justify-center" cols="4"  md="4" lg="4"  v-for="present in listproducts.slice(3, 6)" :key="present.id">
            <CardProduct :present="present"/>
          </v-col>
        </v-row>
      </v-container>
    </v-carousel-item>

     <v-carousel-item  >
      <v-container>
        <v-row justify="center" class="text-center">
          <v-col class="text-center d-flex justify-center" cols="4"  md="4" lg="4"  v-for="present in listproducts.slice(6, 9)" :key="present.id">
            <CardProduct :present="present"/>
          </v-col>
        </v-row>
      </v-container>
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
.theme--dark.v-btn.v-btn--icon {
    color: #424242;
}
.v-window__next {
  background: #FFFFFF;
box-shadow: -1px 0px 7px #80808087;
}

.v-window__prev{
  background: #FFFFFF;
  box-shadow: 2px 2px 2px gray;
  box-shadow: -1px 0px 7px #80808087;
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

<script>
  export default {
    props:['listproducts'],
    data: () => ({
      model: null,
      start:0,
      end:3
    }),
    methods: {
      prev() {
        if (this.start === 0){
            this.start = 3
            this.end = 6
        }
        else{
            this.start = this.start-3,
            this.end = this.end-3
        }

      },
      next(){
        if (this.end === 6){
            this.start = 0
            this.end = 3
        }
        else{
            this.start = this.start +3,
            this.end = this.end +3
        }
      }
    },
  }
</script>


<style >
  .next_prev{
position: absolute;
width: 100%;
display: flex;
z-index: 1;

justify-content: space-between;
top: 18rem;
  }
</style>