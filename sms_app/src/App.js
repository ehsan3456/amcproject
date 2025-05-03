import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes, Navigate, useNavigate } from 'react-router-dom';
import { checkAuthStatus } from './services/api';
import Login from './components/Login';
import Header from './components/Header';
import Sidebar from './components/Sidebar';
import Home from './components/Home';
import Employees from './components/Employees';
import History from './components/History';
import AddGroup from './components/AddGroup';
import './App.css';
import './styles/EmployeeTable.css';

const AppContent = () => {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [user, setUser] = useState(null);
  const [isLoading, setIsLoading] = useState(true);
  const navigate = useNavigate();

  useEffect(() => {
    const verifyAuth = async () => {
      const token = localStorage.getItem('token');
      if (token) {
        try {
          const authData = await checkAuthStatus();
          if (authData.isAuthenticated) {
            setIsAuthenticated(true);
            setUser(authData.user);
          } else {
            // Clear invalid token
            localStorage.removeItem('token');
          }
        } catch (error) {
          console.error('Authentication error:', error);
          localStorage.removeItem('token');
        }
      }
      setIsLoading(false);
    };

    verifyAuth();
  }, []);

  const handleLogin = (token, user) => {
    localStorage.setItem('token', token);
    setIsAuthenticated(true);
    setUser(user);
    navigate('/');
  };

  const handleLogout = () => {
    localStorage.removeItem('token');
    setIsAuthenticated(false);
    setUser(null);
    navigate('/login');
  };

  if (isLoading) {
    return <div className="loading-screen">Loading...</div>;
  }

  return (
    <div className={`app ${isAuthenticated ? 'authenticated' : ''}`}>
      {isAuthenticated && <Header onLogout={handleLogout} user={user} />}
      <div className={`main-content ${isAuthenticated ? 'authenticated' : ''}`}>
        {isAuthenticated && <Sidebar />}
        <div className="page-content">
          <Routes>
            <Route 
              path="/login" 
              element={!isAuthenticated ? <Login onLogin={handleLogin} /> : <Navigate to="/" />} 
            />
            <Route
              path="/"
              element={isAuthenticated ? <Home /> : <Navigate to="/login" />}
            />
            <Route
              path="/employees"
              element={isAuthenticated ? <Employees /> : <Navigate to="/login" />}
            />
            <Route
              path="/history"
              element={isAuthenticated ? <History /> : <Navigate to="/login" />}
            />
            <Route
              path="/add-group"
              element={isAuthenticated ? <AddGroup /> : <Navigate to="/login" />}
            />
            <Route
              path="*"
              element={<Navigate to={isAuthenticated ? "/" : "/login"} />}
            />
          </Routes>
        </div>
      </div>
    </div>
  );
};

const App = () => {
  return (
    <Router>
      <AppContent />
    </Router>
  );
};

export default App;
