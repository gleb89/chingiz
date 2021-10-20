<template>
<div>
            <div v-if="admin_data.filters_present_change" style="width: 100%;padding: 1rem;">
        <v-btn
        @click="dialogform = true"
      class="mx-2"
      fab
      dark
      color="indigo"
    >
<v-icon dark style="color:white"> mdi-plus </v-icon>
    </v-btn>
    </div>
    <v-dialog v-model="dialogsub" max-width="500px">
            <!-- изменить -->
            <v-card>
              <v-card-title>
                <span class="text-h5">Создать подкатегорию категории: </span>
                <p style="font-size:1.3em">{{itemSub.name_category}}</p>
              </v-card-title>

              <v-card-text>
                <v-container>
                  <v-row>
                <v-col cols="12">
                      <v-text-field
                        v-model="name_subcategory"
                        label="Название подкатегории корзины"
                        :rules="rulessub"
                      ></v-text-field>
                    </v-col>
    

                  </v-row>
                </v-container>
              </v-card-text>

              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="dialogsub = false">
                  Отмена
                </v-btn>
                <v-btn color="blue darken-1" text @click="createSub">
                  Сохранить
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>

    <v-dialog v-model="dialogresetsub" max-width="500px">
            <!-- изменить -->
            <v-card>
              <v-card-title>
                <span class="text-h5">Изменить подкатегорию: </span>
                
              </v-card-title>

              <v-card-text>
                <v-container>
                  <v-row>
                <v-col cols="12">
                      <v-text-field
                        v-model="name_subcategory"
                        label="Название подкатегории корзины"
                        :rules="rulessub"
                      ></v-text-field>
                    </v-col>
    

                  </v-row>
                </v-container>
              </v-card-text>

              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="dialogresetsub= false">
                  Отмена
                </v-btn>
                <v-btn color="blue darken-1" text @click="sendResetSub">
                  Сохранить
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
      <v-dialog v-model="dialogformupdate" max-width="500px">
            <!-- изменить -->
            <v-card>
              <v-card-title>
                <span class="text-h5">Изменить категорию</span>
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
                    <v-col cols="12">
                      <v-file-input
                      v-model="image_precent"
                      :rules="rulesImage"
                      accept="image/png, image/jpeg, image/png"
                      placeholder="Загрузите изображение"
                      prepend-icon="mdi-camera"
                      required
                      
                      label="Изменить изображение изображение"
                    ></v-file-input>
                </v-col>

                  </v-row>
                </v-container>
              </v-card-text>

              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="dialogformupdate = false">
                  Отмена
                </v-btn>
                <v-btn color="blue darken-1" text @click="save">
                  Сохранить
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
<v-dialog v-model="dialogform" max-width="500px">
            <!-- изменить -->
            <v-card>
              <v-card-title>
                <span class="text-h5">Создать категорию</span>
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
                    <v-col cols="12">
                                        <v-file-input
                      v-model="image_precent"
                      :rules="rulesImage"
                      accept="image/png, image/jpeg, image/png"
                      placeholder="Загрузите изображение"
                      prepend-icon="mdi-camera"
                      required
                      
                      label="Загрузите изображение"
                    ></v-file-input>
                </v-col>

                  </v-row>
                </v-container>
              </v-card-text>

              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="dialogform = false">
                  Отмена
                </v-btn>
                <v-btn color="blue darken-1" text @click="createForm">
                  Сохранить
                </v-btn>
              </v-card-actions>
            </v-card>
          </v-dialog>
   <v-dialog v-model="dialogDelete" max-width="500px">
            <v-card>
              <v-card-title class="text-h5"
                >Вы действительно хотите удалить категорию корзины?</v-card-title
              >
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="dialogDelete = false"
                  >Отмена</v-btn
                >
                <v-btn color="blue darken-1" text @click="deleteItemConfirm"
                  >Да</v-btn
                >
                <v-spacer></v-spacer>
              </v-card-actions>
            </v-card>
          </v-dialog>

   <v-dialog v-model="dialogSubDelete" max-width="500px">
            <v-card>
              <v-card-title class="text-h5"
                >Вы действительно хотите  подкатегорию</v-card-title
              >
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="dialogSubDelete = false"
                  >Отмена</v-btn
                >
                <v-btn color="blue darken-1" text @click="deleteSubItemConfirm"
                  >Да</v-btn
                >
                <v-spacer></v-spacer>
              </v-card-actions>
            </v-card>
          </v-dialog>


  

  <v-simple-table>
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-left">
            Название категории
          </th>
          <th class="text-left">
            Изображение
          </th>
          <th class="text-left">
            Изменить/Удалить
          </th>
                    <th class="text-left">
            Создать подкатегорию
          </th>
          <th class="text-center">
            Подкатегории
          </th>

        </tr>
      </thead>
      <tbody
       class="drop-zone"

        >
        {{get_items}}
        <tr
        @drop="onDrop($event,item)"
        @dragenter.prevent
        @dragover.prevent
          v-for="(item,index) in items  "
          :key="index"
          class="drag-el"
          draggable="true"
          @dragstart="startDrag($event,item)"
        >
          <td>{{ item.name_category }}</td>
          <td>
            <img style="width: 10rem;"  :src="item.icon" alt="">
          </td>
          <td>
        <v-icon v-if="admin_data.filters_present_change" small class="mr-2" @click="editItem(item)"> mdi-pencil </v-icon>
        <v-icon v-if="admin_data.filters_present_change" small @click="deleteItem(item)"> mdi-delete </v-icon>
                    <td>
        <v-btn
        @click="openSupcategory(item)"
      class="mx-2"
      fab
      dark
      color="info"
    >
