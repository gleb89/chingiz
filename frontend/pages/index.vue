<template>
  <div>
    <div style="margin-top:3rem" id="header__content">
      <div style="text-alignt: center; width: 100%">
        <h1>ЛУЧШИЙ СЕРВИС ОРИГИНАЛЬНЫХ ПОДАРКОВ</h1>
        {{onAnimation}}
        <p style="margin-top: 1rem">
          “...Подарки сближают сердца , вселяют в них радость....”
        </p>
        <v-container>
          <v-row justify="center">
            <v-col cols="12" lg="3" md="3">
              <v-autocomplete
                class="rounded-lg"
                label="Город доставки"
                v-model="city"
                color="orange"
                item-color="orange"
                :items="list_cituys"
                solo
                no-data-text="Ничего не найдено"
              ></v-autocomplete>
            </v-col>
            <v-col cols="12" lg="3" md="3">
              <v-menu
                style=""
                ref="menu1"
                v-model="menu1"
                :close-on-content-click="false"
                transition="scale-transition"
                offset-y
                max-width="290px"
                min-width="auto"
              >
                <template v-slot:activator="{ on, attrs }">
                  <v-text-field
                    class="rounded-lg"
                    v-model="dateFormatted"
                    label="Дата доставки"
                    solo
                    v-bind="attrs"
                    @blur="date = parseDate(dateFormatted)"
                    v-on="on"
                  ></v-text-field>
                </template>
                <v-date-picker
                  locale="ru"
                  v-model="date"
                  no-title
                  @input="menu1 = false"
                ></v-date-picker>
              </v-menu>
            </v-col>
            <v-col
              cols="12"
              lg="3"
              md="3"
              class="d-flex b-b"
              style="align-items: center;margin-bottom: 2rem;"
            >
              <v-btn
                @click="onsavecity_pushCatalog"
                depressed
                rounded
                style=";height: 3rem;width: 20em;"
                color="#ff7a00"
                dark
              >
                <span style="font-size: 12px">найти подарок</span>
              </v-btn>
            </v-col>
          </v-row>
        </v-container>
      </div>
    </div>
    <section id="best-products" class="newsection" style="margin-bottom:4rem;margin-top:4rem">
      <v-container class="newsection-container">
        <h2 class="head-sect">ПОПУЛЯРНЫЕ КОРЗИНЫ И БОКСЫ</h2>
        <Listcart class="d-lg-block d-none" :listproducts="popular_product" />
        <!-- <Listcartmob class="d-lg-none d-block" :listproducts="listproducts" /> -->
        <CaruselProduct
          class="d-lg-none d-block"
          :listproducts="popular_product"
        />
        <div class="b1" style="text-align: center">
          <v-btn
            @click="oncatalog()"
            rounded
            depressed
            style="height: 49px;min-width: 20%; margin: 0.7rem;background: white;color: #505050;border: 2px solid #ff7a00;"
            dark
          >
            <span style="font-size: 12px;">посмотреть все подарки</span>
          </v-btn>
        </div>
      </v-container>
    </section>
    <v-parallax class="d-none d-md-block d-lg-block" src="/bonus.webp">
      <section id="baner-bonys">
        <div style="width: 100%">
          <h2 class="ban"         
