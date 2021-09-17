<template>
<v-container>
  <v-row justify="center" style="position: relative;">
    <div class="next_prev">
      <v-btn text @click="prev"><img src="/L.png" alt=""></v-btn>
      <v-btn text @click="next"><img src="/R.png" alt=""></v-btn>
    </div>
  <v-col style="text-align: -moz-center;" cols="12" md="4" lg="4" v-for="present in listproducts.slice(start,end)" :key="present.id">
    <CardProduct :present="present"/>
  </v-col>
  </v-row>
</v-container>
</template>

<script>
  export default {
    props:['listproducts'],
    data: () => ({
      model: null,
      start:0,
      end:1
    }),
    methods: {
      prev() {
        if (this.start === 0){
            this.start = 5
            this.end = 6
        }
        else{
            this.start = this.start-1,
            this.end = this.end-1
        }

      },
      next(){
        if (this.end === 6){
            this.start = 0
            this.end = 1
        }
        else{
            this.start = this.start +1,
            this.end = this.end +1
        }
      }
    },
  }
</script>


<style >
  .next_prev{
position: absolute;
width: 100%;
display: flex;
z-index: 1;

justify-content: space-between;
top: 8rem;
  }
</style>