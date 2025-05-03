import React, { useState, useEffect, useRef } from 'react';
import '../styles/EmployeeTable.css';
import { 
  fetchSWHR, 
  fetchTemplates, 
  getContactNumber, 
  sendMessage 
} from '../services/api';
import { getCookie } from '../utils/csrf';

const EmployeeTable = () => {
  const [SWHR, setSWHR] = useState([]);
  const [templates, setTemplates] = useState([]);
  const [selectedTemplateContent, setSelectedTemplateContent] = useState('');
  const [filteredSWHR, setFilteredSWHR] = useState([]);
  const [searchQuery, setSearchQuery] = useState('');
  const [selectAll, setSelectAll] = useState(false);
  const [selectedSWHR, setSelectedSWHR] = useState([]);
  const [branchFilter, setBranchFilter] = useState('');
  const [designationFilter, setDesignationFilter] = useState('');
  const [isFormVisible, setIsFormVisible] = useState(false);
  const formRef = useRef(null);
  const [statusMessage, setStatusMessage] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [selectedTemplateId, setSelectedTemplateId] = useState('');

  // Setup CSRF token
  useEffect(() => {
    const csrfToken = getCookie('csrftoken');
    if (csrfToken) {
      // Include CSRF token in requests if needed
      console.log('CSRF token found:', csrfToken);
    } else {
      console.warn('CSRF token not found!');
    }
  }, []);

  // Fetch templates
  useEffect(() => {
    const loadTemplates = async () => {
      try {
        const templateData = await fetchTemplates();
        setTemplates(templateData);
      } catch (error) {
        console.error('Error loading templates:', error);
      }
    };
    loadTemplates();
  }, []);

  // Handle template selection
  const handleTemplateChange = (event) => {
    const templateId = event.target.value;
    setSelectedTemplateId(templateId);
    const template = templates.find((t) => t.id === parseInt(templateId));
    setSelectedTemplateContent(template ? template.template_content : '');
  };

  // Fetch employee data
  useEffect(() => {
    const loadData = async () => {
      try {
        const data = await fetchSWHR();
        setSWHR(data);
        setFilteredSWHR(data);
      } catch (error) {
        console.error('Error loading employee data:', error);
      }
    };
    loadData();
  }, []);

  // Handle search
  const handleSearch = (e) => {
    const query = e.target.value.toLowerCase();
    setSearchQuery(query);
    applyFilters(query, branchFilter, designationFilter);
  };

  // Handle branch filter
  const handleBranchChange = (e) => {
    const branch = e.target.value.toLowerCase();
    setBranchFilter(branch);
    applyFilters(searchQuery, branch, designationFilter);
  };

  // Handle designation filter
  const handleDesignationChange = (e) => {
    const designation = e.target.value.toLowerCase();
    setDesignationFilter(designation);
    applyFilters(searchQuery, branchFilter, designation);
  };

  // Apply all filters
  const applyFilters = (search = searchQuery, branch = branchFilter, designation = designationFilter) => {
    let filtered = SWHR;

    // Apply search query
    if (search) {
      filtered = filtered.filter(
        (emp) =>
          emp.staff_name.toLowerCase().includes(search) ||
          emp.job_desc.toLowerCase().includes(search) ||
          emp.organization_desc.toLowerCase().includes(search) ||
          emp.location_code.toLowerCase().includes(search) ||
          emp.grade_desc.toLowerCase().includes(search)
      );
    }

    // Apply branch filter
    if (branch) {
      filtered = filtered.filter(
        (emp) => emp.organization_desc.toLowerCase() === branch
      );
    }

    // Apply designation filter
    if (designation) {
      filtered = filtered.filter(
        (emp) => emp.job_desc.toLowerCase() === designation
      );
    }

    setFilteredSWHR(filtered);
  };

  const clearFilters = () => {
    setSearchQuery('');
    setBranchFilter('');
    setDesignationFilter('');
    setFilteredSWHR(SWHR);
  };

  // Handle "Select All" checkbox
  const handleSelectAll = async () => {
    setStatusMessage('');

    if (!selectAll) {
      try {
        const updatedSelectedSWHR = await Promise.all(
          filteredSWHR.map(async (employee) => {
            try {
              const data = await getContactNumber(employee.staff_no);
              return {
                staff_no: employee.staff_no,
                contact_number: data.contactNumber || '',
              };
            } catch (error) {
              console.error(`Error fetching contact number for ${employee.staff_no}:`, error);
              return null;
            }
          })
        );

        setSelectedSWHR(updatedSelectedSWHR.filter((entry) => entry !== null));
      } catch (error) {
        console.error('Error in Select All:', error);
      }
    } else {
      setSelectedSWHR([]);
    }

    setSelectAll(!selectAll);
  };

  // Handle individual checkbox selection
  const handleCheckboxChange = async (staff_no) => {
    try {
      setStatusMessage('');
      
      // Check if employee is already selected
      const isAlreadySelected = selectedSWHR.some((entry) => entry.staff_no === staff_no);
      
      if (isAlreadySelected) {
        // Remove from selection if already selected
        setSelectedSWHR((prev) => 
          prev.filter((entry) => entry.staff_no !== staff_no)
        );
      } else {
        // Fetch contact number and add to selection
        const data = await getContactNumber(staff_no);
        
        if (!data.contactNumber) {
          console.error('Contact number not found for staff_no:', staff_no);
          return;
        }
        
        setSelectedSWHR((prev) => [
          ...prev, 
          { 
            staff_no, 
            contact_number: data.contactNumber 
          }
        ]);
      }
    } catch (error) {
      console.error('Error handling checkbox change:', error);
    }
  };

  // Handle sending message
  const handleSendMessage = async () => {
    // Validate inputs
    if (!selectedTemplateContent || selectedSWHR.length === 0) {
      setStatusMessage('Please select a template and at least one employee.');
      return;
    }

    // Extract contact numbers
    const contactNumbers = selectedSWHR.map((item) => item.contact_number);

    setIsLoading(true);
    setStatusMessage('');

    try {
      const result = await sendMessage(selectedTemplateContent, contactNumbers);
      
      // Handle success
      setStatusMessage(result.success || 'Message sent successfully.');
      setSelectedSWHR([]); // Clear selected employees
      setSelectedTemplateContent(''); // Clear selected template
      setSelectAll(false);
    } catch (error) {
      // Handle error
      const errorMsg = error.response?.data?.error || 'An error occurred while sending the message.';
      setStatusMessage(errorMsg);
    } finally {
      setIsLoading(false);
    }
  };

  const handleSendMessageClick = () => {
    setIsFormVisible(true);
    formRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  return (
    <div style={{ padding: '20px', boxShadow: '0 0 9px rgba(255, 255, 255, 0.8)' }}>
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
              <th>ID</th>
              <th>Staff No</th>
              <th>Staff Name</th>
              <th>Job Description</th>
              <th>Org Description</th>
              <th>Location Code</th>
              <th>Organization Desc</th>
              <th>Grade Desc</th>
            </tr>
          </thead>
          <tbody>
            {filteredSWHR.map((employee) => (
              <tr key={employee.staff_no}>
                <td>
                  <input
                    type="checkbox"
                    checked={selectedSWHR.some((entry) => entry.staff_no === employee.staff_no)}
                    onChange={() => handleCheckboxChange(employee.staff_no)}
                  />
                </td>
                <td>{employee.id}</td>
                <td>{employee.staff_no}</td>
                <td>{employee.staff_name}</td>
                <td>{employee.job_desc}</td>
                <td>{employee.organization_desc}</td>
                <td>{employee.location_code}</td>
                <td>{employee.organization_desc}</td>
                <td>{employee.grade_desc}</td>
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

          {statusMessage && (
            <p className={`status-message ${statusMessage.includes('successfully') ? 'success' : 'error'}`}>
              {statusMessage}
            </p>
          )}
        </div>
      )}
    </div>
  );
};

export default EmployeeTable;
