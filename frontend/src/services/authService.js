import api from "./api";

export const login = async (data) => {
  const response = await api.post("/api/v1/auth/login", data);
  return response.data;
};

export const register = async (data) => {
  const response = await api.post("/api/v1/auth/register", data);
  return response.data;
};
