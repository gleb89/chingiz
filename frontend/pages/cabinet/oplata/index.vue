<template>
    <div class="text-center" style="margin-top:6rem;padding:1rem;min-height: 100vh;display: flex;justify-content: center;align-items: center;">
        {{redirectHistory()}}
        <v-alert
  type="success"
><h3>Ваш заказ успешно оплачен</h3></v-alert>
    </div>
</template>

<script>
export default {
    methods: {
        redirectHistory() {
            setTimeout(() => {
                this.$router.push('/cabinet/history')
            }, 2000);
        },
    },
}
</script>