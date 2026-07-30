import { useNavigate } from "react-router-dom";
import Navbar from "../../components/Navbar";

import {
  Container,
  Typography,
  Grid,
  Card,
  CardContent,
  Button,
  Box,
} from "@mui/material";

import Inventory2Icon from "@mui/icons-material/Inventory2";
import ShoppingCartIcon from "@mui/icons-material/ShoppingCart";
import PeopleIcon from "@mui/icons-material/People";
import AttachMoneyIcon from "@mui/icons-material/AttachMoney";

import { motion } from "framer-motion";

function Dashboard() {
  const navigate = useNavigate();

  const cards = [
    {
      title: "Products",
      value: "Manage",
      icon: <Inventory2Icon fontSize="large" />,
    },
    {
      title: "Orders",
      value: "Track",
      icon: <ShoppingCartIcon fontSize="large" />,
    },
    {
      title: "Users",
      value: "Active",
      icon: <PeopleIcon fontSize="large" />,
    },
    {
      title: "Revenue",
      value: "$0",
      icon: <AttachMoneyIcon fontSize="large" />,
    },
  ];

  return (
    <>
      <Navbar />

      <Container sx={{ mt: 5 }}>
        <Typography variant="h4" gutterBottom fontWeight="bold">
          ShopSphere Dashboard
        </Typography>

        <Grid container spacing={3}>
          {cards.map((card, index) => (
            <Grid item xs={12} md={3} key={index}>
              <motion.div whileHover={{ scale: 1.05 }}>
                <Card elevation={4}>
                  <CardContent sx={{ textAlign: "center" }}>
                    {card.icon}

                    <Typography variant="h6" sx={{ mt: 2 }}>
                      {card.title}
                    </Typography>

                    <Typography color="text.secondary">
                      {card.value}
                    </Typography>
                  </CardContent>
                </Card>
              </motion.div>
            </Grid>
          ))}
        </Grid>

        <Box sx={{ mt: 5 }}>
          <Button
            variant="contained"
            sx={{ mr: 2 }}
            onClick={() => navigate("/products")}
          >
            Products
          </Button>

          <Button
            variant="outlined"
            onClick={() => navigate("/orders")}
          >
            Orders
          </Button>
        </Box>
      </Container>
    </>
  );
}

export default Dashboard;
