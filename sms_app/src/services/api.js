import axios from 'axios';

// const API_URL = 'https://ehsan56.pythonanywhere.com/api/SW_HR_V/';
const BASE_URL = 'https://ehsan56.pythonanywhere.com/api';

// export const fetchSWHR = async () => {
//     const response = await axios.get(API_URL);
//     return response.data;
// };

export const login = async (username, password) => {
    try {
      const response = await axios.post(`${API_URL}/token/`, { username, password });
      localStorage.setItem('token', response.data.access);
      return true;
    } catch (error) {
      console.error('Login error:', error);
      return false;
    }
  };
  
  export const fetchEmployees = async () => {
    const token = localStorage.getItem('token');
    try {
      const response = await axios.get(`${API_URL}/employees/`, {
        headers: { Authorization: `Bearer ${token}` }
      });
      return response.data;
    } catch (error) {
      console.error('Fetch employees error:', error);
      return [];
    }
  };
  
  export const addEmployee = async (employeeData) => {
    const token = localStorage.getItem('token');
    try {
      const response = await axios.post(`${API_URL}/employees/`, employeeData, {
        headers: { Authorization: `Bearer ${token}` }
      });
      return response.data;
    } catch (error) {
      console.error('Add employee error:', error);
      throw error;
    }
  };
  
  
