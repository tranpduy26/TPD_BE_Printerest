import express from "express";
import {
  getAllUser,
  getUserInfor,
  updateUserInfor,
} from "../controllers/userController.js";

const userRoutes = express.Router();

userRoutes.get("/get-all-users", getAllUser);
userRoutes.get("/get-infor", getUserInfor);
userRoutes.put("/update-infor/:userId", updateUserInfor);

export default userRoutes;
