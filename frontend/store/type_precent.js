export const state = () => {
    return {
      type_precent:[],
  
  
  
    }
  }
  
  export const mutations = {
    settype_precent (state,type_precent) {
    state.type_precent = type_precent
  
    },
  
  
  }
  
  export const actions = {
    async fetch({commit,state}){
        const headers = {
            "Content-Type": "application/json"
          };
        const type_precent = await this.$axios
        .$get(`https://giftcity.kz/api/v1/present/type/`,{
          headers: headers
        })
        commit('settype_precent',type_precent)
  
    }
  }
  
  export const getters = {
    type_precent: s => s.type_precent,
  
  
  }