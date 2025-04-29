import React, { useState, useEffect, useRef  } from 'react';
import axios from 'axios';
import '../styles/EmployeeTable.css';
import { getCookie } from '../utils/csrf';
const EmployeeTable = () => {
  // const [employees, setEmployees] = useState([]);
  const [SWHR, setSWHR] = useState([])
  const [templates, setTemplates] = useState([]);
  const [selectedTemplateContent, setSelectedTemplateContent] = useState('');
  // const [filteredEmployees, setFilteredEmployees] = useState([]);
  const [filteredSWHR, setFilteredSWHR] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [selectAll, setSelectAll] = useState(false);
  const [selectedSWHR, setSelectedSWHR ] = useState([]);
  // const [selectedEmployees, setSelectedEmployees] = useState([]);
  const [branchFilter, setBranchFilter] = useState('');
  const [designationFilter, setDesignationFilter] = useState('');
  const [isFormVisible, setIsFormVisible] = useState(false);
  const formRef = useRef(null);
  const [message, setMessage] = useState('');
  const [selectedStaff, setSelectedStaff] = useState([]); // List of selected staff IDs
  const [statusMessage, setStatusMessage] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [selectedTemplateId, setSelectedTemplateId] = useState('');




  useEffect(() => {
    const csrfToken = getCookie('csrftoken');
    if (csrfToken) {
        axios.defaults.headers.common['X-CSRFToken'] = csrfToken;
    } else {
        console.warn('CSRF token not found!');
    }
}, []);
  

// useEffect(() => {
//   const csrfToken = getCookie('csrftoken'); // Use the utility function to get the CSRF token

//   if (csrfToken) {
//       axios.defaults.headers.common['X-CSRFToken'] = csrfToken;
//   } else {
//       console.warn('CSRF token not found!');
//   }
// }, []);

  useEffect(() => {
    const fetchTemplates = async () => {
        try {
            const response = await axios.get('http://127.0.0.1:8000/api/templates/');
            setTemplates(response.data);
        } catch (error) {
            console.error('Error fetching templates:', error);
        }
    };
    fetchTemplates();
}, []);

const handleTemplateChange = (event) => {
    const selectedTemplateId = event.target.value;
    const template = templates.find((t) => t.id === parseInt(selectedTemplateId));
    setSelectedTemplateContent(template ? template.template_content : '');
};

  useEffect(() => {
    const getData = async () => {
      try {
        const response = await axios.get('http://127.0.0.1:8000/api/SWHR/');
        setSWHR(response.data);
        setFilteredSWHR(response.data); 
      } catch (error) {
        console.error('Error fetching employees:', error);
      }
    };
    getData();
  }, []);
    // 



  
  
useEffect(() => {
  const csrfToken = getCookie('csrftoken'); // Use the utility function to get the CSRF token

  if (csrfToken) {
      axios.defaults.headers.common['X-CSRFToken'] = csrfToken;
  } else {
      console.warn('CSRF token not found!');
  }
}, []);


const handleSendMessage = async () => {
  // Check if a template and at least one employee is selected
  if (!selectedTemplateContent || selectedSWHR.length === 0) {
      setStatusMessage('Please select a template and at least one employee.');
      return;
  }

  // Extract only the contact numbers from selectedSWHR
  const contactNumbers = selectedSWHR.map((item) => item.contact_number);

  setIsLoading(true);
  setStatusMessage('');

  try {
      const response = await axios.post(
          'http://127.0.0.1:8000/api/sendmessage/',
          {
              message: selectedTemplateContent,
              contactNumbers, // Send only contact numbers
          },
          {
              headers: {
                  'Content-Type': 'application/json',
              },
              withCredentials: true, // Include credentials for CSRF protection
          }
      );

      // Handle success response
      setStatusMessage(response.data.success || 'Message sent successfully.');
      setSelectedSWHR([]); // Clear selected employees
      setSelectedTemplateContent(''); // Clear selected template





  } catch (error) {
      // Handle error response
      const errorMsg = error.response?.data?.error || 'An error occurred while sending the message.';
      setStatusMessage(errorMsg);
      alert(`Error: ${errorMsg}`);
  } finally {
      setIsLoading(false);
  }
};// alert('Message sent Successfully')


  // Handle search
  const handleSearch = (e) => {
    const query = e.target.value.toLowerCase();
    setSearchQuery(query);
  
    // Filter employees based on search query across relevant fields
    const filtered = SWHR.filter(
      (emp) =>
        emp.staff_name.toLowerCase().includes(query) ||
        emp.job_desc.toLowerCase().includes(query) ||
        emp.organization_desc.toLowerCase().includes(query) ||
        emp.location_code.toLowerCase().includes(query) ||
        emp.grade_desc.toLowerCase().includes(query)
    );
    setFilteredSWHR(filtered);
  };

  // Handle branch filter
  const handleBranchChange = (e) => {
    const branch = e.target.value.toLowerCase();
    setBranchFilter(branch);
  
    const filtered = SWHR.filter(
      (emp) => emp.organization_desc.toLowerCase() === branch
    );
    setFilteredSWHR(filtered);
  };
  
  // Handle designation filter
  const handleDesignationChange = (e) => {
    const designation = e.target.value.toLowerCase();
    setDesignationFilter(designation);
  
    const filtered = SWHR.filter(
      (emp) => emp.job_desc.toLowerCase() === designation
    );
    setFilteredSWHR(filtered);
  };
  
  // Apply all filters
  const applyFilters = () => {
    let filtered = SWHR;
  
    // Apply search query
    if (searchQuery) {
      filtered = filtered.filter(
        (emp) =>
          emp.staff_name.toLowerCase().includes(searchQuery) ||
          emp.job_desc.toLowerCase().includes(searchQuery) ||
          emp.organization_desc.toLowerCase().includes(searchQuery) ||
          emp.location_code.toLowerCase().includes(searchQuery) ||
          emp.grade_desc.toLowerCase().includes(searchQuery)
      );
      
    }

    
  
    // Apply branch filter
    if (branchFilter) {
      filtered = filtered.filter(
        (emp) => emp.organization_desc.toLowerCase() === branchFilter
      );
    }
  
    // Apply designation filter
    if (designationFilter) {
      filtered = filtered.filter(
        (emp) => emp.job_desc.toLowerCase() === designationFilter
      );
    }
  
    setFilteredSWHR(filtered);
  };
  const clearFilters = () => {
    setSearchQuery('');
    setBranchFilter('');
    setDesignationFilter('');
    setFilteredSWHR(SWHR); // Reset filtered list
  };
  
  
  // Call applyFilters whenever any filter changes
  useEffect(() => {
    applyFilters();
  },
  [searchQuery, branchFilter, designationFilter,clearFilters ]);
  

  // Handle "Select All" checkbox
  const handleSelectAll = async () => {
    if (!selectAll) {
      setStatusMessage('');

        // When selecting all, fetch contact numbers for all filtered employees
        try {
            const updatedSelectedSWHR = await Promise.all(
                filteredSWHR.map(async (employee) => {
                    const response = await fetch(`http://127.0.0.1:8000/api/get-contact-number/${employee.staff_no}/`);
                    if (!response.ok) {
                        console.error('Error fetching contact number for:', employee.staff_no);
                        return null; // Skip employees with errors
                    }
                    const data = await response.json();
                    return {
                        staff_no: employee.staff_no,
                        contact_number: data.contactNumber || '', // Ensure contact number is set
                    };
                })
            );

            // Filter out any null entries (employees with fetch errors)
            setSelectedSWHR(updatedSelectedSWHR.filter((entry) => entry !== null));
        } catch (error) {
            console.error('Error in Select All:', error);
        }
    } else {
        // When deselecting all
        setSelectedSWHR([]);
    }

    // Toggle the state of the "Select All" checkbox
    setSelectAll(!selectAll);
};


  

  // Handle individual checkbox selection
  const handleCheckboxChange = async (staff_no) => {
    try {
      setStatusMessage('');
        // Fetch contact details for the selected staff_no
        const response = await fetch(`http://127.0.0.1:8000/api/get-contact-number/${staff_no}/`);

        if (!response.ok) {
            console.error('Error: ' + response.statusText);
            return;
        }

        const data = await response.json();

        if (!data.contactNumber) {
            console.error('Contact number not found for staff_no:', staff_no);
            return;
        }

        const contactNumber = data.contactNumber;

        // Toggle the selected employee list (selectedSWHR)
        setSelectedSWHR((prevState) => {
            const isAlreadySelected = prevState.some((entry) => entry.staff_no === staff_no);

            if (isAlreadySelected) {
                // Remove staff_no if it's already selected
                return prevState.filter((entry) => entry.staff_no !== staff_no);
            } else {
                // Add staff_no and contactNumber to selectedSWHR
                return [...prevState, { staff_no, contact_number: contactNumber }];
            }
        });

        // Check if selectedSWHR is updated properly
        console.log('Selected SWHR:', selectedSWHR);
    } catch (error) {
        console.error('Error fetching contact number:', error);
    }
};




  const handleSendMessageClick = () => {
    setIsFormVisible(true);
    formRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  return (
    <div style={{ padding: '20px', boxShadow : '0 0 9px rgba(255, 255, 255, 0.8)'}}>
      <h2>Employee List</h2>

      {/* Filters */}
      <div style={{ marginBottom: '20px' }}>
        <input
          type="text"
          placeholder="Search employees..."
          value={searchQuery}
          onChange={handleSearch}
          style={{ padding: '10px', width: '300px', marginRight: '10px' }}
        />

        <select
          value={branchFilter}
          onChange={handleBranchChange}
          style={{ padding: '10px', marginRight: '10px' }}
        >
          <option value="">Filter by Branch</option>
          <option value="HQ AMC">HQ AMC</option>
        </select>

        <select
          value={designationFilter}
          onChange={handleDesignationChange}
          style={{ padding: '10px' }}
        >
          <option value="">Filter by Designation</option>
          <option value="Developer">Developer</option>
          <option value="Assistant Manager Developer">Assistant Manager Developer</option>
        </select>
        <button 
        onClick={clearFilters}
        style={{ padding: '10px', marginLeft: '10px', backgroundColor: '#ff4d4d', color: '#fff', border: 'none', borderRadius: '5px' }}
        >
          Clear Filters
        </button>

      </div>
      <div style={{ overflowY: 'auto', maxHeight: '400px' }}>

      {/* Employee Table */}
      <table border="1" cellPadding="10" cellSpacing="0" style={{ width: '100%' }}>
        <thead>
          <tr>
            <th>
              <input
                type="checkbox"
                checked={selectAll}
                onChange={handleSelectAll}
              />
            </th>
            <th>id</th>
            <th>Staff No</th>
            <th>Staff Name</th>
            <th>Job Description</th>
            <th>Org Description</th>
            <th>Location Code</th>
            <th>Grade Desc</th>
            <th>Grade Desc</th>
          </tr>
        </thead>
        <tbody >
          {filteredSWHR.map((SWHR) => (
            <tr key={SWHR.staff_no}>
              <td>
              <input
          type="checkbox"
          checked={selectedSWHR.some((entry) => entry.staff_no === SWHR.staff_no)}
          onChange={() => handleCheckboxChange(SWHR.staff_no)}
        />
              </td>
              <td>{SWHR.id}</td>
              <td>{SWHR.staff_no}</td>
              <td>{SWHR.staff_name}</td>
              <td>{SWHR.job_desc}</td>
              <td>{SWHR.organization_desc}</td>
              <td>{SWHR.location_code}</td>
              <td>{SWHR.organization_desc}</td>
              <td>{SWHR.grade_desc}</td>
            </tr>
          ))}
        </tbody>
      </table>
      </div>

      {/* "Send Message" Button */}
      <div style={{ marginTop: '20px' }}>
        <button
          onClick={handleSendMessageClick}
          style={{ padding: '10px 20px', cursor: 'pointer' }}
        >
          Select Template
        </button>
      </div>
      {isFormVisible && (
        <div ref={formRef} className="message-form">
          <h3>Send a Message</h3>
          <div className="form-group">
                <label htmlFor="template">Template:</label>
                <select id="template" onChange={handleTemplateChange}>
                    <option value="">Select a template</option>
                    {templates.map((template) => (
                        <option key={template.id} value={template.id}>
                            {template.template_name}
                        </option>
                    ))}
                </select>
            </div>
          
          <div className="form-group">
            <label htmlFor="message">Message:</label>
            <textarea
                    id="message"
                    placeholder="Type your message here"
                    value={selectedTemplateContent}
                    onChange={(e) => setSelectedTemplateContent(e.target.value)}
                />
            
          </div>
          <button 
                onClick={handleSendMessage} 
                disabled={isLoading || !selectedTemplateContent || selectedSWHR.length === 0}
            >
                {isLoading ? 'Sending...' : 'Send Message'}
            </button>

                {statusMessage && <p className={`status-message ${statusMessage.includes('successfully') ? 'success' : 'error'}`}>{statusMessage}</p>}
        </div>
      )}
    </div>
    
  );
};

export default EmployeeTable;
