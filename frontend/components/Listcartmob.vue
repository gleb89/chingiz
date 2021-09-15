<template>
    <div id="box-cardmob" class="d-flex flex-nowrap  py-3">
        <div  v-for="present in listproducts" :key="present.id">
          <div class="startefect">
            {{onscr}}
          </div>
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
    computed: {
    onscr() {
      if (process.browser) {
        setTimeout(() => {
      var intersecti = new IntersectionObserver(function (entries) {
            if (entries[0].intersectionRatio <= 0) return;
            document.querySelector("#box-cardmob");
            document.querySelector("#box-cardmob").classList.add("listgroup1-dwizh");
            setTimeout(() => {
              document.querySelector("#box-cardmob").classList.remove("listgroup1-dwizh");
            }, 600);
            
          });
      intersecti.observe(document.querySelector(".startefect"));
        }, 1000);
      }
      },
    
    },
  }
</script>

<style >
    #box-cardmob{
        overflow-x: scroll;  
        transition-delay: .5s;
        transition: .5s linear .5s; 
    }
.listgroup1-dwizh{
  margin-left: 20rem;
  transition: .5s linear .5s; 
}
</style>