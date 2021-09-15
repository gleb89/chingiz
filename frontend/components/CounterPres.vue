<template>

</template>


<script>
export default {
    props:['count_present'],
    data () {
      return {
       count_pres:this.count_present
        
      }
    },
    computed: {
 count() {
    if(this.count_pres< 1){
        this.count_pres= 1
      }
      return this.count_pres
        },
    
    },

}
</script>