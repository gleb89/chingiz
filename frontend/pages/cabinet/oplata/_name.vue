<template>
<v-container>
    <div v-if="olata === 'kaspioplata'"  class="text-center" style="margin-top:6rem;padding:1rem;min-height: 100vh;display: flex;justify-content: center;align-items: center;">
    <v-alert
      dense
      text
      type="success"
    >
      Реквизиты <strong>для оплаты заказа</strong> отправлены на указанную вами почту !
      <p>Спасибо за заказ</p>
    </v-alert>
    </div>
      <div v-if="olata === 'uroplata'"  class="text-center" style="margin-top:6rem;padding:1rem;min-height: 100vh;display: flex;justify-content: center;align-items: center;">
    <v-alert
      dense
      text
      type="success"
    >
      Реквизиты <strong>для оплаты заказа</strong> отправлены на указанную вами почту !
      <p>Спасибо за заказ</p>
    </v-alert>
    </div>
      <div v-if="olata === 'presend'"  class="text-center" style="margin-top:6rem;padding:1rem;min-height: 100vh;display: flex;justify-content: center;align-items: center;">
    <v-alert
      dense
      text
      type="success"
    >
      Наш специалист <strong>свяжется с вами в ближайшее время!</strong>
      <p>Спасибо за заказ</p>
    </v-alert>
    </div>
    <!-- <div v-if="olata === 'kaspioplata'" class="text-center" style="margin-top:6rem;padding:1rem;min-height: 100vh;display: flex;justify-content: center;align-items: center;">
   <v-card
   style="background: #f8f8f8;height:60vh;width:80%;padding:2em"
   
   >
    <h3>Для продолжения Вам необходимо произвести оплату по следующим реквизитам:</h3>
   </v-card>

    </div> -->
    </v-container>
</template>

<script>
export default {
    

    data() {
        return {
            olata:this.$route.params.name
        };
    },

    mounted() {
        
    },

    methods: {
        
    },
};
</script>