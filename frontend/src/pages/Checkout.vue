<template>
  <div class="checkout-container">
    <div class="checkout-form-container">
      <form
        id="checkoutForm"
        @submit="handleSubmit"
        novalidate
        autocomplete="off"
      >
        <div class="checkout-heading">
          <h3>Few more step to place your order</h3>
          <h3 class="font-bold total-discount">
            Tips value:

            <span> ${{ calculateSummaryPrice()[5] }}</span>
          </h3>

          <input
            type="radio"
            name="10"
            value="10"
            id="10"
            :disabled="filterFoods.length ? false : true"
            @change="handleRadioChange($event)"
            v-model="tipsvalue"
          /><span>10%</span>

          <input
            type="radio"
            name="20"
            value="20"
            id="20"
            v-model="tipsvalue"
            :disabled="filterFoods.length ? false : true"
            @change="handleRadioChange($event)"
          /><span>20%</span>

          <input
            type="radio"
            name="30"
            value="30"
            id="30"
            v-model="tipsvalue"
            :disabled="filterFoods.length ? false : true"
            @change="handleRadioChange($event)"
          /><span>30%</span>

          <input
            type="radio"
            name="50"
            value="50"
            id="50"
            v-model="tipsvalue"
            :disabled="filterFoods.length ? false : true"
            @change="handleRadioChange($event)"
          /><span>50%</span>
          <input
            type="radio"
            name="Other"
            value="Other"
            id="Other"
            v-model="tipsvalue"
            :disabled="filterFoods.length ? false : true"
            @change="handleRadioChange($event)"
          /><span>Other</span>
          <input
            ref="iTips"
            type="number"
            id="iTips"
            class="form-control"
            :disabled="true"
            :value="this.tips"
            min="1"
            max="1000"
            @change="onTipsChange($event)"
          />
          <h3 v-if="user">
            {{ user.user_name }}'s Order your total is
            <span>${{ calculateSummaryPrice()[4] }}</span>
          </h3>
          <span v-if="isButtonEnabled"
            >your order is supposed to be ready within 35 mins after
            payment</span
          >
        </div>
        <!-- 
                <div class="form-group details-group">
                    <h4>Shipping Details</h4>
                    <div class="form-group">
                        <input type="text" name="coPhone" id="coPhone" placeholder="Phone number" class="form-control"
                            v-model="checkoutObj.phone" />
                        <p class="error-mess" v-if="errorObj.phoneErr.length > 0">{{ errorObj.phoneErr[0] }}</p>
                    </div>

                    <div class="form-group">
                        <input type="text" name="coAddress" id="coAddress" placeholder="Address in Hanoi, Vietnam"
                            class="form-control" v-model="checkoutObj.address" />
                        <p class="error-mess" v-if="errorObj.addressErr.length > 0">{{ errorObj.addressErr[0] }}</p>
                    </div>
                </div>

                <div class="form-group details-group">
                    <h4>Payment Method</h4>
                    <div class="form-group">
                        <div class="form-group">
                            <input type="radio" name="payment" value="cash" id="paymentCash"
                                v-model="checkoutObj.paymentMethod" /><span>Cash</span>
                            <input type="radio" name="payment" value="card" id="paymentCard"
                                v-model="checkoutObj.paymentMethod" /><span>Card (Visa)</span>
                        </div>
                        <p class="error-mess" v-if="errorObj.payErr.length > 0">{{ errorObj.payErr[0] }}</p>
                    </div>


                    <div v-if="checkoutObj.paymentMethod == 'card'">
                        <div class="form-group">
                            <input type="text" name="coCardNum" placeholder="Enter your card number" id="coCardNum"
                                class="form-control" v-model="cardObj.number" size="16" maxlength="16" />
                            <p class="error-mess" v-if="errorObj.numErr.length > 0">{{ errorObj.numErr[0] }}</p>
                        </div>

                        <div class="form-group">
                            <input v-upcase type="text" name="coCardName" placeholder="Enter the name in your card "
                                id="coCardName" class="form-control" v-model="cardObj.name" />
                            <p class="error-mess" v-if="errorObj.nameErr.length > 0">{{ errorObj.nameErr[0] }}</p>
                        </div>

                        <div class="form-group">
                            <div class="form-control">
                                <span
                                    style="font-size: 1.6rem; position: absolute; margin-left: -5px; margin-top: -11px;">Expiry
                                    Date:
                                </span>
                                <input
                                    style="position: absolute; margin-left: 100px; margin-top: -12px; background: inherit;"
                                    type="month" name="coCardEx" id="coCardEx" v-model="cardObj.expiryDate"
                                    @click="availableTime()" />
                            </div>
                            <p class="error-mess" v-if="errorObj.exDateErr.length > 0">{{ errorObj.exDateErr[0] }}</p>
                        </div>

                        <div class="form-group">
                            <input type="text" name="coCardCvv" placeholder="CVV" id="coCardCvv" class="form-control"
                                v-model="cardObj.cvv" />
                            <p class="error-mess" v-if="errorObj.cvvErr.length > 0">{{ errorObj.cvvErr[0] }}</p>
                        </div>
                    </div>
                </div> -->
        <div v-if="user" class="form-group">
          <input
            type="submit"
            value="CONFIRM & PAY"
            class="btn"
            :disabled="isButtonDisabled"
          />
        </div>
        <h3 style="color: red">
          <span v-if="!isButtonEnabled"
            >we are sorry the online order from 10 AM till 7:30 PM</span
          >
        </h3>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { mapState } from "vuex";
