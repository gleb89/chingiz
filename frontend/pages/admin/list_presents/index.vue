<template>
  <div>
{{all_filter}}
    <h2>Все подарочные корзины</h2>
    
          <div
            v-if="admin_data.present_change"
            style="width: 100%; padding: 1rem"
          >
            <v-btn @click="dialog_save = true" class="mx-2" fab color="indigo">
              <v-icon dark style="color:white"> mdi-plus </v-icon>
            </v-btn>
          </div>

<v-expansion-panels style="background: #f7f7f7;margin-top:3em;margin-bottom:3em">
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
 <v-dialog v-model="dialog_save" persistent max-width="600px">
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
                        <div v-if="composition">
                    <p
                      v-for="(comp, index) in composition.split(/\d[.]+/g)"
                      :key="index"
                    >
                      <span style="font-weight: bold;" v-if="index"
                        >{{ index }}.</span
                      >
                      <span style="font-weight: 500;" v-if="['1','2','3','4','5','6','7','8','9'].includes(comp.charAt(comp.length - 1))" >{{ comp.slice(0,-1) }}</span>
                      <span style="font-weight: 500;"  v-if="!['1','2','3','4','5','6','7','8','9'].includes(comp.charAt(comp.length - 1))">{{ comp }}</span>
                      
                    </p>
                  </div>
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
                     
                      accept="image/png, image/jpeg, image/png, image/webp"
                      placeholder="Загрузите изображение"
                      prepend-inner-icon="*"
                      class="prep"
                      append-icon="mdi-camera"
                      required
                     
                      label="Загрузите изображение"
                    ></v-file-input>
              
                    <span>Выбрать категорию</span>
                      <v-combobox
                      v-model="category"
                      :items="categories"
                      label="Выбрать категорию"
                      prepend-inner-icon="*"
                      item-text="name_category"
                      class="prep"
                      item-value="id"
                      multiple
                      outlined
                      return-object
                    ></v-combobox>
                    
                    <div v-if="category.length">
                      <span> Добавить  подкатегорию</span>
                     
                    <v-combobox
                    v-model="category_subcategory"
                    :items="subcategory"
                    item-text="name_subcategory"
                    item-value="id"
                    label="Добавить подкатегорию"
                    multiple
                    chips
                    solo
                    ></v-combobox>
                    </div>
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

            <v-btn color="blue darken-1" text @click="dialog_close">
              Отмена
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-dialog>


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
                        <div v-if="itemadit.composition">
                    <p
                      v-for="(comp, index) in itemadit.composition.split(/\d[.]+/g)"
                      :key="index"
                    >
                      <span style="font-weight: bold;" v-if="index"
                        >{{ index }}.</span
                      >
                      <span style="font-weight: 500;" v-if="['1','2','3','4','5','6','7','8','9'].includes(comp.charAt(comp.length - 1))" >{{ comp.slice(0,-1) }}</span>
                      <span style="font-weight: 500;"  v-if="!['1','2','3','4','5','6','7','8','9'].includes(comp.charAt(comp.length - 1))">{{ comp }}</span>
                      
                    </p>
                  </div>
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
                          accept="image/png, image/jpeg, image/png, image/webp"
                          placeholder="Загрузите изображение"
                          prepend-icon="mdi-camera"
                          label="Загрузите изображение"
                        ></v-file-input>
                      </v-col>

                      <v-col cols="12" sm="12" md="12">
                        
                        <span>Изменить категорию</span>
                     <v-combobox
                          v-model="itemadit.category"
                          :items="categories"
                          label="Изменить категорию"
                          item-text="name_category"
                          item-value="id"
                          multiple
                          chips
                          outlined
                          return-object
                        ></v-combobox>
                      </v-col>
                     
                      <v-col cols="12" >
                   
                      <span> Изменить/Добавить  подкатегорию</span>
                    <v-combobox
                   
                    v-model="itemadit.subcategory"
                    :items="category_subcategory"
                    item-text="name_subcategory"
                    item-value="id"
                    label="Добавить/изменить подкатегорию"
                    multiple
                    chips
                    solo
                    ></v-combobox>
                    
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
          
          <v-autocomplete
            v-model="value"
            :items="forsearch"
            dense
            solo
            filled
            label="Поиск по артиклю или названию"
          ></v-autocomplete>
                      <v-col cols="12">
                  <v-btn v-if="value" @click="value = null" class="ma-2" outlined color="indigo">
                     Очистить поиск
                  </v-btn>
                </v-col>
    <v-data-table
      :headers="headers"
      :items="get_data_present"
      :items-per-page="5"
      
      class="elevation-1"
    >
          <template v-slot:item.category="{ item }">
        <div
          v-for="(category, index) in item.category"
          :key="category.id"
        >
          <span>{{ index + 1 }}.{{ category.name_category }}</span>
          <p></p>
        </div>
      </template>

      <template v-slot:item.image="{ item }">
        <img style="width: 10rem;" :src="item.image_precent" alt="none" />
      </template>

      <template v-slot:item.subcategory_list="{ item }">
        <div >
 
    <div v-for="sub in item.subcategory" :key="sub.id">
       <v-chip
      class="ma-2"
      color="cyan"
      label
      text-color="white"
    >
      <v-icon left>
        mdi-label
      </v-icon>
      {{sub.name_subcategory}}
    </v-chip>
      </div>      
        <div >

        </div>

        </div>
       <!-- {{item.subcategory}} -->
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

      <template v-slot:item.popular="{ item }">
        <v-chip color="cyan" style="padding:1em" dark>
          {{ item.popular }}
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
          v-if="admin_data.present_delete"
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
      `https://giftcity.kz/api/v1/present/`
    );
    const data_filter = await $axios.get(
      `https://giftcity.kz/api/v1/present/filter/all`
    );
    return { data_presents: data_presents.data, data_filter: data_filter.data };
  },

  data() {
    return {
      items: [],
      headers: [
        { text: "Артикул", value: "id" },
        { text: "Заказали раз", value: "popular" },
        { text: "Превью Названия", value: "prevue_name" },
        { text: "Название", value: "name_precent" },
        { text: "Изображение", value: "image", sortable: false },
        { text: "Цена подарка", value: "price" },
        { text: "Состав", value: "composition", sortable: false },
        { text: "Описание", value: "body" },
        {
          text: "Категория",
          value: "category",
          sortable: false
        },
        {
          text: "ПодКатегория",
          value: "subcategory_list",
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
    name_precent: "",
    price: null,
    body:'',
    search: '',
    filtcategory: null,
    subcat_list:[],
    deleteitemdict:{},
    dialogDelete:false,
    img_open: false,
    filtpovod: null,
    value:null,
    composition: "",
    for_sub_update:[],
    dialog2: false,
    image_precent: null,
    prevue_name: "",
    filtform: null,
    dialog_save:'',
    category: [],
    subcategory:[],
    image: null,
    dialogsub:false,
    dialogSubDelete:false,
    form_precent: [],
    reason_for_precent:[],
    form: {},
    itemadit:{},
    type_precent: [],
    type: {},
    select: [],
    category_subcategory:[],
    dialogreset:false,
    search_items:[],
    ind:null
    };
  },
  computed: {
    onlformdata() {
      if (
        this.name_precent &&
        this.price &&
        this.image_precent &&
        this.category.length &&
        this.select.length
      ) {
        return true;
      } else {
        return false;
      }
    },
    get_data_present() {
      if(this.itemadit){
      if(this.itemadit.category){
        if(this.itemadit.category.length){
        this.category_subcategory = []
          for(let category of this.itemadit.category){
          
          if(category.subcategory.length){
            for(let sub of category.subcategory){
              this.category_subcategory.push(sub)

            } 

          }

        }  
              // for(let i of this.itemadit.subcategory){
                
              // if(!this.category_subcategory.includes(i)){
              //   let ind  = this.itemadit.subcategory.findIndex(function (elem) {
                  
	            //   return elem.id === i.id ;
              // });
              // // console.log(ind);
              // this.itemadit.subcategory.splice(ind,1)
              
              // }
              // }

        }
        else{
          this.itemadit.subcategory = []
          this.category_subcategory = []
        }
      } 
      }
      if(this.category.length){
        this.subcategory = []
        
        for(let category of this.category){
          
          if(category.subcategory.length){
            for(let sub of category.subcategory){
              this.subcategory.push(sub)
            } 
          }
        }  
      }
      else{
          this.subcategory = []
          this.category_subcategory = []
        }
        if(this.value){
          this.filtform = null;
          this.filtpovod = null
          this.filtcategory = null;
          if(this.value.split(':')[0] === 'артикул подарка'){
        this.items = this.data_presents.filter(elem => {
          if(elem.id === Number(this.value.split(':')[1])){
            return elem
          }
        });
        }
        if(this.value.split(':')[0] === 'имя подарка'){
          
        this.items = this.data_presents.filter(elem => {
          if(elem.name_precent === this.value.split(':')[1]){
            return elem
          }
          
        });
        
        }

        if(this.value.split(':')[0] === 'превью названия'){
          
        this.items = this.data_presents.filter(elem => {
          
          if(elem.prevue_name === String(this.value.split(':')[1])){
            return elem
          }
          
        });
        }
      
    }
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
            for (let i of elem.category){
          if(i.id === this.filtcategory){
            return elem
          }
            }
         
        });
      }
      if(this.filtform){
      this.items = this.data_presents.filter(elem => {
          if (elem.form_precent.length > 0) {
            return elem.form_precent[0].id === this.filtform;
          }
        });
      }
      if (!this.filtpovod && !this.filtcategory && !this.filtform && !this.value) {
        this.items = this.data_presents;
      }
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
    forsearch(){
      for(let i of this.data_presents){
        this.search_items.push(`артикул подарка:${i.id}`)
        this.search_items.push(`имя подарка:${i.name_precent}`)
        this.search_items.push(`превью названия:${i.prevue_name}`)
      }
      return this.search_items
    },
  },

  mounted() {},

  methods: {
    dialog_close(){
      this.image_precent = null;
          this.image = null;
          this.price = null;
          this.body = "";
          this.composition = "";
          this.prevue_name = "";
          this.name_precent = "";
          this.subcategory = []
          this.select = [];
          
          this.type = {};
          this.form = {};
          this.category = [];
      this.dialog_save = false
    },
    editItem(item){
      this.ind = this.data_presents.findIndex(function (elem) {
	    return elem.id === item.id;
    });
    
    this.itemadit = this.data_presents[this.ind]
    this.category = item.category
    this.for_sub_update = this.itemadit.subcategory
    for (let i of this.data_filter.categories){
      if (i.id === this.category.id){
        this.category.subcategory = i.subcategory
      }
    }
    this.form = item.form_precent[0]
    if (item.type_precent.length > 0) {
        this.type = item.type_precent[0].name_type;
      }
  
    // if (item.category.length > 0) {
    //     this.category = item.category[0].name_category;
    //   }
    this.dialogreset = true
    },
    sendDataform(){
  const headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken
      };
      let select_id = [];
      for (let i of this.select) {
        select_id.push(i.id);
      }
      let category_id = []
      for (let i of this.category) {
        category_id.push(i.id);
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
      bodyFormData.append("category_id", String(category_id));
      if (this.form.id) {
        bodyFormData.append("form_precent_id", this.form.id);
      }
      if (this.type.id) {
        bodyFormData.append("type_precent_id", this.type.id);
      }
      if (this.category_subcategory.length > 0) {
      let sub_id = [];
      for (let i of this.category_subcategory) {
        sub_id.push(i.id);
      }
        bodyFormData.append("sub_list_id",String(sub_id));
      }
      
      if (this.body) {
        bodyFormData.append("body", this.body);
      }
      bodyFormData.append("reason_for_precent_id", String(select_id));
      this.$axios
        .$post(`https://giftcity.kz/api/v1/present/`, bodyFormData, {
          headers: headers
        })
        .then(resp => {
          console.log(resp);
          this.dialog_save = false
          this.data_presents.push(resp);
          this.dialog_send = false;
          this.image_precent = null;
          this.image = null;
          this.price = null;
          this.body = "";
          this.composition = "";
          this.prevue_name = "";
          this.name_precent = "";
          this.subcategory = []
          this.category_subcategory = []
          this.select = [];
          this.type = {};
          this.form = {};
          this.category = [];
          this.itemadit = {}
        })
        .catch(function(error) {
          console.log("error");
        });
    },
    update(){
    let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken
      };
      
      let bodyFormData = new FormData();
      let select_id = [];
      for (let i of this.itemadit.reason_for_precent) {
        select_id.push(i.id);
      }
      let category_id = [];
      for (let i of this.itemadit.category){
        category_id.push(i.id);
      }
      bodyFormData.append("reason_for_precent_id", String(select_id));
      bodyFormData.append("category_id", String(category_id));
      if (this.for_sub_update.length > 0) {
      let sub_id = [];
      for (let i of this.itemadit.subcategory) {
        sub_id.push(i.id);
      }
     
        bodyFormData.append("sub_list_id",String(sub_id));
        
      }
      
      if(this.itemadit.prevue_name){
        bodyFormData.append("prevue_name", this.itemadit.prevue_name);
      }
      if(this.itemadit.name_precent){
        bodyFormData.append("name_precent", this.itemadit.name_precent);
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

      if (this.form) {
        bodyFormData.append("form_precent_id", this.form.id);
        this.itemadit.form_precent[0] = this.form;

      }
      if (this.type.id) {
        bodyFormData.append("type_precent_id", this.type.id);
        this.itemadit.type_precent[0] = this.type;

      }

      
      this.$axios
        .$put(
          `https://giftcity.kz/api/v1/present/${this.itemadit.id}`,
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
          this.data_presents[this.ind].subcategory = resp.subcategory
         
          this.ind = null
          this.image_precent = null;
          this.image = null;
        })
        .catch(function(error) {
          console.log(error);
        });
                    this.type = {};
           this.form = {};

      this.for_sub_update = []
      this.subcategory = []
                this.ind = null
          this.image_precent = null;
          this.image = null;
      this.close();
      
    },
    deleteItem(item){
      this.dialogDelete = true;
      this.deleteitemdict = item
    },
      deleteItemConfirm() {
        let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken
      };
      this.dialogDelete = false;
      this.$axios
        .$delete(`https://giftcity.kz/api/v1/present/${this.deleteitemdict.id}`, {
          headers: headers
        })
        .then(resp => {
          let numind = this.deleteitemdict.id
        this.ind = this.data_presents.findIndex(function (elem) {
	      return elem.id === numind 
        });
       
        this.data_presents.splice(this.ind , 1);
          this.dialogDelete = false;
          this.ind = null
        })
        .catch(function(error) {
          console.log(error);
        });
      
    },
    closeDelete(){
    this.dialogDelete = false
    },
 
    close(){
      this.ind = null
      this.itemadit = {}
      this.image = null
      this.dialogreset = false
      this.type = {};
      this.form = {};
      this.category = [];
      this.for_sub_update = []
      this.subcategory = []
      this.ind = null
      this.image_precent = null;
      this.image = null;
    },
    Onpage(item_id) {
      this.$router.push(`/admin/list_presents/${item_id}`);
    },
    prim_filtcat() {
      this.dialog2 = false;
    },
    ohForm(){
      this.filtpovod = null
        this.filtcategory = null
        this.value = null
       
    },
    onPovod(){
      console.log(2);
        this.filtform = null;
        this.filtcategory = null;
        this.value = null
       
    },
    onCat(){
      
        console.log(1);
        this.filtform = null;
        this.filtpovod = null;
        this.value = null
       
      
    },
       reset() {
      this.filtform = null;
      this.filtpovod = null;
      this.filtcategory = null;
    },
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