import {createStore} from "vuex"
import axios from "axios"

const store = createStore({
  state() {
    return {
      allFoods: [],
      user: JSON.parse(localStorage.getItem('user')) || null,
      admin: undefined,
    };
  },
  mutations: {
    setFoodsData(state, payload) {
      state.allFoods = payload;
    },
    setUser(state, user) {
      state.user = user;
      localStorage.setItem("user", JSON.stringify(user));
    },
    setAdmin(state, payload) {
      state.admin = payload;
    },
  },
  actions: {
    async getFoodsData(context) {
      await axios
        .get("/foods")
        .then(function (response) {
          context.commit("setFoodsData", response.data);
        })
        .catch(function (error) {
          console.log(error);
        });
    },
  },
});

export default store;