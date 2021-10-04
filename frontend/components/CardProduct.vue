<template>
  <v-hover v-slot="{ hover }">
    <v-card
      style="box-shadow: none;max-height:500px;position: relative;padding:1rem"
      width="400"
    >
      <div
        style="text-align: start;"
        @click="onPageProduct(present.id, present.category[0].slug_category)"
      ></div>
      <div style="width:100%;text-align: center;">
        <img
          style="width:20rem"
          :class="{ 'on-hover': hover }"
          class="img"
          :src="present.image_precent"
        />
      </div>
      <div v-if="hover" class="text-center onhov">
        <v-btn
          @click="onPageProduct(present.id, present.category[0].slug_category)"
          style="color:white;opacity:1"
          color="#ff7a00"
        >
          подробнее
        </v-btn>
      </div>
      <hr />
      <v-card-title style="height: 6em;" :class="{ 'on-hover': hover }">
        <h4 class="hh4" style="font-size: 0.9rem;text-align: center;">
          {{ present.prevue_name }}
          <br />
          "{{ present.name_precent }}"
        </h4>
      </v-card-title>

      <v-card-subtitle> </v-card-subtitle>

      <v-card-actions class="d-flex justify-center" style="text-align: center;">
        <div style="min-width: 40%;">
          <img v-if="reveal" src="/checbasket.png" alt="" />
          <span style="font-weight: bold;font-size: 1.3rem;"
            >{{ present.price.toLocaleString() }} тг</span
          >
        </div>
        <div style="width: 50%; text-align: center">
          <v-btn
            @click="addBasket(present.id)"
            style="color:white"
            rounded
            color="#ff7a00"
            ><span v-if="reveal">добавлено</span>
            <span v-if="!reveal">купить</span>
            <img
              style="width: 1.5rem;cursor:pointer"
              src="/shopcart.png"
              alt=""
            />
          </v-btn>
        </div>
      </v-card-actions>
    </v-card>
  </v-hover>
</template>

<script>
export default {
  props: ["present"],
  data: () => ({
    show: false,
    reveal: false
    //  transparent: 'rgba(255, 255, 255, 0)',
  }),
  methods: {
    onPageProduct(id, name_slug) {
      this.$router.push(`/catalog/${name_slug}/present/${id}`);
    },
    addBasket(present_id) {
      let headers = {
        "Content-Type": "application/json"
      };

      if (this.$store.state.localStorage.uid_auth_user) {
        if (this.reveal) {
          this.$router.push("/cabinet/basket");
        }
        else{
        let data = {
          id_user: this.$store.state.localStorage.uid_auth_user,
          precent_id: present_id
        };
        this.$axios
          .$post(
            `https://api-booking.ru/api/v1/present/users/basket/user_basket/add`,
            data,
            {
              headers: headers
            }
          )
          .then(resp => {
            console.log(resp);
            console.log(resp.basket_id);
            if (this.$store.state.localStorage.basket.id_basket > 0) {
              this.$store.commit(
                "localStorage/set_summBasket",
                Number(resp.summa)
              );
            } else {
              this.$store.commit(
                "localStorage/set_summBasket",
                Number(resp.summa)
              );
              this.$store.commit(
                "localStorage/set_idBasket",
                Number(resp.basket_id)
              );
            }
            this.reveal = true;
          })
          .catch(function(error) {
            console.log(error);
          });
          }
      } else {
        if (this.reveal) {
          this.$router.push(
            "/basket/" + this.$store.state.localStorage.basket.id_basket
          );
        }
        else{
        let data = {
          id_basket: this.$store.state.localStorage.basket.id_basket,
          precent_id: present_id
        };
        this.$axios
          .$post(
            `https://api-booking.ru/api/v1/present/users/basket/anonim_basket/add`,
            data,
            {
              headers: headers
            }
          )
          .then(resp => {
            console.log(resp.basket_id);
            if (this.$store.state.localStorage.basket.id_basket > 0) {
              this.$store.commit(
                "localStorage/set_summBasket",
                Number(resp.summa)
              );
            } else {
              this.$store.commit(
                "localStorage/set_summBasket",
                Number(resp.summa)
              );
              this.$store.commit(
                "localStorage/set_idBasket",
                Number(resp.basket_id)
              );
            }
            this.reveal = !this.reveal;
          })
          .catch(function(error) {
            console.log(error);
          });
          }
      }
    }
  }
};
</script>

<style>
.imgs {
  opacity: 1;
}
hr {
  border: none; /* Убираем границу для браузера Firefox */
  color: #e5e5e5; /* Цвет линии для остальных браузеров */
  background-color: #e5e5e5; /* Цвет линии для браузера Firefox и Opera */
  height: 1px; /* Толщина линии */
}
.on-hover {
  opacity: 0.5;
  transition: opacity 0.4s ease-in-out;
}

.show-btns {
  color: rgb(26, 24, 24) !important;
}

.hh4 {
  width: 100%;
}
.onhov {
  position: absolute;
  left: 9rem;
  top: 10rem;
  opacity: 1;
}
@media (max-width: 500px) {
  .onhov {
    left: 8rem;
  }
}
</style>
