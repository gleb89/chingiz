<template>
  <div>
{{all_filter}}
     <v-dialog v-model="dialogreset" max-width="500px">
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
                          v-model="itemadit.prevue_name"
                          label="превью корзины(напр:подарочная корзина)"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12" sm="6" md="12">
                        <v-text-field
                          v-model="itemadit.name_precent"
                          label="Название корзины"
                        ></v-text-field>
                      </v-col>

                      <v-col cols="12" sm="6" md="12">
                        <v-textarea
                          outlined
                          name="input-7-4"
                          v-model="itemadit.body"
                          label="Описание подарочной корзины "
                        ></v-textarea>
                      </v-col>

                      <v-col cols="12" sm="12" md="12">
                        <v-text-field
                          v-model="itemadit.price"
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
                            itemadit.composition
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
                          v-model="itemadit.composition"
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
                          label="Изменить форму"
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
                          label="Изменить тип "
                          single-line
                          outlined
                        ></v-select>
                      </v-col>

                      <v-col cols="12" sm="12" md="12">
                        <span>Изменить повод подарка</span>
                        <v-combobox
                          v-model="itemadit.reason_for_precent"
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
                  <v-btn color="blue darken-1" text @click="update">
                    Сохранить
                  </v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>

    <v-data-table
      :headers="headers"
      :items="get_data_present"
      :items-per-page="5"
      class="elevation-1"
    >
      <template v-slot:item.image="{ item }">
        <img style="width: 10rem;" :src="item.image_precent" alt="none" />
      </template>

      <template v-slot:item.price="{ item }">
        <div style="min-width: 8em;">
          <v-chip color="green" style="padding:1em">
            {{ item.price.toLocaleString() }} тг
          </v-chip>
        </div>
      </template>
      <!-- изображение -->

      <template v-slot:item.reason_for_precent="{ item }">
        <div
          v-for="(reason_item, index) in item.reason_for_precent"
          :key="reason_item.id"
        >
          <span>{{ index + 1 }}.{{ reason_item.name_reason }}</span>
          <p></p>
        </div>
      </template>
      <template v-slot:item.id="{ item }">
        <v-chip color="orange" style="padding:1em" dark>
          {{ item.id }}
        </v-chip>
      </template>
      <!-- изменить удалить -->
      <template v-slot:item.actions="{ item}">
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
  </div>
</template>

<script>
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

  data() {
    return {
      items: [],
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
    categories: [],
    category: {},
    image: null,
    form_precent: [],
    reason_for_precent:[],
    form: {},
    itemadit:{},
    type_precent: [],
    type: {},
    dialogreset:false,
    ind:null
    };
  },
  computed: {
    get_data_present() {
      this.items = this.data_presents;
      return this.items;
    },
    admin_data() {
      return this.$store.state.localStorage.admin_data;
    },
    all_filter() {
      (this.categories = this.data_filter.categories),
        (this.form_precent = this.data_filter.form_precent),
        (this.type_precent = this.data_filter.type_precent),
        (this.reason_for_precent = this.data_filter.reason_for_precent);
    },
  },

  mounted() {},

  methods: {
    editItem(item){
      this.ind = this.data_presents.findIndex(function (elem) {
	    return elem.id === item.id;
    });
    
    this.itemadit = this.data_presents[this.ind]
    if (item.type_precent.length > 0) {
        this.type = item.type_precent[0].name_type;
      }
    if (item.form_precent.length > 0) {
        this.form = item.form_precent[0].name_form;
      }
    if (item.category.length > 0) {
        this.category = item.category[0].name_category;
      }
    this.dialogreset = true
    },
    update(){
    let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken
      };

      let select_id = [];
      for (let i of this.itemadit.reason_for_precent) {
        select_id.push(i.id);
      }
      
      let bodyFormData = new FormData();
      if(this.itemadit.prevue_name){
        bodyFormData.append("prevue_name", this.itemadit.prevue_name);
      }
      if(this.itemadit.body){
         bodyFormData.append("body", this.itemadit.body);
      }
       
      if(this.itemadit.price){
        bodyFormData.append("price", Number(this.itemadit.price));
      }
      
      
      if(this.itemadit.composition){
        bodyFormData.append("composition", this.itemadit.composition);
      }
      
      if (this.image) {
        bodyFormData.append("image", this.image);
      }
      if (this.category.id) {
        bodyFormData.append("category_id", this.category.id);
        this.itemadit.category[0] = this.category;
        this.category = {};
      }
      if (this.form.id) {
        bodyFormData.append("form_precent_id", this.form.id);
        this.itemadit.form_precent[0] = this.form;
        this.form = {};
      }
      if (this.type.id) {
        bodyFormData.append("type_precent_id", this.type.id);
        this.itemadit.type_precent[0] = this.type;
        this.type = {};
      }
      bodyFormData.append("reason_for_precent_id", String(select_id));
      this.$axios
        .$put(
          `http://giftcity.kz/api/v1/present/${this.itemadit.id}`,
          bodyFormData,
          {
            headers: headers
          }
        )
        .then(resp => {
          
        this.ind = this.data_presents.findIndex(function (elem) {
	      return elem.id === resp.id;
        });
       
          this.data_presents[this.ind].image_precent = resp.image_precent
          this.data_presents[this.ind].prevue_name = resp.prevue_name
          this.data_presents[this.ind].price  = resp.price 
          this.data_presents[this.ind].body = resp.body
          this.data_presents[this.ind].composition = resp.composition
          this.data_presents[this.ind].name_precent= resp.name_precent
          this.data_presents[this.ind].type_precent = resp.type_precent
          this.data_presents[this.ind].form_precent = resp.form_precent
          this.data_presents[this.ind].category = resp.category
          this.data_presents[this.ind].reason_for_precent = resp.reason_for_precent
         
          this.ind = null
          this.image_precent = null;
          this.image = null;
        })
        .catch(function(error) {
          console.log(error);
        });
      this.close();
      
    },
    close(){
      this.ind = null
      this.itemadit = {}
      this.image = null
      this.dialogreset = false
    },
    Onpage(item_id) {
      this.$router.push(`/admin/list_presents/${item_id}`);
    },
  }
};
</script>
