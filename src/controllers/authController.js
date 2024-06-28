import { PrismaClient } from "@prisma/client";
import { responseData } from "../config/response.js";

import bcrypt from "bcrypt";
import { createToken } from "../config/jwt.js";

let prisma = new PrismaClient();

export const signIn = async (req, res) => {
  let { email, mat_khau } = req.body;
  let checkEmail = await prisma.nguoi_dung.findFirst({
    where: {
      email: email,
    },
  });
  if (checkEmail) {
    if (bcrypt.compareSync(mat_khau, checkEmail.mat_khau)) {
      let key = new Date().getTime();
      let token = createToken({ nguoi_dung_id: checkEmail.nguoi_dung_id, key });

      responseData(res, "Đăng nhập thành công", token, 200);
    } else {
      responseData(res, "Mật khẩu không đúng", "", 400);
    }
  } else {
    responseData(res, "Email không đúng", "", 400);
  }
};

export const signUp = async (req, res) => {
  try {
    let { email, mat_khau, ho_ten } = req.body;

    let checkEmail = await prisma.nguoi_dung.findFirst({
      where: {
        email,
      },
    });
    if (checkEmail) {
      responseData(res, "Email đã tồn tại", "", 400);
      return;
    }
    const newData = {
      email,
      mat_khau: bcrypt.hashSync(mat_khau, 9),
      ho_ten,
    };
    await prisma.nguoi_dung.create({
      data: { ...newData },
    });
    responseData(res, "Đăng ký thành công", "", 200);
  } catch {
    responseData(res, "Lỗi tè le...", "", 500);
  }
};
