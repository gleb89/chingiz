import colors from 'vuetify/es5/util/colors'

export default {
  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    titleTemplate: 'elbazar-service',
    title: 'elbazar-service',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    script: [
      // {
      //   src: "https://www.gstatic.com/firebasejs/8.6.7/firebase-app.js",
      //   src: "https://www.gstatic.com/firebasejs/8.6.7/firebase-analytics.js",
      //   // src: "/__/firebase/init.js",
      // }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    '@/style/index.css'
  ],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  // plugins: ['@/plugins/firebase'],
  // Auto import components: https://go.nuxtjs.dev/config-components
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
    ['nuxt-vuex-localstorage', {
      mode: 'cookie',
      expireHours: 24 //  If not entered, 24 is the default value
    }]
    // '@nuxtjs/recaptcha',

  ],
  plugins: ['~/plugins/firebase.js'],
  fontawesome:{
    component:'fa',
    icons:{
      solid:true,
      brands:true
    }
  },
  axios: {
    baseURL: 'http://82.148.17.12:8080/api/v1/'
    },

  // recaptcha: {
  //   hideBadge: true,
  //   siteKey: process.env.KEYGOOGLE,
  //   version: 2, // Or 3
  // },
  loading: {
    color: 'white',
    height: '1px'
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
