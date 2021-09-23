<template>
  <v-simple-table>
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-left">
            Дата
          </th>
          <th class="text-left">
            Оплата
          </th>
          <th class="text-left">
            N-чека
          </th>
          <th class="text-left">
            Бонусы
          </th>
          <th class="text-left">
            Сумма
          </th>
        </tr>
      </thead>
      <tbody>
        <tr
            style="color:black;"
          v-for="(item,index) in data_history"
          :key="index"
          :class="{ active: index % 2 }"
          
        >
          <td style="height: 5rem;" ><span class="tdd">{{ new Date(item.dict_basket.date).toLocaleDateString()}}</span> </td>
          <td style="height: 5rem;"  ><span class="tdd">безнал.</span> </td>
          <td style="height: 5rem;"  ><span class="tdd">EL{{item.dict_basket.zakaz_num}}</span> </td>
          <td style="height: 5rem;color:#ff7a00"  ><span class="tdd">+300</span> </td>
          <td style="height: 5rem;"  ><span class="tdd">{{item_summ(item.dict_basket.present_basket).toLocaleString()}} тг</span> </td>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>

<script>
export default {
    props:['data_history'],
    methods: {
        item_summ(items) {
            let summ = 0
           for  (let i of items){
               summ += i.price
            }
            return summ
        },
    },
}
</script>

<style >
    @media (max-width:500px){
        .tdd{
            font-size: .7rem;
            
        }
        
    }
.active{
    background: gray;
    color: black;
}
</style>