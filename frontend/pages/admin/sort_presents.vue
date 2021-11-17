<template>
    <v-container>
        <v-row justify="center" style="">
          <!-- Подарочные корзины -->
          <v-col cols="12">
          <h2>Подарочные корзины</h2>
          <v-row justify="center" class="drop-zone" style="">
            <v-col 
            style="min-height:40vh"
                @drop="onDrop($event,present)"
                @dragenter.prevent
                @dragover.prevent
                    
                draggable="true"
                @dragstart="startDrag($event,present)"
              class="d-flex justify-center drag-el"
              v-for="(present,index) in pres_for_podarok"
              :key="index"
              cols="12" lg="3" md="3"
            >
                <v-card
      style="box-shadow: none;max-height:500px;position: relative;padding:1rem;max-width:100%"
      width="400"
    >
      <div
        style="text-align: start;"
        
      ></div>
      <div style="width:100%;text-align: center;">
        <img
        
          style="height: 10em;width: auto;max-width:100%"
         
          class="img"
          :src="present.image_precent"
        />
      </div>
  
      <hr />
      <v-card-title style="height: 6em;" >
        <h4 class="hh4" style="font-size: 0.9rem;text-align: center;">
         <span style="font-weight: 500;font-size: 1em;">{{ present.prevue_name }}{{present.sort_id_catalog}}</span> 
          <br />
         <span style="font-size: 1em;font-weight: 700;">"{{ present.name_precent }}"</span> 
                  <br />
         <span style="font-size: 1em;font-weight: 700;">"АРТИКУЛ: {{ present.id }}"</span> 
        </h4>
      </v-card-title>

      <v-card-subtitle> </v-card-subtitle>

      <v-card-actions class="d-flex justify-center" style="text-align: center;">
 
 
      </v-card-actions>
    </v-card>
            </v-col>
          </v-row>
            </v-col>
            <v-col cols="12">
              <h2 style="margin-top:5rem">Подарочные Боксы</h2>
              <v-row justify="center" class="drop-zone" style="">
            
<!-- Подарочные боксы-->

            <v-col 
            style="min-height:40vh"
                @drop="onDrop2($event,present)"
                @dragenter.prevent
                @dragover.prevent
                    
                draggable="true"
                @dragstart="startDrag2($event,present)"
              class="d-flex justify-center drag-el"
              v-for="(present,index) in pres_for_box"
              :key="index"
              cols="12" lg="3" md="3"
            >
                <v-card
      style="box-shadow: none;max-height:500px;position: relative;padding:1rem;max-width:100%"
      width="400"
    >
      <div
        style="text-align: start;"
        
      ></div>
      <div style="width:100%;text-align: center;">
        <img
        
          style="height: 10em;width: auto;max-width:100%"
         
          class="img"
          :src="present.image_precent"
        />
      </div>
  
      <hr />
      <v-card-title style="height: 6em;" >
        <h4 class="hh4" style="font-size: 0.9rem;text-align: center;">
         <span style="font-weight: 500;font-size: 1em;">{{ present.prevue_name }}</span> 
          <br />
         <span style="font-size: 1em;font-weight: 700;">"{{ present.name_precent }}"</span> 
                  <br />
         <span style="font-size: 1em;font-weight: 700;">"АРТИКУЛ: {{ present.id }}"</span> 
        </h4>
      </v-card-title>

      <v-card-subtitle> </v-card-subtitle>

      <v-card-actions class="d-flex justify-center" style="text-align: center;">
 
 
      </v-card-actions>
    </v-card>
            </v-col>
            </v-row>
            </v-col>
