<template>
  <v-container >
    <h2>Формы корзин</h2>
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
          <div v-if="admin_data.filters_present_change" style="width: 100%;padding: 1rem;">
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
          <span class="text-h5">Формы корзины</span>
        </v-card-title>
        <v-card-text>
          <v-container>
                    <v-row>
                    <v-col cols="12">
                      <v-text-field
                        v-model="name_form"
                        label="Название формы корзины"
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
        <v-toolbar flat checkbox-color="blue">
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
                        v-model="editedItem.name_form"
                        label="Название повода корзины"
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
                >Вы действительно хотите  форму корзины?</v-card-title
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
            <template v-slot:item.index="{ item,index }">
       {{index+1}}
      </template>
      <template v-slot:item.actions="{ item }">
        <v-icon v-if="admin_data.filters_present_change" small class="mr-2" @click="editItem(item)"> mdi-pencil </v-icon>
        <v-icon v-if="admin_data.filters_present_change" small @click="deleteItem(item)"> mdi-delete </v-icon>
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
      .$get(`https://giftcity.kz/api/v1/present/form_product/`, {
        headers: headers,
      })
      .then((form_presents) => {
        return { form_presents };
      });
  },

  data: () => ({
    name_form: "",
    dialog: false,
    dialog_send: false,
    dialogDelete: false,
    headers: [
      { text: "номер формы", value: "index" },
      { text: "Название", value: "name_form" },
      { text: "Изменить/ удалить", value: "actions", sortable: false,},
    ],
    items: [],
    search: "",
    editedIndex: -1,
    editedItem: {},
  }),

  computed: {
    get_items() {
      this.items = this.form_presents;
      return this.items;
    },
       admin_data(){
       return this.$store.state.localStorage.admin_data
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
    createForm() {
      this.dialog_send = false;
      let data = {
        name_form: this.name_form,
      };
      let headers = {
        "Content-Type": "application/json",
        Authorization: this.$store.state.localStorage.jwtToken,
      };

      this.$axios
        .$post(`https://giftcity.kz/api/v1/present/form_product/`, data, {
          headers: headers,
        })
        .then((resp) => {
          this.items.push(resp);
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
        Authorization: this.$store.state.localStorage.jwtToken,
      };

      Object.assign(this.items[this.editedIndex], this.editedItem);

      this.$axios
        .$get(
          `https://giftcity.kz/api/v1/present/form_product/update/${this.editedItem.id}?name_form=${this.editedItem.name_form}`,
          {
            headers: headers,
          }
        )
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
        Authorization: this.$store.state.localStorage.jwtToken,
      };
      this.$axios
        .$delete(`https://giftcity.kz/api/v1/present/form_product/${this.editedItem.id}`, {
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
