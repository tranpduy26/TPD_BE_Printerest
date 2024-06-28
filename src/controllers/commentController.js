import { PrismaClient } from "@prisma/client";
import { responseData } from "../config/response.js";
import { decodeToken } from "../config/jwt.js";

let prisma = new PrismaClient();

export const getCommentByImgId = async (req, res) => {
  try {
    const { imageId } = req.params;
    const checkImageId = await prisma.hinh_anh.findFirst({
      where: {
        hinh_id: Number(imageId),
      },
    });

    if (checkImageId) {
      let data = await prisma.binh_luan.findMany({
        where: {
          hinh_id: Number(imageId),
        },
      });
      responseData(res, "Xử lý thành công", data, 200);
    } else {
      responseData(res, "Không tồn tại hình ảnh", "", 404);
    }
  } catch {
    responseData(res, "Lỗi tè le...", "", 500);
  }
};

// thêm bình luận của người dùng với ảnh

export const addComment = async (req, res) => {
  let { token } = req.headers;
  let { imageId, comment } = req.body;

  let accessToken = decodeToken(token);
  let { nguoi_dung_id } = accessToken.data;
  let checkImg = await prisma.hinh_anh.findMany({
    where: {
      hinh_id: Number(imageId),
    },
  });
  if (!checkImg) {
    responseData(res, "Hình ảnh không tồn tại", "", 400);
    return;
  }
  // if (token.length === 0) {
  //   responseData(res, "Người dùng chưa đăng nhập", "", 400);
  // }

  let addComment = {
    nguoi_dung_id,
    hinh_id: Number(imageId),
    ngay_binh_luan: new Date(),
    noi_dung: comment,
  };
  await prisma.binh_luan.create({ data: { ...addComment } });
  responseData(res, "Thêm bình luận thành công", "", 200);
};
