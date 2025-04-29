import React from 'react';
import { Link } from 'react-router-dom'; // Import Link from react-router-dom
import '../styles/Sidebar.css';
import { CgProfile } from "react-icons/cg";
import amc_logo from './amc_logo.png'

const Sidebar = () => {
  return (
    <div className="sidebar">
      <img src={amc_logo} size={10} alt="Company Logo" className="sidebar-logo"></img>
      {/* // <CgProfile  className="profile-logo" /> */}
      
      <Link to="/" className="sidebar-button">
        Home
      </Link>
      
      <Link to="/employees" className="sidebar-button">
        Employees
      </Link>
      
      <Link to="/history" className="sidebar-button">
        History
      </Link>
    </div>
  );
};

export default Sidebar;
