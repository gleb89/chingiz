<template>
    <div style="margin-top: 4rem">
    <div @click="onfilterslugPage(0,'Все подарки')" class="box-filter">
      <img src="/fructs.png" alt="" /><span 
       :class="{ active: !$route.params.name}"
      
        >Все подарки 
      </span>
    </div>
    <hr style="color: #e5e5e5" />
    <div v-for="category in categories" :key="category.id">
      <div @click="onfilterslugPage(category.id,category.name_category)" class="box-filter">
        <img style="max-height: 30px;max-width: 30px;min-width: 30px;" :src="category.icon" alt="" /><span
      
          :class="{ active: Number($route.params.name) === category.id}"
          >{{ category.name_category }}
        </span>
      </div>
      <hr style="color: #e5e5e5" />
    </div>
    
      <div v-for="reason in reason_present" :key="'A'+reason.id">
      <div @click="onReason(reason.id,reason.name_reason)" class="box-filter">
        <img style="max-height: 30px;max-width: 30px;min-width: 30px;" :src="reason.icon" alt="" />
        <span
        
          >{{ reason.name_reason }}
        </span>
      </div>
      <hr style="color: #e5e5e5" />
    </div> 

    <div style="margin-top: 2rem">
      <h3>Форма:</h3>
      <div class="mt-4">
        <v-checkbox
          v-for="n in form"
          :key="n.id"
          style="height: 1.3rem; width: 20rem"
          color="orange"
          
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
            
            style="width: 100%"
            type="number"
            single-line
            outlined
          ></v-text-field>
        </div>
        <div>
          <span>до</span>
          <v-text-field
            
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
computed: {
    categories() {
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

    };
  },
  methods: {
    onfilterslugPage(pk,name,cat_or_reason) {
      
      if(pk === 0){
        
        this.$router.push('/catalog')
      }
      else{
        this.$router.push('/catalog/category/'+pk)
      }
      this.$store.commit("categories/setcategoriesname",name); 
    },
    onReason(pk,name) {
      

        this.$router.push('/catalog/reason/'+pk)
     
      this.$store.commit("categories/setcategoriesname",name); 
    },
  },
}
</script>