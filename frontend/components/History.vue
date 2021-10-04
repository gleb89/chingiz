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
        
            style="color:black;cursor:pointer"
          v-for="(item,index) in data_history"
          :key="index"
          :class="{ activel: index % 2 }"
          @click="onPageHistory(item.id)"
        >
        
          <td style="height: 5rem;" ><span class="tdd">{{new Date(item.timestamp).toLocaleDateString()}}</span> </td>
          <td style="height: 5rem;"  ><span v-if="item.fiz_oplata" class="tdd">физ.опл</span>
          <span v-if="item.ur_oplata" class="tdd">юр.опл</span>
           </td>
          <td style="height: 5rem;"  ><span class="tdd">EL{{item.id}}</span> </td>
          <td style="height: 5rem;color:#ff7a00"  ><span class="tdd">+500</span> </td>
          <td style="height: 5rem;"  ><span class="tdd">{{item.summa}} тг</span> </td>
       
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>

<script>
export default {
    props:['data_history','onPageHistory'],
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

<style scoped>
    @media (max-width:500px){
        .tdd{
            font-size: .7rem;
            
        }
        
    }
/* AIzaSyBA_gkIXK0VDwh4kC6Ip_RcEjsu60bW2Ok */
/* 991019846898-a5mgag4e7atbdl2infioliaqhn3n99sp.apps.googleusercontent.com */
/* bWB7SIQeyl7BhORR0wZRZG3Q */
.activel{
    background: rgb(240, 236, 236);
    color: black;
}
</style>

