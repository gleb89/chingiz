import bindStorage from 'nuxt-vuex-localstorage/plugins/bindStorage'

export default (ctx) => {
  const options = {"mode":"cookie","expireHours":24}
  bindStorage(ctx, options)
}