>
            СОБЕРИ БОНУСЫ
            <br />
            НА ОРИГИНАЛЬНЫЙ ПОДАРОК
          </h2>
          <v-btn
            @click="bonys_page"
            rounded
            color="#ff7a00"
            style="height: 49px;min-width: 20%; margin-top: 2rem"
            dark
          >
            <span style="font-size: 12px">узнать подробности</span>
          </v-btn>
        </div>
      </section>
    </v-parallax>
    <v-parallax class="d-block d-lg-none d-md-none" src="/bonus2.webp">
      <section id="baner-bonys">
        <div style="width: 100%">
          <h2 class="ban">
            СОБЕРИ БОНУСЫ
            <br />
            НА ОРИГИНАЛЬНЫЙ ПОДАРОК
          </h2>
          <v-btn
            @click="bonys_page"
            rounded
            color="#ff7a00"
            style="height: 49px;min-width: 20%; margin-top: 2rem"
            dark
          >
            <span style="font-size: 12px">узнать подробности</span>
          </v-btn>
        </div>
      </section>
    </v-parallax>
    <section id="new-products" class="newsection22">
      <v-container class="newsection-container2">
        <h2 class="head-sect">
          НОВИНКИ В ТРЕНДЕ
        </h2>
        <Listcart class="d-lg-block d-none" :listproducts="new_product" />
        <!-- <Listcartmob class="d-lg-none d-block" :listproducts="listproducts" /> -->
        <CaruselProduct
          class="d-lg-none d-block"
          :listproducts="new_product"
        />
        <div class="b1" style="text-align: center;margin-bottom:2rem">
          <v-btn
            @click="oncatalog()"
            rounded
            depressed
            style="height: 49px;min-width: 20%; margin: 0.7rem;background: white;color: #505050;border: 2px solid #ff7a00;"
            dark
          >
            <span style="font-size: 12px;">посмотреть все подарки</span>
          </v-btn>
        </div>
      </v-container>
    </section>

    <section v-if="stocks.length > 0" id="slider-banner" style="">
      <v-container style="padding: 1rem">
        <BanerCarusel :stocks="stocks"/>
      </v-container>
    </section>

    <section id="whywork" style="" class="newsection3">
      <v-container style="padding: 1rem">
        <h2 class="head-sect">
          КАК ЭТО РАБОТАЕТ
        </h2>
        <v-row>
          <v-col
          
            cols="12"
            lg="4"
            class="text-center newsection-container3" 
            style="padding-top: 3rem;position: relative;"
          >
            <div>
              <span style="font-size: 4rem;color: #FF7A00;">01</span>
              <img width="150" height="150" src="w1.webp" alt="" />
            </div>
            <div>
              <p style="color:#676767">
                Выберите ваш <br />
                оригинальный подарок
              </p>
            </div>
            <img
              style="position: absolute;right: 0;bottom: 8em;"
              class="d-lg-block d-none"
              src="Vector.png"
              alt=""
            />
          </v-col>
          <v-col
            cols="12"
            lg="4"
            class="text-center newsection-container4"
            style="padding-top: 3rem;position: relative;"
          >
            <div>
              <span style="font-size: 4rem;color: #FF7A00;">02</span>
              <img width="150" height="150" src="w2.webp" alt="" />
            </div>
            <div>
              <p style="color:#676767">
                Выберите способ оплаты <br />
                и адрес доставки
              </p>
            </div>
            <img
              style="position: absolute;right: 0;bottom: 8em;"
              class="d-lg-block d-none"
              src="Vector.png"
              alt=""
            />
          </v-col>
          <v-col cols="12" lg="4" class="text-center newsection-container5" style="padding-top: 3rem">
            <div>
              <span style="font-size: 4rem;color: #FF7A00;">03</span>
              <img width="150" height="150" src="w3.webp" alt="" />
            </div>
            <p style="color:#676767">
              Дарите <br />
              на радость!
            </p>
          </v-col>
        </v-row>
      </v-container>
    </section>

    <section id="preimyshestva" class="e" style="">
      <v-container>
        <h2 class="head-sect">
          НАШИ ПРЕИМУЩЕСТВА
        </h2>
        <div class="dflex" style="padding: 0.5rem">
          <div style="padding: 1rem; position: relative">
            <div class="boxpreim">
              <img  style="height: 4rem; width: 4rem" src="pp1.svg" alt="" />
              <p class="textp">
                Самый <br />
                большой <br />
                ассортимент
              </p>
            </div>
            <img width="560" height="auto" style="max-width: 100%;" src="one.webp" />
          </div>
          <div style="padding: 1rem; position: relative">
            <div class="boxpreim">
              <img style="height: 4rem; width: 4rem" src="pp2.svg" alt="" />
              <p class="textp">
                География <br />
                доставки <br />
                расширяется <br />
                каждый день
              </p>
            </div>
            <img width="560" height="auto" style="max-width: 100%;"  src="new2.png" />
          </div>
          <div style="padding: 1rem; position: relative">
            <div class="boxpreim">
              <img style="height: 4rem; width: 4rem" src="pp3.svg" alt="" />
              <p class="textp">
                доставка <br />
                до двери
              </p>
            </div>
            <img width="560" height="auto" style="max-width: 100%;"  src="thre.webp" />
          </div>
        </div>
        <div style="text-align: center">
          <v-btn
            @click="oncatalog()"
            rounded
            depressed
            style="height: 49px;min-width: 20%; margin: 0.7rem;background: white;color: #505050;border: 2px solid #ff7a00;"
            dark
          >
            <span style="font-size: 12px;">перейти в каталог</span>
          </v-btn>
        </div>
      </v-container>
    </section>
    <section  id="whywork" style="margin-bottom: 4rem;background:#F4F5F6">
      <v-container>
        <h2 class="head-sect">
          ОТЗЫВЫ
        </h2>
        
        <ListOtz :comments_serv="comments_serv" class="d-none d-lg-block" />
        <Otzmob :comments_serv="comments_serv" class="d-block d-lg-none" />
        <SendOtz  :otzivclick="otzivclick" :otziv="otziv"/>
        <div class=" buttun d-flex text-center justify-center flex-wrap" >
          <v-btn
            @click="otziv = true"
            rounded
            depressed
             color="#ff7a00"
              
            style="height: 49px;min-width: 20%; margin: 0.7rem;border: 2px solid #ff7a00;"
            dark
          >
            <span style="font-size: 12px;">написать отзыв</span>
          </v-btn>
          <v-btn
            @click="oncatalog()"
            rounded
            depressed
            style="height: 49px;min-width: 20%; margin: 0.7rem;background: white;color: #505050;border: 2px solid #ff7a00;"
            dark
          >
            <span style="font-size: 12px;">перейти в каталог</span>
          </v-btn>
        </div>
      </v-container>
    </section>
    <section id="bonus-opros">
      <v-container class="box-opros">
        <div style="padding: 2rem; padding-top: 4rem">
          <h2 style="color: #ff7a00; font-size: 2.7rem">Бонусы за опрос!</h2>
          <p style="margin-top: 3rem;font-weight: 500;;color:#505050">
            Войдите в личный кабинет, пройдите опрос и получите
            <span style="color: #ff7a00; font-weight: bold">500 бонусов.</span>
            <br />
            Копите бонусы и обменивайте на подарки!*
          </p>
          <p
            style="margin-top: 3rem;font-weight: bold;font-size:1em;color:#505050"
          >
            Ваш любимый праздник?
          </p>

          <v-radio-group v-model="radioGroup" background-color="transparent">
            <v-radio
              v-for="n in [
                'День Рождения',
                'Новый год',
                'Наурыз мейрамы',
                'День святого Валентина',
                '8 марта'
              ]"
              :key="n"
              color="orange"
              :label="`${n}`"
              :value="n"
            ></v-radio>
          </v-radio-group>
          <v-dialog v-model="dialog" persistent max-width="600px">
            <v-card style="padding:1rem">
              <SignIn :dialog_exit="dialog_exit" :close="close" />
            </v-card>
          </v-dialog>
          <v-btn
            @click="onBonus"
            rounded
            color="#ff7a00"
            style="height: 49px; margin-top: 1.7rem; margin-bottom: 1.7rem;min-width:15%"
            dark
          >
            <span style="font-size: 12px">получить бонусы</span>
          </v-btn>
          <p style="color:#505050;font-weight: bold;">
            * Подробности акции ищите в разделе “Бонусы”. 1 бонус = 1 ТГ
          </p>
        </div>
      </v-container>
    </section>
  </div>
