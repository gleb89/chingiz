<template>
  <v-container id="section-work">
    <v-row justify="center">
      <v-col cols="12">
        <div>
          <nuxt-link style="color: #303030" to="/">Главная</nuxt-link> /
          <span style="color: #222121a1">Как это работает</span>
        </div>
        <div class="mt-4">
          <h2 style="font-size: 2rem; margin-top: 2rem">Как это работает</h2>
        </div>
      </v-col>
      <v-col cols="12">
          <div class="box-items text-center">
              <v-img
              fluid 
  

  src="/crupzig.png"
></v-img>
           
        <!-- 1 -->
        </div>
      </v-col>
    </v-row>
  </v-container>
</template>

<style >
.box-flex-start{
    padding-left: 15rem;
}
.box-flex-end{
    padding-right: 25rem;
}
.nums {
  color: #ff7a00;
  font-size: 3rem;
}
.text {
  font-size: 18px;
}
.img-bg{
 
}
.box-text {
  /* padding: 1rem;
  display: flex;
  align-items: center; */
}
.box-nums {
  padding: 3rem;
  display: flex;
  align-items: center;
}
.box-items{
    position: relative;
}
#section-work{
    min-height: 200vh;
}
</style>