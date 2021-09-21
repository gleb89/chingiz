<template>
  <v-carousel :show-arrows="false" class="carsmob" height="400"  >
    <v-carousel-item  v-for="comment in 6" :key="comment.id">
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

.v-btn--icon.v-size--small .v-icon, .v-btn--fab.v-size--small .v-icon {
    height: 24px;
    color: #f67929;
    font-size: 24px;
    width: 24px;
}
.v-carousel__controls {
    background: rgba(244, 237, 237, 0.3);
}

</style>