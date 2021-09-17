<template>
  <div>
    <div id="header__content">
      <div style="text-alignt: center; width: 100%">
        <h1>лучший сервис оригинальных подарков</h1>
        <p style="margin-top: 1rem">
          “...Подарки сближают сердца , вселяют в них радость...”
        </p>
        <div
          style="margin-top: 2rem"
          class="d-flex justify-center flex-wrap box-header"
        >
            <v-autocomplete
            style="margin: 1rem"
            label="Город доставки"
            v-model="city"
            color="orange"
            item-color="orange"
            :items="list_cituys"
            solo
            no-data-text="Ничего не найдено"
            ></v-autocomplete>
          <v-menu
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
                style="margin: 1rem"
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
          
          <v-btn
          @click="onsavecity_pushCatalog"
          class="btnper"
            rounded
            style="margin-top:1rem;height: 3rem;"
            color="#ff7a00"
            
            dark
          >
            <span style="font-size: 12px">получить подарок</span>
          </v-btn>
          
        </div>
      </div>
    </div>
    <section id="best-products" style="margin-bottom:4rem;margin-top:4rem">
      <v-container>
        <Listcart class="d-lg-block d-none" :listproducts="listproducts" />
        <Listcartmob class="d-lg-none d-block" :listproducts="listproducts" />
        <div style="text-align: center">
          <v-btn
            @click="oncatalog()"
            rounded
            color="#ff7a00"
            style="height: 39px; margin: 0.7rem;margin-top:4rem"
            dark
          >
            <span style="font-size: 12px">перейти в каталог</span>
          </v-btn>
        </div>
      </v-container>
    </section>

    <section id="baner-bonys">
      <div style="width: 100%">
        <h2 style="font-size: 2.5rem">
          собери бонусы
          <br />
          на постоянную скидку
        </h2>
        <v-btn
        @click="bonys_page"
          rounded
          color="#ff7a00"
          style="height: 39px; margin-top: 2rem"
          dark
        >
          <span style="font-size: 12px">узнать подробности</span>
        </v-btn>
      </div>
    </section>

    <section id="new-products" style="margin-bottom:4rem;margin-top:4rem">
      <v-container>
        <h2
          style="
            margin-top: 3rem;
            margin-bottom: 3rem;
            padding: 1rem;
            font-size: 2.5rem;
          "
        >
          новинки в тренде
        </h2>
        <Listcart class="d-lg-block d-none" :listproducts="listproducts" />
        <Listcartmob class="d-lg-none d-block" :listproducts="listproducts" />
        <div style="text-align: center">
          <v-btn
            @click="oncatalog()"
            rounded
            color="#ff7a00"
            style="height: 39px; margin: 0.7rem;margin-top:4rem"
            dark
          >
            <span style="font-size: 12px">перейти в каталог</span>
          </v-btn>
        </div>
      </v-container>
    </section>

    <section id="slider-banner" style="margin-bottom: 4rem">
      <v-container style="padding: 1rem">
        <BanerCarusel />
      </v-container>
    </section>

    <section id="whywork" style="margin-bottom: 4rem">
      <v-container style="padding: 1rem">
                <h2
          style="
            margin-top: 3rem;
            margin-bottom: 3rem;
            padding: 1rem;
            font-size: 2.5rem;
          "
        >
          Как это работает
        </h2>
        <v-row>
        <v-col cols="12" lg="4" class="text-center" style="padding-top: 3rem">
          <div>
          <span style="font-size: 4rem;color: #FF7A00;">01</span>
          <img src="w1.png" alt="">
          <img src="Vector.png" alt="">
          </div>
          <p style="color:#676767">Выберите ваш <br> оригинальный подарок</p>
        </v-col>
        <v-col cols="12" lg="4" class="text-center" style="padding-top: 3rem">
          <div>
          <span style="font-size: 4rem;color: #FF7A00;">02</span>
           <img src="w2.png" alt="">
           <img src="Vector.png" alt="">
           </div>
           <p style="color:#676767">Выберите способ оплаты <br> и адрес доставки</p>
        </v-col>
        <v-col cols="12" lg="4" class="text-center" style="padding-top: 3rem">
          <div>
          <span style="font-size: 4rem;color: #FF7A00;">03</span>
           <img src="w3.png" alt="">
           </div>
           <p style="color:#676767">Дарите <br> на радость!</p>
        </v-col>
          </v-row>
      </v-container>
    </section>

    <section
      id="preimyshestva"
      class=""
      style="margin-bottom: 4rem"
    >
      <v-container>
        <h2 style="margin-top: 3rem; padding: 1rem; font-size: 2.5rem">
          Наши преимущества
        </h2>
        <div class="dflex" style="padding: 0.5rem">
          <div style="padding: 1rem; position: relative">
            <div class="boxpreim">
              <img style="height: 4rem; width: 4rem" src="one.png" alt="" />
              <p class="textp">
                Самый <br />
                большой <br />
                ассортимент
              </p>
            </div>
            <img style="max-width: 100%;" src="preim1.png" />
          </div>
          <div style="padding: 1rem; position: relative">
            <div class="boxpreim">
              <img style="height: 4rem; width: 4rem" src="two.png" alt="" />
              <p class="textp">
                География <br />
                доставки <br />
                расширяется <br />
                каждый день
              </p>
            </div>
            <img style="max-width: 100%;" src="preim2.png" />
          </div>
          <div style="padding: 1rem; position: relative">
            <div class="boxpreim">
              <img style="height: 4rem; width: 4rem" src="thre.png" alt="" />
              <p class="textp">
                доставка <br />
                до двери
              </p>
            </div>
            <img style="max-width: 100%;" src="preim3.png" />
          </div>
        </div>
        <div style="text-align: center">
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
      </v-container>
    </section>
    <section id="whywork" style="margin-bottom: 4rem;background:#F4F5F6">
      <v-container style="padding: 1rem">
                <h2
          style="
            margin-top: 3rem;
            margin-bottom: 3rem;
            padding: 1rem;
            font-size: 2.5rem;
          "
        >
          отзывы
        </h2>
        <ListOtz class="d-none d-lg-block"/>
        <Otzmob class="d-block d-lg-none"/>
      </v-container>
    </section>
    <section id="bonus-opros">
      <v-container class="box-opros">
        <div style="padding: 2rem; padding-top: 4rem">
          <h2 style="color: #ff7a00; font-size: 2.7rem">Бонусы за опрос!</h2>
          <p style="margin-top: 3rem">
            Войдите в личный кабинет, пройдите опрос и получите
            <span style="color: #ff7a00; font-weight: bold">50 бонусов.</span>
            <br />
            Копите бонусы и обменивайте на овощи и фрукты!*
          </p>
          <p style="margin-top: 3rem">Ваш любимый праздник?</p>

          <v-radio-group v-model="radioGroup" background-color="transparent">
            <v-radio
              v-for="n in [
                'День Рождения',
                'Новый год',
                'Наурыз мейрамы',
                'День святого Валентина',
                '8 марта',
              ]"
              :key="n"
              color="orange"
              :label="`${n}`"
              :value="n"
            ></v-radio>
          </v-radio-group>
              <v-dialog
                v-model="dialog"
                persistent
                max-width="600px"
                
              >
              <v-card style="padding:1rem">
              <SignIn :dialog_exit="dialog_exit" :close="close"/>

              
              </v-card>
              </v-dialog>
          <v-btn
          @click="onBonus"
            rounded
            color="#ff7a00"
            style="height: 39px; margin-top: 1.7rem; margin-bottom: 1.7rem"
            dark
          >
            <span style="font-size: 12px">получить бонусы</span>
          </v-btn>
          <p>* Подробности акции ищите в разделе “Бонусы”. 1 бонус = 1 ТГ</p>
        </div>
      </v-container>
    </section>

  </div>