<!--Букеты цветов -->
<v-col cols="12">
  <h2 style="margin-top:5rem">Букеты цветов</h2>
  <v-row justify="center" class="drop-zone" style="">

            <v-col 
            style="min-height:40vh"
                @drop="onDrop3($event,present)"
                @dragenter.prevent
                @dragover.prevent
                    
                draggable="true"
                @dragstart="startDrag3($event,present)"
              class="d-flex justify-center drag-el"
              v-for="(present,index) in pres_for_cvet"
              :key="index"
              cols="12" lg="3" md="3"
            >
                <v-card
      style="box-shadow: none;max-height:500px;position: relative;padding:1rem;max-width:100%"
      width="400"
    >
      <div
        style="text-align: start;"
        
      ></div>
      <div style="width:100%;text-align: center;">
        <img
        
          style="height: 10em;width: auto;max-width:100%"
         
          class="img"
          :src="present.image_precent"
        />
      </div>
  
      <hr />
      <v-card-title style="height: 6em;" >
        <h4 class="hh4" style="font-size: 0.9rem;text-align: center;">
         <span style="font-weight: 500;font-size: 1em;">{{ present.prevue_name }}</span> 
          <br />
         <span style="font-size: 1em;font-weight: 700;">"{{ present.name_precent }}"</span> 
                  <br />
         <span style="font-size: 1em;font-weight: 700;">"АРТИКУЛ: {{ present.id }}"</span> 
        </h4>
      </v-card-title>

      <v-card-subtitle> </v-card-subtitle>

      <v-card-actions class="d-flex justify-center" style="text-align: center;">
 
 
      </v-card-actions>
    </v-card>
            </v-col>
            </v-row>
            </v-col>
            </v-row>
    </v-container>
</template>

<script>
export default {
      layout: "admin",
  async asyncData({ params, $axios }) {
    // We can use async/await ES6 feature
    const data_presents = await $axios.get(
      `/api/present/sort/catalog`
    );

    return { data_presents: data_presents.data };
  },
  computed: {
  
    pres_for_podarok() {
      return this.data_presents.filter((elem) => {
        return elem.category[0].id  === 2;
      }).sort(function (a, b) {
            return a.sort_id_catalog - b.sort_id_catalog;
          });
    },
    pres_for_box() {
      return this.data_presents.filter((elem) => {
        return elem.category[0].id  === 8;
      }).sort(function (a, b) {
            return a.sort_id_catalog - b.sort_id_catalog;
          });
    },
      pres_for_cvet() {
      return this.data_presents.filter((elem) => {
        return elem.category[0].id === 3;
      }).sort(function (a, b) {
            return a.sort_id_catalog - b.sort_id_catalog;
          });
    },
  
  },
  methods: {
      startDrag(event,item){
  
  event.dataTransfer.dropEffect = "move"
  event.dataTransfer.effectAllowed = "move"
  event.dataTransfer.setData("itemID",item.id) 
  event.dataTransfer.setData("serial_number_one",item.serial_number) 
},
      startDrag2(event,item){
  
  event.dataTransfer.dropEffect = "move"
  event.dataTransfer.effectAllowed = "move"
  event.dataTransfer.setData("itemID",item.id) 
  event.dataTransfer.setData("serial_number_one",item.serial_number) 
},
      startDrag3(event,item){
  
  event.dataTransfer.dropEffect = "move"
  event.dataTransfer.effectAllowed = "move"
  event.dataTransfer.setData("itemID",item.id) 
  event.dataTransfer.setData("serial_number_one",item.serial_number) 
},
  onDrop(event,drop_item){
  
  const id_one =  event.dataTransfer.getData("itemID")
  const id_two = drop_item.id
  
 if (id_one != id_two){
   this.updateSort_id_catalog(id_one,id_two)
 }
  },
  onDrop2(event,drop_item){
  
  const id_one =  event.dataTransfer.getData("itemID")
  const id_two = drop_item.id
  
 if (id_one != id_two){
   this.updateSort_id_catalog(id_one,id_two)
 }
  },
    onDrop3(event,drop_item){
  
  const id_one =  event.dataTransfer.getData("itemID")
  const id_two = drop_item.id
  
 if (id_one != id_two){
   this.updateSort_id_catalog(id_one,id_two)
 }
  },
  updateSort_id_catalog(id_one,id_two ){
        let headers = {
         "Content-Type": "application/json",
        "Authorization":this.$store.state.localStorage.jwtToken
       };
       
      this.$axios
        .$put(`/api/present/update/sort_id_catalog/${id_one}/${id_two}`,{
          headers: headers
        })
        .then((resp) => {
         this.data_presents = resp
         
          
        })
        .catch(function (error) {
         console.log(error);
        });
},
  }
}
</script>