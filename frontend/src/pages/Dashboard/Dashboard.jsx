import { useNavigate } from "react-router-dom";

function Dashboard() {

    const navigate = useNavigate();

    return (

        <div style={{ padding: "30px" }}>

            <h1>Dashboard</h1>

            <br />

            <button
                onClick={() => navigate("/products")}
            >
                View Products
            </button>

        </div>

    );

}

export default Dashboard;
