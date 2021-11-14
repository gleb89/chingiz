export const state = () => {
    return {
      products:[],
      presents:[],
      maxs:0,
      price_min:0,
      
  
  
  
    }
  }
  
  export const mutations = {
    setproducts (state,products) {
    state.products = products
  
    },
    setpresents (state,products) {
      state.presents = products
    
      },
      setpresentspush (state,products) {
        state.presents.push(products)
      
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
        const products = await this.$axios
        .$get(`/api/present/catalog`,{
          headers: headers
        })
        commit('setproducts',products)
  
    }
  }
  
  export const getters = {
    products: s => s.products,
  
  
  }

