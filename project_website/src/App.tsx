import React from 'react';
import logo from './logo.svg';
import './App.css';
import { Nav, Navbar, NavDropdown } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
// import NavDropdown from 'react-bootstrap/NavDropdown'
// import Nav from 'react-bootstrap/Nav'

function App() {
  return (
    <div className="App">
      <Navbar collapseOnSelect expand="lg" bg="dark" variant="dark">

        
        {/* <div style={{display : 'flex', width : 750, justifyContent : 'space-evenly', alignItems : 'center', fontSize : 25}}>
            <a>Assignments</a>
            <a>Project</a>
            <a>About us</a>
        </div> */}
        
        <Navbar.Brand href="#home">
          <img src={logo} className="App-logo" alt="logo" />
          IPM Project group 31
        </Navbar.Brand>
        <Navbar.Toggle aria-controls="responsive-navbar-nav" />
        <Navbar.Collapse id="responsive-navbar-nav">
          <Nav className="justify-content-end" activeKey="/home">
              {/* <Nav.Item>
                <Nav.Link href="/home">Active</Nav.Link>
              </Nav.Item> */}
              <NavDropdown title="Assignments" >
                <NavDropdown.Item eventKey="link-1">Assignment 1</NavDropdown.Item>
              </NavDropdown>
              <NavDropdown title="Project">
                <Nav.Link eventKey="link-2">Project</Nav.Link>
              </NavDropdown>
              <Nav title="About us">
                <Nav.Link eventKey="link-2">About us</Nav.Link>
              </Nav>
          </Nav>
        </Navbar.Collapse>
      </Navbar>
    </div>
  );
}

export default App;
