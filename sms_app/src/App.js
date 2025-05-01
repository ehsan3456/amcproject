import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes, Navigate, useNavigate } from 'react-router-dom';
import axios from 'axios';
import Login from './components/Login';
import Header from './components/Header';
import Sidebar from './components/Sidebar';
import Home from './components/Home';
import Employees from './components/Employees';
import History from './components/History';
import AddGroup from './components/AddGroup';
import './App.css';
import './styles/EmployeeTable.css'

const AppContent = () => {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [user, setUser] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    const token = localStorage.getItem('token');
    if (token) {
      checkAuthStatus(token);
    }
  }, []);


  const checkAuthStatus = async (token) => {
    try {
      axios.defaults.headers.common['Authorization'] = `Token ${token}`;
      const response = await axios.get('https://ehsan56.pythonanywhere.com/api/auth/status/');
      if (response.data.isAuthenticated) {
        setIsAuthenticated(true);
        setUser(response.data.user);
      }
    } catch (error) {
      console.error('Authentication error:', error);
      setIsAuthenticated(false);
      localStorage.removeItem('token');
    }
  };

  const handleLogin = (token, user) => {
    localStorage.setItem('token', token);
    setIsAuthenticated(true);
    setUser(user);
    // Force a re-render of the entire app
    navigate('/');
  };

  const handleLogout = () => {
    localStorage.removeItem('token');
    setIsAuthenticated(false);
    setUser(null);
    // Use navigate instead of window.location.href
    navigate('/login');
  };

  return (
    <div className={`app ${isAuthenticated ? 'authenticated' : ''}`}>
      {isAuthenticated && <Header onLogout={handleLogout} />}
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

