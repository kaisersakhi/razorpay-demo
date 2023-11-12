import {Controller} from "@hotwired/stimulus"


// Connects to data-controller="razorpay"
export default class extends Controller {


    // How to create order id , pass that in here
    // Where to store order info, for apply forms. I think in "Plans" table?
    // Where to store transaction details, like transaction id. Create a new table for transactions?

    // @POST /razorpay/orders?form_response_id -> Creates a new order, links it to the form_response and returns order_id
    // will check if a
    // @POST /razorpay/orders/:id/update
    // POST /razorpay/callback?order_id

    // Create razorpay_orders table +
    // payment_at, payment_id

    // look into webhook and payment signature
    // table course_plan


    static values = {
        formId: String
    }


    connect() {
        this.loadOrder()
    }

    loadOrder() {
        // Creat the order as soon as the page loads.
        console.log(`Loading/create a new order....
                        Form ${this.formIdValue}`)
        const data = {
            resource_id: this.formIdValue
        };

        const options = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data) // Convert the data object to a JSON string
        };

        const order = fetch('/razorpay_orders', options)
        order.then(response => response.json())
            .then(orderData => {
                this.order =  orderData;
            })
            .catch(err => console.error(err))
        return order;
    }

    checkout() {
        if (this.order) {
            const razorPayOrder = this.order.order
            const options = {
                "key": this.order.key_id,
                "order_id": razorPayOrder.order_id,
                "amount": razorPayOrder.amount,
                "currency": razorPayOrder.currency,
                "image": "https://cdn.pixabay.com/photo/2016/08/20/09/51/marguerite-1607181_1280.jpg",
                "handler": function (response) {
                    alert(response.razorpay_payment_id);
                }
            };

            console.log(this.order)
            const rp = new Razorpay(options)
            rp.open();
            console.log(rp)
            console.log(options)
        }
    }


}


