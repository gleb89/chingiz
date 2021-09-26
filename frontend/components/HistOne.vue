<template>
      <v-simple-table class="">
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
            Кол-во
          </th>
        <th style="color:#1F2128" class="text-left">
            Бонусы
          </th>
        <th style="color:#1F2128" class="text-left">
            <span class="tdd" >Итого</span>
           
        </th>
        </tr>
      </thead>
      <tbody>
                  <tr
          v-for="(item,index) in items.history"
          :key="index"
        >
        
        <td  style="max-width: 3rem;height: 10rem;">
            <img style="max-width: 4rem;" :src="item.image_precent" alt="">
        </td>
        <td  style="max-width: 4rem;height: 10rem;">
            <span class="tdd">{{item.name_precent}}</span>
        </td>
   
               <td style="max-width: 2rem;height: 10rem;">
            <span class="tdd" >{{item.count}}</span>
        </td>
             <td  style="max-width: 2rem;height: 2rem;color:#ff7a00">
            <span class="tdd" > +500</span>
        </td>
             <td  style="max-width: 2rem;height: 10rem;">
            <span class="tdd" >{{item.price}}  тг</span>
        </td>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>

<script>
export default {
    props:['items']
}
</script>

<style scoped>
@media (max-width:500px){
.tdd{
    font-size: .7rem;
    
}

}  
</style>