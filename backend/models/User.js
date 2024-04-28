const { default: mongoose } = require("mongoose");

const UserSchema = new mongoose.Schema({
  username: { type: String, required: true },
  email: { type: String, required: true,unique: true},
  otp: { type: String, required: false,default:"none" },
  fcm:{type: String, required:false,default:"none"},
  password: { type: String, required:true},
  verification: { type: Boolean, default:false},
  phone: { type: String, default: "0123456789"},
  phoneVerification: { type: Boolean, default:false},
  address: { type: mongoose.Schema.Types.ObjectId,ref:"Address" ,required:false},
  userType:{type:String, required:true,default:"Client",enum:['Client','Admin','Vendor','Driver']},
  profile: {type:String, default:'https://gravatar.com/avatar/3b407b26a9da5ce43b5c0779c8741f13?s=400&d=robohash&r=x'}

},{timestamps:true});
module.exports = mongoose.model("User", UserSchema);
