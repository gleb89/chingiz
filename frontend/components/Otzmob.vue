<template>
<div id="cars">
  <v-carousel :show-arrows="false" class="carsmob" height="400"  >
    <v-carousel-item  v-for="comment in 6" :key="comment.id">
      <v-container>
        <v-row justify="center" class="text-center">
          <v-col class="text-center d-flex justify-center b"  cols="12"    >
            <CardOtziv/>
          </v-col>
        </v-row>
      </v-container>
    </v-carousel-item>
  </v-carousel>
  </div>
</template>

<style >

.v-btn--icon.v-size--small .v-icon, .v-btn--fab.v-size--small .v-icon {
    height: 24px;
    color: #f67929;
    font-size: 24px;
    width: 24px;
}
#cars .v-carousel__controls {
    background: #f4f5f6;
}

</style>