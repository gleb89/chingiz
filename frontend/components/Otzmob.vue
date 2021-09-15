<template>
    <div id="box-cardmob" class="d-flex flex-nowrap  py-3">
        <div  v-for="present in 5" :key="present.id">
            <CardOtziv/>
        </div>
    </div>
</template>

<script>
  export default {
    
    data: () => ({
      model: null,
    }),
  }
</script>

<style >
    #box-cardmob{
        overflow-x: scroll; 
        
    }
</style>