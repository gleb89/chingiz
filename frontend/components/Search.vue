<template>
            <div class="d-flex flex-wrap  ">
          <v-row>
            <v-col cols="12" lg="8" md="8">
              <div style="flex-grow: 3; position: relative; width: 100%">
                <img class="searc-inp" style="" src="/search .png" alt="" />

                <v-text-field
                  
                  style="border: 1px solid #989898; width: 100%; height: 3.5rem"
                  placeholder="Введите повод, форму, категорию или название "
                  rounded
                ></v-text-field>
                <!-- <div class="result-search" style="">
              <p @click="onresSearch(i)" v-for="i in upd_serch" :key="i">{{i}}</p>
              
      
            </div> -->
              </div>
            </v-col>
            <v-col
              lg="3"
              md="3"
              class="d-lg-block d-md-block d-none"
              style="align-items: center; display: flex"
            >
              <v-select
                
                :label="sort_price || 'Cначала недорогие'"
                
                single-line
              ></v-select>
            </v-col>
          </v-row>
        </div>
</template>