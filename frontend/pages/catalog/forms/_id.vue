<template>

                  <v-row class="mobile-hei" justify="center">
         
                <v-col
                  class="boxs-cardprod"
                  v-for="present in listproducts"
                  :key="present.id"
                  cols="12"
                  lg="6"
                  md="6"
                  sm="6"
                >
                <div class="" style="width: 100%; text-align: end; position: relative">
                <v-btn
                @click="toTop"
                v-show="fab"
                  style="position: fixed; right: 3em; bottom: 7em; z-index: 1"
                  fab
                  dark
                  color="orange"
                >
                <fa style="font-size:1.4em" icon="angle-up"></fa>
                </v-btn>
              </div>
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
                  <div style="width: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 40vh;"
                v-if="client && productsfetch.total > $store.state.products.presents.length" >
                     <v-progress-circular
                      v-intersect="onIntersect"
                        indeterminate
                    color="amber"
                     ></v-progress-circular>
                </div>
              </v-row>
</template>

<script>
export default {
    head() {
      return {
    title: `Подарки на праздник  с формой  ${this.forms.name_form}` ,
    meta: [
      {
        hid: `Подарки на праздник  с формой  ${this.forms.name_form}`,
        name: 'description',
        content:
          `Подарки на праздник с формой  ${this.forms.name_form} (Нур-Султан,Алматы)`,
      },
      {
        hid: `Подарки на праздник  с формой  ${this.forms.name_form} (Нур-Султан,Алматы)`,
        name: 'keywords',
        content:
          `Подарки  на праздник  с формой  ${this.forms.name_form} (Нур-Султан,Алматы)`,
      },
       {
          hid: 'og:image',
          property: 'og:image',
          content: `Подарки  на праздник  с формой  ${this.forms.name_form} (Нур-Султан,Алматы)`
        },
        {
          hid: 'og:image:secure_url',
          property: 'og:image:secure_url',
          content: `Подарки  на праздник  с формой  ${this.forms.name_form}  (Нур-Султан,Алматы)`
        },
        {
          hid: 'og:image:alt',
          property: 'og:image:alt',
          content: 'GIFTCITY'
        }
     
    ],
    }
    },
   transition: 'bounce',
    layout: "catalog",

    async fetch({ store }) {
    if (store.getters["allfilter/allfilter"].length === 0) {
      await store.dispatch("allfilter/fetch");
    }
  },
 async asyncData({ route, $axios,store }) {
    const form_id = Number(route.params.id)
    let products = await $axios.get(
       `/api/present/catalog/paginations/form?pk=${form_id}&page=1&size=20`
    );
    let forms = await $axios.get(
       `/api/present/form_product/${form_id}`
    );
    store.commit("categories/setcategoriesname", forms.data.name_form);
    products.data.items.sort(() => Math.random() - 0.5)
    return { productsfetch: products.data,form_id:form_id,forms:forms.data};
  },
  
 computed: {
     listproducts() {

      if(this.$store.state.products.price_min && this.$store.state.products.maxs){
        var arrs =  this.$store.state.products.presents.filter(
          (elem) => {
            
            return (
              
              elem.price >= Number(this.$store.state.products.price_min) &&
              elem.price <= Number(this.$store.state.products.maxs)
            );
          }
        );
      this.len_items = arrs.length
      this.$store.commit("categories/setSizepresent",this.len_items); 
        return arrs
        
      }

      else{
      this.len_items = this.productsfetch.total
      this.$store.commit("categories/setSizepresent",this.len_items); 
      this.$store.commit("products/setpresents",this.productsfetch.items); 
  
    this.products = this.$store.state.products.presents

        return this.products
    }
      }  
  },

  data() {
      return {
          
          products: [],
          isIntersecting :false,
          len_items:0,
          page:1,
          client:false,
          fab:false
      };
  },
    mounted: function () {
    setTimeout(() => {
      this.client = true
    }, 2000);
  

  },
  methods: {
      onScroll (e) {
      
      if (typeof window === 'undefined') return
      const top = window.pageYOffset ||   e.target.scrollTop || 0
      this.fab = top > 160
    },
    toTop () {
 this.$vuetify.goTo(0)
    },
        pageData(){
          this.page = this.page +1
          console.log(this.page);
        this.$axios
        .$get( `/api/present/catalog/paginations/form?pk=${this.form_id}&page=${this.page}&size=20`,{
          
        })
        .then((resp) => {
          
          for (let i of resp.items){
            // this.productsfetch.items.push(i)
            this.$store.commit("products/setpresentspush",i); 
          }
          console.log('tt',this.$store.state.products.presents.length);
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