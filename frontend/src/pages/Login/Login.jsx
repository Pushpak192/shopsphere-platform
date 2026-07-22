import { useState } from "react";
import {
  Container,
  Paper,
  Typography,
  TextField,
  Button,
  Box,
} from "@mui/material";
import { Link, useNavigate } from "react-router-dom";
import { login } from "../../services/authService";

function Login() {
  const navigate = useNavigate();

  const [formData, setFormData] = useState({
    username: "",
    password: "",
  });

  const handleChange = (event) => {
    setFormData({
      ...formData,
      [event.target.name]: event.target.value,
    });
  };

  const handleLogin = async (event) => {
    event.preventDefault();

    try {
      const response = await login(formData);

      localStorage.setItem("token", response.token);
      localStorage.setItem("username", response.username);
      localStorage.setItem("role", response.role);

      navigate("/dashboard");
    } catch (error) {
      alert("Invalid Username or Password");
    }
  };

  return (
    <Container maxWidth="sm">
      <Paper elevation={5} sx={{ p: 4, mt: 10 }}>
        <Typography variant="h4" align="center" gutterBottom>
          ShopSphere Login
        </Typography>

        <Box component="form" onSubmit={handleLogin}>
          <TextField
            fullWidth
            margin="normal"
            label="Username"
            name="username"
            value={formData.username}
            onChange={handleChange}
          />

          <TextField
            fullWidth
            margin="normal"
            label="Password"
            type="password"
            name="password"
            value={formData.password}
            onChange={handleChange}
          />

          <Button
            fullWidth
            variant="contained"
            type="submit"
            sx={{ mt: 3 }}
          >
            Login
          </Button>

          <Typography align="center" sx={{ mt: 2 }}>
            Don't have an account?{" "}
            <Link to="/register">Register</Link>
          </Typography>
        </Box>
      </Paper>
    </Container>
  );
}

export default Login;
