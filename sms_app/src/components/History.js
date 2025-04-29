import React, { useState, useEffect } from 'react';
import axios from 'axios';
import '../styles/History.css';

const History = () => {
  const [outgoingSMS, setOutgoingSMS] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchOutgoingSMS = async () => {
      try {
        setLoading(true);
        const response = await axios.get('http://127.0.0.1:8000/api/outgoing-sms/');
        if (Array.isArray(response.data)) {
          setOutgoingSMS(response.data);
        } else {
          throw new Error('Received invalid data format');
        }
        setError(null);
      } catch (err) {
        setError('Failed to load outgoing SMS history. Please try again later.');
        console.error('Error fetching outgoing SMS:', err);
      } finally {
        setLoading(false);
      }
    };

    fetchOutgoingSMS();
  }, []);

  const getStatusClass = (status) => {
    switch (status) {
      case 'sent':
        return 'status-sent';
      case 'failed':
        return 'status-failed';
      case 'pending':
        return 'status-pending';
      default:
        return '';
    }
  };

  if (loading) return <div className="loading">Loading...</div>;
  if (error) return <div className="error">{error}</div>;

  return (
    <div className="history-container">
      <h2>Outgoing SMS History</h2>
      {outgoingSMS.length === 0 ? (
        <p className="no-data">No SMS history found.</p>
      ) : (
        <table className="sms-table">
          <thead>
            <tr>
              <th>Receiver</th>
              <th>Message</th>
              <th>Status</th>
              <th>Sent At</th>
            </tr>
          </thead>
          <tbody>
            {outgoingSMS.map((sms) => (
              <tr key={sms.id}>
                <td>{sms.RECEIVER}</td>
                <td>{sms.MSG}</td>
                <td>
                  <span className={`status ${getStatusClass(sms.status)}`}>
                    {sms.STATUS}
                  </span>
                </td>
                <td>{new Date(sms.SENTTIME).toLocaleString()}</td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default History;