<v-icon dark style="color:white"> mdi-plus </v-icon>
    </v-btn>
          </td>
          
          <td >
                   
          
              <v-sheet
    class="mx-auto"
    max-width="700"
  >
      <v-slide-group
              
      multiple
      show-arrows
    >
      <v-slide-item
       v-for="(i, index) in item.subcategory" :key="i.id"
        v-slot="{ active, toggle }"
      >
       <v-btn
       text
          
        >
        <div style="font-size: 1.2em;font-weight: bold;display: flex;justify-content: flex-start;align-items: center;">
             <div>
                      <v-chip
      class="ma-2"
      color="cyan"
      label
      style="padding: 1em;"
      @click="resetSub(item,i,i.name_subcategory,index)"    
      text-color="white"
    >
       <v-icon left>
        mdi-label
      </v-icon>
                 <span>{{index+1}}.</span> {{i.name_subcategory}}  <v-icon style="font-size:1.2em;color:green;cursor:pointer;margin-left:1rem" v-if="admin_data.filters_present_change" small class="mr-2" > mdi-pencil </v-icon>
                </v-chip>
             </div>
               <div class="text-center">
              <v-icon @click="deleteSub(item,i,index)" style="font-size:1.2em;color:red;cursor:pointer" v-if="admin_data.filters_present_change" small > mdi-delete </v-icon>
             </div>
             
            </div>
        </v-btn>
      </v-slide-item>
    </v-slide-group>

           
       </v-sheet>
          </td>

        </tr>
      </tbody>
    </template>
  </v-simple-table>
  </div>
</template>
 
<script>

