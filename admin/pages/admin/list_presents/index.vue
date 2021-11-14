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
          <div style="width: 100%; padding: 1rem">
            <v-btn
              v-bind="attrs"
              v-on="on"
              class="mx-2"
              fab
              
              color="indigo"
            >
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
                          :rules="[(v) => !!v || 'Не может быть пустым']"
                          label="превью корзины(напр:подарочная корзина)"
                        ></v-text-field>
                    <v-text-field
                      v-model="name_precent"
                      label="Название подарочной корзины"
                      :rules="[(v) => !!v || 'Не может быть пустым']"
                      required
                    ></v-text-field>

                    <v-textarea
                      outlined
                      name="input-7-4"
                      v-model="composition"
                      label="Состав подарочной корзины "
                      :rules="[(v) => !!v || 'Не может быть пустым']"
                      required
                    ></v-textarea>

                      <v-textarea
                      outlined
                      name="input-7-4"
                      v-model="body"
                      label="Описание подарочной корзиныv "
                      :rules="[(v) => !!v || 'Не может быть пустым']"
                      required
                    ></v-textarea>

                    <v-text-field
                      v-model="price"
                      hide-details
                      single-line
                      required
                      type="number"
                      :rules="[(v) => !!v || 'Не может быть пустым']"
                      label="Цена подарочной корзины "
                    />

                    <v-file-input
                      v-model="image_precent"
                      :rules="rulesImage"
                      accept="image/png, image/jpeg, image/png"
                      placeholder="Загрузите изображение"
                      prepend-icon="mdi-camera"
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
                    <v-select
                      v-model="reason"
                      :items="reason_for_precent"
                      item-text="name_reason"
                      item-value="id"
                      persistent-hint
                      return-object
                      single-line
                      label="Выбрать повод подарка"
                      outlined
                    ></v-select>

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

            <v-btn color="blue darken-1" text @click="dialog_send = false">
              Отмена
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>
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
                        <v-textarea
                          outlined
                          name="input-7-4"
                          v-model="editedItem.composition"
                          label="Состав подарочной корзины "
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
                          label="Изменить категорию"
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
                          label="Изменить форму подарка"
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
                          single-line
                          label="Изменить тип подарка"
                          outlined
                        ></v-select>
                      </v-col>

                      <v-col cols="12" sm="12" md="12">
                        <span>Изменить повод подарка</span>
                        <v-select
                          v-model="reason"
                          :items="reason_for_precent"
                          item-text="name_reason"
                          item-value="id"
                          persistent-hint
                          return-object
                          single-line
                          label="Изменить повод подарка"
                          outlined
                        ></v-select>
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
        <!-- изображение -->
          <template v-slot:item.image="{ item }">
          <img  style="width: 10rem;" :src="item.image_precent" alt="none">

        </template>
        <!-- изменить удалить -->
        <template v-slot:item.actions="{ item }">
          <v-icon small class="mr-2" @click="editItem(item)">
            mdi-pencil
          </v-icon>
          <v-icon small @click="deleteItem(item)"> mdi-delete </v-icon>
        </template>
        <template v-slot:item.onpage="{ item }">
          <div class="text-center">
            <fa
              style="cursor: pointer"
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
      `/api/present/`
    );
    const data_filter= await $axios.get(
      `/api/present/filter/all`
    );
    return { data_presents: data_presents.data, data_filter: data_filter.data };
  },

  data: () => ({
    name_precent: "",
    price: null,
    img_open :false,
    composition: "",
    image_precent: null,
    prevue_name:'',
    categories: [],
    category: {},
    body:'',
    form_precent: [],
    form: {},
    type_precent: [],

    type: {},
    reason_for_precent: [],
    reason: {},
    dialog_send: false,
    rulesImage: [
      (value) =>
        !value ||
        value.size < 2000000 ||
        "Avatar size should be less than 2 MB!",
    ],
    reason: {},
    dialog: false,
    dialogDelete: false,
    headers: [
      { text: "Артикул", value: "id" },
      { text: "Превью Названия", value: "prevue_name" },
      { text: "Название", value: "name_precent" },
      { text: "Изображение", value: "image", sortable: false },
      { text: "Цена(тг)", value: "price" },
      { text: "Состав", value: "composition", sortable: false },
      { text: "Описание", value: "body" },
      {
        text: "Категория",
        value: "category[0].name_category",
        sortable: false,
      },
      {
        text: "Повод ",
        value: "reason_for_precent[0].name_reason",
        sortable: false,
      },
      {
        text: "Тип подарка",
        value: "type_precent[0].name_type",
        sortable: false,
      },
      {
        text: "Форма подарка",
        value: "form_precent[0].name_form",
        sortable: false,
      },
      //   { text: "Изображение", value: "form_precent[0].name_form", sortable: false },
      { text: "Изменить/ удалить", value: "actions", sortable: false },
      { text: "перейти", value: "onpage", sortable: false },
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
    reason: {},
  }),

  computed: {

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
        this.composition &&
        this.image_precent &&
        this.category.id &&
        this.form.id &&
        this.type.id &&
        this.reason.id &&
        this.prevue_name &&
        this.body
      ) {
        return true;
      } else {
        return false;
      }
    },
    get_filters() {
      this.categories = this.$store.getters["allfilter/allfilter"].categories;
      this.form_precent =
        this.$store.getters["allfilter/allfilter"].form_precent;
      this.type_precent =
        this.$store.getters["allfilter/allfilter"].type_precent;
      this.reason_for_precent =
        this.$store.getters["allfilter/allfilter"].reason_for_precent;
    },
    get_items() {
      this.items = this.data_presents;
      return this.items;
    },
  },

  watch: {
    dialog(val) {
      val || this.close();
    },
    dialogDelete(val) {
      val || this.closeDelete();
    },
  },

  methods: {
    onImage(image){
        // <img src="image_precent"/>
        console.log(image);
        return 'hhh'
      },
    selectFile() {

    },
    sendDataform() {
      const headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken,
      };

      let bodyFormData = new FormData();
      bodyFormData.append("prevue_name", this.prevue_name);
      bodyFormData.append("name_precent", this.name_precent);
      bodyFormData.append("price", Number(this.price));
      bodyFormData.append("composition", this.composition);
      bodyFormData.append("image", this.image_precent);
      bodyFormData.append("category_id", this.category.id);
      bodyFormData.append("form_precent_id", this.form.id);
      bodyFormData.append("type_precent_id", this.type.id);
      bodyFormData.append("body", this.body);
      bodyFormData.append("reason_for_precent_id", this.reason.id);

      this.$axios
        .$post(`/api/present/`, bodyFormData, {
          headers: headers,
        })
        .then((resp) => {
          console.log(resp);
          this.items.push(resp)
          this.dialog_send = false;
        })
        .catch(function (error) {
          console.log("error");
        });
    },
    Onpage(item_id) {
      this.$router.push(`/admin/list_presents/${item_id}`);
    },
    editItem(item) {
      this.editedIndex = this.items.indexOf(item);
      this.editedItem = Object.assign({}, item);
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

    close() {
      this.dialog = false;
      this.$nextTick(() => {
        this.editedItem = Object.assign({}, this.defaultItem);
        this.editedIndex = -1;
      });
    },
    save() {
      let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken,
      };
      Object.assign(this.items[this.editedIndex], this.editedItem);

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
      if (this.reason.id) {
        bodyFormData.append("reason_for_precent_id", this.reason.id);
        this.editedItem.reason_for_precent[0] = this.reason;
        this.reason = {};
      }

      this.$axios
        .$put(`/api/present/${this.editedItem.id}`, bodyFormData, {
          headers: headers,
        })
        .then((resp) => {
          this.items = resp;
        })
        .catch(function (error) {
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
        Authorization: this.$store.state.localStorage.jwtToken,
      };
      this.$axios
        .$delete(`/api/present/${this.editedItem.id}`, {
          headers: headers,
        })
        .then((resp) => {
          this.items = resp;
        })
        .catch(function (error) {
          console.log(error);
        });
    },
  },
};
</script>


