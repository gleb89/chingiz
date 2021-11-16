<template>

                  <v-row class="mobile-hei" justify="center">
                  
            <v-col
              cols="12"
              lg="12"
              md="12"
              style="min-height: 4em; position: relative"
            >
              <v-slide-group
                class="grop"
                v-if="subcategory_data.subcategory"
                multiple
                show-arrows
              >
                <v-slide-item
                  v-for="sub in subcategory_data.subcategory"
                  :key="sub.id"
                  v-slot="{ active, toggle }"
                >
                  <v-btn
                    style="background: white;color: #505050;border: 1px solid #ff7a00;min-width:10em:padding:1em"
                    class="mx-2"
                    :input-value="sub_id.includes(sub.id)"
                    active-class="orange white--text"
                    depressed
                    rounded
                    @click="onPodSub(sub.id)"
                  >
                    <span style="font-size: 0.8em">{{
                      sub.name_subcategory
                    }}</span>
                  </v-btn>
                </v-slide-item>
              </v-slide-group>
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
    title: `подарок-${this.subcategory_data.name_category} (Нур-Султан,Алматы)` ,
    meta: [
      {
        hid: `подарок-${this.subcategory_data.name_category} (Нур-Султан,Алматы)`,
        name: 'description',
        content:
          `Купить подарок  ${this.subcategory_data.name_category} (Нур-Султан,Алматы)`,
      },
      {
        hid: `подарок   ${this.subcategory_data.name_category} (Нур-Султан,Алматы)`,
        name: 'keywords',
        content:
          `Подарок  ${this.subcategory_data.name_category} (Нур-Султан,Алматы)`,
      },
       {
          hid: 'og:image',
          property: 'og:image',
          content: `${this.subcategory_data.name_category} (Нур-Султан,Алматы)`
        },
        {
          hid: 'og:image:secure_url',
          property: 'og:image:secure_url',
          content: `${this.subcategory_data.name_category} (Нур-Султан,Алматы)`
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
    const categoru_id = route.params.name
    let products = await $axios.get(
       `/api/present/catalog/paginations/categories?id=${categoru_id}&page=1&size=20`
    );
    
    let subcategory_data = await $axios.get(
       `/api/present/categories/${categoru_id}`
    );  
    store.commit("categories/setcategoriesname", subcategory_data.data.name_category)
    products.data.items.sort(() => Math.random() - 0.5)
    return {subcategory_data:subcategory_data.data, productsfetch: products.data,categoru_id:categoru_id};
  },
 
 computed: {
    listproducts() {
        if(this.sub_id.length){ 
        var sub = this.$store.state.products.presents.filter(
          (elem) => {
            for (let i of elem.subcategory) {
              if (this.sub_id.includes(i.id)) {
                
                return elem;
              }
            }
           
          }

        );
      // this.len_items = sub.length
      // this.$store.commit("categories/setSizepresent",this.len_items); 
        return sub
        }
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
          subcategory:null,
          subcategories: this.$store.state.categories.subcategories,
          len_items:0,
          page:1,
          client:false,
          fab:false,
          sub_id: [],
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
        .$get( `/api/present/catalog/paginations/categories?id=${this.categoru_id}&page=${this.page}&size=20`,{
          
        })
        .then((resp) => {
          
          for (let i of resp.items){
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
      onPodSub(sub_id) {
        
      if (this.sub_id.includes(sub_id)) {
        for (var i = 0; i < this.sub_id.length; i++) {
          if (this.sub_id[i] === Number(sub_id)) {
            this.sub_id.splice(i, 1);
          }
        }
      } 
      else {
        this.sub_id.push(sub_id);
      }
      if (this.sub_id.length === 0) {
        // this.$store.state.products.presents.filter(
        //   (elem) => {
        //     if (elem.category[0].name_category === this.filter_name) {
        //       for (let i of this.categories) {
        //         if (i.name_category === this.filter_name) {
        //           this.categories_for_sub = i.subcategory;
        //         } else {
        //         }
        //       }
        //       return elem;
        //     }
        //   }
        // );
      }
      // this.products.sort(() => Math.random() - 0.5)
    },
  },

}
</script>