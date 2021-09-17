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
    left: -.9rem;
    
}
    
  .carsmob  .v-window__next {
    right: -.9rem;
   
}
}


</style>