</template>

<script>
export default {
 head: {
    title: "Купить Подарки На Любой Праздник И Повод | (Нур-Султан,Алматы)",
    meta: [
      {
        hid: "description",
        name: "description",
        content:
          "Купить Подарки На Любой Праздник И Повод | (Нур-Султан,Алматы)",
      },
        {
        hid: `GIFTCITY`,
        name: 'keywords',
        content:
          "Купить Подарки На Любой Праздник И Повод | (Нур-Султан,Алматы)",
      },
       {
          hid: 'og:image',
          property: 'og:image',
          content: '/giftcity.svg'
        },
        {
          hid: 'og:image:secure_url',
          property: 'og:image:secure_url',
          content: '/giftcity.svg'
        },
        {
          hid: 'og:image:alt',
          property: 'og:image:alt',
          content: 'GIFTCITY'
        }
    ],
  },
  async asyncData({ $axios }) {
    const headers = {
      "Content-Type": "application/json"
    };
    const stocks = await $axios.get(
      `http://giftcity.kz/api/v1/present/stocks/`
    );
    const comments= await $axios.get(
      `http://giftcity.kz/api/v1/present/commentsservice/`
    );
    const comments_serv = comments.data.filter(elem => {
          return elem.moderation
        });
    return { stocks: stocks.data,comments_serv:comments_serv };
  },
  async fetch({ store }) {
    if (store.getters["products/products"].length === 0) {
      await store.dispatch("products/fetch");
    }
  },
  computed: {
    onAnimation(){
      if(!process.client) return;
      setTimeout(() => {
        
     
      var newsectionpresents = new IntersectionObserver(function (entries) {
            if (entries[0].intersectionRatio <= 0) return;
            var menu = document.querySelector(".newsection-container");
            menu.classList.add("newsection2");
          });

      var newsectionpresents2 = new IntersectionObserver(function (entries) {
      if (entries[0].intersectionRatio <= 0) return;
      var menu = document.querySelector(".newsection-container2");
      menu.classList.add("newsection2");
    });

      var newsectionpresents3 = new IntersectionObserver(function (entries) {
      if (entries[0].intersectionRatio <= 0) return;
      var menu = document.querySelector(".newsection-container3");
      menu.classList.add("newsection2");
      setTimeout(() => {
      var menu2 = document.querySelector(".newsection-container4");
      menu2.classList.add("newsection2");
      }, 1000);

      setTimeout(() => {
      var menu3 = document.querySelector(".newsection-container5");
      menu3.classList.add("newsection2");
      }, 1000);
    });

      newsectionpresents.observe(document.querySelector(".newsection"));
      newsectionpresents2.observe(document.querySelector(".newsection22"));
      newsectionpresents3.observe(document.querySelector(".newsection3"));
       }, 1000);
    },
    listproducts() {
      this.presents = this.$store.getters["products/products"];
      return this.presents;
    },
    new_product(){
      let new_array = this.$store.getters["products/products"].slice(-18)
        return new_array.sort(function(a, b) { return b.id - a.id; });
    },
    popular_product(){
      let new_array = this.$store.getters["products/products"].slice(-18)
        return new_array.sort(function(a, b) { return b.popular - a.popular; });
    },
    computedDateFormatted() {
      return this.formatDate(this.date);
    }
  },
  watch: {
    date(val) {
      this.dateFormatted = this.formatDate(this.date);
    }
  },
  data: vm => ({
    date: new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
      .toISOString()
      .substr(0, 10),
    dateFormatted: "",
    presents: [],
    menu1: false,
    isIntersecting: false,
    menu2: false,
    dialog: false,
    radioGroup: 1,
    datetime: "",
    date: "",
    otziv:false,
    city: "",
    list_cituys: [
      // 'Абай',
      // 'Акколь',
      // 'Аксай',
      // 'Аксу',
      // 'Актау',
      // 'Актобе',
      // 'Алга',
      "Алматы",
      // 'Арал',
      // 'Аркалык',
      // 'Арыс',
      "Нур-Султан"
      // 'Атбасар',
      // 'Атырау',
      // 'Аягоз',
      // 'Байконыр',
      // 'Балхаш',
      // 'Булаево',
      // 'Державинск',
      // 'Ерейментау',
      // 'Есик',
      // 'Есиль',
      // 'Жанаозен',
      // 'Жанатас',
      // 'Жаркент',
      // 'Жезказган',
      // 'Жем',
      // 'Жетысай',
      // 'Житикара',
      // 'Зайсан',
      // 'Зыряновск',
      // 'Казалинск',
      // 'Кандыагаш',
      // 'Капшагай',
      // 'Караганды',
      // 'Каражал',
      // 'Каратау',
      // 'Каркаралинск',
      // 'Каскелен',
      // 'Кентау',
      // 'Кокшетау',
      // 'Костанай',
      // 'Косшы',
      // 'Кулсары',
      // 'Курчатов',
      // 'Кызылорда',
      // 'Ленгер',
      // 'Лисаковск',
      // 'Макинск',
      // 'Мамлютка',
      // 'Павлодар',
      // 'Петропавловск',
      // 'Приозёрск',
      // 'Риддер',
      // 'Рудный',
      // 'Сарань',
      // 'Сарканд',
      // 'Сарыагаш',
      // 'Сатпаев',
      // 'Семей',
      // 'Сергеевка',
      // 'Серебрянск',
      // 'Степногорск',
      // 'Степняк',
      // 'Тайынша',
      // 'Талгар',
      // 'Талдыкорган',
      // 'Тараз',
      // 'Текели',
      // 'Темиртау',
      // 'Темир',
      // 'Темиртау',
      // 'Тобыл',
      // 'Туркестан',
      // 'Уральск',
      // 'Усть-Каменогорск',
      // 'Ушарал',
      // 'Уштобе',
      // 'Форт-Шевченко',
      // 'Хромтау',
      // 'Шардара',
      // 'Шалкар',
      // 'Шар',
      // 'Шахтинск',
      // 'Шемонаиха',
      // 'Шу',
      // 'Шымкент',
      // 'Щучинск',
      // 'Экибастуз',
      // 'Эмба'
    ]
  }),

  methods: {

    otzivclick(){
      this.otziv = !this.otziv
    },
    close() {
      this.dialog = !this.dialog;
    },
    dialog_exit() {
      this.dialog = false;
    },
    onBonus() {
      if (!this.$store.state.localStorage.uid_auth_user) {
        this.dialog = true;
      } else {
        this.$router.push("/" + "for_bonus");
      }
    },
    bonys_page() {
      this.$router.push("/" + "for_bonus");
    },
    hhh() {
      this.$store.commit("localStorage/set_summBasket", 0);
      this.$store.commit("localStorage/set_idBasket", 0);
      this.$store.commit("localStorage/setAuthuser", "");
    },
    formatDate(date) {
      if (!date) return null;

      const [year, month, day] = date.split("-");
      return `${month}/${day}/${year}`;
    },
    parseDate(date) {
      if (!date) return null;

      const [month, day, year] = date.split("/");
      return `${year}-${month.padStart(2, "0")}-${day.padStart(2, "0")}`;
    },
    oncatalog() {
      this.$router.push("/" + "catalog/Все_продукты");
    },
    onsavecity_pushCatalog() {
      this.$store.commit("localStorage/set_Sity", this.city);
      this.$store.commit("localStorage/set_Date", this.date);
      this.$router.push("/" + "catalog/Все_продукты");
    },
    getEvents(event) {
      // event only has the 'current month'
      let viewStart = this.$refs.calendar.getStartOfWeek(event.start);
      let viewEnd = this.$refs.calendar.getEndOfWeek(event.end);
      console.log(viewStart, viewEnd);
    }
  }
};
</script>
<style>
.v-text-field.v-text-field--enclosed:not(.v-text-field--rounded)
  > .v-input__control
  > .v-input__slot,
