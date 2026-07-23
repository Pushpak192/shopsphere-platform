import { useEffect, useState } from "react";
import { getAllProducts } from "../../services/productService";

function ProductList() {

    const [products, setProducts] = useState([]);

    useEffect(() => {

        loadProducts();

    }, []);

    const loadProducts = async () => {

        try {

            const data = await getAllProducts();

            setProducts(data);

        } catch (error) {

            console.error(error);

        }

    };

    return (

        <div style={{ padding: "20px" }}>

            <h1>Products</h1>

            <table border="1" cellPadding="10">

                <thead>

                    <tr>

                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Category</th>

                    </tr>

                </thead>

                <tbody>

                    {products.map((product) => (

                        <tr key={product.id}>

                            <td>{product.id}</td>
                            <td>{product.name}</td>
                            <td>{product.description}</td>
                            <td>{product.price}</td>
                            <td>{product.stock}</td>
                            <td>{product.category}</td>

                        </tr>

                    ))}

                </tbody>

            </table>

        </div>

    );

}

export default ProductList;
