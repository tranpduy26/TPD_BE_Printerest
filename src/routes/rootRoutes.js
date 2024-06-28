import express from "express";
import imageRoutes from "./imageRoutes.js";
import commentRoutes from "./commentRoutes.js";
import authRoutes from "./authRoutes.js";
import userRoutes from "./userRoutes.js";

const rootRoute = express.Router();
rootRoute.use("/auth", authRoutes);
rootRoute.use("/image", imageRoutes);
rootRoute.use("/comment", commentRoutes);
rootRoute.use("/user", userRoutes);

export default rootRoute;
