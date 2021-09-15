<template>
    <div id="box-cardmob2" class="d-flex flex-nowrap  py-3">
        <div  v-for="present in 5" :key="present.id">
            <div class="startefect2">
            {{onscr}}
          </div>
            <CardOtziv/>
        </div>
    </div>
</template>

<script>
  export default {
    
    data: () => ({
      model: null,
    }),
    computed: {
    onscr() {
      if (process.browser) {
        setTimeout(() => {
      var intersecti = new IntersectionObserver(function (entries) {
            if (entries[0].intersectionRatio <= 0) return;
            document.querySelector("#box-cardmob2");
            document.querySelector("#box-cardmob2").classList.add("listgroup1-dwizh2");
            setTimeout(() => {
              document.querySelector("#box-cardmob2").classList.remove("listgroup1-dwizh2");
            }, 600);
            
          });
      intersecti.observe(document.querySelector(".startefect2"));
        }, 1000);
      }
      },
    
    },
  }
</script>

<style >
#box-cardmob2{
    overflow-x: scroll;  
    transition-delay: .5s;
    transition: .5s linear .5s; 
    }
.listgroup1-dwizh2{
  padding-left: 15rem;
  transition: .5s linear .5s; 
}
</style>