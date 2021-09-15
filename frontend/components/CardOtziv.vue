<template>
    <div style="margin:3rem">
        <v-card
        class="rounded-xl"
            style="height: 18rem;width: 20rem;"
            color="#FFFFFF"
          >
          <v-card-title >
            <p style="color:#676767;font-size: 1rem;">
              Михаил Шафутинский
              <br>
              <span style="color: #C4C4C4;;font-size: .8rem;">г. Алма-ата</span>
            </p>
            </v-card-title>
            <v-card-subtitle>
              <div class="text--primary">
        Заказал маме фруктовую корзину на день Рождения.
       Когда доставили, не поверил свом глазам
        - свежайшие фрукты, без единого нюанса. Мама даже расплакалась от радости. Спас...
      </div>
            </v-card-subtitle>

            <v-card-actions>
              <v-btn style="color: #c4c4c4;font-size: .7rem;" @click="reveal = true" text>
               Читать полностью
              </v-btn>
            </v-card-actions>
            <v-expand-transition>
      <v-card
    
        v-if="reveal"
        class="transition-fast-in-fast-out v-card--reveal rounded-xl"
        style="height: 100%;"
      >
        <v-card-text class="pb-0">
          <p class="text-h4 text--primary">
            Весь отзыв
          </p>
          <p>
            Заказал маме фруктовую корзину на день Рождения.
       Когда доставили, не поверил свом глазам
        - свежайшие фрукты, без единого нюанса. Мама даже расплакалась от радости. Спас
        Заказал маме фруктовую корзину на день Рождения.
       Когда доставили, не поверил свом глазам
        - свежайшие фрукты, без единого нюанса. Мама даже расплакалась от радости. Спас
          </p>
        </v-card-text>
        <v-card-actions class="pt-0">
          <v-btn
            text
            style="color: #c4c4c4;font-size: .7rem;"
            @click="reveal = false"
          >
            Свернуть
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-expand-transition>
          </v-card>
    </div>
</template>

<script>
  export default {
    data: () => ({
      reveal: false,
    }),
  }
</script>

<style>
.v-card--reveal {
  bottom: 0;
  opacity: 1 !important;
  position: absolute;
  width: 100%;
  overflow: scroll;
}
</style>