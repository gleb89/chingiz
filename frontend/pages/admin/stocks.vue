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

      
      <v-dialog v-model="dialog_send" persistent max-width="600px">
        <template v-slot:activator="{ on, attrs }">
          <div v-if="admin_data.present_change" style="width: 100%; padding: 1rem">
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
            <span class="text-h5">Акции</span>
          </v-card-title>
          <v-card-text>
            <v-container class="">
              <v-row justify="start">
                <h2 class="text-start">Добавить акцию</h2>
               
                <v-col cols="12">
                  <v-form ref="form_com_children" lazy-validation>
                         <v-text-field
                        v-model="name_stock"
                        label="Название акции"
                        :rules="[v => !!v || 'Не может быть пустым']"
                      ></v-text-field>
                     <v-text-field
                        v-model="body_stock"
                        :rules="[v => !!v || 'Не может быть пустым']"
                        label="Описание акции"
                      ></v-text-field>
                    <v-text-field
                        v-model="conditions"
                        label="Условие акции"
                        :rules="[v => !!v || 'Не может быть пустым']"
                      ></v-text-field>
                      <v-file-input
                        v-model="image"
                        :rules="rulesImage"
                        accept="image/png, image/jpeg, image/png"
                        placeholder="Загрузите изображение"
                        prepend-icon="mdi-camera"
                        required
                        label="Загрузите изображение"
                      ></v-file-input>
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
                   <v-col cols="12">
                        <v-text-field
                          v-model="editedItem.name_stock"
                          label="Название акции"
                          
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-text-field
                          v-model="editedItem.body_stock"
                          
                          label="Описание акции"
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-text-field
                          v-model="editedItem.conditions"
                          label="Условие акции"
                          
                        ></v-text-field>
                      </v-col>
                      <v-col cols="12">
                        <v-file-input
                          v-model="image"
                          :rules="rulesImage"
                          accept="image/png, image/jpeg, image/png"
                          placeholder="Загрузите изображение"
                          prepend-icon="mdi-camera"
                          
                          label="Загрузите изображение"
                        ></v-file-input>
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
          <template v-slot:item.imagess="{ item }">
          <img  style="width: 10rem;" :src="item.image" alt="none">

        </template>

        <!-- изменить удалить -->
        <template v-slot:item.actions="{ item }">
          <v-icon small class="mr-2" @click="editItem(item)">
            mdi-pencil
          </v-icon>
          <v-icon  small @click="deleteItem(item)"> mdi-delete </v-icon>
        </template>
 
      </v-data-table>
    </v-card>
  </v-container>
</template>
 
<script>
import { mapState } from "vuex";
export default {
  layout: "admin",

  asyncData({ $axios }) {
    const headers = {
      "Content-Type": "application/json"
    };
    return $axios
      .$get(`https://giftcity.kz/api/v1/present/stocks/`, {
        headers: headers
      })
      .then(stocks => {
        return { stocks };
      });
  },

  data: () => ({
    name_precent: "",
    price: null,
    img_open :false,
    composition: "",
 
   
    dialog: false,
    dialogDelete: false,
     name_stock: "",
    body_stock: "",
    conditions: "",
    dialog: false,
    dialog_send: false,
    dialogDelete: false,
    image: null,
    headers: [
      { text: "Название акции", value: "name_stock" },
      { text: "Изображение", value: "imagess", sortable: false },
      { text: "Описание", value: "body_stock", sortable: false },
      { text: "Условие", value: "conditions", sortable: false },
      { text: "Изменить/ удалить", value: "actions", sortable: false }
    ],
    items: [],
    rulesImage: [
      value =>
        !value ||
        value.size < 8000000 ||
        "Avatar size should be less than 8 MB!"
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
     admin_data(){
       return this.$store.state.localStorage.admin_data
       },
   
    onlformdata() {
       if (this.name_stock && this.body_stock && this.conditions && this.image) {
        return true;
      } else {
        return false;
      }
    },

    get_items() {
      this.items = this.stocks ;
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
 
    let bodyFormData = new FormData();
      bodyFormData.append("image", this.image);
      bodyFormData.append("name_stock", this.name_stock);
      bodyFormData.append("body_stock", this.body_stock);
      bodyFormData.append("conditions", this.conditions);
      let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken
      };
      this.$axios
        .$post(`https://giftcity.kz/api/v1/present/stocks/`, bodyFormData, {
          headers: headers
        })
        .then((resp) => {
          
          this.items.push(resp) 
          this.dialog_send = false;
        })
        .catch(function (error) {
          console.log("error");
        });
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
      if(this.image){
          bodyFormData.append("image", this.image);
      }
 
          bodyFormData.append("name_stock", this.editedItem.name_stock);
 
    
        bodyFormData.append("body_stock", this.editedItem.body_stock);
    
      
 
        bodyFormData.append("conditions", this.editedItem.conditions);
   
      
      this.$axios
        .$post(
          `https://giftcity.kz/api/v1/present/stocks/update/${this.editedItem.id}`,
          bodyFormData,
          {
            headers: headers
          }
        )
        .then(resp => {
            console.log(resp);
          this.stocks= resp
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
        .$delete(`https://giftcity.kz/api/v1/present/stocks/${this.editedItem.id}`, {
          headers: headers,
        })
        .then((resp) => {
          
        })
        .catch(function (error) {
          console.log(error);
        });
    },
  },
};
</script>

<style  >
  .v-data-table-header{
    background: rgb(236, 224, 253) none repeat scroll 0% 0%;
  }
</style>


