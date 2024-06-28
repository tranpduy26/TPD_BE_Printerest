import { PrismaClient } from "@prisma/client";
import { responseData } from "../config/response.js";
import { decodeToken } from "../config/jwt.js";
import fs from "fs";

let prisma = new PrismaClient();

// ======= Trang chủ ======
// lấy tất cả hình ảnh
export const getAllImage = async (req, res) => {
  try {
    let data = await prisma.hinh_anh.findMany();
    responseData(res, "Xử lý thành công", data, 200);
  } catch {
    responseData(res, "Lỗi tè le...", "", 500);
  }
};

// tìm kiếm danh sách hình ảnh theo tên
export const searchImage = async (req, res) => {
  try {
    let { searchName } = req.params;
    let find = await prisma.hinh_anh.findMany({
      where: {
        ten_hinh: {
          contains: searchName,
        },
      },
    });
    if (find.length === 0) {
      responseData(res, "Không tìm thấy hình ảnh phù hợp", "", 400);
    } else {
      responseData(res, "Xử lý thành côngggg", find, 200);
    }
  } catch {
    responseData(res, "Lỗi tè le...", "", 500);
  }
};

// ======= trang chi tiết =====
// thấy thông tin ảnh và người tạo ảnh bằng id ảnh
export const getImageInforById = async (req, res) => {
  try {
    const { imageId } = req.params;

    const checkImg = await prisma.hinh_anh.findFirst({
      where: {
        hinh_id: Number(imageId),
      },
    });
    if (checkImg) {
      let data = await prisma.hinh_anh.findFirst({
        where: {
          hinh_id: Number(imageId),
        },
        include: {
          nguoi_dung: {
            select: {
              ho_ten: true,
            },
          },
        },
      });
      responseData(res, "Xử lý thành công", data, 200);
    } else {
      responseData(res, "Không tìm thấy hình ảnh", "", 200);
    }
  } catch {
    responseData(res, "Lỗi tè le...", "", 500);
  }
};

// kiểm tra ảnh đã lưu hay chưa
export const checkImageSaved = async (req, res) => {
  let { token } = req.headers;
  let { imageId } = req.params;

  let accessToken = decodeToken(token);
  let { nguoi_dung_id } = accessToken.data;
  try {
    let checkImg = await prisma.hinh_anh.findFirst({
      where: {
        hinh_id: Number(imageId),
      },
    });
    if (!checkImg) {
      responseData(res, "Không tồn tại hình ảnh", "", 400);
      return;
    }
    let data = await prisma.luu_anh.findFirst({
      where: {
        nguoi_dung_id,
        hinh_id: Number(imageId),
      },
    });
    if (data) {
      responseData(res, "Ảnh đã được lưu", "", 200);
    } else {
      responseData(res, "Ảnh chưa được lưu", nguoi_dung_id, 200);
    }
  } catch {
    responseData(res, "Lỗi tè le...", "", 500);
  }
};

// ==== trang quản lý ảnh ====

// lấy danh sách ảnh theo user ID
export const getImgByUserId = async (req, res) => {
  try {
    let { userId } = req.params;

    let checkUser = await prisma.nguoi_dung.findFirst({
      where: {
        nguoi_dung_id: Number(userId),
      },
    });

    if (checkUser) {
      let data = await prisma.hinh_anh.findMany({
        where: {
          nguoi_dung_id: Number(userId),
        },
        // include: {
        //   ten_hinh: true,
        // },
      });
      responseData(res, "Xử lý thành công", data, 200);
    } else {
      responseData(res, "Người dùng không tồn tại", "", 400);
    }
  } catch {
    responseData(res, "Lỗi tè le...", "", 500);
  }
};

export const getImageSavedByUser = async (req, res) => {
  let { token } = req.headers;
  let accessToken = decodeToken(token);
  let { nguoi_dung_id } = accessToken.data;
  try {
    let checkUser = await prisma.luu_anh.findFirst({
      where: {
        nguoi_dung_id,
      },
    });

    if (!checkUser) {
      responseData(res, "Người dùng chưa lưu ảnh nào", "", 200);
    }
    let data = await prisma.luu_anh.findMany({
      where: {
        nguoi_dung_id,
      },
      include: {
        hinh_anh: true,
      },
    });
    responseData(res, "Xử lý thành công", data, 200);
  } catch {
    responseData(res, "Lỗi tè le...", "", 500);
  }
};

export const getImageCreateByUser = async (req, res) => {
  let { token } = req.headers;
  let accessToken = decodeToken(token);
  let { nguoi_dung_id } = accessToken.data;
  try {
    let checkUser = await prisma.hinh_anh.findFirst({
      where: {
        nguoi_dung_id,
      },
    });

    if (!checkUser) {
      responseData(res, "Người dùng chưa lưu ảnh nào", "", 200);
    }
    let data = await prisma.hinh_anh.findMany({
      where: {
        nguoi_dung_id,
      },
    });
    responseData(res, "Xử lý thành công", data, 200);
  } catch {
    responseData(res, "Lỗi tè le...", "", 500);
  }
};

// Xóa hình ảnh bằng id ảnh
export const deleteImageById = async (req, res) => {
  let { token } = req.headers;
  let accessToken = decodeToken(token);
  let { nguoi_dung_id } = accessToken.data;

  let { hinh_id } = req.params;
  try {
    let checkImg = await prisma.hinh_anh.findFirst({
      where: { hinh_id: Number(hinh_id) },
    });
    if (!checkImg) {
      responseData(res, "Không tồn tại ảnh", "", 400);
    }
    let checkInfor = await prisma.hinh_anh.findFirst({
      where: {
        hinh_id: Number(hinh_id),
        nguoi_dung_id,
      },
    });
    if (checkInfor) {
      await prisma.hinh_anh.delete({
        where: {
          hinh_id: Number(hinh_id),
          nguoi_dung_id,
        },
      });
      responseData(res, "Xử lý thành công", "", 200);
    } else {
      responseData(res, "Ảnh này không phải của bạn!! Không xóa được", 400);
    }
  } catch {
    responseData(res, "Lỗi tè le...", "", 500);
  }
};

export const uploadImage = async (req, res) => {
  let { token } = req.headers;
  let accessToken = decodeToken(token);
  let { nguoi_dung_id } = accessToken.data;

  let { ten_hinh, mo_ta, duong_dan } = req.body;

  try {
    let imgUpload = await prisma.hinh_anh.create({
      data: {
        ten_hinh,
        duong_dan,
        mo_ta,
        nguoi_dung_id,
      },
    });

    responseData(res, "Upload thành công", imgUpload, 200);
  } catch {
    responseData(res, "Lỗi tè le...", "", 500);
  }
};
