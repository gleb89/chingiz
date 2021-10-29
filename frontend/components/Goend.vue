<template>
              <div @click="gopage" class="d-lg-none d-block"
           style="background: whitesmoke;width: 100%;padding:1rem;color:#7C7C7C">
            <fa style="font-size: 1rem;" icon="chevron-left"></fa>
             <span style="margin-left:1rem">назад</span>
          </div>
</template>


<script>
export default {
    methods: {
        gopage(){
      this.$router.go(-1);
    },
    },
}
</script>