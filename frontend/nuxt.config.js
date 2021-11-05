import colors from 'vuetify/es5/util/colors'

export default {
  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  ssr: true,

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    titleTemplate: 'Подарки на любой праздник | (Нур-Султан,Алматы)',
    title: 'Подарки на любой праздник | (Нур-Султан,Алматы)',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      {name :"apple-mobile-web-app-status-bar-style", content :"default"},
      {name :"theme-color", content :"#ffffff"},
      { hid: 'description', name: 'description', content: 'Купить Подарки На Любой Праздник И Повод | (Нур-Султан,Алматы)'},
      { hid: 'keywords', name: 'keywords', content: 'Купить Подарки На Любой Праздник И Повод | (Нур-Султан,Алматы)'},
      {property: "og:image", content :"/logo.png"},
      { name: 'format-detection', content: 'telephone=no' },
      {name:"mailru-domain" ,content:"H4AMvCUJss9mZlhr"} 
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ],

  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    '@/style/index.css',
  ],
  
  pwa: {
    workbox: {
      runtimeCaching: [
          {
              urlPattern: 'https://fonts.googleapis.com/.*',
              handler: 'cacheFirst',
              method: 'GET',
              strategyOptions: {cacheableResponse: {statuses: [0, 200]}}
          },
          {
              urlPattern: 'https://fonts.gstatic.com/.*',
              handler: 'cacheFirst',
              method: 'GET',
              strategyOptions: {cacheableResponse: {statuses: [0, 200]}}
          },
      ]
  },
    manifest: {
      name: 'GIFTCITY',
      short_name: 'GIFTCITY',
      description:'Купить Подарки На Любой Праздник И Повод | (Нур-Султан,Алматы)',
      lang: 'ru',
      display: 'standalone',
      

    },
  },
  plugins: ['~/plugins/firebase.js',
  '~/plugins/v-mask.js',
  { src: '~/plugins/pwa-update.js', mode: 'client' }
],
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    // https://go.nuxtjs.dev/vuetify
    '@nuxtjs/vuetify',
    
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/axios
    '@nuxtjs/axios',
    '@nuxtjs/fontawesome',
    '@nuxtjs/pwa',
    '@nuxtjs/robots',
    '@nuxtjs/sitemap',

    
    // '@nuxtjs/recaptcha',

  ],

  sitemap: {
    generate: true,
    hostname: 'https://giftcity.kz',
    exclude: [
      '/admin',
      '/admin/list_presents',
      '/admin/all_couries',
      '/admin/alladmins',
      '/admin/categories',
      '/admin/comments',
      '/admin/commentserv',
      '/admin/stocks',
      '/admin/podpiska',
      '/admin/users',
      '/admin/povod',
      '/admin/orders',
      '/admin/all_couries',
      '/cabinet',
      '/cabinet/basket',
      '/cabinet/bonus',
      '/cabinet/history',
      '/cabinet/oplata',
      '/oferta',
      '/basket',
    ]
  },

  
  fontawesome:{
    component:'fa',
    icons:{
      solid:true,
      brands:true
    },
  },

  axios: {
 
    },

  // recaptcha: {
  //   hideBadge: true,
  //   siteKey: process.env.KEYGOOGLE,
  //   version: 2, // Or 3
  // },
  loading: {
    color: 'orange',
    height: '2px'
  },

  vuetify: {
    customVariables: ['~/assets/variables.scss'],
    theme: {
      dark: false,
      themes: {
        dark: {
          primary: colors.blue.darken2,
          accent: colors.grey.darken3,
          secondary: colors.amber.darken3,
          info: colors.teal.lighten1,
          warning: colors.amber.base,
          error: colors.deepOrange.accent4,
          success: colors.green.accent3
        }
      }
    }
  },


  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
  }
}