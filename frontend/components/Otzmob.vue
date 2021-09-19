<template>
  <v-carousel class="carsmob" height="400"  hide-delimiters style="position:relitative;">
    <v-carousel-item  v-for="comment in 9" :key="comment.id">
      <v-container>
        <v-row justify="center" class="text-center">
          <v-col class="text-center d-flex justify-center"  cols="12"    >
            <CardOtziv/>
          </v-col>
        </v-row>
      </v-container>
    </v-carousel-item>
  </v-carousel>
</template>

<style >

@media (max-width: 500px) {
  .carsmob  .v-window__prev {
    background: #FFFFFF;
    top: 85%;
    left: 7rem;
    
}
    
  .carsmob  .v-window__next {
    background: #FFFFFF;
    top: 85%;
    right: 7rem;
   
}
}


</style>