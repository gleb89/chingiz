export { default as AdminMenu } from '../../components/AdminMenu.vue'
export { default as BanerCarusel } from '../../components/BanerCarusel.vue'
export { default as Basket } from '../../components/Basket.vue'
export { default as CardOtziv } from '../../components/CardOtziv.vue'
export { default as CardPreim } from '../../components/CardPreim.vue'
export { default as CardProduct } from '../../components/CardProduct.vue'
export { default as Com } from '../../components/Com.vue'
export { default as Comments } from '../../components/Comments.vue'
export { default as CounterPres } from '../../components/CounterPres.vue'
export { default as Filternedor } from '../../components/Filternedor.vue'
export { default as Filters } from '../../components/Filters.vue'
export { default as Foot } from '../../components/Foot.vue'
export { default as FormLoginAdmin } from '../../components/FormLoginAdmin.vue'
export { default as ListOtz } from '../../components/ListOtz.vue'
export { default as Listcart } from '../../components/Listcart.vue'
export { default as Listcartmob } from '../../components/Listcartmob.vue'
export { default as Mobbar } from '../../components/Mobbar.vue'
export { default as Mobfilter } from '../../components/Mobfilter.vue'
export { default as Nav } from '../../components/Nav.vue'
export { default as Navmobile } from '../../components/Navmobile.vue'
export { default as NuxtLogo } from '../../components/NuxtLogo.vue'
export { default as Otzmob } from '../../components/Otzmob.vue'
export { default as PreimCarusel } from '../../components/PreimCarusel.vue'
export { default as SignIn } from '../../components/SignIn.vue'
export { default as Tutorial } from '../../components/Tutorial.vue'
export { default as VuetifyLogo } from '../../components/VuetifyLogo.vue'

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