.v-text-field.v-text-field--enclosed .v-text-field__details {
  padding: 0 12px;
  max-width: 100%;
  min-width: 100%;
}
#ind {
  transition-delay: 0.5s;
  transition: 0.5s linear 0.5s;
}
.ind3 {
  padding-left: 15rem;
  transition: 0.5s linear 0.5s;
}
#header__content {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  background-image: url("/header.webp");
  min-height: 100vh;
  color: white;
  display: flex;
  align-items: center;
  text-align: center;
}
h1 {
  margin-top: 4rem;
}
#baner-bonys {
  min-height: 400px;
  color: white;
  display: flex;
  align-items: center;
  text-align: center;
}
h1 {
  text-align: center;
  font-size: 2.5rem;
}
@media (max-width: 500px) {
  h1 {
    font-size: 2rem;
  }

  .head-sect {
    margin-top: 1rem;
    margin-bottom: 1rem;
    padding: 1rem;
    font-size: 1.875em;
  }
}
.head-sect {
  margin-top: 3rem;
  margin-bottom: 3rem;
  padding: 1rem;
  font-size: 2em;
}
#bonus-opros .box-opros {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  background-image: url("/bonysball.webp");
  min-height: 60vh;
  margin-bottom: 4rem;
  /* min-height: 400px;
  color: white;
  display: flex;
  align-items: center;
  text-align: center; */
}
@media (max-width: 500px) {
  #bonus-opros .box-opros {
    background-image: url("/oprmob.webp");
  }
}
#scorosite .box-scoro {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  background-image: url("/scoronasite.png");
  min-height: 60vh;
  margin-bottom: 4rem;
}
.box-flex {
  display: flex;
  flex-wrap: wrap;
  text-align: right;
  justify-content: center;
}
.dflex {
  display: flex;
  justify-content: center;
  flex-wrap: nowrap;
}
@media (max-width: 1260px) {
  .dflex {
    flex-wrap: wrap;
  }
}

