<template>
  <v-carousel id="cars" height="400"  hide-delimiters style="position:relitative;">
   
    <v-carousel-item  >
      <v-container>
        <v-row justify="center" class="text-center">
          <v-col class="text-center d-flex justify-center"  cols="12"  md="4" lg="4"  v-for="comment in 3" :key="comment.id">
            <CardOtziv/>
          </v-col>
        </v-row>
      </v-container>
    </v-carousel-item>

     <v-carousel-item  >
      <v-container>
        <v-row justify="center" class="text-center">
          <v-col class="text-center d-flex justify-center"  cols="12"  md="4" lg="4"  v-for="comment in 3" :key="comment.id">
            <CardOtziv/>
          </v-col>
        </v-row>
      </v-container>
    </v-carousel-item>

     <v-carousel-item  >
      <v-container>
        <v-row justify="center" class="text-center">
           <v-col class="text-center d-flex justify-center"  cols="12"  md="4" lg="4"  v-for="comment in 3" :key="comment.id">
            <CardOtziv/>
          </v-col>
        </v-row>
      </v-container>
    </v-carousel-item>
  </v-carousel>
</template>

<style scoped>
.v-window__next {
    background: rgba(0,0,0,.3);
    border-radius: 50%;
    position: absolute;
    margin: 0 16px;
    top: 30%;
    z-index: 1;
}
.v-window__prev {
    background: rgba(0,0,0,.3);
    border-radius: 50%;
    position: absolute;
    margin: 0 16px;
    top: 30%;
    z-index: 1;
}
</style>