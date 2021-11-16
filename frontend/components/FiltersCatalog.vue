<template>
    <div style="margin-top: 4rem">
    <div @click="onfilterslugPage(0,'Все подарки')" class="box-filter">
      <img src="/fructs.png" alt="" /><span 
       :class="{ active: !$route.params.id && !$route.params.name}"
      
        >Все подарки 
      </span>
    </div>
    <hr style="color: #e5e5e5" />
    <div v-for="category in categories" :key="category.id">
      <div @click="onfilterslugPageF(category.id,category.name_category)" class="box-filter">
        <img style="max-height: 30px;max-width: 30px;min-width: 30px;" :src="category.icon" alt="" /><span
      
          :class="{ active: Number($route.params.name) === category.id && $route.path.includes('/catalog/category')}"
          >{{ category.name_category }} 
        </span>
      </div>
      <hr style="color: #e5e5e5" />
    </div>
    
      <div v-for="reason in reason_present" :key="'A'+reason.id">
      <div @click="onReasonF(reason.id,reason.name_reason)" class="box-filter">
        <img style="max-height: 30px;max-width: 30px;min-width: 30px;" :src="reason.icon" alt="" />
        
        <span
        :class="{ active: Number($route.params.name) === reason.id && $route.path.includes('/catalog/reason')}"
          >{{ reason.name_reason }} 
        </span>
      </div>
      <hr style="color: #e5e5e5" />
    </div> 

    <div style="margin-top: 2rem">
      <h3>Форма:</h3>
      <div class="mt-4">
        <v-checkbox
        @click="onFormF(n.id,n.name_form)"
          v-for="n in form"
          :key="n.id"
          style="height: 1.3rem; width: 20rem"
          color="orange"
          v-model="name_form"
          :label="`${n.name_form}`"
          :value="n.id"
        ></v-checkbox>
      </div>
    </div> 

    <div style="margin-top: 2rem">
      <h3>Цена</h3>
      <!-- forms-price-filter -->
      <div class="mt-4">
        <div>
          <span>от</span>
          <v-text-field
            v-model="minprice"
            style="width: 100%"
            type="number"
            single-line
            outlined
          ></v-text-field>
        </div>
        <div>
          <span>до</span>
          <v-text-field
            v-model="maxprice"
            style="width: 100%"
            type="number"
            single-line
            outlined
          ></v-text-field>
        </div>
      </div>

      <!-- form-check-filter -->


      <!-- button reset filters -->
      <div class="text-center mt-8">
        <v-btn
          @click="onReset"
          rounded
          color="#ff7a00"
          style="height: 39px; margin: 0.7rem"
          dark
        >
          <span style="font-size: 12px">сбросить фильтры</span>
        </v-btn>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props:['onReason','onfilterslugPage','onForm'],
computed: {
    categories() {
            if (this.minprice && this.maxprice) {
              this.$store.commit("products/setpresentsPrice",this.minprice); 
               this.$store.commit("products/setpresentsMaxs",this.maxprice); 
                
      }else{
        this.$store.commit("products/setpresentsPrice",0); 
        this.$store.commit("products/setpresentsMaxs",0); 
      }

        return this.$store.state.allfilter.allfilter.categories
    },
    reason_present(){
        return this.$store.state.allfilter.allfilter.reason_for_precent
    },
    form(){
        return this.$store.state.allfilter.allfilter.form_precent
    },


},
  data() {
    return {
      name_form:'',
      maxprice:null,
     minprice:null

    };
  },
  methods: {
    onFormF(n_id,n_name_form){
      this.onForm(n_id,n_name_form,1,this.name_form)
    },
    onfilterslugPageF(category_id,category_name_category){
      this.name_form = ''
      this.onfilterslugPage(category_id,category_name_category)
    },
    onReasonF(reason_id,reason_name_reason){
      this.name_form = ''
      this.onReason(reason_id,reason_name_reason)
    },
    onReset(){
      this.name_form = ''
      this.minprice = null
      this.maxprice = null
      this.$store.commit("products/setpresentsPrice",0 ,0); 
      this.onfilterslugPage(0,'Все подарки','')
    }
  },

}
</script>