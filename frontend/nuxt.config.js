import colors from 'vuetify/es5/util/colors'

export default {
  // Disable server-side rendering: https://go.nuxtjs.dev/ssr-mode
  ssr: true,

  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    titleTemplate: 'Подарки',
    title: 'Подарки',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      {name :"apple-mobile-web-app-status-bar-style", content :"default"},
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/logo.ico' }
    ]
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  css: [
    '@/style/index.css'
  ],
  pwa: {
    manifest: {
      name: 'Bota Boutique',
      short_name: 'Bota Boutique',
      lang: 'ru',
      display: 'standalone',

    },
  },
  plugins: ['~/plugins/firebase.js'],
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
    '@nuxtjs/pwa',
    
    // '@nuxtjs/recaptcha',

  ],
  
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