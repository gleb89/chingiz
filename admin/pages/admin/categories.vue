<template>
  <v-container >
    <h2>Категории корзин</h2>
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
    <template>
  <v-row justify="center">
    <v-dialog
      v-model="dialog_send"
      persistent
      max-width="600px"
    >
      <template v-slot:activator="{ on, attrs }">
          <div style="width: 100%;padding: 1rem;">
        <v-btn
        v-bind="attrs"
        v-on="on"
      class="mx-2"
      fab
      dark
      color="indigo"
    >
<v-icon dark style="color:white"> mdi-plus </v-icon>
    </v-btn>
    </div>
      </template>
      <v-card>
        <v-card-title>
          <span class="text-h5">Категории  корзины</span>
        </v-card-title>
        <v-card-text>
          <v-container>
                    <v-row>
                    <v-col cols="12">
                      <v-text-field
                        v-model="name_category"
                        label="Название категории корзины"
                      ></v-text-field>
                    </v-col>

                  </v-row>
          </v-container>
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          
          <v-btn
            color="blue darken-1"
            text
            @click="dialog_send = false"
          >
            Отмена
          </v-btn>
          <v-btn
            color="blue darken-1"
            text
            @click="createForm"
          >
            Сохранить
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-row>
</template>
    <v-data-table
    id="list-table"
     :headers="headers"
    :items="get_items"
    :search="search"
    
    >
      <template v-slot:top >
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
                        v-model="editedItem.name_category"
                        label="Название формы корзины"
                      ></v-text-field>
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
                >Вы действительно хотите категорию корзины?</v-card-title
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
      <!-- изменить удалить -->
      <template v-slot:item.actions="{ item }">
        <v-icon small class="mr-2" @click="editItem(item)"> mdi-pencil </v-icon>
        <v-icon small @click="deleteItem(item)"> mdi-delete </v-icon>
      </template>
    </v-data-table>
    </v-card>
  </v-container>
</template>
 
<script>
export default {
  layout: "admin",
  asyncData({ $axios }) {
    const headers = {
      "Content-Type": "application/json",
    };
    return $axios
      .$get(`/api/present/categories/`, {
        headers: headers,
      })
      .then((category_presents) => {
        return { category_presents};
      });
  },

  data: () => ({
    name_category: '',
    dialog: false,
    dialog_send:false,
    dialogDelete: false,
    headers: [
      { text: "id формы", value: "id" },
      { text: "Название", value: "name_category" },
      { text: "Изменить/ удалить", value: "actions", sortable: false },
    ],
    items: [],
    search: '',
    editedIndex: -1,
    editedItem: {},
  }),

  computed: {
    get_items() {
      this.items = this.category_presents;
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
      createForm(){
          this.dialog_send = false
          let data = {
              name_category:this.name_category
          }
          let headers = {
         "Content-Type": "application/json",
        "Authorization":this.$store.state.localStorage.jwtToken
       };
       
      this.$axios
        .$post(`/api/present/categories/`,data ,{
          headers: headers
        })
        .then((resp) => {
         this.items.push(resp)
          
        })
        .catch(function (error) {
         console.log(error);
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
        "Authorization":this.$store.state.localStorage.jwtToken
       };
       
       Object.assign(this.items[this.editedIndex], this.editedItem);

      this.$axios
        .$get(`/api/present/categories/update/${this.editedItem.id}?name_category=${this.editedItem.name_category}`, {
          headers: headers
        })
        .then((resp) => {
         console.log(resp);
          
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
        "Authorization":this.$store.state.localStorage.jwtToken
       };
        this.$axios
        .$delete(`/api/present/categories/${this.editedItem.id}`,{
          headers: headers
        })
        .then((resp) => {
         this.items = resp

        })
        .catch(function (error) {
         console.log(error);
        });
      


      
    },
  },
};
</script>
