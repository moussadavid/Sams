<template>
  <vue-basic-alert :duration="300" :closeIn="2000" ref="alert" />

  <div v-if="user" class="quick-view">
    <div class="quick-view-inner" v-for="f in selectedFood" :key="f">
      <h2 class="d-flex justify-content-between">
        {{ f.food_name }}
        <slot></slot>
      </h2>
      <div class="product-detail d-flex">
        <!-- <div class="image">
          <img :src="require(`../assets/images/${f.food_src}`)" alt="" />
        </div> -->
        <div class="content">
          <!-- <p class="desc">{{f .food_desc }}</p> -->
          <p class="money">
            ${{ parseFloat(f.food_price) - parseFloat(f.food_discount)
            }}<span v-if="parseFloat(f.food_discount) > 0">${{ parseFloat(f.food_price) }}</span>
          </p>
          <div class="qty">
            <label for="qty">Quantity:</label>
            <input type="number" name="qty" id="qty" value="1" min="1" max="1000" @change="onQtyChange($event)" />
          </div>
          <div v-if="f.food_category === 'platters' || f.food_category === 'sandwiches' || f.food_category === 'salad'">
            <!-- <p>
              Side Rice
              <input type="checkbox" id="chkFrenchFries" value="French Fries (no Rice)" v-model="side_salad" />
              Add French Fries (no Rice)
            </p> -->

            <p>
              Side Salad
            <table>
              <tr>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkLettuce" value="Lettuce" v-model="side_salad" />
                  Lettuce
                </td>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkTabbouleh" value="Tabbouleh" v-model="side_salad" />
                  Tabbouleh
                </td>
              </tr>
              <tr>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkCucumber" value="Cucumber" v-model="side_salad" />
                  Cucumber
                </td>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkOnion" value="Onion" v-model="side_salad" />
                  Onion
                </td>
              </tr>
              <tr>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkTomato" value="Tomato" v-model="side_salad" />
                  Tomato
                </td>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkFetaCheese" value="Feta Cheese" v-model="side_salad" />
                  Feta Cheese
                </td>
              </tr>
              <tr>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkBananaPepper" value="Banana Pepper" v-model="side_salad" />
                  Banana Pepper
                </td>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkJalapeno" value="Jalapeño" v-model="side_salad" />
                  Jalapeño
                </td>
              </tr>
              <tr>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkBlackOlives" value="Black Olives" v-model="side_salad" />
                  Black Olives
                </td>

              </tr>
              <tr>
                              <td style="padding-right:10px;">
                    <input type="checkbox" id="chkSauce" value="Sauce on it" v-model="side_salad" />
                    Sauce on it
                  </td>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkSauceside" value="Sauce on side" v-model="side_salad" />
                  Sauce on side
                </td>
              </tr>
            </table>
            </p>
          </div>
          <div v-else-if="f.food_category === 'combo'">
            <p>

              <input type="radio" id="chkFrenchFries" value="French Fries" v-model="side_Rice" />
              French Fries
              <input type="radio" id="chkRice" value="Rice" v-model="side_Rice" />
              Rice
            </p>
            <p>
              Side Salad
            <table>
              <tr>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkLettuce" value="Lettuce" v-model="side_salad" />
                  Lettuce
                </td>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkTabbouleh" value="Tabbouleh" v-model="side_salad" />
                  Tabbouleh
                </td>
              </tr>
              <tr>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkCucumber" value="Cucumber" v-model="side_salad" />
                  Cucumber
                </td>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkOnion" value="Onion" v-model="side_salad" />
                  Onion
                </td>
              </tr>
              <tr>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkTomato" value="Tomato" v-model="side_salad" />
                  Tomato
                </td>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkFetaCheese" value="Feta Cheese" v-model="side_salad" />
                  Feta Cheese
                </td>
              </tr>
              <tr>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkBananaPepper" value="Banana Pepper" v-model="side_salad" />
                  Banana Pepper
                </td>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkJalapeno" value="Jalapeño" v-model="side_salad" />
                  Jalapeño
                </td>
              </tr>
              <tr>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkBlackOlives" value="Black Olives" v-model="side_salad" />
                  Black Olives
                </td>
               
              </tr>
              <tr>
               <td style="padding-right:10px;">
                    <input type="checkbox" id="chkSauce" value="Sauce on it" v-model="side_salad" />
                    Sauce on it
                  </td>
                <td style="padding-right:10px;">
                  <input type="checkbox" id="chkSauceside" value="Sauce on side" v-model="side_salad" />
                  Sauce on side
                </td>
              </tr>
            </table>
            </p>
          </div>
          <!-- <div v-else-if="type === 'C'">C</div>
          <div v-else>Not A/B/C</div> -->
          <table style="width: 100%;">
            <tr style="width: 100%;">
              <td style="text-align: center;padding-right: 10px;">
                <label for="uMessage">Note</label>

              </td>
              <td>
                <textarea placeholder="May have an additional charge to be paid at the restaurant" style="width: 100%;" name="uMessage"
                  id="uMessage" rows="3" v-model="special_requests"></textarea>
              </td>
            </tr>
          </table>

          <button class="btn" @click="addToCart">Add to cart</button>
        </div>
      </div>
    </div>
  </div>
  <div v-else class="quick-view">
    <div class="quick-view-inner">
      <h2 class="d-flex justify-content-between">
        Please login to use this method
        <slot></slot>
      </h2>
      <div class="link-to-login" style="text-align: center; margin-top: 120px">
        <router-link class="btn" to="/login" style="padding: 28px; font-size: 24px">login now
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { mapState } from "vuex";
import VueBasicAlert from "vue-basic-alert";
export default {
  props: ["food"],
  name: "QuickView",

  data() {
    return {
      qty: 1,
      side_salad: [],
      side_Rice: [],
      special_requests: "",
    };
  },

  computed: {
    ...mapState(["allFoods", "user"]),

    selectedFood: function () {
      return this.allFoods.filter(
        (f) => parseInt(f.food_id) == parseInt(this.food)
      );
    },
  },

  methods: {
    onQtyChange: function (e) {
      if (e.target.value < 1) {
        e.target.value = 1;
        this.qty = e.target.value;
      } else {
        this.qty = e.target.value;
      }
    },

    async addToCart() {
      let data = {
        user_id: parseInt(this.user.user_id),
        food_id: parseInt(this.food),
        item_qty: parseInt(this.qty),
        side_salad: this.side_salad.toString() + " / " + this.side_Rice.toString(),
        special_requests: this.special_requests,
      };

      await axios.post("/cartItem/", data);
      this.$refs.alert.showAlert(
        "success",
        "Thank you!",
        "Add To Cart Successfully !"
      );
      // }
    },
  },

  components: {
    VueBasicAlert,
  },
};
</script>

