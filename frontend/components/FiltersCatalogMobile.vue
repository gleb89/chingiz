<template>
    <div>
         <v-container style="padding:1em">
    <v-row justify="center" style="margin-top:2rem">
 <v-col
      @click="onfilterslugPageMob(0,'Все подарки')" 
        class="box-cat rounded-lg text-center"
        
      >
        <img style="height: 30px;width: auto;" src="/g1.png" alt="" />
        <p class="text-center" style="font-size: .9rem;font-weight: bold;">
          Все категории
        </p>
      </v-col> 
                  <v-alert
              v-model="alertcat"
              style="position: fixed;z-index: 2;width: 90%;"
              color="orange"
              elevation="13"
              type="success"
              >Категория выбрана!</v-alert
            >
        <v-col
        class="box-cat rounded-lg text-center"
        @click="onfilterslugPageMob(category.id,category.name_category)"
        v-for="category in categories.slice(0,4)"
        :key="category.id"
      >
        <img style="height: 30px;width: auto;" :src="category.icon" alt="" />
        <p class="text-center" style="font-size: .9rem;font-weight: bold;">
          {{ category.name_category }}
        </p>
      </v-col> 

      <v-col
      class="box-cat rounded-lg text-center"
        v-for="reason in reason_present.slice(0,5)"
        :key="'A' + reason.id"
        @click="onReasonMob(reason.id,reason.name_reason)"
      >
        <img
          style="max-height: 30px;max-width: 30px;"
          :src="reason.icon"
          alt=""
        />
        <p class="text-center" style="font-size: .9rem;font-weight: bold;">
          {{ reason.name_reason }}
        </p>
      </v-col>
      <div @click="dialogcategory = true" style="width: 100%;text-align: center;
    margin-top:1em">
<a style="color:black;font-weight: 500;text-decoration: underline;">Больше категорий</a>
      </div>
            <v-dialog
        v-model="dialogcategory"
        fullscreen
        hide-overlay
        transition="dialog-bottom-transition"
      >
        <v-card>
          <v-toolbar dark color="orange">
            <v-btn icon dark @click="dialogcategory = false" >
              <v-icon>mdi-close</v-icon>
            </v-btn>
            <v-toolbar-title>Все категории</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items> </v-toolbar-items>
          </v-toolbar>
          <div style="margin-top: 4rem;padding: 1rem;">
            <v-alert
              v-model="alert"
              style="position: fixed;z-index: 2;width: 90%;"
              color="orange"
              elevation="13"
              type="success"
              >Фильтр применен</v-alert
            >
<v-row justify="center" style="margin-top:1rem">
        <v-col
        class="box-cat rounded-lg text-center"
       @click="onfilterslugPageMobDialog(category.id,category.name_category)"
        v-for="category in categories"
        :key="category.id"
      >
        <img style="height: 30px;width: auto;" :src="category.icon" alt="" />
        <p class="text-center" style="font-size: .9rem;font-weight: bold;">
          {{ category.name_category }}
        </p>
      </v-col> 

      <v-col
      class="box-cat rounded-lg text-center"
        v-for="reason in reason_present"
        :key="'A' + reason.id"
       @click="onReasonMobDialog(reason.id,reason.name_reason)"
      >
        <img
          style="max-height: 30px;max-width: 30px;"
          :src="reason.icon"
          alt=""
        />
        <p class="text-center" style="font-size: .9rem;font-weight: bold;">
          {{ reason.name_reason }}
        </p>
      </v-col>
</v-row>

           
          </div>
        </v-card>
      </v-dialog>
</v-row>
</v-container>
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
      alertcat:false,
      alert:false,
     minprice:null,
     dialogcategory:false,

    };
  },
  methods: {
onReasonMob(reason_id,reason_name_reason){
    this.onReason(reason_id,reason_name_reason)
    this.alertcat = true
    setTimeout(() => {
      this.alertcat =false
    }, 500)

        setTimeout(() => {
      this.$vuetify.goTo(550)
    }, 500)
    
},
onReasonMobDialog(reason_id,reason_name_reason){
    this.onReason(reason_id,reason_name_reason)
    this.dialogcategory = false
    this.alertcat = true
    setTimeout(() => {
      this.alertcat = false
    }, 500)
    setTimeout(() => {
      this.$vuetify.goTo(550)
    }, 500)
    
},
onfilterslugPageMobDialog(category_id,category_name_category){
  this.onfilterslugPage(category_id,category_name_category)
    this.dialogcategory = false
    this.alertcat = true
    setTimeout(() => {
      this.alertcat = false
    }, 500)
    setTimeout(() => {
      this.$vuetify.goTo(550)
    }, 500)
},
onfilterslugPageMob(category_id,category_name_category){
  this.onfilterslugPage(category_id,category_name_category)
    //       this.alert=false
    // this.dialogcategory = false
    this.alertcat = true
    setTimeout(() => {
      this.alertcat =false
    }, 500);
            setTimeout(() => {
      this.$vuetify.goTo(550)
    }, 500)
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
<style>
.active {
  color: #ff7a00;
}
.box-cat {
  background: #ff7a00;
  color: white;
  margin: 3px;
  max-width: 45%;
  min-width: 45%;
}
.mdi-close::before {
    content: "\F0156";
    color: white;
}
</style>