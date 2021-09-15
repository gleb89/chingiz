<template>
  <div id="mob-carusel">
    <v-carousel hide-delimiters style="position: relitative">
      <v-carousel-item v-for="(item, i) in items" :key="i" :src="item.src">
        <div v-if="i === 0" class="box-text-preim mt-4">
          <div style="display: flex; flex-wrap: nowrap">
            <img style="margin-left: 1rem" src="/flex1icon.png" alt="" />
            <h3 style="padding: 1rem">Прямые цены от оптовиков</h3>
          </div>
          <div style="padding: 1rem">
            <p class="text-preim" style="margin-top: 2rem; font-size: 0.8rem">
              Хватит переплачивать овощным лавкам двойные и тройные цены!
            </p>
            <p class="text-preim" style="margin-top: 2rem; font-size: 0.8rem">
              Мы даём вам прямые цены от оптовиков, не накручивая свою маржу,
              потому что мы зарабатываем с комиссии от оптовиков.
            </p>
            <p class="text-preim" style="margin-top: 2rem; font-size: 0.8rem">
              Поэтому вы можете быть уверены, что вы покупаете по лучшим ценам
              нашего города.
            </p>
            <div style="text-align: center; width: 100%">
              <v-btn
                @click="oncatalog()"
                rounded
                color="#ff7a00"
                style="height: 39px; margin: 0.7rem"
                dark
              >
                <span style="font-size: 12px">перейти в каталог</span>
              </v-btn>
            </div>
          </div>
        </div>

        <div v-if="i === 1" class="box-text-preim mt-4">
          <div style="display: flex; flex-wrap: nowrap">
            <img style="margin-left: 1rem" src="/icon2f.png" alt="" />
            <h3 style="padding: 1rem">Широкий ассортимент</h3>
          </div>
          <div class="te-box" style="padding: 1rem">
            <p class="text-preim" style="font-size: 1rem">
              Только в нашем онлайн магазине вы найдёте самый большой
              ассортимент фруктовой и овощной продукции с доставкой до двери.
            </p>
            <div style="text-align: center; width: 100%">
              <v-btn
                @click="oncatalog()"
                rounded
                color="#ff7a00"
                style="height: 39px; margin: 0.7rem"
                dark
              >
                <span style="font-size: 12px">перейти в каталог</span>
              </v-btn>
            </div>
          </div>
        </div>

        <div v-if="i === 2" class="box-text-preim mt-4">
          <div style="display: flex; flex-wrap: nowrap">
            <img style="margin-left: 1rem" src="/icon3f.png" alt="" />
            <h3 style="padding: 1rem">Доставка до двери</h3>
          </div>
          <div class="te-box" style="padding: 1rem">
            <p class="text-preim" style="font-size: 1rem">
              50% стоимости доставки мы берём на себя, вы оплачиваете только
              лишь оставшиеся 50%.
            </p>
            <div style="text-align: center; width: 100%">
              <v-btn
                @click="oncatalog()"
                rounded
                color="#ff7a00"
                style="height: 39px; margin: 0.7rem"
                dark
              >
                <span style="font-size: 12px">перейти в каталог</span>
              </v-btn>
            </div>
          </div>
        </div>

        <div v-if="i === 3" class="box-text-preim mt-4">
          <div style="display: flex; flex-wrap: nowrap">
            <img style="margin-left: 1rem" src="/icon4f.png" alt="" />
            <h3 style="padding: 1rem">Проверка качества</h3>
          </div>
          <div class="te-box" style="padding: 1rem">
            <p class="text-preim" style="font-size: 1rem">
              Пока вы спите, мы каждую ночь лично дегустируем продукцию
              оптовиков и отбираем только лучшее для наших клиентов. .
            </p>
            <div style="text-align: center; width: 100%">
              <v-btn
                @click="oncatalog()"
                rounded
                color="#ff7a00"
                style="height: 39px; margin: 0.7rem"
                dark
              >
                <span style="font-size: 12px">перейти в каталог</span>
              </v-btn>
            </div>
          </div>
        </div>

        <div v-if="i === 4" class="box-text-preim mt-4">
          <div style="display: flex; flex-wrap: nowrap">
            <img style="margin-left: 1rem" src="/icon5f.png" alt="" />
            <h3 style="padding: 1rem">Благотворительность</h3>
          </div>
          <div class="te-box" style="padding: 1rem">
            <p class="text-preim" style="font-size: 1rem">
              20% от нашего чистого дохода мы направляем на благотворительность.
            </p>
            <div style="text-align: center; width: 100%">
              <v-btn
                @click="oncatalog()"
                rounded
                color="#ff7a00"
                style="height: 39px; margin: 0.7rem"
                dark
              >
                <span style="font-size: 12px">перейти в каталог</span>
              </v-btn>
            </div>
          </div>
        </div>
      </v-carousel-item>
    </v-carousel>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        {
          src: "/flex1.png",
        },
        {
          src: "/flex2.png",
        },
        {
          src: "/flex3.png",
        },
        {
          src: "/flex4.png",
        },
        {
          src: "/flex5.png",
        },
      ],
    };
  },
};
</script>

<style>
#mob-carusel .v-window__next {
  right: 20%;
  background: white;
  top: 90%;
}
#mob-carusel .v-window__prev {
  top: 90%;
  left: 20%;
  background: white;
}

#mob-carusel .v-btn--icon.v-size--default .v-icon,
.v-btn--fab.v-size--default .v-icon {
  height: 24px;
  font-size: 24px;
  width: 24px;
  color: #676767;
}
.te-box {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  min-height: 20rem;
}
</style>