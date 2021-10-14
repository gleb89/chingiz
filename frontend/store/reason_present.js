export const state = () => {
    return {
      reason_present:[],
  
  
  
    }
  }
  
  export const mutations = {
    setreason_present (state,reason_present) {
    state.reason_present = reason_present
  
    },
  
  
  }
  
  export const actions = {
    async fetch({commit,state}){
        const headers = {
            "Content-Type": "application/json"
          };
        const reason_present = await this.$axios
        .$get(`http://giftcity.kz/api/v1/present/reason/`,{
          headers: headers
        })
        commit('setreason_present',reason_present)
  
    }
  }
  
  export const getters = {
    reason_present: s => s.reason_present,
  
  
  }