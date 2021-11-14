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
    <v-dialog style="padding:1em" v-model="dialogImage">
       <v-card>
        <v-container class="">
                      <v-col
              class="d-flex justify-center"
            style="padding:1em"
              cols="12"
            >
      <img style="max-width: 30em;;height:auto"  :src="link_image" alt="">
       </v-col>
          
     </v-container>
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

  <v-expansion-panels style="background: #f7f7f7;margin-top:3em;margin-bottom:3em">
          <v-expansion-panel>
            <v-expansion-panel-header>
              <h4 class="pb-6">Фильтры</h4>
            </v-expansion-panel-header>
            <v-expansion-panel-content>
              <v-row>
                <v-col cols="12" >
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
                </v-col>
   
                <v-col cols="12">
                  <v-btn @click="radioGroup = 'Все'" class="ma-2" outlined color="indigo">
                    Сбросить фильтры
                  </v-btn>
                </v-col>
              </v-row>
            </v-expansion-panel-content>
          </v-expansion-panel>
        </v-expansion-panels>
          <v-autocomplete
            v-model="valueforsearch"
            :items="forsearch"
            dense
            solo
            filled
            label="Поиск по артиклю заказа"
          ></v-autocomplete>
                                <v-col cols="12">
                  <v-btn v-if="valueforsearch " @click="valueforsearch = null" class="ma-2" outlined color="indigo">
                     Очистить поиск
                  </v-btn>
                </v-col>

    <v-data-table
    style="margin-top:4em"
      :headers="headers"
      :items="sorted"
      :items-per-page="5"
      class="elevation-1"
    >
      <template v-slot:item.pres_list="{ item }">
        <v-btn @click="onAllpresent(item.history)" outlined color="indigo">
           смотреть
          <fa style="font-size: 1em;color: #7c7cc5;" icon="eye"></fa> 
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
         <div v-if="item.admin_send_curer">
           <fa  style="color:green" icon="check"></fa> отправлен:
           <p v-if="item.admin_send_curer">курьеру c id :{{item.send_id_curer}}</p>
           
         </div>
        
        
          
        
      </template>
       
              <template v-slot:item.adress_user="{ item }">
                <div style="background: azure;padding:1em">
       <p>{{item.adress_user.split(',')[0]}}</p>
       <p>{{item.adress_user.split(',')[1]}}</p>
       <p>{{item.adress_user.split(',')[2]}}</p>
       <p>{{item.adress_user.split(',')[3]}}</p>
       </div>
       
       
      </template>
        <template v-slot:item.photo_otchet="{ item }">
       <img @click="onImage(item.photo_otchet)" v-if="item.photo_otchet" style="max-width: 6rem;cursor:pointer" :src="item.photo_otchet" alt="">
       
       
      </template>

              <template v-slot:item.timestamp="{ item }">
       <span>{{new Date(item.timestamp).toLocaleDateString()}}</span>
       
       
      </template>
      <template v-slot:item.succes_dostavka_curer="{ item }">
       <fa v-if="item.succes_dostavka_curer" style="color:green" icon="check"></fa>
       <fa v-if="!item.succes_dostavka_curer" style="color:red" icon="stop-circle"></fa>
       
      
      </template>
    </v-data-table>
  </div>
</template>

<script>
export default {
  props:['data_history_ur',"curers"],
computed: {
       admin_data(){
       return this.$store.state.localStorage.admin_data
       },
    forsearch(){
      for(let i of this.data_history_ur){
        this.search_items.push(`артикул заказа:${i.id}`)
      }
      return this.search_items
    },
    sorted(){
      if(this.valueforsearch){
        console.log('rrr');
        return this.data_history_ur.filter(elem => {
          return elem.id === Number(this.valueforsearch.split(':')[1])
            
          
        });
      }
      else{
      if(this.radioGroup === 'Все'){
        
        return this.data_history_ur
      }
 
      if(this.radioGroup === 'Неоплаченные'){
        return this.data_history_ur.filter((elem) => {
        return elem.succes_oplata  === false
      });
      }
        if(this.radioGroup === 'Оплаченные'){
        return this.data_history_ur.filter((elem) => {
        return elem.succes_oplata  === true
      });
      }
        if(this.radioGroup === 'Отправлены курьеру'){ 
        return this.data_history_ur.filter((elem) => {
        return elem.admin_send_curer  === true
      });
      }
        if(this.radioGroup === 'Неотправлены курьеру'){
        return this.data_history_ur.filter((elem) => {
        return elem.admin_send_curer  ===  false
      });
      }
        if(this.radioGroup === 'Отправлено курьеру но еще не доставлено'){ 
        return this.data_history_ur.filter((elem) => {
        return elem.admin_send_curer  ===  true && elem.succes_dostavka_curer === false
      });
      }
        if(this.radioGroup === 'Отправлено курьеру и доставлено'){
        return this.data_history_ur.filter((elem) => {
        return elem.admin_send_curer  ===  true && elem.succes_dostavka_curer === true
      });
      }
      }
    },

},
 
  data() {
    return {
headers: [
        { text: "Артикул заказа", value: "id" },
        { text: "Доставлено ?", value: "succes_dostavka_curer" },
        { text: "Дата заказа", value: "timestamp" },
        { text: "Конт. лицо", value: "name_user" },
        { text: "Фамилия", value: "famaly_name_user" },
        { text: "Имя компании", value: "name_company" },
        { text: "Банк бенефицара", value: "bank_benefic" },
        { text: "БИН", value: "bin_bank" },
        { text: "БИК", value: "bik_bank" },
        { text: "ИИК", value: "iik_bank" },
        { text: "Код платежа", value: "cod_platezh" },
        { text: "КБЕ", value: "kbe" },
        { text: "email", value: "email_user" },
        { text: "Адрес доставки", value: "adress_user", sortable: false },
        { text: "Комментарий", value: "comment_user" },
        { text: "Сист.оплаты", value: "oplata_user" },
        { text: "Исп.бонусы", value: "bonus_user" },
        { text: "Итого(тг)", value: "summa" },
        { text: "Дата доставки", value: "data_dostavki" },
        { text: "подарки в заказе ", value: "pres_list", sortable: false },
        { text: "Оплата", value: "admin_succes_oplata" },
        { text: "Отправить курьеру", value: "admin_send_curer" },
        { text: "Фото-очет", value: "photo_otchet", sortable: false },
        // { text: "выбрать курьера", value: "curers_list", sortable: false },
        //   { text: "Изменить/ удалить", value: "actions", sortable: false },
        //   { text: "перейти", value: "onpage", sortable: false },
      ],
      presents_for_zakaz: [],
      dialog_pres: false,
      curer:{},
      link_image : '',
      dialogImage : false,
      history_data:{},
      search_items:[],
      dialog:false,
      ind:null,
      radioGroup: 'Все',
      valueforsearch:null,
    
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
        .$put(`/api/present/history/succes_olata/${pk}/${oplata}`, {
    
        })
        .then((data) => {
          this.data_history_ur[index] = data
         
        })
        .catch(function (error) {
        console.log('error');
      });
    },
    onImage(link_image){
      this.link_image = link_image
      this.dialogImage = true
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
        .$post(`/api/couriers/orders/create/${this.curer.id}`, data, {
    
        })
        .then((data) => {
            console.log(data);
            this.data_history_ur[this.ind].admin_send_curer = true
            this.data_history_ur[this.ind].send_id_curer = this.curer.id
            this.data_history_ur[this.ind].send_name_curer = this.curer.name
            this.dialog = false
        })
        .catch(function (error) {
        console.log('error');
      });
    }
  }

}
</script>


 