import config from "../../config/data.js";

export default {
  name: "Checkout",

  data() {
    return {
      checkoutObj: { phone: "", address: "", paymentMethod: "" },
      cardObj: { number: "", name: "", expiryDate: "", cvv: "" },
      errorObj: {
        phoneErr: [],
        addressErr: [],
        payErr: [],
        numErr: [],
        nameErr: [],
        exDateErr: [],
        cvvErr: [],
      },
      cartItem: [],
      itemQuantity: [],
      itemSide_Salad: [],
      itemspecial_requests: [],
      billId: 1,
      tipsPercentage: 0,
      tips: 0,
      tipsvalue: null,
      startTime: 10,
      endTime: 19.5,
    };
  },

  created() {
    this.getAllCartItem();
  },

  computed: {
    ...mapState(["allFoods", "user"]),

    filterFoods: function () {
      return this.allFoods.filter((f) => this.matchID(f, this.cartItem));
    },
    isButtonDisabled() {
      const currentTime = new Date().getHours();

      // Disable the button if the current time is outside the specified range
      return currentTime <= this.startTime || currentTime >= this.endTime;
    },
  },
  mounted() {
    this.loadDataFromDatabase();
  },
  methods: {
    async loadDataFromDatabase() {
      let bill = (await axios.get("/billstatus/new")).data;

      if (bill == "") {
        this.billId = 1;
      } else {
        this.billId = parseInt(bill.bill_id) + 1;
      }
    },
    availableTime: function () {
      var now = new Date();
      var currentMonth = ("0" + (now.getMonth() + 1)).slice(-2);

      var minRange = now.getFullYear() + "-" + currentMonth;
      var maxRange = now.getFullYear() + 10 + "-" + currentMonth;

      document.getElementById("coCardEx").setAttribute("min", minRange);
      document.getElementById("coCardEx").setAttribute("max", maxRange);
    },

    matchID: function (food, cartArray) {
      let temp = "";
      cartArray.forEach((element) => {
        if (parseInt(food.food_id) == element) {
          temp = food;
        }
      });
      return temp;
    },
    getFoodItem: function (foodArray, cartItem) {
      let temp = "";
      foodArray.forEach((element) => {
        if (parseInt(cartItem) == parseInt(element.food_id)) {
          temp = element;
        }
      });

      return temp;
    },
    calculateSummaryPrice: function () {
      let tips = 0;
      let subtotal = 0;
      let discount = 0;
      let delivery = 0;
      let Taxfees = 0;
      let i = 0;
      while (i < this.itemQuantity.length) {
        let foodItem = this.getFoodItem(this.filterFoods, this.cartItem[i]);
        subtotal =
          subtotal + parseFloat(foodItem.food_price) * this.itemQuantity[i];
        discount =
          discount + parseFloat(foodItem.food_discount) * this.itemQuantity[i];
        i = i + 1;
      }
      if (!this.filterFoods.length) {
        delivery = 0;
      } else {
        let tax = parseFloat((subtotal * config.tax) / 100);
        Taxfees =
          parseFloat(((tax + subtotal) * config.stripFees) / 100) +
          config.stripFixedFees +
          tax;
      }
      let total = subtotal - discount + delivery + Taxfees;
      tips = parseFloat(this.tips) + (total * this.tipsPercentage) / 100;
      total = total + tips;
      return [
        subtotal.toFixed(2),
        discount.toFixed(2),
        delivery.toFixed(2),
        Taxfees.toFixed(2),
        total.toFixed(2),
        tips.toFixed(2),
      ];
    },

    async onTipsChange(e) {
      this.tips = parseFloat(e.target.value).toFixed(2);
      this.tipsPercentage = 0;
    },

    async handleRadioChange(e) {
      this.tips = 0;
      const inputElement = this.$refs.iTips;

      if (e.target.value != "Other") {
        this.tipsPercentage = e.target.value;
        inputElement.disabled = true;
      } else {
        inputElement.disabled = false;
        this.tipsPercentage = 0;
      }
    },
    async getAllCartItem() {
      if (this.user) {
        let existItem = await axios.get("/cartItem/" + this.user.user_id);
        existItem.data.forEach((element) => {
          this.cartItem.push(element.food_id);
          this.itemQuantity.push(element.item_qty);
          this.itemSide_Salad.push(element.side_salad);
          this.itemspecial_requests.push(element.special_requests);
        });
      }
    },

    resetCheckErr: function () {
      this.errorObj.phoneErr = [];
      this.errorObj.addressErr = [];
      this.errorObj.payErr = [];
      this.errorObj.numErr = [];
      this.errorObj.nameErr = [];
      this.errorObj.exDateErr = [];
      this.errorObj.cvvErr = [];
    },

    checkEmptyErr: function () {
      for (var typeErr in this.errorObj) {
        if (this.errorObj[typeErr].length != 0) {
          return false;
        }
      }
      return true;
    },

    inputUpcase: function (e) {
      e.target.value = e.target.value.toUpperCase();
    },

    checkForm: function () {
      this.resetCheckErr();

      // Phone validate
      if (!this.checkoutObj.phone) {
        this.errorObj.phoneErr.push("Entering phone number is required");
      } else {
        if (this.checkoutObj.phone.length != 10) {
          this.errorObj.phoneErr.push(
            "Phone numbers must have exactly 10 digits"
          );
        }

        if (!/[0-9]{10}/.test(this.checkoutObj.phone)) {
          this.errorObj.phoneErr.push("Phone numbers can only contain numbers");
        }
      }

      // Address validate
      if (!this.checkoutObj.address) {
        this.errorObj.addressErr.push("Entering address is required");
      }

      // Card validate
      if (!this.checkoutObj.paymentMethod) {
        this.errorObj.payErr.push("Selecting payment method is required");
      } else if (this.checkoutObj.paymentMethod == "card") {
        if (!this.cardObj.number) {
          this.errorObj.numErr.push("Entering card number is required");
        } else {
          if (!this.cardObj.number.startsWith("4")) {
            this.errorObj.numErr.push("Visa card numbers must start with 4");
          }

          if (this.cardObj.number.length != 16) {
            this.errorObj.numErr.push(
              "Visa card numbers must have exactly 16 digits"
            );
          }

          if (!/[0-9]{16}/.test(this.cardObj.number)) {
            this.errorObj.numErr.push(
              "Visa card numbers can only contain numbers"
            );
          }
        }

        if (!this.cardObj.name) {
          this.errorObj.nameErr.push("Entering name is required");
        } else {
          if (!/^[A-Za-z]+$/.test(this.cardObj.name.replace(/\s/g, ""))) {
            this.errorObj.nameErr.push("A name can only contain letters");
          }
        }

        if (!this.cardObj.expiryDate) {
          this.errorObj.exDateErr.push("Entering expiry date is required");
        }

        if (!this.cardObj.cvv) {
          this.errorObj.cvvErr.push("Entering cvv code is required");
        } else {
          if (this.cardObj.cvv.length != 3) {
            this.errorObj.cvvErr.push("Cvv code must have exactly 3 digits");
          }

          if (!/[0-9]{3}/.test(this.cardObj.cvv)) {
            this.errorObj.cvvErr.push("Cvv code can only contain numbers");
          }
        }
      } else if (this.checkoutObj.paymentMethod == "cash") {
        this.cardObj.number = "";
        this.cardObj.name = "";
        this.cardObj.expiryDate = "";
        this.cardObj.cvv = "";

        this.errorObj.numErr = [];
        this.errorObj.nameErr = [];
        this.errorObj.exDateErr = [];
        this.errorObj.cvvErr = [];
      }
    },

    isPaid: function () {
      if (this.checkoutObj.paymentMethod == "cash") {
        return "false";
      } else if (this.checkoutObj.paymentMethod == "card") {
        return "true";
      }
    },

    async sendBillDetails(billId, foodId, qty, sidesalad,special_requests) {
      let billDetails = {
        bill_id: parseInt(billId),
        food_id: parseInt(foodId),
        item_qty: parseInt(qty),
        side_salad: sidesalad,
        special_requests:special_requests,
      };

      await axios.post("/billdetails", billDetails);
    },

    handleSubmit() {
      this.cartItem.forEach((foodId, index) => {
        this.sendBillDetails(
          this.billId,
          foodId,
          this.itemQuantity[index],
          this.itemSide_Salad[index],
          this.itemspecial_requests[index],
        );
      });

      var now = new Date();
      var day = ("0" + now.getDate()).slice(-2);
      var month = ("0" + (now.getMonth() + 1)).slice(-2);
      var hour = ("0" + now.getHours()).slice(-2);
      var min = ("0" + now.getMinutes()).slice(-2);
      var currentTime =
        now.getFullYear() + "-" + month + "-" + day + "T" + hour + ":" + min;

      let billStatus = {
        bill_id: parseInt(this.billId),
        user_id: parseInt(this.user.user_id),
        bill_phone: this.user.user_phone,
        bill_address: this.checkoutObj.address,
        bill_when: currentTime,
        bill_method: this.checkoutObj.paymentMethod,
        bill_subtotal: parseFloat(this.calculateSummaryPrice()[0]),
        bill_discount: parseFloat(this.calculateSummaryPrice()[1]),
        bill_delivery: parseFloat(this.calculateSummaryPrice()[2]),
        bill_taxfees: parseFloat(this.calculateSummaryPrice()[3]),
        bill_tips: parseFloat(this.calculateSummaryPrice()[5]),
        bill_total: parseFloat(this.calculateSummaryPrice()[4]),
        bill_paid: "false",
        bill_status: 1,
      };
      axios.post("/billstatus", billStatus);

      //   axios.delete("/cartItem/" + this.user.user_id);
      let checkoutOrder = {
        amount: parseInt(this.calculateSummaryPrice()[4] * 100),
        bill_id: parseInt(this.billId),
        user_id: parseInt(this.user.user_id),
      };
      axios.post("/create-checkout-session", checkoutOrder);
      this.cartItem = [];
      this.itemQuantity = [];

      this.$router.push("/home");
      // }
    },
  },
};
</script>

