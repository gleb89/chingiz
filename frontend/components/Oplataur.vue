<template>
  <v-form>
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
            label="* Контактное лицо"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
            label="* Номер телефона"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
            label="* Наименование организации"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
            label="* E-mail"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
            label="* Банк бенефицара"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
            label="* БИН"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
            label="* БИК"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
            label="* ИИК"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
            label="* Код назначения платежа"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6" md="6">
          <v-text-field
            label="* КБе"
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
            label="* Укажите адрес доставки"
            solo
            style="min-width:100%"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="12" md="12">
          <v-textarea
            solo
            style="min-width:100%"
            name="input-7-4"
            label="Комментарий"
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
          <v-radio-group background-color="transparent" style="min-width:100%">
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
          <v-radio-group background-color="transparent" style="min-width:100%">
            <v-radio
              v-for="n in ['Не использовать', 'Списать бонусы']"
              :key="n"
              color="orange"
              :label="`${n}`"
              :value="n"
            ></v-radio>
          </v-radio-group>
        </v-col>
        <v-col cols="12" sm="12" md="12" style="background: #F4F5F6;">
          <div class="d-flex flex-wrap" style="align-items: center;">
            <v-text-field
              label="Укажите, сколько бонусов вы хотите списать"
              solo
              class="bonusform"
              style=""
            ></v-text-field>
            <v-btn
              rounded
              color="#ff7a00"
              style="height: 39px;color: white;;margin-bottom:1.8rem;margin-left:1rem;"
              dark
            >
              <span style="font-size: 12px;">применить</span>
            </v-btn>
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
          <!-- mobile -->
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
                <p>Бонусы: - 700 тг.</p>
                <h3 style="color:#676767">Всего к оплате: 350 000 тг.</h3>
            </div>


        </v-col>
        
      </v-row>
    </v-container>
  </v-form>
</template>

<script>
export default {
  props: ["presents_in_basket"],
  data() {
      return {
          scrol: false,
      };
  },
  computed: {
    basket() {
      return this.$store.state.localStorage.basket;
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