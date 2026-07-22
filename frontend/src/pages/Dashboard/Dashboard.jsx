import { Button, Container, Paper, Typography } from "@mui/material";
import { useNavigate } from "react-router-dom";

function Dashboard() {
  const navigate = useNavigate();

  const username = localStorage.getItem("username");
  const role = localStorage.getItem("role");

  const logout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("username");
    localStorage.removeItem("role");

    navigate("/");
  };

  return (
    <Container maxWidth="md">
      <Paper elevation={5} sx={{ p: 4, mt: 10 }}>
        <Typography variant="h4" gutterBottom>
          Welcome {username}
        </Typography>

        <Typography variant="h6" gutterBottom>
          Role : {role}
        </Typography>

        <Button
          variant="contained"
          color="error"
          onClick={logout}
          sx={{ mt: 3 }}
        >
          Logout
        </Button>
      </Paper>
    </Container>
  );
}

export default Dashboard;
