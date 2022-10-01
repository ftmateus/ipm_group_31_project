import React from "react";
import logo from "./logo.svg";
import "./App.css";
import { Nav, Navbar, NavDropdown } from "react-bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";
import { scroller, animateScroll as scroll } from "react-scroll";
import { LoremIpsum, Avatar } from "react-lorem-ipsum";

// import NavDropdown from 'react-bootstrap/NavDropdown'
// import Nav from 'react-bootstrap/Nav'

function App() {
  return (
    <div className="App">
      <Navbar
        collapseOnSelect
        expand="lg"
        bg="dark"
        variant="dark"
        sticky="top"
      >
        {/* <div style={{display : 'flex', width : 750, justifyContent : 'space-evenly', alignItems : 'center', fontSize : 25}}>
            <a>Assignments</a>
            <a>Project</a>
            <a>About us</a>
        </div> */}

        <Navbar.Brand href="#">
          <img src={logo} className="App-logo" alt="logo" />
          IPM Project group 31
        </Navbar.Brand>
        <Navbar.Toggle aria-controls="responsive-navbar-nav" />
        <Navbar.Collapse id="responsive-navbar-nav">
          <Nav className="justify-content-end" activeKey="/home">
            {/* <Nav.Item>
                <Nav.Link href="/home">Active</Nav.Link>
              </Nav.Item> 
              <NavDropdown title="Assignments" >
                <NavDropdown.Item eventKey="link-1">Assignment 1</NavDropdown.Item>
              </NavDropdown>
              <NavDropdown title="Project">
                <Nav.Link eventKey="link-2">Project</Nav.Link>
              </NavDropdown>
              <Nav title="About us">
                <Nav.Link eventKey="link-2">About us</Nav.Link>
              </Nav>*/}

            <Nav.Link
              onClick={() =>
                scroller.scrollTo("about", {
                  smooth: true,
                  offset: -70,
                  duration: 800,
                })
              }
            >
              About
            </Nav.Link>
            <Nav.Link
              onClick={() =>
                scroller.scrollTo("assignments", {
                  smooth: true,
                  offset: -70,
                  duration: 800,
                })
              }
            >
              Assignments
            </Nav.Link>
            <Nav.Link
              onClick={() =>
                scroller.scrollTo("project", {
                  smooth: true,
                  offset: -70,
                  duration: 800,
                })
              }
            >
              Project
            </Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Navbar>

      <div id="about" style={{marginBottom : 700}}>
        <div className="div1">
          <div className="section-title">
            <h4>About Us</h4>
            <h2>
              <strong>Titulo do Project</strong> IPM
            </h2>
          </div>
          <LoremIpsum p={4} />
        </div>
      </div>
      <div id="assignments">
        <div className="div1">
          <LoremIpsum p={4} />
        </div>
      </div>
      <div id="project">
        <div className="div1">
          <LoremIpsum p={4} />
        </div>
      </div>
    </div>
  );
}

export default App;
