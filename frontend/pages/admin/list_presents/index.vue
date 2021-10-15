<template>
  <v-container>
    <h2>Все подарочные корзины</h2>
    <v-card>
      <v-card-title>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="Поиск"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>

      {{ get_filters }}
      <v-dialog v-model="dialog_send" persistent max-width="600px">
        <template v-slot:activator="{ on, attrs }">
          <div
            v-if="admin_data.present_change"
            style="width: 100%; padding: 1rem"
          >
            <v-btn v-bind="attrs" v-on="on" class="mx-2" fab color="indigo">
              <v-icon dark style="color:white"> mdi-plus </v-icon>
            </v-btn>
          </div>
        </template>
        <v-card>
          <v-card-title>
            <span class="text-h5">Поводы корзины</span>
          </v-card-title>
          <v-card-text>
            <v-container class="">
              <v-row justify="start">
                <h2 class="text-start">Добавить подарочную корзину</h2>
                {{ all_filter }}
                <v-col cols="12">
                  <v-form ref="form_com_children" lazy-validation>
                    <v-text-field
                      v-model="prevue_name"
                      label="превью корзины(напр:подарочная корзина)"
                    ></v-text-field>
                    <v-text-field
                      v-model="name_precent"
                      prepend-inner-icon="*"
                      class="prep"
                      label="Название подарочной корзины"
                      :rules="[v => !!v || 'Не может быть пустым']"
                      required
                    ></v-text-field>
                    <h4 class="mt-6">
                      Перенос строки ,если начало нового пункта начинается с
                      цифры и точки
                      <br />
                      пример(1.)
                    </h4>
                    <h6>Превью отображения на сайте</h6>
                    <p
                      v-for="(comp, index) in composition.split(/\d[.]+/g)"
                      :key="index"
                    >
                      <span style="font-weight: bold;" v-if="index"
                        >{{ index }}.</span
                      >
                      {{ comp }}
                    </p>
                    <v-textarea
                      outlined
                      name="input-7-4"
                      v-model="composition"
                      label="Состав подарочной корзины "
                      required
                    >
                    </v-textarea>

                    <v-textarea
                      outlined
                      name="input-7-4"
                      v-model="body"
                      label="Описание подарочной корзины"
                      required
                    ></v-textarea>

                    <v-text-field
                      v-model="price"
                      hide-details
                      single-line
                      required
                      type="number"
                      class="prep"
                      :rules="[v => !!v || 'Не может быть пустым']"
                      prepend-inner-icon="*"
                      label="Цена подарочной корзины "
                    />

                    <v-file-input
                      v-model="image_precent"
                      :rules="rulesImage"
                      accept="image/png, image/jpeg, image/png"
                      placeholder="Загрузите изображение"
                      prepend-inner-icon="*"
                      class="prep"
                      append-icon="mdi-camera"
                      required
                      @change="selectFile"
                      label="Загрузите изображение"
                    ></v-file-input>
                    <span>Выбрать категорию</span>
                    <v-select
                      v-model="category"
                      :items="categories"
                      item-text="name_category"
                      item-value="id"
                      persistent-hint
                      return-object
                      single-line
                      class="prep"
                      prepend-inner-icon="*"
                      label="Выбрать категорию"
                      outlined
                    ></v-select>
                    <span>Выбрать форму подарка</span>
                    <v-select
                      v-model="form"
                      :items="form_precent"
                      item-text="name_form"
                      item-value="id"
                      persistent-hint
                      return-object
                      single-line
                      label="Выбрать форму подарка"
                      outlined
                    ></v-select>
                    <span>Выбрать тип подарка</span>
                    <v-select
                      v-model="type"
                      :items="type_precent"
                      item-text="name_type"
                      item-value="id"
                      persistent-hint
                      return-object
                      single-line
                      label="Выбрать тип подарка"
                      outlined
                    ></v-select>
                    <span>Выбрать повод подарка</span>
                    <!-- <v-select
                      v-model="reason"
                      :items="reason_for_precent"
                      item-text="name_reason"
                      item-value="id"
                      persistent-hint
                      return-object
                      single-line
                      label="Выбрать повод подарка"
                      outlined
                    ></v-select> -->

                    <v-combobox
                      v-model="select"
                      :items="reason_for_precent"
                      label="Выбрать повод подарка"
                      prepend-inner-icon="*"
                      item-text="name_reason"
                      class="prep"
                      item-value="id"
                      multiple
                      outlined
                      return-object
                    ></v-combobox>

                    <v-btn
                      :disabled="!onlformdata"
                      class="mr-4"
                      @click="sendDataform"
                    >
                      Создать
                    </v-btn>
                  </v-form>
                </v-col>
              </v-row>
            </v-container>
          </v-card-text>
          <v-card-actions>
            <v-spacer></v-spacer>

            <v-btn color="blue darken-1" text @click="dialog_sendrr">
              Отмена
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>

      <v-container>
        <v-expansion-panels style="background: #f7f7f7;">
          <v-expansion-panel>
            <v-expansion-panel-header>
              <h4 class="pb-6">Фильтры</h4>
            </v-expansion-panel-header>
            <v-expansion-panel-content>
              <v-row>
                <v-col cols="12" lg="4" md="4">
                  <h6>По категориям</h6>
                  <v-select
                  @click="onCat"
                    solo
                    v-model="filtcategory"
                    :items="categories"
                    label="Выбрать категорию"
                    item-text="name_category"
                    item-value="id"
                  ></v-select>
                </v-col>
                <v-col cols="12" lg="4" md="4">
                  <h6>По поводам </h6>
                  <v-select
                    solo
                    @click="onPovod"
                    v-model="filtpovod"
                    :items="reason_for_precent"
                    label="Выбрать повод подарка"
                    item-text="name_reason"
                    item-value="id"
                  ></v-select>
                </v-col>
                <v-col cols="12" lg="4" md="4">
                  <h6>По форме</h6>
                  <v-select
                  @click="ohForm"
                    solo
                    v-model="filtform"
                    :items="form_precent"
                    item-text="name_form"
                    item-value="id"
                    label="Выбрать форму подарка"
                  ></v-select>
                </v-col>
                <v-col cols="12">
                  <v-btn @click="reset" class="ma-2" outlined color="indigo">
                    Сбросить фильтры
                  </v-btn>
                </v-col>
              </v-row>
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
      </v-container>
      <v-data-table
        id="list-table"
        :headers="headers"
        :items="get_items"
        :search="search"
        
      >
        <template v-slot:top>
          <v-toolbar flat>
            <v-divider class="mx-4" inset vertical></v-divider>
            <v-spacer></v-spacer>
            <v-dialog v-model="dialog" max-width="500px">
              <!-- изменить -->
              <v-card>
                <v-card-title>
                  <span class="text-h5">Изменить</span>
                </v-card-title>

                <v-card-text>
                  <v-container>
                    <v-row>
                      <v-col cols="12" sm="6" md="12">
                        <v-text-field
                          v-model="editedItem.prevue_name"
                          label="превью корзины(напр:подарочная корзина)"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="12">
                        <v-text-field
                          v-model="editedItem.name_precent"
                          label="Название корзины"
                        ></v-text-field>
                      </v-col>

                      <v-col cols="12" sm="6" md="12">
                        <v-textarea
                          outlined
                          name="input-7-4"
                          v-model="editedItem.body"
                          label="Описание подарочной корзины "
                        ></v-textarea>
                      </v-col>

                      <v-col cols="12" sm="12" md="12">
                        <v-text-field
                          v-model="editedItem.price"
                          label="Цена корзины"
                        ></v-text-field>
                      </v-col>

                      <v-col cols="12" sm="12" md="12">
                        <h4 class="mt-6">
                          Перенос строки, если начало нового пункта начинается с
                          цифры и точки
                          <br />
                          пример(1.)
                        </h4>
                        <h6>Превью отображения на сайте</h6>
                        <p
                          v-for="(comp, index) in String(
                            editedItem.composition
                          ).split(/\d[.]+/g)"
                          :key="index"
                        >
                          <span style="font-weight: bold;" v-if="index"
                            >{{ index }}.</span
                          >
                          {{ comp }}
                        </p>

                        <v-textarea
                          outlined
                          name="input-7-4"
                          v-model="editedItem.composition"
                          label="Состав подарочной корзины"
                        ></v-textarea>
                      </v-col>

                      <v-col cols="12" sm="12" md="12">
                        <v-file-input
                          v-model="image"
                          accept="image/png, image/jpeg, image/bmp"
                          placeholder="Загрузите изображение"
                          prepend-icon="mdi-camera"
                          label="Загрузите изображение"
                        ></v-file-input>
                      </v-col>

                      <v-col cols="12" sm="12" md="12">
                        <span>Изменить категорию</span>
                        <v-select
                          v-model="category"
                          :items="categories"
                          item-text="name_category"
                          item-value="id"
                          persistent-hint
                          return-object
                          single-line
                          :label="category"
                          outlined
                        ></v-select>
                      </v-col>

                      <v-col cols="12" sm="12" md="12">
                        <span>Изменить форму подарка</span>

                        <v-select
                          v-model="form"
                          :items="form_precent"
                          item-text="name_form"
                          item-value="id"
                          persistent-hint
                          return-object
                          single-line
                          :label="form"
                          outlined
                        ></v-select>
                      </v-col>

                      <v-col cols="12" sm="12" md="12">
                        <span>Изменить тип подарка</span>
                        <v-select
                          v-model="type"
                          :items="type_precent"
                          item-text="name_type"
                          item-value="id"
                          persistent-hint
                          return-object
                          :label="type"
                          single-line
                          outlined
                        ></v-select>
                      </v-col>

                      <v-col cols="12" sm="12" md="12">
                        <span>Изменить повод подарка</span>
                        <v-combobox
                          v-model="editedItem.reason_for_precent"
                          :items="reason_for_precent"
                          label="Изменить повод подарка"
                          item-text="name_reason"
                          item-value="id"
                          multiple
                          outlined
                          return-object
                        ></v-combobox>
                      </v-col>
                    </v-row>
                  </v-container>
                </v-card-text>

                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="close">
                    Отмена
                  </v-btn>
                  <v-btn color="blue darken-1" text @click="save">
                    Сохранить
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
            <!-- удалить -->
            <v-dialog v-model="dialogDelete" max-width="500px">
              <v-card>
                <v-card-title class="text-h5"
                  >Вы действительно хотите удалить корзину?</v-card-title
                >
                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn color="blue darken-1" text @click="closeDelete"
                    >Отмена</v-btn
                  >
                  <v-btn color="blue darken-1" text @click="deleteItemConfirm"
                    >Да</v-btn
                  >
                  <v-spacer></v-spacer>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </v-toolbar>
        </template>
        <template v-slot:item.image="{ item }">
          <img style="width: 10rem;" :src="item.image_precent" alt="none" />
        </template>

        <template v-slot:item.price="{ item }">
          <div  style="min-width: 8em;">
                  <v-chip
        color="green"
        style="padding:1em"
        
      >
        {{item.price.toLocaleString()}} тг
      </v-chip>
            
          </div>
          
        </template>
        <!-- изображение -->

        <template v-slot:item.reason_for_precent="{ item }">
          <div
            v-for="(reason_item,index) in item.reason_for_precent"
            :key="reason_item.id"
          >
            <span>{{index+1}}.{{ reason_item.name_reason }}</span>
            <p></p>
          </div>
        </template>
            <template v-slot:item.id="{ item }">
      <v-chip
        color="orange"
        style="padding:1em"
        dark
        
      >
        {{ item.id }}
      </v-chip>
    </template>
        <!-- изменить удалить -->
        <template v-slot:item.actions="{ item }">
          <v-icon
            style="font-size:1.5em"
            v-if="admin_data.present_change"
            small
            class="mr-2"
            @click="editItem(item)"
          >
            mdi-pencil
          </v-icon>
          <v-icon
          color="red"
            style="font-size:1.5em"
            v-if="admin_data.present_change"
            small
            @click="deleteItem(item)"
          >
            mdi-delete
          </v-icon>
        </template>
        <template v-slot:item.onpage="{ item }">
          <div class="text-center">
            <fa
              style="cursor: pointer;font-size:1.5em"
              @click="Onpage(item.id)"
              icon="angle-right"
            ></fa>
          </div>
        </template>
      </v-data-table>
    </v-card>
  </v-container>
