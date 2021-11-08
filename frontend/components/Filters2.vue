<template>
  <div style="margin-top: 4rem">
    <div @click="onfilterslug('all_presents',0,'')" class="box-filter">
      <img src="/fructs.png" alt="" /><span 
      :class="{ active: !filter_name }"
        >Все подарки
        {{ selected_list }}
      </span>
    </div>
    <hr style="color: #e5e5e5" />
    <div v-for="category in categories" :key="category.id">
      <div @click="onfilterslug(category.slug_category,category.id,category.name_category)" class="box-filter">
        <img style="max-height: 30px;max-width: 30px;min-width: 30px;" :src="category.icon" alt="" /><span
        :class="{ active: filter_name === category.name_category }"
          
          >{{ category.name_category }}
        </span>
      </div>
      <hr style="color: #e5e5e5" />
    </div>
    
      <div v-for="reason in reason_present" :key="'A'+reason.id">
      <div @click="onReason(reason.id,reason.name_reason)" class="box-filter">
        <img style="max-height: 30px;max-width: 30px;min-width: 30px;" :src="reason.icon" alt="" />
        <span
        :class="{ active: filter_name === reason.name_reason }"
          >{{ reason.name_reason }}
        </span>
      </div>
      <hr style="color: #e5e5e5" />
    </div> 

    <!-- <div style="margin-top: 2rem">
      <h3>Форма:</h3>
      <div class="mt-4">
        <v-checkbox
          v-for="n in form"
          :key="n.id"
          style="height: 1.3rem; width: 20rem"
          color="orange"
          v-model="form_id"
          :label="${n.name_form}"
          :value="n.id"
        ></v-checkbox>
      </div>
    </div>  -->

    <div style="margin-top: 2rem">
      <h3>Цена</h3>
      
      <!-- <div class="mt-4">
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
      </div> -->

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
    "pageData",
    "filter_name",
    "clickselect",
    "ads_select",
    "reason_present",
    "onReason",
    "form",
    "type_precent",
  ],
  computed: {

  
  },

  data() {
    return {
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
        this.minp,
        this.maxp,
        this.form_id
        );
    },
  },

  methods: {
    resetfilters() {
      this.clickselect();
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

<style scoped>
.active {
  color: #ff7a00;
}
.v-input--selection-controls .v-input__slot > .v-label,
.v-input--selection-controls .v-radio > .v-label {
  min-width: 10rem;
}
</style>