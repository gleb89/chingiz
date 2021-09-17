<template>
  <v-app-bar
  id="app-fot"
      absolute
      color="white"
    >
      <v-btn  @click="drawerclick()" icon>
        <img style="width:23px" fluid src="/mobapp.png">
      </v-btn>

      <v-toolbar-title><v-img @click="onHome" src="/Logo.png"></v-img></v-toolbar-title>

      <v-spacer></v-spacer>

      <v-btn icon>
        <img style="width:23px" fluid src="/Telephone.png">
      </v-btn>

      <v-btn icon @click="onCatalog">
        <img style="width:23px" fluid src="/Search.png">
      </v-btn>

    </v-app-bar>
</template>

<script>
export default {
  props:['drawerclick'],
  methods: {
    onHome(){
      this.$router.push('/')
    },
    onCatalog(){
      this.$router.push("/"+'catalog/Все_продукты');
    }
  },
}
</script>

<style>

</style>