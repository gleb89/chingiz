export const state = () => {
    return {
      categories:[],
      name_category:'',
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
        .$get(`/api/present/categories/`,{
          headers: headers
        })
        commit('setcategories',categories)
  
    }
  }
  
  export const getters = {
    categories: s => s.categories,
  
  
  }