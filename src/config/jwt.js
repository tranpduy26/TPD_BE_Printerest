import jwt from "jsonwebtoken";

export const createToken = (data) => {
  let token = jwt.sign({ data }, "BIMAT", {
    algorithm: "HS256",
    expiresIn: "3s",
  });

  return token;
};

export const checkToken = (token) =>
  jwt.verify(token, "BIMAT", (error, decoded) => error);

export const decodeToken = (token) => {
  return jwt.decode(token);
};
