<template>
  <v-sheet
    class="mx-auto"
    color="#F4F5F6"
    
  >
    <v-slide-group
      v-model="model"
      class="pa-0"
      slide-group-prev-basis="12px"
      active-class="success"
      show-arrows
      center-active
    >
      <v-slide-item
        v-for="i in 4"
        :key="i"
        v-slot="{ active, toggle }"
      >
        <CardOtziv/>
      </v-slide-item>
    </v-slide-group>
  </v-sheet>
</template>

<script>
  export default {
    data: () => ({
      model: null,
    }),
  }
</script>


<style >
@media (max-width:500px) {
    .v-slide-group__next, .v-slide-group__prev {
    min-width: 3px;
}
}

</style>