export default {
  layout: "admin",
  asyncData({ $axios }) {
    const headers = {
      "Content-Type": "application/json",
    };
    return $axios
      .$get(`http://giftcity.kz/api/v1/present/categories/`, {
        headers: headers,
      })
      .then((category_presents) => {
        return { category_presents};
      });
  },

  data: () => ({
    name_category: '',
    dialog: false,
    name_subcategory:'',
    rulesImage: [
      (value) =>
        !value ||
        value.size < 2000000 ||
        "Avatar size should be less than 2 MB!",
    ],
    dialogformupdate:false,
    itemSub:{},
    dialog_send:false,
    category_id:null,
    dialogDelete: false,
    image_precent:null,
    dialogform:false,
    items: [],
    indSub:null,
    rulessub:[v => !!v || 'Не может быть пустым'],
    item_id:null,
    dialogSubDelete:false,
    dialogresetsub:false,
    dialogsub:false,
    search: '',
    editedIndex: -1,
    editedItem: {},
  }),

  computed: {

    get_items() {
      this.items = this.category_presents;
     
    },
       admin_data(){
       return this.$store.state.localStorage.admin_data
       },
  },

  watch: {
    dialog(val) {
      val || this.close();
    },
 
  },

  methods: {
  openSupcategory(item ){
    this.name_subcategory = ''
    this.itemSub = item
    this.dialogsub = true
  },
  resetSub(category,item,name,index){
    this.category_id = category.id
    
    this.indSub = index
   
    this.itemSub = item
    this.name_subcategory = name
    this.dialogresetsub = true
  },
  deleteSub(category,item,index){
    this.category_id = category.id
    this.indSub = index
  
   
    this.itemSub = item
    
    this.dialogSubDelete = true
  },
  deleteSubItemConfirm(){
  let headers = {
         "Content-Type": "application/json",
        "Authorization":this.$store.state.localStorage.jwtToken
       };
       let indd = this.indSub
      this.$axios
        .$delete(`http://giftcity.kz/api/v1/present/subcategories/${this.itemSub.id}`,{
          headers: headers
        })
        .then((resp) => {
        
        
        let cat_id = this.category_id
        
        let ind  = this.category_presents.findIndex(function (elem) {
	      return elem.id === cat_id ;
        });
         
 
        this.category_presents[ind].subcategory.splice([indd], 1)
      
        })
        .catch(function (error) {
         console.log(error);
        });
        this.itemSub = {}
        this.indSub = null
        this.name_subcategory = ''
  
    this.dialogSubDelete = false
  }, 
  sendResetSub(){
    let headers = {
         "Content-Type": "application/json",
        "Authorization":this.$store.state.localStorage.jwtToken
       };
       let indd = this.indSub
      this.$axios
        .$put(`http://giftcity.kz/api/v1/present/subcategories/${this.itemSub.id}?name_subcategory=${this.name_subcategory}`,{
          headers: headers
        })
        .then((resp) => {
        
        
        let cat_id = this.category_id
        
        let ind  = this.category_presents.findIndex(function (elem) {
	      return elem.id === cat_id ;
        });
         
 
        this.category_presents[ind].subcategory[indd].name_subcategory = resp.name_subcategory
      
        })
        .catch(function (error) {
         console.log(error);
        });
        this.itemSub = {}
        this.indSub = null
        this.name_subcategory = ''
        this.dialogresetsub = false
  },
createSub(){
  if(this.name_subcategory){
  let headers = {
         "Content-Type": "application/json",
        "Authorization":this.$store.state.localStorage.jwtToken
       };
       let pk = this.itemSub.id
      this.$axios
        .$post(`http://giftcity.kz/api/v1/present/subcategories/?name_subcategory=${this.name_subcategory}&id_category=${this.itemSub.id}`,{
          headers: headers
        })
        .then((resp) => {
        
        
        let ind  = this.category_presents.findIndex(function (elem) {
	      return elem.id === pk;
        });
        
        this.category_presents[ind].subcategory.push(resp)
        })
        .catch(function (error) {
         console.log(error);
        });
        this.itemSub = {}
        this.name_subcategory = ''
      this.dialogsub = false
      
  }
  else{
    this.rulessub
  }

},
      startDrag(event,item){
  
  event.dataTransfer.dropEffect = "move"
  event.dataTransfer.effectAllowed = "move"
  event.dataTransfer.setData("itemID",item.id) 
  event.dataTransfer.setData("serial_number_one",item.serial_number) 
},
  onDrop(event,drop_item){
  
  const id_one =  event.dataTransfer.getData("itemID")
  const id_two = drop_item.id
  
 
  this.updateSerialNumb(id_one,id_two )
},
updateSerialNumb(id_one,id_two ){
        let headers = {
         "Content-Type": "application/json",
        "Authorization":this.$store.state.localStorage.jwtToken
       };
       console.log(id_one,id_two );
      this.$axios
        .$put(`http://giftcity.kz/api/v1/present/categories/update/serial/${id_one}/${id_two}`,{
          headers: headers
        })
        .then((resp) => {
         this.category_presents = resp
         this.image_precent =  null
          
        })
        .catch(function (error) {
         console.log(error);
        });
},
      createForm(){
          this.dialog_send = false
  
          let bodyFormData = new FormData();
          bodyFormData.append("image", this.image_precent);
          let headers = {
         "Content-Type": "application/json",
        "Authorization":this.$store.state.localStorage.jwtToken
       };
       
      this.$axios
        .$post(`http://giftcity.kz/api/v1/present/categories/?category_name=${this.name_category}`,bodyFormData ,{
          headers: headers
        })
        .then((resp) => {
         this.items.push(resp)
         this.dialogform = false
         this.image_precent =  null
          
        })
        .catch(function (error) {
         console.log(error);
        });
      },
    editItem(item) {
      this.name_category = item.name_category
    this.item_id = item.id
    this.dialogformupdate = true
    },

    deleteItem(item) {
      this.item_id = item.id
      this.dialogDelete = true
    },

    deleteItemConfirm() {
   let headers = {
         "Content-Type": "application/json",
        "Authorization":this.$store.state.localStorage.jwtToken
       };
        this.$axios
        .$delete(`http://giftcity.kz/api/v1/present/categories/${this.item_id}`,{
          headers: headers
        })
        .then((resp) => {
         this.category_presents = resp
         this.dialogDelete = false
        })
        .catch(function (error) {
         console.log(error);
        });
    },

    close() {
      this.dialog = false;
      this.image_precent =  null
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
       
       
      let bodyFormData = new FormData();
      if (this.image_precent) {
        bodyFormData.append("image", this.image_precent);
        
      }

      
      bodyFormData.append("name_category", this.name_category);
      
      this.$axios
        .$post(`http://giftcity.kz/api/v1/present/categories/update/${this.item_id}`, bodyFormData, {
          headers: headers
        })
        .then((resp) => {
         
         this.category_presents = resp
         this.dialogformupdate = false
         this.image_precent =  null
          
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
        .$delete(`http://giftcity.kz/api/v1/present/categories/${this.editedItem.id}`,{
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
