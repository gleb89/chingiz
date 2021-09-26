export const state = () => {
    return {
      users:[],
  
  
  
    }
  }
  
  export const mutations = {
    setusers (state,users) {
    state.users = users
  
    },
  
  
  }
  
  export const actions = {
    async fetch({commit,state}){
        const headers = {
            "Content-Type": "application/json"
          };
        const users = await this.$axios
        .$get(`http://82.148.17.12:8080/api/v1/present/users/`,{
          headers: headers
        })
        commit('setusers',users)
  
    }
  }
  
  export const getters = {
    users: s => s.users,
  
  
  }