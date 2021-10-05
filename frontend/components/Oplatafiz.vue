<template>
  <v-form    
    ref="form"
    v-model="valid">
    <v-container>
      <v-row>
        <v-col cols="12" sm="12" md="12">
          <div class="d-flex mt-6" style="align-items: center;">
            <v-avatar color="#FF7A00" size="32">
              <span class="white--text text-h5">1</span>
            </v-avatar>
            <h3 class="ml-4">Авторизация</h3>
          </div>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
           label="Имя"
                  class="prep"
              prepend-inner-icon="*"
           v-model="name"
           :rules="[(v) => !!v || 'Не может быть пустым']"
            solo style="min-width:100%"
            ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
            label="Номер телефона" 
                   class="prep"
              prepend-inner-icon="*"
            v-model="phone"
            :rules="[(v) => !!v || 'Не может быть пустым']"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
            label="Фамилия"
                   class="prep"
      
            v-model="familyname"
            
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
            label="E-mail" 
            v-model="email"
            prepend-inner-icon="*" 
            :rules="[(v) => !!v || 'Не может быть пустым']"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <!-- доставка  -->
        <v-col cols="12" sm="12" md="12">
          <div class="d-flex mt-6" style="align-items: center;">
            <v-avatar color="#FF7A00" size="32">
              <span class="white--text text-h5">2</span>
            </v-avatar>
            <h3 class="ml-4">Доставка</h3>
          </div>
        </v-col>
        <v-col cols="12" sm="12" md="12">
          <v-text-field
          id="searchTextField"
            label="Укажите адрес доставки"
                   class="prep"
              prepend-inner-icon="*"
            :rules="[(v) => !!v || 'Не может быть пустым']"
            solo
            v-model="adress" 
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="12" md="12">
          <v-textarea
            solo
            style="min-width:100%" 
            name="input-7-4"
            label="Комментарий"
            v-model="text_comment"
          ></v-textarea>
        </v-col>
        <!-- способ оплаты -->

        <v-col cols="12" sm="12" md="12">
          <div class="d-flex mt-6" style="align-items: center;">
            <v-avatar color="#FF7A00" size="32">
              <span class="white--text text-h5">3</span>
            </v-avatar>
            <h3 class="ml-4">Способ оплаты</h3>
          </div>
        </v-col>
        <v-col cols="12" sm="12" md="12">
          <v-radio-group v-model="oplata_methods" background-color="transparent" style="min-width:100%">
            
            <v-radio 
            
              v-for="n in [
                'Kaspi, K2, Kaspi Pay',
                'Оплатить картой Visa / Master Card'
              ]"
              :key="n"
              color="orange"
              :label="`${n}`"
              :value="n"
            ></v-radio>
          </v-radio-group>
        </v-col>

        <!-- Списание бонусов -->
        <v-col cols="12" sm="12" md="12">
          <div class="d-flex mt-6" style="align-items: center;">
            <v-avatar color="#FF7A00" size="32">
              <span class="white--text text-h5">4</span>
            </v-avatar>
            <h3 class="ml-4">Активировать бонусы</h3>
          </div>
        </v-col>
        <v-col cols="12" sm="12" md="12">
          <v-radio-group v-model="spis_bonus"  background-color="transparent" style="min-width:100%">
            
            <v-radio
            
              v-for="n in ['Не использовать', 'Списать бонусы']"
              :key="n"
              color="orange"
              :label="`${n}`"
              :value="n"
            ></v-radio>
          </v-radio-group>
        </v-col>
        <v-col v-if="spis_bonus === 'Списать бонусы'" cols="12" sm="12" md="12" style="background: #F4F5F6;">
        <div style="width:100%">
      <p >Укажите, сколько бонусов вы хотите списать</p>
      <v-slider
      style="width:100%"
      
        v-model="count_spis_bonus"
        color="orange"
        step="1"
        track 
        thumb-label="always"
        :max="user_data.points"
        min="0"
      ></v-slider>

          </div>
        </v-col>

        <!-- дата доставки -->
                <v-col cols="12" sm="12" md="12">
          <div class="d-flex mt-6" style="align-items: center;">
            <v-avatar color="#FF7A00" size="32">
              <span class="white--text text-h5">5</span>
            </v-avatar>
            <h3 class="ml-4">Дата доставки</h3>
          </div>
        </v-col>

         <v-col cols="12" sm="12" md="12">
           <v-menu
            ref="menu1"
            v-model="menu1"
            :rules="[(v) => !!v || 'Не может быть пустым']"
            :close-on-content-click="false"
            transition="scale-transition"
            offset-y
            width="1000px"
            max-width="1000px"
            min-width="auto"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="data_dostavki"
                label="Дата доставки"
                       class="prep"
              prepend-inner-icon="*"
                solo
                v-bind="attrs"
                @blur="date = parseDate(data_dostavki)"
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
        <!-- Ваш заказ -->

        <v-col cols="12" sm="12" md="12">
          <div class="d-flex mt-6" style="align-items: center;">
            <v-avatar color="#FF7A00" size="32">
              <span class="white--text text-h5">6</span>
            </v-avatar>
            <h3 class="ml-4">Ваш заказ</h3>
          </div>
        </v-col>
        <v-col cols="12" sm="12" md="12">
          <v-simple-table class="d-lg-block d-md-block d-none">
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
                    Артикул
                  </th>
                  <th style="color:#1F2128" class="text-left">
                    Количество
                  </th>
                  <th style="color:#1F2128" class="text-left">
                    Бонусы
                  </th>
                  <th style="color:#1F2128" class="text-left">
                    Итого
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(item, index) in presents_in_basket.count_present_item
                    .presents"
                  :key="index"
                >
                  <td>
                    <img
                      style="max-width: 8rem;"
                      :src="item.image_precent"
                      alt=""
                    />
                  </td>
                  <td>{{ item.name_precent }}</td>
                  <td>00129{{ item.id }}</td>
                  <td>{{ item.count }} шт</td>

                  <td>
                    <span style="color:#FF7A00;font-weight: bold;">+500</span>
                  </td>
                  <td>
                    {{ item.price.toLocaleString() }} тг
                  </td>
                </tr>
              </tbody>
            </template>
          </v-simple-table>
          <v-simple-table class="d-lg-none d-md-none d-block">
            <template v-slot:default>
              <thead>
                <tr>
                  <th v-if="!scrol" style="color:#1F2128" class="text-left">
                    Фото товара
                  </th>
                  <th v-if="!scrol" style="color:#1F2128" class="text-left">
                    Наименование товара
                  </th>
                  <th v-if="!scrol" style="color:#1F2128" class="text-left">
                    Артикул
                  </th>
                <th v-if="scrol" style="color:#1F2128" class="text-left">
                   вернуться
                  </th>
                    <th v-if="!scrol" style="color:#1F2128" class="text-left">
                   смотреть подробнее
                  </th>
                  <th v-if="scrol" style="color:#1F2128" class="text-left">
                    Количество
                  </th>
                  <th v-if="scrol" style="color:#1F2128" class="text-left">
                    Бонусы
                  </th>
                  <th v-if="scrol" style="color:#1F2128" class="text-left">
                    Итого
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="(item, index) in presents_in_basket.count_present_item
                    .presents"
                  :key="index"
                >
                  <td v-if="!scrol">
                    <img
                      style="max-width: 4rem;"
                      :src="item.image_precent"
                      alt=""
                    />
                  </td>
                  <td style="font-size: .8rem;" v-if="!scrol">{{ item.name_precent }}</td>
                  <td v-if="!scrol">00129{{ item.id }}</td>
                   <td style="height: 10rem;" @click="scrol = !scrol" v-if="!scrol" class="text-center"><fa icon="long-arrow-alt-right"></fa> </td>
                   <td style="height: 10rem;" @click="scrol = !scrol" v-if="scrol" class="text-center"><fa icon="long-arrow-alt-left"></fa> </td>
                  <td style="height: 10rem;" v-if="scrol">{{ item.count }} шт</td>

                  <td style="height: 10rem;" v-if="scrol">
                    <span style="color:#FF7A00;font-weight: bold;">+500</span>
                  </td>
                  <td v-if="scrol">
                    {{ item.price.toLocaleString() }} тг
                  </td>
                </tr>
              </tbody>
            </template>
          </v-simple-table>
        </v-col>
                <v-col cols="12" sm="12" md="12">
            <div style="text-align: end;">
                <p>Итого: {{basket.summ_present.toLocaleString()}} тг</p>
                <p>Доставка: 500 тг.</p>
                 <p v-if="spis_bonus != 'Списать бонусы'" >Бонусы: - 0 тг.</p>
                <h3 v-if="spis_bonus != 'Списать бонусы'"  style="color:#676767">Всего к оплате: {{basket.summ_present + 500}} тг.</h3>
                <p v-if="spis_bonus === 'Списать бонусы'" >Бонусы: - {{count_spis_bonus}} тг.</p>
                <h3 v-if="spis_bonus === 'Списать бонусы'"  style="color:#676767">Всего к оплате: {{(basket.summ_present + 500)-count_spis_bonus}} тг.</h3>
            </div>


        </v-col>
        <div class="text-center pt-4 pb-7 mb-6" style="width: 100%;">
            <v-btn
               
            
            
            @click="validate"
            rounded
            color="#ff7a00"
            style="min-width: 30%;height: 3rem;"
            dark
          >
            <span style="font-size: .6rem">перейти к оформлению</span>
          </v-btn>
            </div>
      </v-row>
    </v-container>
    
  </v-form>
