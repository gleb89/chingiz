export const state = () => {
    return {
      products:[],
  
  
  
    }
  }
  
  export const mutations = {
    setproducts (state,products) {
    state.products = products
  
    },
  
  
  }
  
  export const actions = {
    async fetch({commit,state}){
        const headers = {
            "Content-Type": "application/json"
          };
        const products = await this.$axios
        .$get(`https://giftcity.kz/api/v1/present/`,{
          headers: headers
        })
        commit('setproducts',products)
  
    }
  }
  
  export const getters = {
    products: s => s.products,
  
  
  }