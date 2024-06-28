import express from "express";
import {
  addComment,
  getCommentByImgId,
} from "../controllers/commentController.js";

const commentRoutes = express.Router();

commentRoutes.get("/get-comment-by-img-id/:imageId", getCommentByImgId);
commentRoutes.post("/add-comment", addComment);

export default commentRoutes;

// trời opwi cứu tui trời ơiiii
