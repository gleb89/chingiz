<template>
  <div id="onas">
    <v-container>
      <v-row justify="center">
        <v-col cols="12">
          <div>
            <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
            <span style="color: #222121a1">о нас</span>
          </div>
          <div class="mt-4">
            <h2 style="font-size:2rem;margin-top: 2rem;">О нас</h2>
          </div>
        </v-col>
        <v-col cols="12" class="mt-6">
          <div>
            <div
              class="text-center"
              style="display: flex; justify-content: center"
            >
              <div class="text-center logo-onas">
                <p class="lozung">Философия</p>
                <p class="box-orange" style="color: "></p>
              </div>
            </div>
            <p class="text-center text-onas">
              Вера. Творческий подход. Честность.
            </p>
          </div>
        </v-col>
        <v-col cols="12" class="mt-6">
          <div>
            <div
              class="text-center"
              style="display: flex; justify-content: center"
            >
              <div class="text-center logo-onas">
                <p class="lozung">Миссия<span style="opacity: 0">bz</span></p>
                <p class="box-orange-rev" style="color: "></p>
              </div>
            </div>
            <p style="font-size: 1rem; color: #676767" class="text-center">
              Мы вкладываем весь свой опыт, экспертизу, возможности для
              обеспечения наших граждан лучшей ценой и качеством продуктов и
              товаров.
            </p>
          </div>
        </v-col>
        <v-col cols="12" class="mt-6">
          <div>
            <div
              class="text-center"
              style="display: flex; justify-content: center"
            >
              <div class="text-center logo-onas">
                <p class="lozung" style="">
                  Команда<span style="opacity: 0">z</span>
                </p>
                <p class="box-orange" style="color: "></p>
              </div>
            </div>
            <p style="font-size: 1rem; color: #676767" class="text-center">
              Мы соединяем наш опыт, экспертизу, энергию и навыки с цифровыми
              технологиями для создания лучшей цены, качества и сервиса.
            </p>
          </div>
        </v-col>
      </v-row>
    </v-container>
    <section id="foto-people">
          <v-container>
      <v-row justify="center">
              <v-col cols="12" lg="4" md="4"  class="mt-6">
          <v-img src="/1.png"></v-img>
          <p class="text-img  text-center">eco founder</p>
        </v-col>
        <v-col cols="12" lg="4" md="4" class="mt-6">
          <v-img src="/2.png"></v-img>
          <p class="text-img  text-center">сто</p>
        </v-col>
        <v-col cols="12" lg="4" md="4" class="mt-6">
          <v-img src="/3.png"></v-img>
          <p class="text-img text-center">Openhome</p>
        </v-col>
            </v-row>
    </v-container>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      property: [],
    };
  },
  methods: {},
};
</script>

<style>
.text-img{
  font-size: 18px;
  font-weight: bold;
  margin-top: 1rem;
  color: #676767;
}
.lozung {
  position: relative;
  z-index: 1;
  color: white;
  font-size: 24px;
}

.text-onas {
  font-size: 1.5rem;
  color: #676767;
}

#foto-people {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  background-image: url("/bgonas.png");
  min-height: 140vh;
}
.box-orange {
  height: 2.5rem;
  background: #ff7a00;
  color: #ff7a00;
  width: 10rem;
  position: absolute;
  top: 0;
  left: -1.5rem;
  transform: rotate(-5deg);
}
.box-orange-rev {
  height: 2.5rem;
  background: #ff7a00;
  color: #ff7a00;
  width: 10rem;
  position: absolute;
  top: 0;
  left: -2rem;
  transform: rotate(5deg);
}

.logo-onas {
  font-size: 1.4rem;
  z-index: 1;
  position: relative;
  color: black;
  font-weight: bold;
}
</style>