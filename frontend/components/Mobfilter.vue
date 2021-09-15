<template>
  <v-row justify="center">
    <v-dialog
      v-model="dialog"
      fullscreen
      hide-overlay
      transition="dialog-bottom-transition"
    >
      <template v-slot:activator="{ on, attrs }">
            <v-btn
            class="btn-mobile-filter"
            v-bind="attrs"
            v-on="on"
            rounded
            style="height: 39px; margin: 0.7rem; border-color: #ff7a00;margin-top: 3rem;"
            color="indigo"
            outlined
            dark
          >
            <span style="font-size: 12px; color: black"
              >Фильтры</span
            >
          </v-btn>
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
    <div @click="onfilterslug('Все_продукты')" class="box-filter">
      <img src="/fructs.png" alt="" /><span :class="{ active: !filter_name }"
        >Все продукты
        {{ selected_list }}
      </span>
    </div>
    <hr style="color: #e5e5e5" />
    <div v-for="category in categories" :key="category.id">
      <div @click="onfilterslug(category.slug_category)" class="box-filter">
        <img src="/fructs.png" alt="" /><span
          :class="{ active: filter_name === category.name_category }"
          >{{ category.name_category }}
        </span>
      </div>
      <hr style="color: #e5e5e5" />
    </div>

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
.v-input--selection-controls .v-input__slot > .v-label,
.v-input--selection-controls .v-radio > .v-label {
  min-width: 10rem;
}
</style>
