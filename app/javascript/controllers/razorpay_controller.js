import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="razorpay"
export default class extends Controller {
  static values = {

  }
  connect() {

  }
  // How to create order id , pass that in here
  // Where to store order info, for apply forms. I think in "Plans" table?
  // Where to store transaction details, like transaction id. Create a new table for transactions?
  checkout(){
    const options = {
      "key": "rzp_test_UrIAsIJWrIy2Mw",
      "order_id": "order_MyOTSVzeDyC5kS",
      "amount": "1000",
      "currency": "INR",
      "description": "Acme Corp",
      "image": "https://s3.amazonaws.com/rzp-mobile/images/rzp.jpg",
      "handler": function (response) {
        alert(response.razorpay_payment_id);
      }
    };

    const rp = new Razorpay(options)
    rp.open();
    console.log(rp)
  }
}
