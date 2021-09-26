export const state = () => {
    return {
      user:[],
  
  
  
    }
  }
  
  export const mutations = {
    setusers (state,user) {
    state.user = user
  
    },
  
  
  }
  
  export const actions = {
    async fetch({commit,state}){
        const headers = {
            "Content-Type": "application/json"
          };
        const user = await this.$axios
        .$get(`http://82.148.17.12:8080/api/v1/present/users/ftUmWOQkGzanvINTDFAlXPaYcIJ3`,{
          headers: headers
        })
        commit('setusers',user)
  
    }
  }
  
  export const getters = {
    users: s => s.user,
  
  
  }