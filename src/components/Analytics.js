import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { getCookie } from '../utils/csrf';

import { BarChart, Bar, LineChart, Line, PieChart, Pie, ResponsiveContainer, XAxis, YAxis, Tooltip, Legend, Cell } from 'recharts';

const Analytics = () => {
  const [messageOverTime, setMessageOverTime] = useState([]);
  const [successRate, setSuccessRate] = useState([]);
  const [topTemplates, setTopTemplates] = useState([]);
  const [employeeEngagement, setEmployeeEngagement] = useState([]);
  const [locationMessageCount, setLocationMessageCount] = useState([]);


  useEffect(() => {
    const csrfToken = getCookie('csrftoken'); // Use the utility function to get the CSRF token
  
    if (csrfToken) {
        axios.defaults.headers.common['X-CSRFToken'] = csrfToken;
    } else {
        console.warn('CSRF token not found!');
    }
  }, []);
  

  useEffect(() => {
    const fetchData = async () => {
      try {
        const messageOverTimeResponse = await axios.get('http://127.0.0.1:8000/api/analytics/messages-over-time/');
        setMessageOverTime(messageOverTimeResponse.data);

        const successRateResponse = await axios.get('http://127.0.0.1:8000/api/analytics/success-rate/');
        setSuccessRate([
          { name: 'Sent', value: successRateResponse.data.sent },
          { name: 'Failed', value: successRateResponse.data.failed }
        ]);

    
        const locationMessageCountResponse = await axios.get('http://127.0.0.1:8000/api/analytics/location-message-count/');
        setLocationMessageCount(locationMessageCountResponse.data);
      } catch (error) {
        console.error('Error fetching analytics data:', error);
      }
    };

    fetchData();
  }, []);

  const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#8884D8'];

  return (
    <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-2">
      <div className="bg-white p-4 rounded-lg shadow">
        <h2 className="text-xl font-bold mb-4">Messages Sent Over Time</h2>
        <ResponsiveContainer width="100%" height={300}>
          <LineChart data={messageOverTime}>
            <XAxis dataKey="name" />
            <YAxis />
            <Tooltip />
            <Legend />
            <Line type="monotone" dataKey="messages" stroke="#8884d8" />
          </LineChart>
        </ResponsiveContainer>
      </div>

      <div className="bg-white p-4 rounded-lg shadow">
        <h2 className="text-xl font-bold mb-4">Message Success Rate</h2>
        <ResponsiveContainer width="100%" height={300}>
          <PieChart>
            <Pie
              data={successRate}
              cx="50%"
              cy="50%"
              labelLine={false}
              outerRadius={80}
              fill="#8884d8"
              dataKey="value"
              label={({ name, percent }) => `${name} ${(percent * 100).toFixed(0)}%`}
            >
              {successRate.map((entry, index) => (
                <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
              ))}
            </Pie>
            <Tooltip />
          </PieChart>
        </ResponsiveContainer>
      </div>

     
        <div className="bg-white p-4 rounded-lg shadow">
        <h2 className="text-xl font-bold mb-4">Messages Received by Branches </h2>
        <ResponsiveContainer width="60%" height={300}>
          <BarChart data={locationMessageCount}>
            <XAxis dataKey="name" />
            <YAxis />
            <Tooltip />
            <Legend />
            <Bar dataKey="value" fill="#8884d8">
              {locationMessageCount.map((entry, index) => (
                <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
              ))}
            </Bar>
          </BarChart>
        </ResponsiveContainer>
      </div>
      
    </div>
  );
};
export default Analytics;