<style scoped>
.quick-view {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 99;
  background-color: rgba(0, 0, 0, 0.2);

  display: flex;
  align-items: center;
  justify-content: center;
}

.quick-view .quick-view-inner {
  width: auto;
  height: auto;
  scroll-behavior: smooth;
  scroll-padding-top: 8.5rem;
  background-color: #f7f7f7;
  padding: 32px;
}

.quick-view .quick-view-inner h2 {
  margin: 0;
  font-size: 32px;
  color: #27ae60;
}

.quick-view .quick-view-inner .product-detail .image img {
  height: 20rem;
  margin: 20px;
}

.quick-view .quick-view-inner .product-detail .content {
  margin-top: 20px;
  font-size: 20px;
  width: 100%;
}

.quick-view .quick-view-inner .product-detail .content p span {
  margin-left: 5px;
  text-decoration: line-through;
  opacity: 0.5;
}

.quick-view .quick-view-inner .product-detail .content div label {
  margin-right: 10px;
}

.quick-view .quick-view-inner .product-detail .content .btn {
  margin-top: 20px;
  float: right;
}

@media (max-width: 768px) {
  .quick-view .quick-view-inner {
    width: 50vw;
    height: 40vh;
  }

  .quick-view .quick-view-inner h2 {
    font-size: 20px;
  }

  .quick-view .quick-view-inner .btn {
    font-size: 10px;
    padding: 0.3rem 0.9rem;
  }

  .quick-view .quick-view-inner .product-detail .image img {
    height: 12rem;
    margin: 30px;
    margin-left: 0px;
  }

  .quick-view .quick-view-inner .product-detail .content .desc {
    font-size: 12px;
  }

  .quick-view .quick-view-inner .product-detail .content .qty {
    font-size: 12px;
  }

  .link-to-login {
    margin-top: 20px !important;
  }
}

@media (max-width: 576px) {
  .quick-view .quick-view-inner {
    width: 90vw;
    height: 40vh;
  }

  .link-to-login {
    margin-top: 50px !important;
  }

  .link-to-login>a {
    padding: 20px !important;
    font-size: 18px !important;
  }
}
</style>
