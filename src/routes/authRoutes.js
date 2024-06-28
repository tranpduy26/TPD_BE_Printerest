import express from "express";
import { signIn, signUp } from "../controllers/authController.js";

const authRoutes = express.Router();

authRoutes.post("/signin", signIn);
authRoutes.post("/signup", signUp);

export default authRoutes;
