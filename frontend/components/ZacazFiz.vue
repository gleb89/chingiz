<template>
  <div>
      
    <v-dialog
      v-model="dialog_pres"
      transition="dialog-bottom-transition"
      max-width="600"
    >
      <v-card>
        <v-container class="">
          <v-row justify="center">
            <v-col
              class="d-flex justify-center"
              v-for="present in presents_for_zakaz"
              :key="present.id"
              cols="12"
            >
              <CardProdHistory :present="present" />
            </v-col>
          </v-row>
        </v-container>
        <v-divider></v-divider>
        <v-card-actions style="justify-content: end;">
          <v-btn color="blue darken-1" text @click="dialog_pres = false">
            Закрыть
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
<v-dialog
      v-model="dialog"
      scrollable
      max-width="600px"
    >
      <v-card>
        <v-card-title>Курьеры</v-card-title>
        <v-divider></v-divider>
        <v-card-text style="height: 300px;">
          <v-radio-group
            v-model="curer"
            column
          >
          <div style="margin-bottom: 4rem;"  v-for="(curer,index) in curers" :key="index">
              <p>
                Имя курьера: {{curer.name}}
              </p>
              <p>
                Адрес прож.: {{curer.adress_prozjivania}}
              </p>
              <p>
                телефон: {{curer.phone_courier}}
              </p>
            <v-radio
           
              label="Выбрать"
              :value="curer"
            ></v-radio>
          </div>
 
          </v-radio-group>
        </v-card-text>
        <v-divider></v-divider>
        <v-card-actions>
          <v-btn
            color="blue darken-1"
            text
            @click="dialog = false"
          >
            закрыть
          </v-btn>
          <v-btn
            color="blue darken-1"
            text
            @click="sendCurers"
          >
            отправить
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <div class="pl-4">
      <h4 style="margin-top:4em">Сортировка</h4>
      
      <div>
      <v-radio-group v-model="radioGroup">
        <v-row>
          <v-col  v-for="n in [
        'Все',
        'Неоплаченные',
        'Оплаченные',
        'Отправлены курьеру',
        'Неотправлены курьеру',
        'Отправлено курьеру но еще не доставлено',
        'Отправлено курьеру и доставлено'
        ]" :key="n" cols="6" lg="4" md="4">
      <v-radio
       
        
        :label="` ${n}`"
        :value="n"
      ></v-radio>
      </v-col>
      </v-row>
    </v-radio-group>
      </div>
    </div>
    <v-data-table
    style="margin-top:4em"
      :headers="headers"
      :items="sorted"
      :items-per-page="5"
      class="elevation-1"
    >
      <template v-slot:item.pres_list="{ item }">
        <v-btn @click="onAllpresent(item.history)" text>
          смотреть
        </v-btn>
      </template>

      <template v-slot:item.admin_succes_oplata="{ item,index }">
        <v-switch
            @click="succesOplata(item.id,item.succes_oplata,index)"
            color="success"
                label="Подтверждение оплаты"
                v-model="item.succes_oplata"
                ></v-switch>
      </template>

      <template v-slot:item.admin_send_curer="{ item,index }">
       <div v-if="admin_data.history_basket_change">
        <v-btn  v-if="!item.admin_send_curer" @click="openCurer(item,index)" text>
          выбрать
        </v-btn>
        </div>
        <span v-if="item.admin_send_curer">отправлен курьеру c id :{{item.send_id_curer}}/
          имя: {{item.send_name_curer}}/
        </span>
      </template>
        <template v-slot:item.photo_otchet="{ item }">
       <img style="max-width: 6rem;" :src="item.photo_otchet" alt="еще не доставлено курьером">
       
      </template>
    </v-data-table>
  </div>
</template>

