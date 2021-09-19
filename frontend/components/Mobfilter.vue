<template>
<div>
  <v-row justify="center" style="margin-top:1rem">
    <v-col class="box-cat rounded-lg text-center" @click="onfilterslug('Все_продукты')" cols="6">
      <img src="/mobca.png" alt="" /><p
      class="text-center"
      style="font-size: .9rem;font-weight: bold;"
        >Все корзины
        {{ selected_list }}
      </p>
      </v-col>
  
    <v-col class="box-cat rounded-lg text-center" @click="onfilterslug(category.slug_category)" v-for="category in categories" :key="category.id">
        <img src="/mobca.png" alt="" /><p
          class="text-center"
          style="font-size: .9rem;font-weight: bold;"
          >{{ category.name_category }}
        </p>
      
     </v-col>
    
  </v-row>
    <v-row justify="center">
    <v-col>
              <div>
          <h2 class="text-left mt-5">
          <span  v-if="!filter_name && !search">Подарочные корзины({{ listproducts.length }})</span>
          <span v-if="filter_name && !search">
            {{ filter_name }} ({{ listproducts.length }})</span
          >
          <span v-if="search"
            >Результат поиска ({{ listproducts.length }})</span
          >
        </h2>
        </div>
    </v-col>
    <v-dialog
      v-model="dialog"
      fullscreen
      hide-overlay
      transition="dialog-bottom-transition"
    >
      <template v-slot:activator="{ on, attrs }">

        <div style="width:100%;background: #F4F5F6;padding-left:.5rem;align-items: center;" class="d-flex">
          <div class="ned"  >
                            <v-select
                            style="margin-top:1rem"
                            
          :items="[{'name':'недорогие'}, {'name':'более дорогие'}]"
          label="Сначала недорогие"
          item-text="name"
          dense
          solo
        ></v-select>
            
          </div>

        
        <div >
            <v-btn
            v-bind="attrs"
            v-on="on"
            color="indigo"
            text
            
            
          >
          <span style="color:#676767">Фильтры</span>
            <img src="/filter.png" alt="">
              
          </v-btn>
          </div>
          </div>
      </template>
      <v-card>
        <v-toolbar
          dark
          color="orange"
        >
          <v-btn
            icon
            dark
            @click="dialog = false"
          >
            <v-icon>mdi-close</v-icon>
          </v-btn>
          <v-toolbar-title>Фильтры</v-toolbar-title>
          <v-spacer></v-spacer>
          <v-toolbar-items>
          </v-toolbar-items>
        </v-toolbar>
  <div style="margin-top: 4rem;padding: 1rem;">
<v-alert
v-model="alert"
style="position: fixed;z-index: 2;width: 90%;"
  color="orange"
  elevation="13"
  type="success"
>Фильтр применен</v-alert>


    <div style="margin-top: 2rem">
      <h3>Форма:</h3>
      <div class="mt-4">
        <v-checkbox
        @click="onalert"
          v-for="n in form.form_precent"
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
      <h3>Тип:</h3>
      <div class="mt-4">
        <v-checkbox
        @click="onalert"
          v-for="n in form.type_precent"
          :key="n.id"
          style="height: 1.3rem; width: 20rem"
          color="orange"
          v-model="type_id"
          :label="`${n.name_type}`"
          :value="n.id"
        ></v-checkbox>
      </div>
    </div>

    <div style="margin-top: 2rem">
      <h3>Повод:</h3>
      <div class="mt-4">
        <v-checkbox
        @click="onalert"
          v-for="n in form.reason_for_precent"
          :key="n.id"
          style="height: 1.3rem; width: 20rem"
          color="orange"
          v-model="reason_id"
          :label="`${n.name_reason}`"
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
            :label="Math.min(...minmaxPrice()) + ' тг'"
            single-line
            outlined
          ></v-text-field>
        </div>
        <div>
          <span>до</span>
          <v-text-field
            v-model="maxp"
            style="width: 100%"
            :label="Math.max(...minmaxPrice()) + ' тг'"
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
    "filter_name",
    "clickselect",
    "ads_select",
    "form",
    "listproducts",
    "filter_name",
    "search"
  ],

  data() {
    return {
      alert:false,
      dialog:false,
      selected_list1: [],
      maxp: null,
      minp: null,
      form_id: null,
      type_id: null,
      reason_id: null,
    };
  },
  computed: {
    selected_list() {
      this.ads_select(
        this.selected_list1,
        this.maxp,
        this.minp,
        this.form_id,
        this.type_id,
        this.reason_id
        );
    },
  },

  methods: {
    onalert(){
      this.alert = true
      setTimeout(() => {
        this.alert = false
      }, 1000);
    },
    resetfilters() {
      this.clickselect();
      this.dialog = false
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
    },
  },
};
</script>

<style >
.active {
  color: #ff7a00;
}
.box-cat{
  background: #ff7a00;
  color: white;
  margin: 3px;
  max-width: 45%;
  min-width: 45%;
}

</style>
