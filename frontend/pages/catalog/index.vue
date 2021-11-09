<template>

                  <v-row class="mobile-hei">
                                     <v-col cols="12">
                      <Search/>
                    </v-col>
                <v-col
                  class="boxs-cardprod"
                  v-for="present in listproducts"
                  :key="present.id"
                  cols="12"
                  lg="6"
                  md="6"
                  sm="6"
                >
                  <div
                    style="
                      width: 98%;
                      justify-content: center;
                      display: flex;
                      max-width: 98%;
                      padding: 0.5em;
                    "
                  >
                    <CardProduct :present="present" />
                  </div>
                </v-col>
                  <div style="width:100%;text-align: center;" v-if="client && this.productsfetch.total > this.productsfetch.items.length"  v-intersect="onIntersect">
                     <v-progress-circular
                        indeterminate
                    color="amber"
                     ></v-progress-circular>
                </div>
              </v-row>
</template>

<script>
export default {
    layout: "catalog",

    async fetch({ store }) {
    if (store.getters["allfilter/allfilter"].length === 0) {
      await store.dispatch("allfilter/fetch");
    }
  },
 async asyncData({ route, $axios }) {
  
    let products1 = await $axios.get(
       `https://giftcity.kz/api/v1/present/catalog/paginations?page=1&size=40`
    );
    return { productsfetch: products1.data};
  },

 computed: {
    listproducts() {
         this.len_items = this.productsfetch.total
      this.$store.commit("categories/setSizepresent",this.len_items); 
      setTimeout(() => {
              this.products = this.productsfetch.items
   
      }, 100);
      return this.products
    },
  },
  data() {
      return {
          
          products: [],
          isIntersecting :false,
          len_items:0,
          page:1,
          client:false
      };
  },
    mounted: function () {
    setTimeout(() => {
      this.client = true
    }, 2000);

  },
  methods: {
        pageData(){
          this.page = this.page +1
          console.log(this.page);
        this.$axios
        .$get(`https://giftcity.kz/api/v1/present/catalog/paginations?page=${this.page}&size=40`,{
          
        })
        .then((resp) => {
          
          for (let i of resp.items){
            this.productsfetch.items.push(i)
          }
          
           this.page = resp.page
          this.productsfetch.total = resp.total
        })
        .catch(function (error) {
        console.log('error');
      });
        
     },
  onIntersect (entries, observer) {
        // More information about these options
        // is located here: https://developer.mozilla.org/en-US/docs/Web/API/Intersection_Observer_API
        this.isIntersecting = entries[0].isIntersecting
        if(this.isIntersecting ){
          this.pageData()
        }
        },
  },

}
</script>