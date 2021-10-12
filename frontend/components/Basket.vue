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

  <v-simple-table class="d-lg-none d-md-none d-block">
    <template v-slot:default>
      <thead>
   <tr>
          <th style="color:#1F2128" class="text-center">
            Фото 
          </th>
          <th style="color:#1F2128" class="text-center">
            Цена
          </th>
          <th style="color:#1F2128" class="text-center">
            Кол-во
          </th>
        <th style="color:#1F2128" class="text-center">
            Бонусы
          </th>
        <th style="color:#1F2128" class="text-center">
            Удалить
          </th>

        </tr>
      </thead>
      <tbody style="min-height:5rem">
        <tr
          v-for="(item,index) in presents"
          :key="index"
        >
        <!-- <p style="position: absolute;">{{item.prevue_name}}: {{ item.name_precent}}</p> -->
          <td style="max-width: 4rem;height: 10rem;"><img style="max-width: 4rem;" :src="item.image_precent" alt=""></td>
          <td style="height: 10rem;max-width: 3rem;"><span style="font-weight: bold;">{{ item.price.toLocaleString() }} тг</span> </td>
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
          <td style="max-width: 3rem;height: 10rem;width:1rem"> <span style="color:#FF7A00;font-weight: bold;">+500</span></td>
          <td style="height: 10rem;width:1rem">
                          <v-btn @click="delete_present_in_basket(item.id,index)" text>
                  <img style="max-width: .7rem;" src="/clos.png" alt="">
              </v-btn>
          </td>

        </tr>
      </tbody>
    </template>
  </v-simple-table>

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