.theme--light.v-image {
  color: rgba(0, 0, 0, 0.87);
  border-radius: 10px;
}
.textp {
  font-size: 1.3rem;
  color: white;
  font-weight: bold;
  margin-left: 1rem;
}
#new-product {
  margin-bottom: 4rem;
  margin-top: 4rem;
}
.forin {
  padding: 1rem;
}
.ban {
  font-size: 2.4em;
}
@media (max-width: 500px) {
  .btnper {
    width: 50%;
    margin-top: 1.3rem;
  }
  .ban {
    font-size: 1.875em;
  }
  .b1 {
    padding-top: 4rem;
  }
  .forin {
    padding: 0;
    padding-left: 1rem;
    padding-right: 1rem;
    width: 100%;
  }
}

.text-flex1 {
  position: absolute;
  z-index: 1;
  padding: 2rem;
  top: 1rem;
}

@media (max-width: 500px) {
  #preimyshestva h3 {
    font-size: 1rem;
  }
}
.text-preim {
  margin-top: 2rem;
  width: 50%;
}

@media screen {
  .text-preim {
    font-size: 0.8rem;
    width: 70%;
  }
}
@media (max-width: 500px) {
  .text-preim {
    font-size: 0.7rem;
    width: 90%;
  }
}
.boxpreim {
  position: absolute;
  z-index: 1;
  display: flex;
  flex-wrap: nowrap;
  top: 30%;
  left: 2rem;
}

