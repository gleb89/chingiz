
// store/localStorage.js
export const state = () => ({
  jwtToken : '',
  admin_data:{},
  uid_auth_user:'',
  id_basket: 1,
  city:'',
  date:'',
  basket:{ 
    id_basket: 0,
    summ_present:0
  }
  })



  export const mutations = {
    setAuthadmin (state, jwtToken ) {
      state.jwtToken  = jwtToken 
    },
    setAuthadmindata(state,admindata){
      state.admin_data = admindata
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
    },
    set_Sity(state, city){
      localStorage.setItem('city',city) 
      state.basket.city = city
    },
    set_Date(state, date){
      localStorage.setItem('date',date) 
      state.basket.date = date
    }
  
  }
