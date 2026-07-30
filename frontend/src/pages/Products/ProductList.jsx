import { useEffect, useState } from "react";
import Navbar from "../../components/Navbar";
import { getAllProducts } from "../../services/productService";

import {
  Container,
  Typography,
  Card,
  CardContent,
  CircularProgress,
  Alert,
  Button,
  Stack,
  TextField,
} from "@mui/material";

import {
  DataGrid,
  GridActionsCellItem,
} from "@mui/x-data-grid";

import EditIcon from "@mui/icons-material/Edit";
import DeleteIcon from "@mui/icons-material/Delete";
import AddIcon from "@mui/icons-material/Add";

function ProductList() {
  const [products, setProducts] = useState([]);
  const [filteredProducts, setFilteredProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");

  useEffect(() => {
    loadProducts();
  }, []);

  useEffect(() => {
    const filtered = products.filter((p) =>
      p.name.toLowerCase().includes(search.toLowerCase())
    );

    setFilteredProducts(filtered);
  }, [search, products]);

  const loadProducts = async () => {
    try {
      const response = await getAllProducts();
      setProducts(response);
      setFilteredProducts(response);
    } catch (err) {
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const columns = [
    { field: "id", headerName: "ID", width: 80 },
    { field: "name", headerName: "Name", flex: 1 },
    { field: "description", headerName: "Description", flex: 1.5 },
    { field: "price", headerName: "Price", width: 120 },
    { field: "stock", headerName: "Stock", width: 100 },
    { field: "category", headerName: "Category", width: 150 },
    {
      field: "actions",
      type: "actions",
      width: 100,
      getActions: () => [
        <GridActionsCellItem
          icon={<EditIcon />}
          label="Edit"
          onClick={() => alert("Edit feature coming next")}
        />,
        <GridActionsCellItem
          icon={<DeleteIcon />}
          label="Delete"
          onClick={() => alert("Delete feature coming next")}
        />,
      ],
    },
  ];

  return (
    <>
      <Navbar />

      <Container sx={{ mt: 5 }}>
        <Typography variant="h4" fontWeight="bold" gutterBottom>
          Products
        </Typography>

        <Stack
          direction="row"
          spacing={2}
          sx={{ mb: 3 }}
        >
          <TextField
            label="Search Product"
            value={search}
            onChange={(e) => setSearch(e.target.value)}
          />

          <Button
            variant="contained"
            startIcon={<AddIcon />}
          >
            Add Product
          </Button>
        </Stack>

        <Card>
          <CardContent>
            {loading ? (
              <CircularProgress />
            ) : filteredProducts.length === 0 ? (
              <Alert severity="info">
                No Products Found
              </Alert>
            ) : (
              <div style={{ height: 500 }}>
                <DataGrid
                  rows={filteredProducts}
                  columns={columns}
                  pageSizeOptions={[5, 10, 20]}
                  initialState={{
                    pagination: {
                      paginationModel: {
                        pageSize: 5,
                      },
                    },
                  }}
                />
              </div>
            )}
          </CardContent>
        </Card>
      </Container>
    </>
  );
}

export default ProductList;
