// src/services/api.js
import api from './apiConfig';

// Authentication
export const login = async (username, password) => {
  try {
    const response = await api.post('/login/', { username, password });
    if (response.data.token) {
      localStorage.setItem('token', response.data.token);
      return { success: true, user: response.data.user };
    }
    return { success: false, message: response.data.message || 'Login failed' };
  } catch (error) {
    console.error('Login error:', error);
    return { 
      success: false, 
      message: error.response?.data?.message || 'Authentication failed. Please check your credentials.'
    };
  }
};

// Check authentication status
export const checkAuthStatus = async () => {
  try {
    const response = await api.get('/auth/status/');
    return response.data;
  } catch (error) {
    console.error('Auth check error:', error);
    throw error;
  }
};

// Fetch SWHR data
export const fetchSWHR = async () => {
  try {
    const response = await api.get('/SWHR/');
    return response.data;
  } catch (error) {
    console.error('Error fetching SWHR data:', error);
    throw error;
  }
};

// Get contact number for staff
export const getContactNumber = async (staffNo) => {
  try {
    const response = await api.get(`/get-contact-number/${staffNo}/`);
    return response.data;
  } catch (error) {
    console.error(`Error fetching contact number for staff ${staffNo}:`, error);
    throw error;
  }
};

// Fetch templates
export const fetchTemplates = async () => {
  try {
    const response = await api.get('/templates/');
    return response.data;
  } catch (error) {
    console.error('Error fetching templates:', error);
    throw error;
  }
};

// Send message
export const sendMessage = async (message, contactNumbers) => {
  try {
    const response = await api.post('/sendmessage/', {
      message,
      contactNumbers
    });
    return response.data;
  } catch (error) {
    console.error('Error sending message:', error);
    throw error;
  }
};

// Fetch outgoing SMS history
export const fetchOutgoingSMS = async () => {
  try {
    const response = await api.get('/outgoing-sms/');
    return response.data;
  } catch (error) {
    console.error('Error fetching outgoing SMS:', error);
    throw error;
  }
};
