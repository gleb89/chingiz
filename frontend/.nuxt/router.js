import Vue from 'vue'
import Router from 'vue-router'
import { normalizeURL, decode } from 'ufo'
import { interopDefault } from './utils'
import scrollBehavior from './router.scrollBehavior.js'

const _13a55732 = () => interopDefault(import('../pages/admin/index.vue' /* webpackChunkName: "pages/admin/index" */))
const _423e335a = () => interopDefault(import('../pages/business/index.vue' /* webpackChunkName: "pages/business/index" */))
const _e19d060a = () => interopDefault(import('../pages/cabinet/index.vue' /* webpackChunkName: "pages/cabinet/index" */))
const _9c040508 = () => interopDefault(import('../pages/catalog/index.vue' /* webpackChunkName: "pages/catalog/index" */))
const _f0f846e8 = () => interopDefault(import('../pages/for_bonus/index.vue' /* webpackChunkName: "pages/for_bonus/index" */))
const _3c1c529a = () => interopDefault(import('../pages/for_work/index.vue' /* webpackChunkName: "pages/for_work/index" */))
const _2dbd8ff3 = () => interopDefault(import('../pages/o_nas/index.vue' /* webpackChunkName: "pages/o_nas/index" */))
const _68a0c022 = () => interopDefault(import('../pages/admin/add_courie_order.vue' /* webpackChunkName: "pages/admin/add_courie_order" */))
const _56a05220 = () => interopDefault(import('../pages/admin/all_couries.vue' /* webpackChunkName: "pages/admin/all_couries" */))
const _bb71da28 = () => interopDefault(import('../pages/admin/categories.vue' /* webpackChunkName: "pages/admin/categories" */))
const _0594cf94 = () => interopDefault(import('../pages/admin/form.vue' /* webpackChunkName: "pages/admin/form" */))
const _7c6ab788 = () => interopDefault(import('../pages/admin/list_presents/index.vue' /* webpackChunkName: "pages/admin/list_presents/index" */))
const _653e7f35 = () => interopDefault(import('../pages/admin/orders.vue' /* webpackChunkName: "pages/admin/orders" */))
const _518c57cc = () => interopDefault(import('../pages/admin/povod.vue' /* webpackChunkName: "pages/admin/povod" */))
const _0c486b27 = () => interopDefault(import('../pages/admin/send_order.vue' /* webpackChunkName: "pages/admin/send_order" */))
const _7dedb1ec = () => interopDefault(import('../pages/admin/type.vue' /* webpackChunkName: "pages/admin/type" */))
const _c0671ca0 = () => interopDefault(import('../pages/cabinet/basket/index.vue' /* webpackChunkName: "pages/cabinet/basket/index" */))
const _06605c40 = () => interopDefault(import('../pages/cabinet/history/index.vue' /* webpackChunkName: "pages/cabinet/history/index" */))
const _ca26f4b8 = () => interopDefault(import('../pages/admin/list_presents/_id.vue' /* webpackChunkName: "pages/admin/list_presents/_id" */))
const _241af381 = () => interopDefault(import('../pages/basket/_id.vue' /* webpackChunkName: "pages/basket/_id" */))
const _c2d3b8d2 = () => interopDefault(import('../pages/catalog/_name/index.vue' /* webpackChunkName: "pages/catalog/_name/index" */))
const _7aa87643 = () => interopDefault(import('../pages/catalog/_name/present/index.vue' /* webpackChunkName: "pages/catalog/_name/present/index" */))
const _6955a52a = () => interopDefault(import('../pages/catalog/_name/present/_id.vue' /* webpackChunkName: "pages/catalog/_name/present/_id" */))
const _12c36bf2 = () => interopDefault(import('../pages/index.vue' /* webpackChunkName: "pages/index" */))

const emptyFn = () => {}

Vue.use(Router)

export const routerOptions = {
  mode: 'history',
  base: '/',
  linkActiveClass: 'nuxt-link-active',
  linkExactActiveClass: 'nuxt-link-exact-active',
  scrollBehavior,

  routes: [{
    path: "/admin",
    component: _13a55732,
    name: "admin"
  }, {
    path: "/business",
    component: _423e335a,
    name: "business"
  }, {
    path: "/cabinet",
    component: _e19d060a,
    name: "cabinet"
  }, {
    path: "/catalog",
    component: _9c040508,
    name: "catalog"
  }, {
    path: "/for_bonus",
    component: _f0f846e8,
    name: "for_bonus"
  }, {
    path: "/for_work",
    component: _3c1c529a,
    name: "for_work"
  }, {
    path: "/o_nas",
    component: _2dbd8ff3,
    name: "o_nas"
  }, {
    path: "/admin/add_courie_order",
    component: _68a0c022,
    name: "admin-add_courie_order"
  }, {
    path: "/admin/all_couries",
    component: _56a05220,
    name: "admin-all_couries"
  }, {
    path: "/admin/categories",
    component: _bb71da28,
    name: "admin-categories"
  }, {
    path: "/admin/form",
    component: _0594cf94,
    name: "admin-form"
  }, {
    path: "/admin/list_presents",
    component: _7c6ab788,
    name: "admin-list_presents"
  }, {
    path: "/admin/orders",
    component: _653e7f35,
    name: "admin-orders"
  }, {
    path: "/admin/povod",
    component: _518c57cc,
    name: "admin-povod"
  }, {
    path: "/admin/send_order",
    component: _0c486b27,
    name: "admin-send_order"
  }, {
    path: "/admin/type",
    component: _7dedb1ec,
    name: "admin-type"
  }, {
    path: "/cabinet/basket",
    component: _c0671ca0,
    name: "cabinet-basket"
  }, {
    path: "/cabinet/history",
    component: _06605c40,
    name: "cabinet-history"
  }, {
    path: "/admin/list_presents/:id",
    component: _ca26f4b8,
    name: "admin-list_presents-id"
  }, {
    path: "/basket/:id?",
    component: _241af381,
    name: "basket-id"
  }, {
    path: "/catalog/:name",
    component: _c2d3b8d2,
    name: "catalog-name"
  }, {
    path: "/catalog/:name/present",
    component: _7aa87643,
    name: "catalog-name-present"
  }, {
    path: "/catalog/:name/present/:id",
    component: _6955a52a,
    name: "catalog-name-present-id"
  }, {
    path: "/",
    component: _12c36bf2,
    name: "index"
  }],

  fallback: false
}

export function createRouter (ssrContext, config) {
  const base = (config._app && config._app.basePath) || routerOptions.base
  const router = new Router({ ...routerOptions, base  })

  // TODO: remove in Nuxt 3
  const originalPush = router.push
  router.push = function push (location, onComplete = emptyFn, onAbort) {
    return originalPush.call(this, location, onComplete, onAbort)
  }

  const resolve = router.resolve.bind(router)
  router.resolve = (to, current, append) => {
    if (typeof to === 'string') {
      to = normalizeURL(to)
    }
    return resolve(to, current, append)
  }

  return router
}
