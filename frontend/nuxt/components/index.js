export const AdminMenu = () => import('../../components/AdminMenu.vue' /* webpackChunkName: "components/admin-menu" */).then(c => wrapFunctional(c.default || c))
export const BanerCarusel = () => import('../../components/BanerCarusel.vue' /* webpackChunkName: "components/baner-carusel" */).then(c => wrapFunctional(c.default || c))
export const Basket = () => import('../../components/Basket.vue' /* webpackChunkName: "components/basket" */).then(c => wrapFunctional(c.default || c))
export const CardOtziv = () => import('../../components/CardOtziv.vue' /* webpackChunkName: "components/card-otziv" */).then(c => wrapFunctional(c.default || c))
export const CardPreim = () => import('../../components/CardPreim.vue' /* webpackChunkName: "components/card-preim" */).then(c => wrapFunctional(c.default || c))
export const CardProduct = () => import('../../components/CardProduct.vue' /* webpackChunkName: "components/card-product" */).then(c => wrapFunctional(c.default || c))
export const Com = () => import('../../components/Com.vue' /* webpackChunkName: "components/com" */).then(c => wrapFunctional(c.default || c))
export const Comments = () => import('../../components/Comments.vue' /* webpackChunkName: "components/comments" */).then(c => wrapFunctional(c.default || c))
export const CounterPres = () => import('../../components/CounterPres.vue' /* webpackChunkName: "components/counter-pres" */).then(c => wrapFunctional(c.default || c))
export const Filternedor = () => import('../../components/Filternedor.vue' /* webpackChunkName: "components/filternedor" */).then(c => wrapFunctional(c.default || c))
export const Filters = () => import('../../components/Filters.vue' /* webpackChunkName: "components/filters" */).then(c => wrapFunctional(c.default || c))
export const Foot = () => import('../../components/Foot.vue' /* webpackChunkName: "components/foot" */).then(c => wrapFunctional(c.default || c))
export const FormLoginAdmin = () => import('../../components/FormLoginAdmin.vue' /* webpackChunkName: "components/form-login-admin" */).then(c => wrapFunctional(c.default || c))
export const ListOtz = () => import('../../components/ListOtz.vue' /* webpackChunkName: "components/list-otz" */).then(c => wrapFunctional(c.default || c))
export const Listcart = () => import('../../components/Listcart.vue' /* webpackChunkName: "components/listcart" */).then(c => wrapFunctional(c.default || c))
export const Listcartmob = () => import('../../components/Listcartmob.vue' /* webpackChunkName: "components/listcartmob" */).then(c => wrapFunctional(c.default || c))
export const Mobbar = () => import('../../components/Mobbar.vue' /* webpackChunkName: "components/mobbar" */).then(c => wrapFunctional(c.default || c))
export const Mobfilter = () => import('../../components/Mobfilter.vue' /* webpackChunkName: "components/mobfilter" */).then(c => wrapFunctional(c.default || c))
export const Nav = () => import('../../components/Nav.vue' /* webpackChunkName: "components/nav" */).then(c => wrapFunctional(c.default || c))
export const Navmobile = () => import('../../components/Navmobile.vue' /* webpackChunkName: "components/navmobile" */).then(c => wrapFunctional(c.default || c))
export const NuxtLogo = () => import('../../components/NuxtLogo.vue' /* webpackChunkName: "components/nuxt-logo" */).then(c => wrapFunctional(c.default || c))
export const Otzmob = () => import('../../components/Otzmob.vue' /* webpackChunkName: "components/otzmob" */).then(c => wrapFunctional(c.default || c))
export const PreimCarusel = () => import('../../components/PreimCarusel.vue' /* webpackChunkName: "components/preim-carusel" */).then(c => wrapFunctional(c.default || c))
export const SignIn = () => import('../../components/SignIn.vue' /* webpackChunkName: "components/sign-in" */).then(c => wrapFunctional(c.default || c))
export const Tutorial = () => import('../../components/Tutorial.vue' /* webpackChunkName: "components/tutorial" */).then(c => wrapFunctional(c.default || c))
export const VuetifyLogo = () => import('../../components/VuetifyLogo.vue' /* webpackChunkName: "components/vuetify-logo" */).then(c => wrapFunctional(c.default || c))

// nuxt/nuxt.js#8607
function wrapFunctional(options) {
  if (!options || !options.functional) {
    return options
  }

  const propKeys = Array.isArray(options.props) ? options.props : Object.keys(options.props || {})

  return {
    render(h) {
      const attrs = {}
      const props = {}

      for (const key in this.$attrs) {
        if (propKeys.includes(key)) {
          props[key] = this.$attrs[key]
        } else {
          attrs[key] = this.$attrs[key]
        }
      }

      return h(options, {
        on: this.$listeners,
        attrs,
        props,
        scopedSlots: this.$scopedSlots,
      }, this.$slots.default)
    }
  }
}
