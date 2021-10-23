<template>
<div id="cars">
  <v-carousel  :show-arrows="false" class="carsmob" height="400"  >
    <v-carousel-item  v-for="(comment,i) in comments_serv" :key="i">
            <CardOtziv :comment="comment"/>
    </v-carousel-item>
  </v-carousel>
  </div>
</template>
<script>
export default {
  props:['comments_serv']
}
</script>
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