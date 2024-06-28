import express from "express";
import {
  checkImageSaved,
  deleteImageById,
  getAllImage,
  getImageCreateByUser,
  getImageInforById,
  getImageSavedByUser,
  getImgByUserId,
  searchImage,
  uploadImage,
} from "../controllers/imageController.js";
import upload from "../config/upload.js";

const imageRoutes = express.Router();

imageRoutes.get("/get-all", getAllImage);
imageRoutes.get("/search-image/:searchName", searchImage);
imageRoutes.get("/image-infor/:imageId", getImageInforById);
imageRoutes.get("/get-image-by-user-id/:userId", getImgByUserId);
imageRoutes.get("/check-image-saved/:imageId", checkImageSaved);
imageRoutes.get("/get-saved-image", getImageSavedByUser);
imageRoutes.get("/get-create-image", getImageCreateByUser);
imageRoutes.delete("/delete/:hinh_id", deleteImageById);
imageRoutes.post("/upload-image", upload.single("image"), uploadImage);

export default imageRoutes;
