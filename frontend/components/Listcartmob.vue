<template>
    <div id="box-cardmob" class="d-flex flex-nowrap  py-3">
        <div  v-for="present in listproducts" :key="present.id">
            <CardProduct :present="present"/>
        </div>
    </div>
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
    #box-cardmob{
        overflow-x: scroll; 
        
    }
</style>