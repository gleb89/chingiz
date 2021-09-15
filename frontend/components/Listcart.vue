<template>
  <v-sheet
    class="mx-auto"
    
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
        v-for="present in listproducts"
        :key="present.id"
        v-slot="{ active, toggle }"
      >
<CardProduct :present="present"/>
      </v-slide-item>
    </v-slide-group>
  </v-sheet>
</template>

<script>
  export default {
    props:['listproducts'],
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