<script>
export default {
  props:['data_history_fiz',"curers"],
computed: {
       admin_data(){
       return this.$store.state.localStorage.admin_data
       },
    sorted(){
      if(this.radioGroup === 'Все'){
        return this.data_history_fiz
      }
      if(this.radioGroup === 'Неоплаченные'){
        return this.data_history_fiz.filter((elem) => {
        return elem.succes_oplata  === false
      });
      }
        if(this.radioGroup === 'Оплаченные'){
        return this.data_history_fiz.filter((elem) => {
        return elem.succes_oplata  === true
      });
      }
        if(this.radioGroup === 'Отправлены курьеру'){ 
        return this.data_history_fiz.filter((elem) => {
        return elem.admin_send_curer  === true
      });
      }
        if(this.radioGroup === 'Неотправлены курьеру'){
        return this.data_history_fiz.filter((elem) => {
        return elem.admin_send_curer  ===  false
      });
      }
        if(this.radioGroup === 'Отправлено курьеру но еще не доставлено'){ 
        return this.data_history_fiz.filter((elem) => {
        return elem.photo_otchet ===  false && elem.admin_send_curer  === true
      });
      }
        if(this.radioGroup === 'Отправлено курьеру и доставлено'){
        return this.data_history_fiz.filter((elem) => {
        return elem.photo_otchet  ===  true && elem.admin_send_curer  === true
      });
      }

    },

},
 
  data() {
    return {
      headers: [
      { text: "Артикул заказа", value: "id" },
      { text: "Дата заказа", value: "timestamp" },
      { text: "Имя клиента", value: "name_user" },
      { text: "Фамилия", value: "famaly_name_user" },
      { text: "email", value: "email_user" },
      { text: "Адресс", value: "adress_user", sortable: false },
      { text: "Комментарий", value: "comment_user" },
     { text: "Сист.оплаты", value: "oplata_user" },
     { text: "Исп.бонусы", value: "bonus_user" },
     { text: "Итого(тг)", value: "summa" },
     { text: "Дата доставки", value: "data_dostavki" },
       { text: "подарки в заказе ", value: "pres_list", sortable: false },
       { text: "Оплата", value: "admin_succes_oplata" },
        { text: "Отправить курьеру", value: "admin_send_curer" },
        { text: "Фото-очет", value: "photo_otchet", sortable: false },
    //   { text: "Изменить/ удалить", value: "actions", sortable: false },
    //   { text: "перейти", value: "onpage", sortable: false },
    ],
      presents_for_zakaz: [],
      dialog_pres: false,
      curer:{},
      history_data:{},
      dialog:false,
      ind:null,
      radioGroup: 'Все',
    };
  },
  methods: {
    onAllpresent(presents) {
      this.presents_for_zakaz = presents;
      this.dialog_pres = true;
    },
    openCurer(item,index){
        this.ind = index
        this.history_data = item
        this.dialog = true
        
    },
    succesOplata(pk,bool_olata,index){
     let oplata
     if(bool_olata){
       oplata = 1
     }
     else{
       oplata = 0
     }
    this.$axios
        .$put(`http://giftcity.kz/api/v1/present/history/succes_olata/${pk}/${oplata}`, {
    
        })
        .then((data) => {
          this.data_history_fiz[index] = data
         
        })
        .catch(function (error) {
        console.log('error');
      });
    },
    sendCurers(){
        
        let data = {
                "history_id": this.history_data.id,
                "name_user": this.history_data.name_user,
                "famaly_name_user": this.history_data.famaly_name_user,
                "phone_user": this.history_data.phone_user,
                "email_user": this.history_data.email_user,
                "adress_user": this.history_data.adress_user
        }

        this.$axios
        .$post(`http://giftcity.kz/api/v1/couriers/orders/create/${this.curer.id}`, data, {
    
        })
        .then((data) => {
            console.log(data);
            this.data_history_fiz[this.ind].admin_send_curer = true
            this.data_history_fiz[this.ind].send_id_curer = this.curer.id
            this.data_history_fiz[this.ind].send_name_curer = this.curer.name
            this.dialog = false
        })
        .catch(function (error) {
        console.log('error');
      });
    }
  }

}
</script>

