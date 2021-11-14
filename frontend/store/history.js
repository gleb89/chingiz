export const state = () => {
    return {
      history:[],
  
  
  
    }
  }
  
  export const mutations = {
    sethistory (state,history) {
    state.history = history
  
    },
  
  
  }
  
  export const actions = {
    async fetch({commit,state}){
        const headers = {
            "Content-Type": "application/json"
          };
        const history = await this.$axios
        .$get(`/api/present/history/`,{
          headers: headers
        })
        
        commit('sethistory',history)
  
    }
  }
  
  export const getters = {
    history: s => s.history,
  
  
  }