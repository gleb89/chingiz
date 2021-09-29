<template>
      <v-card
    style="box-shadow: none;max-height:500px;position: relative;padding:1rem"
    
    width="400"
    
  >
  <div style="text-align: start;">
    </div>
    <div style="width:100%;text-align: center;">
    <img style="width:20rem" class="img"  :src="present.image_precent" >
    </div>
 
    <hr>
    <v-card-title style="height: 6em;">
      <h4 class="hh4" style="font-size: 0.9rem;text-align: center;">{{present.prevue_name}}</h4>
      <h4 class="hh4" style="font-size: 0.9rem;text-align: center;">"{{present.name_precent}}"</h4>
      <h4 class="hh4" style="font-size: 0.9rem;text-align: center;">Артикул подарка: {{present.id}}</h4>
    </v-card-title>

    <v-card-subtitle >

    </v-card-subtitle>

 
  </v-card>
</template>

<script>
export default {
    props:['present']
}
</script>