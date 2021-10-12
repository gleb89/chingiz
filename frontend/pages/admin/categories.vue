<template>
  <v-simple-table>
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-left">
            id категории
          </th>
          <th class="text-left">
            Название категории
          </th>
          <th class="text-left">
            Изображение
          </th>
          <th class="text-left">
            Изменить/Удалить
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
          v-for="item in items  "
          :key="item.id"
          class="drag-el"
          draggable="true"
          @dragstart="startDrag($event,item)"
        >
        <td>{{ item.id}}</td>
          <td>{{ item.name_category }}</td>
          <td>
            <img style="width: 10rem;"  :src="item.icon" alt="">
          </td>
          <td>
        <v-icon v-if="admin_data.filters_present_change" small class="mr-2" @click="editItem(item)"> mdi-pencil </v-icon>
        <v-icon v-if="admin_data.filters_present_change" small @click="deleteItem(item)"> mdi-delete </v-icon>
          </td>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>
 
<script>

export default {
  layout: "admin",
  asyncData({ $axios }) {
    const headers = {
      "Content-Type": "application/json",
    };
    return $axios
      .$get(`http://api-booking.ru/api/v1/present/categories/`, {
        headers: headers,
      })
      .then((category_presents) => {
        return { category_presents};
      });
  },

  data: () => ({
    name_category: '',
    dialog: false,
    rulesImage: [
      (value) =>
        !value ||
        value.size < 2000000 ||
        "Avatar size should be less than 2 MB!",
    ],
    dialog_send:false,
    dialogDelete: false,
    image_precent:null,
    headers: [
      { text: "id формы", value: "id" },
      { text: "Название", value: "name_category" },
       { text: "Изображение", value: "icon", sortable: false },
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
      startDrag(event,item){
  console.log(item);
  event.dataTransfer.dropEffect = "move"
  event.dataTransfer.effectAllowed = "move"
  event.dataTransfer.setData("itemID",item.id) 
},
  onDrop(event,drop_item){
  
  const itemID =  event.dataTransfer.getData("itemID")
  // const item = this.items.value.find((item) => item.id == itemID)
  console.log(itemID);
  console.log(drop_item.id);

  // for(let i of this.items){
  //   if(i.id == itemID){
  //      i.id = itemID
  //   }
  // }
  // event.dataTransfer.setData("itemID",item.id) 
  // item.list = list
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
        .$post(`http://api-booking.ru/api/v1/present/categories/?category_name=${this.name_category}`,bodyFormData ,{
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
      let bodyFormData = new FormData();
      if (this.image_precent) {
        bodyFormData.append("image", this.image_precent);
        
      }

      
      bodyFormData.append("name_category", this.editedItem.name_category);
      
      this.$axios
        .$post(`http://api-booking.ru/api/v1/present/categories/update/${this.editedItem.id}`, bodyFormData, {
          headers: headers
        })
        .then((resp) => {
         console.log(resp);
         this.category_presents = resp
          
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
        .$delete(`http://api-booking.ru/api/v1/present/categories/${this.editedItem.id}`,{
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
