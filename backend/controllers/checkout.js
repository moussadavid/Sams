// // This is your test secret API key.
import Stripe from "stripe";
import config from "../config/data.js";
const stripe = new Stripe(config.stripeKey);
import open from "open";


const YOUR_DOMAIN = config.frontendBaseUrl;

export const checkout = async (req, res) => {
  const data = req.body;
  const product = await stripe.products.create({
    name: "Sam's Gyros",
  });
  const price = await stripe.prices.create({
    currency: "usd",
    unit_amount: data.amount,
    product: product.id,
  });

    const sessionParams = {
      payment_method_types: ["card"],
      line_items: [
        {
          price: price.id,
          quantity: 1,
        },
      ],
      mode: "payment",
      success_url:
        `${YOUR_DOMAIN}/thank?bill_id=` +
        data.bill_id +
        "&user_id=" +
        data.user_id,
      cancel_url: `${YOUR_DOMAIN}/home`,
    };
    
    stripe.checkout.sessions.create(sessionParams, (error, session) => {
        if (error) {
                    console.error(
                      "Error creating Checkout Session:",
                      error.message
                    );

            res.send(err);

        } else {
open(session.url);

            res.json(session);


      }
    });

    
    
//   const session = await stripe.checkout.sessions.create({
//     line_items: [
//       {
//         price: price.id,
//         quantity: 1,
//       },
//     ],
//     mode: "payment",
//     success_url: `${YOUR_DOMAIN}/success.html`,
//     cancel_url: `${YOUR_DOMAIN}/cancel.html`,
//   });
//     //return session;
//     res.json({ url: session.url });
//    //res.redirect(303, session.url);
};
