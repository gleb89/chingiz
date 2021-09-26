
// store/localStorage.js
export const state = () => ({
  jwtToken : '',
  uid_auth_user:'',
  id_basket: 1,
  basket:{ 
    id_basket: 0,
    summ_present:0
  }
  })



  export const mutations = {
    setAuthadmin (state, jwtToken ) {
      state.jwtToken  = jwtToken 
    },
    setAuthuser (state, uid_auth_user ) {
      localStorage.setItem('uid_auth_user',uid_auth_user) 
      state.uid_auth_user  = uid_auth_user
      
    },
    set_idBasket (state, id_basket ) {
      localStorage.setItem('id_basket',id_basket) 
      state.basket.id_basket = id_basket
    },
    set_summBasket (state, summ ) {
      localStorage.setItem('summ_present',summ) 
      state.basket.summ_present = summ
    }
  
  }
