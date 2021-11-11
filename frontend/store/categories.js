export const state = () => {
    return {
      categories:[],
      name_category:'Все подарки',
      count_present:0,
      subcategories:[]
  
  
  
    }
  }
  
  export const mutations = {
    setcategories (state,categories) {
    state.categories = categories
  
    },
    setSubcategories(state,subcategories) {
      state.subcategories = subcategories
    
      },
    setcategoriesname (state,name) {
      state.name_category = name
    
      },
      setSizepresent (state,count) {
        state.count_present = count
      
        },
  
  
  }
  
  export const actions = {
    async fetch({commit,state}){
        const headers = {
            "Content-Type": "application/json"
          };
        const categories = await this.$axios
        .$get(`http://giftcity.kz:8001/api/v1/present/categories/`,{
          headers: headers
        })
        commit('setcategories',categories)
  
    }
  }
  
  export const getters = {
    categories: s => s.categories,
  
  
  }