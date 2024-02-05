<template>
  <div class="admin-container">
    <div class="d-flex justify-content-between">
      <h1>Hello Admin!</h1>
      <button class="btn" @click="handleLogout()">Logout</button>
    </div>

    <div class="table-responsive">
       <h1>Active Orders</h1>
      <table class="table colored-header datatable project-list">
        <thead>
          <tr>
            <th>Order Id</th>
            <th>Show Order</th>
            <th>User Name</th>
            <th>Phone</th>
            <!-- <th>Address</th> -->
            <th>When</th>
            <th>Paid</th>
            <th>Total</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="b in filterBills.slice().reverse()" :key="b.bill_id">
            <td>
              {{ b.bill_id }}
            </td>
            <td>
  <button @click="sendBillId(b.bill_id)">show order details</button>
            </td>
            <td>{{ getUserName(b.user_id) }}</td>
            <td>{{ b.bill_phone }}</td>
            <!-- <td>{{ b.bill_address }}</td> -->
            <td>{{ b.bill_when }}</td>
            <td>{{ b.bill_paid }}</td>
            <td>${{ b.bill_total }}</td>
            <td>{{ avaiableStatus[b.bill_status] }}</td>
            <td>
              <button
                v-if="b.bill_status < 5 && b.bill_paid == 'true'"
                class="action-btn"
                @click="nextStatusBtn(b.bill_id)"
              >
                {{ avaiableStatus[b.bill_status + 1] }}
              </button>

              <button
                v-if="b.bill_paid == 'false'"
                class="cancel-btn"
                @click="cancelBtn(b.bill_id)"
              >
                Cancel
              </button>

              <!-- <button
                v-else-if="b.bill_status == 5 && b.bill_paid == 'false'"
                class="paid-btn"
                @click="paidBtn(b.bill_id)"
              >
                Paid
              </button> -->

              <button
                v-else-if="b.bill_status == 5 && b.bill_paid == 'true'"
                class="action-btn"
              >
                Picked Up
              </button>
            </td>
          </tr>
        </tbody>
      </table>
<br>
<h1>Completed Orders</h1>
      <table class="table colored-header datatable project-list">
        <thead>
          <tr>
            <th>Order Id</th>
            <th>Show Order</th>
            <th>User Name</th>
            <th>Phone</th>
            <!-- <th>Address</th> -->
            <th>When</th>
            <th>Paid</th>
            <th>Total</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="b in completedBills.slice().reverse()" :key="b.bill_id">
            <td>
              {{ b.bill_id }}
            </td>
            <td>
  <button @click="sendBillId(b.bill_id)">show order details</button>
            </td>
            <td>{{ getUserName(b.user_id) }}</td>
            <td>{{ b.bill_phone }}</td>
            <!-- <td>{{ b.bill_address }}</td> -->
            <td>{{ b.bill_when }}</td>
            <td>{{ b.bill_paid }}</td>
            <td>${{ b.bill_total }}</td>
            <td>{{ avaiableStatus[b.bill_status] }}</td>
          </tr>
        </tbody>
      </table>

    </div>
     <OrderDetails v-if="showOrderDetails" :bill="sendId">
            <button class="btn" @click="closeView">X</button>
        </OrderDetails>
  </div>
</template>

<script>
import OrderDetails from "@/components/OrderDetails.vue";
import axios from "axios";
import { mapState, mapMutations } from "vuex";
export default {
  name: "Dashboard",

  data() {
    return {
      avaiableStatus: [
        "cancel",
        "confirmed",
        "preparing",
        "checking",
        "ready",
        "completed",
      ],
      allBills: [],
      showOrderDetails: false,
            sendId: null,
      interval: "",
      allUsers: [],
    };
  },

  created() {
    this.getAllBills();
    this.getUsersData();
    if (!this.admin) {
      this.$router.push("/");
    }
  },

  mounted: function () {
    this.autoUpdate();
  },

  beforeUnmount() {
    clearInterval(this.interval);
  },

  computed: {
    ...mapState(["allFoods", "admin"]),

    filterBills: function () {
      return this.allBills.filter(
        (b) => b.bill_status < 5 && b.bill_status > 0
      );
      },

          completedBills: function () {
      return this.allBills.filter(
        (b) => b.bill_status < 6 && b.bill_status > 4
      );
    },
  },

  methods: {
    ...mapMutations(["setAdmin"]),

    async getAllBills() {
      this.allBills = (await axios.get("/billstatus")).data;
    },

    async getUsersData() {
      this.allUsers = (await axios.get("/users")).data;
    },
    sendBillId: function (id) {
      this.sendId = id;
      this.showOrderDetails = !this.showOrderDetails;
    },

    closeView: function () {
      this.showOrderDetails = !this.showOrderDetails;
    },

    handleLogout: function () {
      this.setAdmin("");
    },

    async nextStatusBtn(id) {
      await axios.put("/billstatus/" + id);
      this.getAllBills();
    },


    async paidBtn(id) {
      await axios.put("/billstatus/paid/" + id);
      this.getAllBills();
    },
    getUserName(userId) {
      let temp = this.allUsers.filter((u) => u.user_id === userId);
      let user_name = temp.length > 0 && temp[0] ? temp[0].user_name : null;
      return user_name;
    },

    async cancelBtn(id) {
      await axios.put("/billstatus/cancel/" + id);
      this.getAllBills();
    },

    autoUpdate: function () {
      this.interval = setInterval(
        function () {
          this.getAllBills();
        }.bind(this),
        1000
      );
    },
    },
     components: { OrderDetails }
};
</script>

<style scoped>
.admin-container {
  background-color: #fff;
  height: 100vh;
  padding: 2rem 9%;
  font-size: 16px;
}

.project-list > tbody > tr > td {
  padding: 12px 8px;
}

.project-list > tbody > tr > td .avatar {
  width: 22px;
  border: 1px solid #ccc;
}

.table-responsive {
  margin-top: 8vh;
}

.action-btn,
.cancel-btn,
.paid-btn {
  width: 100px;
  height: 25px;
  color: white;
  text-transform: capitalize;
}

.action-btn {
  background-color: #0da9ef;
  margin-right: 10px;
}

.cancel-btn,
.paid-btn {
  background-color: red;
}

.action-btn:hover {
  background-color: #27ae60;
}
</style>
