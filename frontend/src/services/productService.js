import api from "./api";

export const getAllProducts = async () => {

    const response = await api.get("/api/v1/products");

    return response.data;

};

export const getProductById = async (id) => {

    const response = await api.get(`/api/v1/products/${id}`);

    return response.data;

};

export const addProduct = async (product) => {

    const response = await api.post("/api/v1/products", product);

    return response.data;

};

export const updateProduct = async (id, product) => {

    const response = await api.put(`/api/v1/products/${id}`, product);

    return response.data;

};

export const deleteProduct = async (id) => {

    await api.delete(`/api/v1/products/${id}`);

};
