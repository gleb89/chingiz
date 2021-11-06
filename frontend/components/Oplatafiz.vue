<template>
  <v-form  
  @submit.prevent="validate"
  lazy-validation  
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
            v-mask="'+7 (###) ###-##-##'"
                   class="prep"
              prepend-inner-icon="*"
            v-model="phone"
            :rules="[rulesphone.required,rulesphone.counter]"
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
            class="prep"
            v-model="email"
            prepend-inner-icon="*" 
            :rules="[rules.required, rules.email]"
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
          <!-- <v-text-field
          id=""
          label="Укажите город "
          placeholder=""
            class="prep"
            prepend-inner-icon="*"
            :rules="[(v) => !!v || 'Не может быть пустым']"
            solo
            v-model="city" 
            style="min-width:100%"
          ></v-text-field> -->
                    <v-autocomplete
                
                class="prep"
                label="Город доставки"
                prepend-inner-icon="*"
                v-model="city"
                :rules="[(v) => !!v || 'Не может быть пустым']"
                color="orange"
                item-color="orange"
                :items="list_cituys"
                solo
                no-data-text="Ничего не найдено"
              ></v-autocomplete>
        </v-col>
        <v-col cols="12" sm="12" md="12">
          <v-text-field
          id=""
          label="Укажите улицу "
          placeholder=""
            class="prep"
            prepend-inner-icon="*"
            :rules="[(v) => !!v || 'Не может быть пустым']"
            solo
            v-model="stret" 
            style="min-width:100%"
          ></v-text-field>
      
        </v-col>
        <v-col cols="12" sm="12" md="12">
          <v-text-field
          id=""
          label="Укажите дом "
          placeholder=""
            class="prep"
            prepend-inner-icon="*"
            :rules="[(v) => !!v || 'Не может быть пустым']"
            solo
            v-model="home" 
            style="min-width:100%"
          ></v-text-field>
      
        </v-col>
        <v-col cols="12" sm="12" md="12">
          <v-text-field
          id=""
          label="Укажите квартиру"
          placeholder=""
            class="prep"
            prepend-inner-icon="*"
            :rules="[(v) => !!v || 'Не может быть пустым']"
            solo
            v-model="kvartira" 
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
          <v-radio-group :rules="[(v) => !!v || 'Не может быть пустым']" v-model="oplata_methods" background-color="transparent" style="min-width:100%">
       
            <v-radio 
            
              v-for="n in [
                'Kaspi.kz, Kaspi Pay',
                'Оплатить картой Visa / Master Card',
                'Оплата при получении'
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
                :rules="[(v) => !!v || 'Не может быть пустым']"
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
 <div class="d-lg-none d-md-none d-block" >
           <v-card
           v-for="(item,index) in  presents_in_basket.count_present_item.presents"
          :key="index"
         style="border: none;"
    class="mx-auto"
    
    outlined
  >
    <v-list-item three-line>
              <v-avatar
                
                size="125"
                tile
              >
                <v-img :src="item.image_precent"></v-img>
              </v-avatar>

      <v-list-item-content style="margin-left: 2em;">
        <div class=" mb-4" >
         
          <span>Название:</span> <span style="font-weight: 500;"> {{item.name_precent}}</span>

        </div>
        <v-list-item-title class=" mb-1">
           <span>Артикул:</span> <span style="font-weight: 500;"> EL-{{item.id}}</span>
           <p class="mt-3">
          Цена: <span style="font-weight: 500;"> {{ item.price.toLocaleString() }} тг </span>
          </p>
          <p class="mt-3">
          Количество: <span style="font-weight: 500;"> {{ item.count }} шт</span>
          </p>
        </v-list-item-title>
        <v-list-item-subtitle>
         <span style="font-weight: 500;font-size: 1.1em;">Бонусы:</span>  <span style="color:#FF7A00;font-weight: bold;font-size: 1.2em;">+500</span>
        </v-list-item-subtitle>
      </v-list-item-content>


    </v-list-item>
     <hr>
  </v-card>
       
</div>
        </v-col>
                <v-col cols="12" sm="12" md="12">
            <div style="text-align: end;">
                <p>Итого: {{basket.summ_present.toLocaleString()}} тг</p>
                <p>Доставка: 500 тг.</p>
                 <p v-if="spis_bonus != 'Списать бонусы'" >Бонусы: - 0 тг.</p>
                <h3 v-if="spis_bonus != 'Списать бонусы'"  style="color:#676767">Всего к оплате: {{(basket.summ_present + 500).toLocaleString()}} тг.</h3>
                <p v-if="spis_bonus === 'Списать бонусы'" >Бонусы: - {{count_spis_bonus}} тг.</p>
                <h3 v-if="spis_bonus === 'Списать бонусы'"  style="color:#676767">Всего к оплате: {{((basket.summ_present + 500)-count_spis_bonus).toLocaleString()}} тг.</h3>
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
            <span style="font-size: .6rem">оформить заказ</span>
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

 
// const center = {  lat: 40.749933, lng: -73.98633 };
// const defaultBounds = {
//   north: center.lat + 0.1,
//   south: center.lat - 0.1,
//   east: center.lng + 0.1,
//   west: center.lng - 0.1,
// };
// const input = document.getElementById("searchTextField");
// const options = {
//   bounds: defaultBounds,
//   componentRestrictions: { country: "kz" },
//     fields: ["formatted_address", "geometry", "name"],
//     strictBounds: false,
//     types: ["address"],

// };
// const autocomplete = new google.maps.places.Autocomplete(input, options);
// autocomplete.setTypes("address")

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
      kvartira:'',
      list_cituys: [
      "Алматы",
      "Нур-Султан"
    ],
      home:'',
      stret:'',
     rulesphone: {
          required: value => !!value || 'Не может быть пустым.',
          counter: value => value.length === 18 || 'Минимум 11 цифр',
         
        },
      rules: {
          required: value => !!value || 'Не может быть пустым.',
          counter: value => value.length <= 20 || 'Максимум 20 символов',
          email: value => {
            const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
            return pattern.test(value) || 'Невалидный e-mail.'
          },
        },
    
      city:localStorage.getItem('city')||'',
      name:'',
      count_spis_bonus:0,
      spis_bonus:'Не использовать',
      oplata_methods:null,
      text_comment:'',
      adress: '',
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
      
      this.adress = 'Город: '+this.city+',Улица: '+this.stret+',Дом: '+this.home+',Квартира: '+this.kvartira
      
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
        .$post(`https://giftcity.kz/api/v1/present/history/oplata/${this.$store.state.localStorage.basket.id_basket}`, data, {
        })
        .then((resp) => {
          console.log(resp);

        this.$store.commit("localStorage/set_summBasket",Number(0));
        this.retbonus()
                        
                
                
        if(this.oplata_methods === 'Kaspi.kz, Kaspi Pay'){
          this.$router.push('/cabinet/oplata/kaspioplata')
        }
        if(this.oplata_methods === 'Оплата при получении'){
          this.$router.push('/cabinet/oplata/presend')
        }
        if(this.oplata_methods === 'Оплатить картой Visa / Master Card'){
          this.$router.push('/cabinet/oplata/presend')
        }
        
        
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
