
// store/localStorage.js
export const state = () => ({
  jwtToken : '',
  uid_auth_user:'',
  basket:{ 
    id_basket:0,
    summ_present:0
  }
  })

  export const mutations = {
    setAuthadmin (state, jwtToken ) {
      state.jwtToken  = jwtToken 
    },
    setAuthuser (state, uid_auth_user ) {
      state.uid_auth_user  = uid_auth_user
      console.log('state',state.uid_auth_user );
    },
    set_idBasket (state, id_basket ) {
      state.basket.id_basket = id_basket
    },
    set_summBasket (state, summ ) {
      state.basket.summ_present = summ
    }
  
  }
