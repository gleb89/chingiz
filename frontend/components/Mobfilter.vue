<template>
  <div>
    <v-row justify="center" style="margin-top:1rem">
    </v-row>
    <v-container style="padding:1em">
    <v-row justify="center" style="margin-top:2rem">
 <v-col
         @click="
          onfilterslugmob(
            'all_presents',
          )
        "
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
        @click="
          onfilterslugmob(
            category.slug_category,
            category.id,
            category.name_category
          )
        "
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
        @click="onReasonmob(reason.id, reason.name_reason)"
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
      
</v-row>
</v-container>
    <v-row justify="center">
      
      {{selected_list}}
      
      <v-col>
        <div>
          
          <h2 class="text-left mt-8">
          <span v-if="!filter_name && !search">Все подарки </span>
          <span v-if="filter_name && !search">
            {{ filter_name }}</span
          >
          <span v-if="search"
            >Результат поиска</span
          >
          </h2>

        </div>
      </v-col>
      
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
        @click="
          onfilterslugmob(
            category.slug_category,
            category.id,
            category.name_category
          )
        "
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
        @click="onReasonmob(reason.id, reason.name_reason)"
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
      <v-dialog
        v-model="dialog"
        fullscreen
        hide-overlay
        transition="dialog-bottom-transition"
      >
        <template v-slot:activator="{ on, attrs }">
          <div
            style="width:100%;background: #F4F5F6;padding-left:.5rem;align-items: center;"
            class="d-flex"
          >
            <div class="ned">
              <v-select
                style="margin-top:1rem"
                :items="['сначала недорогие','более дорогие']"
                solo
                dense
                v-model="sort_price"
                :label="sort_price ||'сначала недорогие'"
              ></v-select>
            </div>

            <div>
              <v-btn v-bind="attrs" v-on="on" color="indigo" text>
                <span style="color:#676767">Фильтры</span>
                <img src="/filter.png" alt="" />
              </v-btn>
            </div>

          </div>
 
        </template>
        
        <v-card class="open" style="">
          <v-toolbar dark color="orange">
            <v-btn icon dark @click="dialog = false">
              <v-icon>mdi-close</v-icon>
            </v-btn>
            <v-toolbar-title>Фильтры</v-toolbar-title>
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

            <div style="margin-top: 2rem">
              <h3>Форма:</h3>
              <div class="mt-4">
                <v-checkbox
                @click="onalert()"
                  v-for="n in form"
                  :key="n.id"
                  style="height: 1.3rem; width: 20rem"
                  color="orange"
                  v-model="form_id"
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
                    v-model="minp"
                    style="width: 100%"
                    type="number"
                    single-line
                    outlined
                  ></v-text-field>
                </div>
                <div>
                  <span>до</span>
                  <v-text-field
                    v-model="maxp"
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
                  @click="resetfilters()"
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
        </v-card>
      </v-dialog>
    <!-- <div style="width:100%;text-align: left;   padding-left: 1em;
    padding-top: .5em;">
    <v-btn
       style="background: #fb8c00;;color: white;"
          class="mx-2"
          
          depressed
          rounded
          @click="dialogcategory = true" 
        >
        <span style="font-size:.8em">Выбрать категорию</span>
          
        </v-btn>

            </div> -->
    </v-row>
 
  </div>
</template>

<script>
export default {
  props: [
    "selected",
    "maxprice",
    "minprice",
    "categories",
    "presents",
    "onfilterslug",
    "listproducts",
    "filter_name",
    "clickselect",
    "ads_select",
    "reason_present",
    "onReason",
    "form",
    "search",
    "type_precent",
    
  ],

  data() {
    return {
      alert: false,
      sort_price:null,
      dialog: false,
      dialogcategory:false,
      selected_list1: [],
      alertcat:false,
      maxp: null,
      minp: null,
      form_id: null,
      type_id: null,
      reason_id: null
    };
  },
  computed: {
    selected_list() {
    
      this.ads_select(this.minp, this.maxp, this.form_id,this.sort_price);
    }
  },

  methods: {
  onfilterslugmob(slug_category,id,name_category){
    this.onfilterslug(slug_category,id,name_category)
    this.alertcat = true
    setTimeout(() => {
      this.alertcat =false
    }, 1000);
    this.$vuetify.goTo(750)
    this.dialogcategory = false
  },
  onReasonmob(id, name_reason){
    this.onReason(id, name_reason)
        this.alertcat = true
    setTimeout(() => {
      this.alertcat =false
    }, 1000);
    this.$vuetify.goTo(750)
    this.dialogcategory = false
  },
    onalert() {
      this.alert = true;
      setTimeout(() => {
        this.alert = false;
      }, 1000);
    },
    resetfilters() {
      this.clickselect();
      this.dialog = false;
      this.minp = null;
      this.maxp = null;
      this.form_id = null;
      this.type_id = null;
      this.reason_id = null;
    },
    minmaxPrice() {
      let list_price = [];
      for (let i of this.presents) {
        list_price.push(Number(i.price));
      }
      return list_price;
    }
  }
};
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
