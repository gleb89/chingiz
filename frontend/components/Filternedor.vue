<template>
  <div class="text-center">
    <v-menu offset-y>
      <template v-slot:activator="{ on, attrs }">
        <!-- <v-btn
          color="primary"
          dark
          v-bind="attrs"
          v-on="on"
        >
          Недорогие
        </v-btn> -->
            <span
            v-bind="attrs"
          v-on="on"
              style="
                height: 3.5rem;
                display: block;
                padding: 1.2rem;
                text-align: end;
              "
              >сначала недорогие <img src="/nadorogie.png" alt=""
            /></span>
      </template>
      <v-list>
        <v-list-item
          v-for="(item, index) in items"
          :key="index"
        >
          <v-list-item-title>{{ item.title }}</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-menu>
  </div>
</template>

<script>
  export default {
    data: () => ({
      items: [
        { title: 'Недорогие' },
        { title: 'Дорогие' },
      ],
    }),
  }
</script>