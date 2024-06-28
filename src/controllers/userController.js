import { PrismaClient } from "@prisma/client";
import { responseData } from "../config/response.js";
import { decodeToken } from "../config/jwt.js";
import bcrypt from "bcrypt";

let prisma = new PrismaClient();

export const getAllUser = async (req, res) => {
  try {
    let data = await prisma.nguoi_dung.findMany();
    responseData(res, "Xử lý thành công", data, 200);
  } catch {
    responseData(res, "Lỗi tè le...", error, 500);
  }
};

export const getUserInfor = async (req, res) => {
  let { token } = req.headers;
  let accessToken = decodeToken(token);
  let { nguoi_dung_id } = accessToken.data;
  try {
    let data = await prisma.nguoi_dung.findFirst({
      where: {
        nguoi_dung_id,
      },
    });

    responseData(res, "Xử lý thành công", data, 200);
  } catch {
    responseData(res, "Lỗi tè le...", error, 500);
  }
};

export const updateUserInfor = async (req, res) => {
  let { userId } = req.params;
  let { email, mat_khau, ho_ten, tuoi } = req.body;
  let { token } = req.headers;
  let accessToken = decodeToken(token);
  let { nguoi_dung_id } = accessToken.data;

  let checkUser = await prisma.nguoi_dung.findFirst({
    where: {
      nguoi_dung_id: Number(userId),
    },
  });

  let getUser = await prisma.nguoi_dung.findFirst({
    where: {
      nguoi_dung_id,
    },
  });

  if (!checkUser) {
    responseData(res, "Người dùng không tồn tại", "", 400);
    return;
  }
  if (nguoi_dung_id !== Number(userId)) {
    responseData(res, "Bạn không có quyền thay đổi thông tin", "", 400);
    return;
  }
  let dataUpdate = {
    email,
    mat_khau: bcrypt.hashSync(mat_khau, 9),
    ho_ten,
    tuoi: Number(tuoi),
  };

  await prisma.nguoi_dung.update({
    where: {
      nguoi_dung_id,
    },
    data: dataUpdate,
  });

  responseData(res, "xử lý thành công", dataUpdate, 200);
};
