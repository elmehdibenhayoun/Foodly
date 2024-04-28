const express = require("express");
const app = express();
const dotenv = require("dotenv");
const { default: mongoose } = require("mongoose");
const CategoryRoute = require("./routes/category");
const RestaurantRoute = require("./routes/restaurant");
const FoodRoute = require("./routes/food");
const RatingRoute = require("./routes/rating");
const AuthRoute = require("./routes/auth");
const UserRoute = require("./routes/user");
const AddressRoute = require("./routes/address");
const CartRoute = require("./routes/cart");
const OrderRoute = require("./routes/order");
const sendEmail = require("./utils/smtp_function");
const generateOtp = require("./utils/otp_generator");

dotenv.config();

const port = process.env.PORT;

mongoose
  .connect(process.env.MONGOURL)
  .then(() => console.log("Foodly Database connected"))
  .catch((err) => {
    console.log(err);
  });



app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use("/", AuthRoute);
app.use("/api/users", UserRoute);
app.use("/api/category", CategoryRoute);
app.use("/api/restaurant", RestaurantRoute);
app.use("/api/foods", FoodRoute);
app.use("/api/rating", RatingRoute);
app.use("/api/address", AddressRoute);
app.use("/api/cart", CartRoute);
app.use("/api/orders", OrderRoute);

app.listen(port, () => console.log(`listening on http://192.168.1.101:${port}`));