.forinp {
  margin: 1rem;
}
.buttun{
  
}

@media (max-width: 500px) {
  .forinp {
    width: 100%;
    text-align: center;
    display: flex;
    justify-content: center;
    text-align: center;
    padding: 1rem;
    margin: 0;
  }
.buttun{
  margin-top: 2em;
  padding-bottom: 0;
}
  h2 {
    font-size: 1.5rem;
    text-align: center;
  }
}
.theme--light.v-list-item .v-list-item__mask {
  color: orange;
}
@media (max-width: 959px) {
  .b-b {
    justify-content: center;
  }
  .buttun{
  margin-top: 2em;
  padding-bottom: 0;
}
}
@media (max-width: 1260px) {

  .buttun{
  margin-top: 2em;
  padding-bottom: 0;
}
}
.v-application--is-ltr .v-input--selection-controls__input {
  background: white;
  border: 50%;
  border-radius: 100%;
  border-color: #f4e5de;
  border: 1px solid #f4e7e0;
}

.newsection-container{
    opacity: 0;
    margin-top: 7rem;
    /* transition-delay: .5s; */
}

.newsection-container2{
    opacity: 0;
    margin-top: 7rem;
    /* transition-delay: .5s; */
}

.newsection-container3{
      opacity: 0;
      margin-top: 7rem;
}
.newsection-container4{
      opacity: 0;
      margin-top: 7rem;
}
.newsection-container5{
      opacity: 0;
      margin-top: 7rem;
}
.newsection2{
    opacity: 1; 
    margin-top: 0;
    transition: .7s linear .5s; 
     
}
</style>
