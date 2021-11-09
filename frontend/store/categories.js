export const state = () => {
    return {
      categories:[],
      name_category:'Все подарки'
  
  
  
    }
  }
  
  export const mutations = {
    setcategories (state,categories) {
    state.categories = categories
  
    },
    setcategoriesname (state,name) {
      state.name_category = name
    
      },
  
  
  }
  
  export const actions = {
    async fetch({commit,state}){
        const headers = {
            "Content-Type": "application/json"
          };
        const categories = await this.$axios
        .$get(`https://giftcity.kz/api/v1/present/categories/`,{
          headers: headers
        })
        commit('setcategories',categories)
  
    }
  }
  
  export const getters = {
    categories: s => s.categories,
  
  
  }