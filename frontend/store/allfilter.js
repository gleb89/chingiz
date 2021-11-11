export const state = () => {
    return {
      allfilter:[],
  
  
  
    }
  }
  
  export const mutations = {
    setallfilter (state,allfilter) {
    state.allfilter = allfilter
  
    },
  
  
  }
  
  export const actions = {
    async fetch({commit,state}){
        const headers = {
            "Content-Type": "application/json"
          };
        const allfilter = await this.$axios
        .$get(`http://giftcity.kz:8001/api/v1/present/filter/all`,{
          headers: headers
        })
        commit('setallfilter',allfilter)
  
    }
  }
  
  export const getters = {
    allfilter: s => s.allfilter,
  
  
  }