<script setup>
// enables v-focus in templates
// const vUpcase = {
//     mounted(el) {
//         el.style.textTransform = "uppercase";
//     }
// }
</script>

<style scoped>
.checkout-container {
  padding: 2rem 9%;
}

.checkout-container .checkout-form-container {
  background: #fff;
  height: 90vh;
}

.checkout-container .checkout-form-container form {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -42%);
  max-width: 70rem;
  width: 100%;
  box-shadow: 0 1rem 1rem rgba(0, 0, 0, 0.05);
  border: 0.1rem solid rgba(0, 0, 0, 0.2);
  padding: 2rem;
  border-radius: 0.5rem;
  animation: fadeUp 0.4s linear;
}

.checkout-container .checkout-form-container form h3 {
  padding-bottom: 1rem;
  font-size: 2rem;
  text-transform: uppercase;
  color: #130f40;
  margin: 0;
}

.checkout-container .checkout-form-container form .form-control {
  margin: 0.7rem 0;
  border-radius: 0.5rem;
  background: #f7f7f7;
  padding: 2rem 1.2rem;
  font-size: 1.6rem;
  color: #130f40;
  text-transform: none;
  width: 100%;
  border: none;
}

.checkout-container .checkout-form-container form label {
  font-size: 2rem;
  margin: 0;
  padding: 0;
}