</template>

<script>
export default {
  asyncData({ $axios, route, error }) {
    const headers = {
      "Content-Type": "application/json",
    };

    return $axios
      .$get(`present/`, {
        headers: headers,
      })
      .then((presents) => {
        return { presents };
      });
  },
  computed: {
        onscr() {
      if (process.browser) {
        setTimeout(() => {
      var intersecti = new IntersectionObserver(function (entries) {
            if (entries[0].intersectionRatio <= 0) return;
            document.querySelector("#ind");
            document.querySelector("#ind").classList.add("ind3");
            setTimeout(() => {
              document.querySelector("#ind").classList.remove("ind3");
            }, 600);
            
          });
      intersecti.observe(document.querySelector(".ind2"));
        }, 1000);
      }
      },
    listproducts() {
      
      return this.presents;
    },
    computedDateFormatted() {
      return this.formatDate(this.date);
    },
 
  },
  watch: {
    date(val) {
      this.dateFormatted = this.formatDate(this.date);
    },
  },
  data: (vm) => ({
    date: new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
      .toISOString()
      .substr(0, 10),
    dateFormatted: "",
    menu1: false,
    menu2: false,
    dialog: false,
    radioGroup: 1,
    datetime: "",
    date: "",
    city: "",
    list_cituys:[
      'Абай',
      'Акколь',
      'Аксай',
      'Аксу',
      'Актау',
      'Актобе',
      'Алга',
      'Алматы',
      'Арал',
      'Аркалык',
      'Арыс',
      'Нур-Султан',
      'Атбасар',
      'Атырау',
      'Аягоз',
      'Байконыр',
      'Балхаш',
      'Булаево',
      'Державинск',
      'Ерейментау',
      'Есик',
      'Есиль',
      'Жанаозен',
      'Жанатас',
      'Жаркент',
      'Жезказган',
      'Жем',
      'Жетысай',
      'Житикара',
      'Зайсан',
      'Зыряновск',
      'Казалинск',
      'Кандыагаш',
      'Капшагай',
      'Караганды',
      'Каражал',
      'Каратау',
      'Каркаралинск',
      'Каскелен',
      'Кентау',
      'Кокшетау',
      'Костанай',
      'Косшы',
      'Кулсары',
      'Курчатов',
      'Кызылорда',
      'Ленгер',
      'Лисаковск',
      'Макинск',
      'Мамлютка',
      'Павлодар',
      'Петропавловск',
      'Приозёрск',
      'Риддер',
      'Рудный',
      'Сарань',
      'Сарканд',
      'Сарыагаш',
      'Сатпаев',
      'Семей',
      'Сергеевка',
      'Серебрянск',
      'Степногорск',
      'Степняк',
      'Тайынша',
      'Талгар',
      'Талдыкорган',
      'Тараз',
      'Текели',
      'Темиртау',
      'Темир',
      'Темиртау',
      'Тобыл',
      'Туркестан',
      'Уральск',
      'Усть-Каменогорск',
      'Ушарал',
      'Уштобе',
      'Форт-Шевченко',
      'Хромтау',
      'Шардара',
      'Шалкар',
      'Шар',
      'Шахтинск',
      'Шемонаиха',
      'Шу',
      'Шымкент',
      'Щучинск',
      'Экибастуз',
      'Эмба'
    ]
  }),

  methods: {
    close(){
      this.dialog = !this.dialog
    }, 
    dialog_exit(){
      this.dialog = false
    },
    onBonus(){
      if(!this.$store.state.localStorage.uid_auth_user){
        this.dialog = true
      }
      else{
        this.$router.push('/'+'for_bonus')
      }
      
    },
    bonys_page(){
      this.$router.push('/'+'for_bonus')
    },
    hhh(){
      this.$store.commit("localStorage/set_summBasket",0);
      this.$store.commit("localStorage/set_idBasket",0);
      this.$store.commit("localStorage/setAuthuser",'');
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
      this.$router.push("/"+'catalog/Все_продукты');
    },
    onsavecity_pushCatalog(){
      this.$router.push("/"+'catalog/Все_продукты');
    },
    getEvents(event) {
      // event only has the 'current month'
      let viewStart = this.$refs.calendar.getStartOfWeek(event.start);
      let viewEnd = this.$refs.calendar.getEndOfWeek(event.end);
      console.log(viewStart, viewEnd);
    },
  },
};
</script>
<style>
#ind{
    transition-delay: .5s;
    transition: .5s linear .5s; 
    }
.ind3{
  padding-left: 15rem;
  transition: .5s linear .5s; 
}
#header__content {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  background-image: url("/header.png");
  min-height: 100vh;
  color: white;
  display: flex;
  align-items: center;
  text-align: center;
}
h1{
    margin-top: 4rem;
}
#baner-bonys {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  background-image: url("/bonus.png");
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
}
#bonus-opros .box-opros {
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  background-image: url("/bonysball.png");
  min-height: 60vh;
  margin-bottom: 4rem;
  /* min-height: 400px;
  color: white;
  display: flex;
  align-items: center;
  text-align: center; */
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

@media(max-width: 500px){
.btnper{
  width: 50%;
  margin-top: 1.3rem

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
.box-header .v-text-field.v-text-field--solo .v-input__control {
  min-height: 48px;
  padding: 0;
  max-width: max-content;
}
.box-header .theme--light.v-input {
  width: -webkit-max-content;
  width: -moz-max-content;
  width: max-content;
  margin-top: 1rem;
  max-width: max-content;
}
.theme--light.v-list-item .v-list-item__mask{
  color:orange;
}
</style>
