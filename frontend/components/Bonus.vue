<template>
  <v-simple-table>
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-left">
            Дата
          </th>
          <th class="text-left">
            Начислены
          </th>
          <th class="text-left">
            Бонусы
          </th>
          <th class="text-left">
            Сумма в <br> чеке
          </th>
        </tr>
      </thead>
      <tbody>
        <tr
        
            style="color:black;cursor:pointer"
          v-for="(item,index) in bonus_data"
          :key="index"
          :class="{ active: index % 2 }"
        >
                  <td style="height: 5rem;" ><span class="tdd">{{ new Date(item.timestamp).toLocaleDateString()}}</span> </td>
          <td style="height: 5rem;"  ><span class="tdd">{{item.enum_povod}}</span> </td>

          <td style="height: 5rem;color:#ff7a00"  ><span class="tdd">{{item.count_points}}</span> </td>
          <td style="height: 5rem;"  ><span class="tdd">{{item.summ_check.toLocaleString()}} тг</span> </td>
       
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>

<script>
export default {
    props:['bonus_data']
}
</script>

<style scoped>
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