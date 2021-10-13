<template>
<div>
  <v-simple-table class="d-lg-block d-md-block d-none">
    <template v-slot:default>
      <thead>
        <tr>
          <th style="color:#1F2128" class="text-left">
            Фото товара
          </th>
          <th style="color:#1F2128" class="text-left">
            Наименование товара
          </th>
          <th style="color:#1F2128" class="text-left">
            Количество, шт
          </th>
        <th style="color:#1F2128" class="text-left">
            Бонусы
          </th>
        <th style="color:#1F2128" class="text-left">
            Итого
          </th>
        <th style="color:#1F2128" class="text-left">
           Закрыть
        </th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(item,index) in presents"
          :key="index"
        >
          <td>
              <img style="max-width: 8rem;" :src="item.image_precent" alt="">
          </td>
          <td>{{ item.name_precent}}</td>
          <td>
                             <div
            class="d-flex justify-start"
            style="
              width: 100%;
              height: 39px;
              margin-top: 0.7rem;
              margin-right: 1rem;
            "
          >
            <div style="flex-grow: 1; text-align: center; background: #f4f5f6">
              <v-btn block depressed @click="item_remove_count(item.id,index)"> - </v-btn>
            </div>
            <div style="flex-grow: 2;text-align: center;border: 1px solid whitesmoke;padding-top: .5rem;"
            >
            <span >{{item.count}}</span>
              
            </div>
            <div style="flex-grow: 1; text-align: center; background: #f4f5f6">
              <v-btn block depressed @click="item_add_count(item.id,index)"> + </v-btn>
            </div>
          </div>
          </td>
          <td>
              <span style="color:#FF7A00;font-weight: bold;">+500</span>
          </td>
          <td>
              {{item.price.toLocaleString()}}
          </td>
          <td>
              <v-btn @click="delete_present_in_basket(item.id,index)" text>
                  <img src="/clos.png" alt="">
              </v-btn>
          </td>
        </tr>
      </tbody>
    </template>
  </v-simple-table>


<div class="d-lg-none d-md-none d-block" >
           <v-card
           v-for="(item,index) in presents"
          :key="index"
         style="border: none;"
    class="mx-auto"
    
    outlined
  >
    <v-list-item three-line>
              <v-avatar
                
                size="125"
                tile
              >
                <v-img :src="item.image_precent"></v-img>
              </v-avatar>

      <v-list-item-content style="margin-left: 2em;">
        <div class=" mb-4" >
          <span>Название:</span> <span style="font-weight: 500;"> {{item.name_precent}}</span>
        </div>
        <v-list-item-title class=" mb-1">
          Цена: <span style="font-weight: 500;"> {{ item.price.toLocaleString() }} тг </span>
        </v-list-item-title>
        <v-list-item-subtitle>
         <span style="font-weight: 500;">Бонусы:</span>  <span style="color:#FF7A00;font-weight: bold;">+500</span>
        </v-list-item-subtitle>
      </v-list-item-content>


    </v-list-item>

    <v-card-actions >
     
        <v-col cols="6">
            <div
            class="d-flex justify-start"
            style="
              width: 100%;
              height: 36px;
              margin-top: ;
              margin-right: 1rem;
            "
          >
            <div style="flex-grow: 1; text-align: center; background: #f4f5f6">
              <v-btn block depressed @click="item_remove_count(item.id,index)"> - </v-btn>
            </div>
            <div style="flex-grow: 2;text-align: center;border: 1px solid whitesmoke;padding-top: .5rem;"
            >
            <span >{{item.count}}</span>
              
            </div>
            <div style="flex-grow: 1; text-align: center; background: #f4f5f6">
              <v-btn block depressed @click="item_add_count(item.id,index)"> + </v-btn>
            </div>
          </div>
          </v-col>
          <v-col cols="6" class="text-right">
            <v-btn text @click="delete_present_in_basket(item.id,index)">
              <fa style="color: #db4f4f;" icon="trash"></fa> 
            </v-btn>
            </v-col>
          
    </v-card-actions>
  </v-card>
        <hr>
</div>
</div>
</template>

<script>
  export default {
    props:[
      'presents',
      'delete_present_in_basket',
      'item_add_count',
      'item_remove_count'
      ],
    computed: {
    count() {
    if(this.count_present< 1){
        this.count_present= 1
      }
      return this.count_present
        },
    
    },

    data () {
      return {
        count_present:1,
        
      }
    },
  }
</script>

<style lang="" scoped>

</style>