</template>

<script>
import { mapState } from "vuex";
export default {
  layout: "admin",
  async asyncData({ params, $axios }) {
    // We can use async/await ES6 feature
    const data_presents = await $axios.get(
      `http://giftcity.kz/api/v1/present/`
    );
    const data_filter = await $axios.get(
      `http://giftcity.kz/api/v1/present/filter/all`
    );
    return { data_presents: data_presents.data, data_filter: data_filter.data };
  },
  data: () => ({
    page: 1,
    pageCount: 0,
    itemsPerPage: 10,
    name_precent: "",
    price: null,
    filtcategory: null,
    img_open: false,
    filtpovod: null,
    composition: "",
    dialog2: false,
    image_precent: null,
    prevue_name: "",
    filtform: null,
    categories: [],
    select: [],
    category: {},
    body: "",
    form_precent: [],
    form: {},
    type_precent: [],
    type: {},
    reason: {},
    dialog_send: false,
    rulesImage: [
      value =>
        !value ||
        value.size < 2000000 ||
        "Avatar size should be less than 2 MB!"
    ],
    reason: {},
    dialog: false,
    dialogDelete: false,
    headers: [
      { text: "Артикул", value: "id" },
      { text: "Превью Названия", value: "prevue_name" },
      { text: "Название", value: "name_precent" },
      { text: "Изображение", value: "image", sortable: false },
      { text: "Цена подарка", value: "price" },
      { text: "Состав", value: "composition", sortable: false },
      { text: "Описание", value: "body" },
      {
        text: "Категория",
        value: "category[0].name_category",
        sortable: false
      },
      {
        text: "Повод ",
        value: "reason_for_precent",
        sortable: false
      },
      {
        text: "Тип подарка",
        value: "type_precent[0].name_type",
        sortable: false
      },
      {
        text: "Форма подарка",
        value: "form_precent[0].name_form",
        sortable: false
      },
      //   { text: "Изображени!е", value: "form_precent[0].name_form", sortable: false },
      { text: "Изменить/ удалить", value: "actions", sortable: false },
      { text: "перейти", value: "onpage", sortable: false }
    ],
    items: [],
    search: "",
    editedIndex: -1,
    editedItem: {},
    categories: [],
    category: {},
    image: null,
    form_precent: [],
    form: {},
    type_precent: [],
    type: {},
    reason_for_precent: [],
    reason: {}
  }),
  computed: {
    admin_data() {
      return this.$store.state.localStorage.admin_data;
    },
    all_filter() {
      (this.categories = this.data_filter.categories),
        (this.form_precent = this.data_filter.form_precent),
        (this.type_precent = this.data_filter.type_precent),
        (this.reason_for_precent = this.data_filter.reason_for_precent);
    },
    onlformdata() {
      if (
        this.name_precent &&
        this.price &&
        this.image_precent &&
        this.category.id &&
        this.select.length
      ) {
        return true;
      } else {
        return false;
      }
    },
    get_filters() {
      this.categories = this.$store.getters["allfilter/allfilter"].categories;
      this.form_precent = this.$store.getters[
        "allfilter/allfilter"
      ].form_precent;
      this.type_precent = this.$store.getters[
        "allfilter/allfilter"
      ].type_precent;
      this.reason_for_precent = this.$store.getters[
        "allfilter/allfilter"
      ].reason_for_precent;
    },
    get_items() {
      if(this.filtpovod){
        this.items = this.data_presents.filter(elem => {
          for (let i of elem.reason_for_precent) {
            if (i.id === this.filtpovod) {
              return elem;
            }
          }
        });
      }
      if(this.filtcategory){
        this.items = this.data_presents.filter(elem => {
          return elem.category[0].id === this.filtcategory;
        });
      }
      if(this.filtform){
      this.items = this.data_presents.filter(elem => {
          if (elem.form_precent.length > 0) {
            return elem.form_precent[0].id === this.filtform;
          }
        });
      }
      if (!this.filtpovod && !this.filtcategory && !this.filtform) {
        this.items = this.data_presents;
      }
      return this.items;
    }
  },
  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    }
  },
  methods: {
    prim_filtcat() {
      this.dialog2 = false;
    },
    ohForm(){
      this.filtpovod = null
        this.filtcategory = null
       
    },
    onPovod(){
      console.log(2);
        this.filtform = null;
        this.filtcategory = null;
       
    },
    onCat(){
      
        console.log(1);
        this.filtform = null;
        this.filtpovod = null;
       
      
    },
    reset() {
      this.filtform = null;
      this.filtpovod = null;
      this.filtcategory = null;
    },

    onImage(image) {
      // <img src="image_precent"/>
      console.log(image);
      return "hhh";
    },
    selectFile() {},
    sendDataform() {
      const headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken
      };
      let select_id = [];
      for (let i of this.select) {
        select_id.push(i.id);
      }

      let bodyFormData = new FormData();

      if (this.prevue_name) {
        bodyFormData.append("prevue_name", this.prevue_name);
      }
      bodyFormData.append("name_precent", this.name_precent);
      bodyFormData.append("price", Number(this.price));
      if (this.composition) {
        bodyFormData.append("composition", this.composition);
      }

      bodyFormData.append("image", this.image_precent);
      bodyFormData.append("category_id", this.category.id);
      if (this.form.id) {
        bodyFormData.append("form_precent_id", this.form.id);
      }
      if (this.type.id) {
        bodyFormData.append("type_precent_id", this.type.id);
      }
      if (this.body) {
        bodyFormData.append("body", this.body);
      }

      bodyFormData.append("reason_for_precent_id", String(select_id));
      this.$axios
        .$post(`http://giftcity.kz/api/v1/present/`, bodyFormData, {
          headers: headers
        })
        .then(resp => {
          console.log(resp);
          this.items.push(resp);
          this.dialog_send = false;
      this.image_precent = null;
      this.image = null;
      this.price = null;
      this.body = "";
      this.composition = "";
      this.prevue_name = "";
      this.name_precent = "";
      this.select = [];
      this.type = {};
      this.form = {};
      this.category = {};
        })
        .catch(function(error) {
          console.log("error");
        });
    },
    Onpage(item_id) {
      this.$router.push(`/admin/list_presents/${item_id}`);
    },
    editItem(item) {
      this.editedIndex = this.items.indexOf(item);
      this.editedItem = Object.assign({}, item);
      if (item.type_precent.length > 0) {
        this.type = item.type_precent[0].name_type;
      }
      if (item.form_precent.length > 0) {
        this.form = item.form_precent[0].name_form;
      }
      if (item.category.length > 0) {
        this.category = item.category[0].name_category;
      }

      this.dialog = true;
    },
    deleteItem(item) {
      this.editedIndex = this.items.indexOf(item);
      this.editedItem = Object.assign({}, item);
      this.dialogDelete = true;
    },
    deleteItemConfirm() {
      this.items.splice(this.editedIndex, 1);
      this.closeDelete();
    },
    dialog_sendrr() {
      this.image_precent = null;
      this.image = null;
      this.price = null;
      this.body = "";
      this.composition = "";
      this.prevue_name = "";
      this.name_precent = "";
      this.select = [];
      this.type = {};
      this.form = {};
      this.category = {};
      this.dialog_send = false;
    },
    close() {
      this.dialog = false;
      this.image_precent = null;
      this.image = null;
      this.price = null;
      this.body = "";
      this.composition = "";
      this.prevue_name = "";
      this.name_precent = "";
      this.select = [];
      this.type = {};
      this.form = {};
      this.category = {};
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },
    save() {
      let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken
      };
      Object.assign(this.items[this.editedIndex], this.editedItem);
      let select_id = [];
      for (let i of this.editedItem.reason_for_precent) {
        select_id.push(i.id);
      }
      console.log(select_id);
      let bodyFormData = new FormData();
      bodyFormData.append("prevue_name", this.editedItem.prevue_name);
      bodyFormData.append("name_precent", this.editedItem.name_precent);
      bodyFormData.append("body", this.editedItem.body);
      bodyFormData.append("price", Number(this.editedItem.price));
      bodyFormData.append("composition", this.editedItem.composition);
      if (this.image) {
        bodyFormData.append("image", this.image);
      }
      if (this.category.id) {
        bodyFormData.append("category_id", this.category.id);
        this.editedItem.category[0] = this.category;
        this.category = {};
      }
      if (this.form.id) {
        bodyFormData.append("form_precent_id", this.form.id);
        this.editedItem.form_precent[0] = this.form;
        this.form = {};
      }
      if (this.type.id) {
        bodyFormData.append("type_precent_id", this.type.id);
        this.editedItem.type_precent[0] = this.type;
        this.type = {};
      }

      bodyFormData.append("reason_for_precent_id", String(select_id));

      this.$axios
        .$put(
          `http://giftcity.kz/api/v1/present/${this.editedItem.id}`,
          bodyFormData,
          {
            headers: headers
          }
        )
        .then(resp => {
          console.log(resp);
          this.items = resp;
          this.image_precent = null;
          this.image = null;
        })
        .catch(function(error) {
          console.log(error);
        });
      this.close();
    },
    closeDelete() {
      this.dialogDelete = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
      let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken
      };
      this.$axios
        .$delete(`http://giftcity.kz/api/v1/present/${this.editedItem.id}`, {
          headers: headers
        })
        .then(resp => {
          this.items = resp;
        })
        .catch(function(error) {
          console.log(error);
        });
    }
  }
};
</script>

<style>
.v-data-table-header {
  background: rgb(236, 224, 253) none repeat scroll 0% 0%;
}
.prep .theme--light.v-icon {
  color: rgb(243 10 10 / 54%);
}
</style>