.checkout-container .checkout-form-container form span {
  font-size: 18px;
  padding-left: 5px;
  padding-right: 40px;
}

.checkout-container .checkout-form-container form .btn {
  margin: 1rem 0;
  width: 100%;
  text-align: center;
}

.checkout-container .checkout-form-container form p {
  padding-top: 1rem;
  font-size: 1.5rem;
  color: #666;
  margin: 0;
}

.checkout-container .checkout-form-container form p a {
  color: #27ae60;
}

.checkout-container .checkout-form-container form p a:hover {
  color: #130f40;
  text-decoration: underline;
}

.checkout-container .checkout-form-container form .form-group {
  margin: 0;
}

.checkout-container .checkout-form-container form .form-group.details-group {
  margin-top: 40px;
}

.checkout-container .checkout-form-container form .form-group .error-mess {
  font-size: 1.5rem;
  position: relative;
  color: rgb(243, 47, 47);
  margin: 0;
  padding: 0;
}

.checkout-container .checkout-form-container form .checkout-heading h3 {
  display: flex;
  justify-content: space-between;
}

.checkout-container .checkout-form-container form .checkout-heading h3 span {
  padding-right: 0px;
  color: #f38609;
}

.checkout-container
  .checkout-form-container
  form
  .checkout-heading
  h3:first-of-type
  span {
  padding-right: 0px;
  color: #130f40;
}
</style>
