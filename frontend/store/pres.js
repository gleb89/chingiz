export const state = () => {
    return {
      pres:[],
      presents:[],
      maxs:0,
      price_min:0,
      
  
  
  
    }
  }
  
  export const mutations = {
    setpres (state,pres) {
    state.pres = pres
  
    },
    setpresents (state,pres) {
      console.log(pres);
      state.presents = pres
    
      },
      setpresentspush (state,pres) {
        state.presents.push(pres)
      
        },

        setpresentsPrice (state,price_min) {
          state.price_min = price_min
          },
          setpresentsMaxs (state,price_max) {
            state.maxs= price_max
            },
          

        SetSortPriceNav(state,sort_price){
          if (sort_price === "более дорогие") {
      
            state.presents.sort(function (a, b) {
              return b.price - a.price;
            });
          }
          if (sort_price === "сначала недорогие") {
            
            state.presents.sort(function (a, b) {
              return a.price - b.price;
            });
          }
        }


  
  
  }
  
  export const actions = {
    async fetch({commit,state}){
        const headers = {
            "Content-Type": "application/json"
          };
        const pres = await this.$axios
        .$get(`/api/present/catalog`,{
          headers: headers
        })
        commit('setpres',pres)
  
    }
  }
  
  export const getters = {
    pres: s => s.pres,
  
  
  }

