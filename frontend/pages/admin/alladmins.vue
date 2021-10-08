<template>
<div>
    <h2>Администраторы</h2>
      <v-simple-table class="d-lg-block d-md-block d-none">
    <template v-slot:default>
      <thead>
        <tr>
          <th style="color:#1F2128" class="text-left">
            имя админа
          </th>
        <th style="color:#1F2128" class="text-left">
           Подарки
        </th>
          <th style="color:#1F2128" class="text-left">
            Фильтры(Категории и т.д)
          </th>
          <th style="color:#1F2128" class="text-left">
            Пользователи
          </th>
        <th style="color:#1F2128" class="text-left">
            Комментарии
          </th>
        <th style="color:#1F2128" class="text-left">
            Email подписки
          </th>
        <th style="color:#1F2128" class="text-left">
           Курьеры
        </th>
        <th style="color:#1F2128" class="text-left">
           Заказы
        </th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(admin,index) in admins"
          :key="index"
        >
          <td>
              {{admin.name}}
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                v-model="admin.present_read"
                ></v-switch>
            <v-switch
            color="info"

                label="Изменение"
                v-model="admin.present_change"
                ></v-switch>
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                v-model="admin.filters_present_read"
                ></v-switch>
            <v-switch
            color="info"
                label="Изменение"
                v-model="admin.filters_present_change"
                ></v-switch>
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                v-model="admin.users_read"
                ></v-switch>
            <v-switch
            color="info"
                label="Изменение"
                v-model="admin.users_change"
                ></v-switch>
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                v-model="admin.сomments_read"
                ></v-switch>
            <v-switch
            color="info"
                label="Изменение"
                v-model="admin.сomments_change"
                ></v-switch>
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                v-model="admin.podpiska_read"
                ></v-switch>
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                v-model="admin.courer_read"
                ></v-switch>
            <v-switch
            color="info"
                label="Изменение"
                v-model="admin.courer_change"
                ></v-switch>
          </td>

          <td>
            <v-switch
            color="success"
                label="Чтение"
                v-model="admin.history_basket_read"
                ></v-switch>
            <v-switch
            color="info"
                label="Изменение"
                v-model="admin.history_basket_change"
                ></v-switch>
          </td>
         
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</div>
</template>

<script>
export default {
    layout: "admin",

  async asyncData({ route, $axios }) {
   
    let admins = await $axios.get(
       `http://api-booking.ru/api/v1/present/admin/`
    );

    return { admins:admins.data};
  },
  data() {
      return {
        
      };
  },
}
</script>