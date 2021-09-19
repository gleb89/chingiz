<template>
  
        <v-card
        class="rounded-xl"
            color="#FFFFFF"
            style="padding:1rem;height: 300px;width: 380px;"
          >
         
            <p class="text-left " style="color:#676767;font-size: 1rem;">
              Михаил Шафутинский 
            </p>
            <p class="text-left " style="color: #C4C4C4;;font-size: .8rem;">г. Алма-ата</p>
            <div style="padding-bottom:1rem" class="text-left">
              <img src="/oot.png" alt="">
            </div>
            
            
            
              <div class="text--primary text-left">
        Заказал маме фруктовую корзину на день Рождения.
       Когда доставили, не поверил свом глазам
        - свежайшие фрукты, без единого нюанса...
      </div>
          <v-dialog
          
      v-model="dialog"
      width="600px"
    >
      
      <v-card class="rounded-xl">
        <v-card-title>
          <span class="text-h6" style="color:#676767;font-size: 1rem;">Михаил Шафутинский</span>
        </v-card-title>
        <p  class="text-left " style="color: #C4C4C4;;font-size: .8rem;padding-left:1.5rem">г. Алма-ата</p>
                    <div style="padding-bottom:1rem;padding-left:1.5rem" class="text-left">
              <img src="/oot.png" alt="">
            </div>
        <v-card-text>
                 Заказал маме фруктовую корзину на день Рождения.
       Когда доставили, не поверил свом глазам
        - свежайшие фрукты, без единого нюанса. Мама даже расплакалась от радости. Спас
                Заказал маме фруктовую корзину на день Рождения.
       Когда доставили, не поверил свом глазам
        - свежайшие фрукты, без единого нюанса. Мама даже расплакалась от радости. Спас
                Заказал маме фруктовую корзину на день Рождения.
       Когда доставили, не поверил свом глазам
        - свежайшие фрукты, без единого нюанса. Мама даже расплакалась от радости. Спас
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

            <div class="text-left">
              <v-btn class="text-left" style="color: #c4c4c4;font-size: .7rem;" @click="dialog = true" text>
               Читать полностью
              </v-btn>
           </div>

          </v-card>

</template>

<script>
  export default {
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

</style>