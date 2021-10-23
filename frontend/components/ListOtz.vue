<template>
  <v-carousel  id="cars" height="400"  hide-delimiters style="position:relitative;">
  
    <v-carousel-item v-for="i in Math.ceil(comments_serv.length/3)" :key="i">
      <v-container style="">
        <v-row justify="center" class="text-center">
          <v-col class="text-center d-flex justify-center"  cols="12"  md="4" lg="4" v-for="comment in comments_serv.slice(indNol(i),indEnd(i))" :key="comment.id">
           
            <CardOtziv :comment="comment"/>
            
          </v-col>
        </v-row>
      </v-container>
    </v-carousel-item>
  
  </v-carousel>
</template>

<script>
export default {
  props:['comments_serv'],
  data() {
    return {
      ind_nol: 0,
      ind_end:3
    };
  },
  methods: {
  indNol(i){
    if(i ===1){
      return 0
    }
    else{
      return (i*3)-3
    }
  },
  indEnd(i){
      if(i ===1){
      return 3
    }
    else{
      return i*3
    }
    
    return 
  }
  },
}
</script>
<style scoped>

</style>