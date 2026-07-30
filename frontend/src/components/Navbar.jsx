import { AppBar, Toolbar, Typography, Button, Box } from "@mui/material";
import StorefrontIcon from "@mui/icons-material/Storefront";
import LogoutIcon from "@mui/icons-material/Logout";
import { useNavigate } from "react-router-dom";

const Navbar = () => {
  const navigate = useNavigate();

  const logout = () => {
    localStorage.removeItem("token");
    navigate("/login");
  };

  return (
    <AppBar
      position="static"
      elevation={3}
      sx={{
        background: "#1976d2",
      }}
    >
      <Toolbar>
        <Box
          sx={{
            display: "flex",
            alignItems: "center",
            gap: 1,
          }}
        >
          <StorefrontIcon />
          <Typography variant="h6" fontWeight="bold">
            ShopSphere
          </Typography>
        </Box>

        <Box sx={{ flexGrow: 1 }} />

        <Button
          color="inherit"
          startIcon={<LogoutIcon />}
          onClick={logout}
        >
          Logout
        </Button>
      </Toolbar>
    </AppBar>
  );
};

export default Navbar;
