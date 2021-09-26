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
          v-model="name"
          :rules="[(v) => !!v || 'Не может быть пустым']"
            label="* Контактное лицо"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
          :rules="[(v) => !!v || 'Не может быть пустым']"
          v-model="phone"
            label="* Номер телефона"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
          :rules="[(v) => !!v || 'Не может быть пустым']"
          v-model="name_company"
            label="* Наименование организации"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
          :rules="[(v) => !!v || 'Не может быть пустым']"
          v-model="email"
            label="* E-mail"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
          :rules="[(v) => !!v || 'Не может быть пустым']"
          v-model="bank_benefic"
            label="* Банк бенефицара"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
          v-model="bin_bank"
          :rules="[(v) => !!v || 'Не может быть пустым']"
            label="* БИН"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
          v-model="bik_bank"
          :rules="[(v) => !!v || 'Не может быть пустым']"
            label="* БИК"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
          v-model="iik_bank"
          :rules="[(v) => !!v || 'Не может быть пустым']"
            label="* ИИК"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
          :rules="[(v) => !!v || 'Не может быть пустым']"
          v-model="cod_platezh"
            label="* Код назначения платежа"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
          :rules="[(v) => !!v || 'Не может быть пустым']"
          v-model="kbe"
            label="* КБе"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <!-- доставка  -->
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
            label="* Укажите адрес доставки"
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
                'Счёт на оплату (отправляется по e-mail)'
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
        <!-- Ваш заказ -->

        <v-col cols="12" sm="12" md="12">
          <div class="d-flex mt-6" style="align-items: center;">
            <v-avatar color="#FF7A00" size="32">
              <span class="white--text text-h5">5</span>
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
                    <span style="color:#FF7A00;font-weight: bold;">+200</span>
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
                    <span style="color:#FF7A00;font-weight: bold;">+200</span>
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
  props: ["presents_in_basket",'user_data','oplatacheck'],
  data() {
      return {
          scrol: false,
          valid: true,
          scrol: false,
          name:'',
          count_spis_bonus:this.user_data.points/2,
          spis_bonus:null,
          oplata_methods:null,
          text_comment:'',
          adress:'',
          email:'',
          familyname:'',
          phone:'',
          name_company:'',
          bank_benefic:'',
          bin_bank:'',
          bik_bank:'',
          iik_bank:'',
          cod_platezh:'',
          kbe:'',
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
        this.adress &&
        this.name_company &&
        this.bank_benefic &&
        this.bin_bank &&
        this.bik_bank &&
        this.iik_bank &&
        this.cod_platezh &&
        this.kbe 
      ) {
        return true;
      } else {
        return false;
      }
    },
  
  },
  methods: {
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
      let data = {
      'name_user':this.name,
      'oplata_user':this.oplata_methods,
      'comment_user':this.text_comment,
      'adress_user':this.adress,
      'bonus_user':this.count_spis_bonus,
      'email_user':this.email,
      'phone_user':this.phone,
      'summa':(this.basket.summ_present + 500)-this.count_spis_bonus,
      "ur_oplata": true,
      "name_company": this.name_company,
      "bank_benefic": this.bank_benefic,
      "bin_bank": this.bin_bank,
      "bik_bank": this.bik_bank,
      "iik_bank": this.iik_bank,
      "cod_platezh": this.cod_platezh,
      "kbe": this.kbe,
      }
      console.log(data);
      
      this.$axios
        .$post(`http://localhost:8080/api/v1/present/history/oplata/${this.$store.state.localStorage.basket.id_basket}`, data, {
        })
        .then((resp) => {
          console.log(resp);
           let basket_id = this.$store.state.localStorage.basket.id_basket
        // window.location.href = `http://82.148.17.12:8080/api/v1/present/history/oplata/for_end/${basket_id}`
        })
        .catch(function (error) {
          console.log(error);
        });
      
    },
  },
};
</script>

<style>
.bonusform {
  max-width: 70%;
  min-width: 70%;
}
@media (max-width: 500px) {
  .bonusform {
    max-width: 100%;
    min-width: 100%;
  }
}
</style>