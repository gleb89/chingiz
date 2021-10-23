<template>
  
        <v-card
        class="rounded-xl co"
            color="#FFFFFF"
            
            style="padding:1rem;min-height: 300px;"
          >
         
            <p class="text-left " style="color:#676767;font-size: 1rem;">
              {{comment.name_user}} 
            </p>
            <!-- <p class="text-left " style="color: #C4C4C4;;font-size: .8rem;">г. Алма-ата</p> -->
            <div style="padding-bottom:1rem" class="text-left">
              <img src="/oot.png" alt="">
            </div>
            
            
            
              <div class="text--primary text-left" style="min-height: 9em;">
        {{comment.body}}
      </div>
          <v-dialog
          
      v-model="dialog"
      width="600px"
    >
      
      <v-card class="rounded-xl">
        <v-card-title>
          <span class="text-h6" style="color:#676767;font-size: 1rem;">{{comment.name_user}} </span>
        </v-card-title>
        <!-- <p  class="text-left " style="color: #C4C4C4;;font-size: .8rem;padding-left:1.5rem">г. Алма-ата</p> -->
                    <div style="padding-bottom:1rem;padding-left:1.5rem" class="text-left">
              <img src="/oot.png" alt="">
            </div>
        <v-card-text>
        {{comment.body}}
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>

          <v-btn
            color="#f67929"
            text
            @click="dialog = false"
          >
            Свернуть
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

            <div class="text-left" style="">
              <v-btn class="text-left" style="color: #c4c4c4;font-size: .7rem;" @click="dialog = true" text>
               Читать полностью
              </v-btn>
           </div>

          </v-card>

</template>

<script>
  export default {
    props:['comment'],
    data: () => ({
      reveal: false,
      dialog:false
    }),
    methods: {
      close_dialog() {
        this.dialog = !this.dialog
      },
    },
  }
</script>

<style>
.co{
  width: 80%;
  min-height: 30vh;
}
@media (max-width: 2600px){
  .co{
  width: 80%;
  min-height: 20vh;
  
 
  }
}
@media (max-width: 1900px){
  .co{
  width: 80%;
  
 
  }
}
@media (max-width: 500px){
  .co{
  width: 100%;
  
}
}
</style>