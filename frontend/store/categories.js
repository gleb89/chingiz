export const state = () => {
    return {
      categories:[],
  
  
  
    }
  }
  
  export const mutations = {
    setcategories (state,categories) {
    state.categories = categories
  
    },
  
  
  }
  
  export const actions = {
    async fetch({commit,state}){
        const headers = {
            "Content-Type": "application/json"
          };
        const categories = await this.$axios
        .$get(`http://api-booking.ru/api/v1/present/categories/`,{
          headers: headers
        })
        commit('setcategories',categories)
  
    }
  }
  
  export const getters = {
    categories: s => s.categories,
  
  
  }