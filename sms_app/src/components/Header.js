import '../styles/Header.css'
const Header = ({ onLogout }) => {
  const handleLogout = () => {
    onLogout();
  };

  return (
    <div className="header">
      <h1 className="header-title">SMS App</h1>
      <button className="logout-button" onClick={handleLogout}>
        Logout
      </button>
    </div>
  );
};

export default Header;

