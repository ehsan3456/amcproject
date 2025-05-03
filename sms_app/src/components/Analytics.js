import React, { useState, useEffect } from 'react';
import { BarChart, Bar, LineChart, Line, PieChart, Pie, ResponsiveContainer, XAxis, YAxis, Tooltip, Legend, Cell } from 'recharts';
import api from '../services/apiConfig';

const Analytics = () => {
  const [messageOverTime, setMessageOverTime] = useState([]);
  const [successRate, setSuccessRate] = useState([]);
  const [topTemplates, setTopTemplates] = useState([]);
  const [employeeEngagement, setEmployeeEngagement] = useState([]);
  const [locationMessageCount, setLocationMessageCount] = useState([]);
  
  useEffect(() => {
    const fetchData = async () => {
      try {
        const messageOverTimeResponse = await api.get('/analytics/messages-over-time/');
        setMessageOverTime(messageOverTimeResponse.data);
        
        const successRateResponse = await api.get('/analytics/success-rate/');
        setSuccessRate([
          { name: 'Sent', value: successRateResponse.data.Send },
          { name: 'Failed', value: successRateResponse.data.failed }
        ]);
        
        const locationMessageCountResponse = await api.get('/analytics/location-message-count/');
        setLocationMessageCount(locationMessageCountResponse.data);
      } catch (error) {
        console.error('Error fetching analytics data:', error);
      }
    };
    fetchData();
  }, []);
  
  const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042', '#8884D8'];
  
  return (
    <div className="grid grid-cols-1 md:grid-cols-2 gap-6 p-4">
      <div className="bg-white p-4 rounded-lg shadow">
        <h2 className="text-xl font-semibold mb-4">Messages Sent Over Time</h2>
        <ResponsiveContainer width="100%" height={300}>
          <LineChart data={messageOverTime}>
            <XAxis dataKey="date" />
            <YAxis />
            <Tooltip />
            <Legend />
            <Line type="monotone" dataKey="count" stroke="#8884d8" />
          </LineChart>
        </ResponsiveContainer>
      </div>

      <div className="bg-white p-4 rounded-lg shadow">
        <h2 className="text-xl font-semibold mb-4">Message Success Rate</h2>
        <ResponsiveContainer width="100%" height={300}>
          <PieChart>
            <Pie
              data={successRate}
              cx="50%"
              cy="50%"
              labelLine={false}
              label={({ name, percent }) => `${name} ${(percent * 100).toFixed(0)}%`}
              outerRadius={100}
              fill="#8884d8"
              dataKey="value"
            >
              {successRate.map((entry, index) => (
                <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
              ))}
            </Pie>
            <Tooltip />
            <Legend />
          </PieChart>
        </ResponsiveContainer>
      </div>

      <div className="bg-white p-4 rounded-lg shadow col-span-1 md:col-span-2">
        <h2 className="text-xl font-semibold mb-4">Messages Received by Branches</h2>
        <ResponsiveContainer width="100%" height={300}>
          <BarChart data={locationMessageCount}>
            <XAxis dataKey="location" />
            <YAxis />
            <Tooltip />
            <Legend />
            <Bar dataKey="count" fill="#8884d8">
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