</template>

<script>

export default {
// head() {
//     return {
//       script: [
//         {src: `https://maps.googleapis.com/maps/api/js?key=bWB7SIQeyl7BhORR0wZRZG3Q&callback=initMap&libraries=places&v=weekly`}
//       ]
//     };
//   },
mounted: function () {
  // const center = { lat: 50.064192, lng: -130.605469 };
	// 	var defaultBounds = new google.maps.LatLngBounds(
	// 	new google.maps.LatLng(43.238949, 76.889709),
	// 	new google.maps.LatLng(-33.8474, 151.2631));
	// 	var input = document.getElementById('searchTextField');
	// 	var options = {
	// 		bounds: defaultBounds,
	// 		types: ['establishment']
	// 	};
	// 	this.autocomplete = new google.maps.places.Autocomplete(input, options);
const center = { lat: 43.238949, lng: 76.889709 };
// Create a bounding box with sides ~10km away from the center point
const defaultBounds = {
  north: center.lat + 0.1,
  south: center.lat - 0.1,
  east: center.lng + 0.1,
  west: center.lng - 0.1,
};
const input = document.getElementById("searchTextField");
const options = {
  bounds: defaultBounds,
  componentRestrictions: { country: "kz" },
    fields: ["formatted_address", "geometry", "name"],
    strictBounds: false,
    types: ["establishment"],

};
const autocomplete = new google.maps.places.Autocomplete(input, options);

	},
  props: ["presents_in_basket",'user_data','oplatacheck','retbonus'],

    watch: {
    date(val) {
      this.data_dostavki = this.formatDate(this.date);
    },
  },
  data(vm) {
    return {
   date: new Date(Date.now() - new Date().getTimezoneOffset() * 60000)
      .toISOString()
      .substr(0, 10),
      valid: true,
      scrol: false,
      menu1:false,
      name:'',
      count_spis_bonus:0,
      spis_bonus:null,
      oplata_methods:null,
      text_comment:'',
      adress:localStorage.getItem('city')||'',
      email:'',
      familyname:'',
      phone:'',
      data_dostavki:localStorage.getItem('date')||''
    };
  },
    computed: {
    basket() {
      return this.$store.state.localStorage.basket;
    },
      onlformdata() {
        
      if (
        this.name &&
        this.phone &&
        this.email &&
        this.adress &&
        this.data_dostavki &&
        this.oplata_methods  
      ) {
        return true;
      } else {
        return false;
      }
    },

  
  },
  methods: {
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
      validate () {
        this.$refs.form.validate()
        if(this.$refs.form.validate()){
          this.oplatacheckfiz()
        }
        else{
          console.log('0000');
        }
      },
    oplatacheckfiz() {
      let sum = (this.basket.summ_present + 500)-this.count_spis_bonus
      let bonuusadd = this.presents_in_basket.count_present_item.presents.length*500

      let data = {
      'name_user':this.name,
      'oplata_user':this.oplata_methods,
      'comment_user':this.text_comment,
      'adress_user':this.adress,
      'bonus_user':bonuusadd ,
      'email_user':this.email,
      'famaly_name_user':this.familyname,
      'phone_user':this.phone,
      'summa':Number(sum),
      "fiz_oplata": true,
      'data_dostavki':String(this.data_dostavki) ,
      'spisbonuys':Number(this.count_spis_bonus)
      }
      
      
      
      this.$axios
        .$post(`https://api-booking.ru/api/v1/present/history/oplata/${this.$store.state.localStorage.basket.id_basket}`, data, {
        })
        .then((resp) => {
          console.log(resp);

        this.$store.commit("localStorage/set_summBasket",Number(0));
        this.retbonus()
        this.$router.push('/cabinet/oplata')
        
        })
        .catch(function (error) {
          console.log(error);
        });
      
    },
  },
};
</script>

<style scoped>
.bonusform {
  max-width: 100%;
  min-width: 100%;
}
@media (max-width: 500px) {
  .bonusform {
    max-width: 100%;
    min-width: 100%;
  }
}
.theme--light.v-input {
    width: 100%;
    margin-top: 1rem;
}
.prep .v-icon.v-icon {

  
    color: #ff7a00;
}
</style>
