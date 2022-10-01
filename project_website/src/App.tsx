import React from "react";
import logo from "./logo.svg";
import "./App.css";
import { Nav, Navbar, NavDropdown } from "react-bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";
import { scroller, animateScroll as scroll } from "react-scroll";
import { LoremIpsum, Avatar } from "react-lorem-ipsum";
import GroupElement from "./GroupElement";

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
            Group 31
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
                  duration: 70,
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
                  duration: 70,
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
                  duration: 70,
                })
              }
            >
              Project
            </Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Navbar>

      <div id="about">
        <div className="div1">
          <div className="section-title">
            <h4>About Us</h4>
            <h2>
              <strong>Group 31</strong>
            </h2>
          </div>
          {/* <LoremIpsum p={4} /> */}
          Hi there. We are the group 31 of IPM class and this is our web site. 
          Here we present our assignments and project progress.
          <div style={{display : "flex", justifyContent : "space-evenly", flexWrap: "wrap", marginTop : 50, gap: 25}}>
            <GroupElement 
                elementName="Bruno Carmo" 
				elementNumber="57418" 
				linkedinUrl="https://www.linkedin.com/"
				githubUrl="https://github.com/"
			/>
            <GroupElement 
				elementName="Francisca Corga" 
				elementNumber="58218" 
				linkedinUrl="https://www.linkedin.com/"
				githubUrl="https://github.com/"
			/>
            <GroupElement 
				elementName="Francisco Mateus" 
				elementNumber="53270" 
				linkedinUrl="https://www.linkedin.com/"
				githubUrl="https://github.com/"
			/>
            <GroupElement 
				elementName="Sahil Kumar" 
				elementNumber="57449" 
				linkedinUrl="https://www.linkedin.com/"
				githubUrl="https://github.com/"
			/>
          </div>
        </div>
      </div>
      <div id="assignments">
        <div className="div1" >
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
