<template>
  <div class="order-details">
    <div class="order-details-inner">
      <h2 class="d-flex justify-content-between">
        Order summary
        <slot></slot>
      </h2>
      <div
        class="d-flex flex-wrap flex-row"
        style="overflow-y: auto"
        id="printDiv"
      >
      <h3 class="d-flex justify-content-between">
        Order number: 
         <span>{{ bill_id }}</span>
      </h3>
        <div style="flex: 100%" v-for="(f, index) in foodsInBill" :key="index">
          <!-- <div class="product-detail d-flex">
            <div class="image">
              <img :src="require(`../assets/images/${f.food_src}`)" alt="" />
            </div>
            <div class="content">
              <p class="name">
                {{ f.food_name }} <span>X {{ item_qty[index] }}</span>
              </p>
              <p class="desc">{{ side_salad[index] }}</p>
            </div>
          </div> -->

          <div class="desc col-sm-12">
            <h3 class="item-name">
              <span>{{ item_qty[index] }}</span> {{ f.food_name }}
            </h3>
            <div class="item-desc">
              <p>Side salad: {{ side_salad[index] }}</p>
            </div>
            <div class="item-desc">
              <p>Special requests: {{ special_requests[index] }}</p>
            </div>
            
          </div>
        </div>
      </div>

      <!-- <div class="price">
        <p>Discount: ${{ billMatch.bill_discount }}</p>
        <p>Delivery Fee: ${{ billMatch.bill_delivery }}</p>
        <p>Total: ${{ billMatch.bill_total }}</p>
      </div> -->
       <div v-if="admin">
      <button @click="printDiv()">Print</button>
        </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { mapState } from "vuex";
export default {
  props: ["bill"],
  name: "OrderDetails",

  data() {
    return {
      allFoodsInBill: [],
      foodsInBill: [],
      item_qty: [],
      side_salad: [],
      special_requests:[],
      billMatch: undefined,
      bill_id: undefined,
    };
  },

  created() {
    this.getAllFoods();
    this.getBillStatus();
  },

  computed: {
    ...mapState(["allFoods","admin"]),

    filterFoods: function () {
      return this.allFoods.filter((f) => this.matchID(f, this.allFoodsInBill));
    },
  },

  methods: {
    matchID: function (food, cartArray) {
      let temp = "";
      cartArray.forEach((element) => {
        if (parseInt(food.food_id) == element) {
          temp = food;
        }
      });
      return temp;
    },
    getFoodItem: function (foodId) {
      let temp = this.allFoods.filter((f) => f.food_id == foodId);
      return temp;
    },
    async getAllFoods() {
      if (this.bill) {
        let data = (await axios.get("/billdetails/" + this.bill)).data;
        data.forEach((element) => {
          this.bill_id = element.bill_id;
          let foodItem = this.getFoodItem(element.food_id);
          this.allFoodsInBill.push(element.food_id);
          this.item_qty.push(element.item_qty);
          this.side_salad.push(element.side_salad);
          this.special_requests.push(element.special_requests);
          this.foodsInBill.push({
            food_id: element.food_id,
            food_src: foodItem[0].food_src,
            food_name: foodItem[0].food_name,
          });
        });
      }
    },

    async getBillStatus() {
      if (this.bill) {
        this.billMatch = (
          await axios.get("/billstatus/bill/" + this.bill)
        ).data[0];
      }
    },
    printDiv() {
      var printWindow = window.open("", "_blank");
      var printContents = document.getElementById("printDiv").innerHTML;

      printWindow.document.write(
        "<html><head><title>Print</title></head><body>"
      );
      printWindow.document.write(printContents);
      printWindow.document.write("</body></html>");

      printWindow.document.close(); // Close the document open for writing
      printWindow.print();
    },
  },
};
</script>

<style scoped>
.order-details {
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

.order-details .order-details-inner {
  width: 60vw;
  height: 70vh;
  background-color: #fff;
  padding: 32px;
  overflow: auto; /* Enable scrolling */
}

.order-details .order-details-inner h2 {
  margin: 0;
  font-size: 32px;
  color: #27ae60;
  margin-bottom: 20px;
}

.order-details .order-details-inner .product-detail .image img {
  height: 8rem;
  width: 8rem;
  margin: 20px;
}

.order-details .order-details-inner .product-detail .content {
  margin-top: 20px;
  font-size: 12px;
  width: 100%;
}

.order-details .order-details-inner .product-detail .content p:first-of-type {
  font-size: 16px;
  color: #f38609;
}

.order-details .order-details-inner .product-detail .content p span {
  font-size: 14px;
  color: black;
}

.order-details .order-details-inner .price {
  margin-top: 30px;
  font-size: 16px;
}

@media (max-width: 768px) {
  .order-details .order-details-inner {
    width: 80vw;
    height: 60vh;
  }

  .order-details .order-details-inner h2 {
    font-size: 20px;
  }

  .order-details .order-details-inner .product-detail .content .desc,
  .order-details .order-details-inner .product-detail .content .name span {
    font-size: 12px !important;
  }

  .order-details .order-details-inner .product-detail .content .name {
    font-size: 14px !important;
  }
}

@media (max-width: 576px) {
  .order-details .order-details-inner {
    width: 90vw;
    height: 65vh;
  }

  .order-details .order-details-inner div:first-of-type {
    flex-direction: column;
  }
}

@media (max-width: 376px) {
  .order-details .order-details-inner {
    width: 90vw;
    height: 65vh;
    padding: 5px !important;
  }

  .order-details .order-details-inner .product-detail .content .name {
    font-size: 12px !important;
  }
}
</style>
