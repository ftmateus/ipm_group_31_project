import React, { useState } from "react";
import logo from "./logo.svg";
import "./App.css";
import { Button, Modal, Nav, Navbar, NavDropdown } from "react-bootstrap";
import "bootstrap/dist/css/bootstrap.min.css";
import { scroller, animateScroll as scroll } from "react-scroll";
import { LoremIpsum, Avatar } from "react-lorem-ipsum";
import GroupElement from "./GroupElement";
import AssignmentContainer from "./AssignmentContainer";
import ProjectContainer from "./ProjectContainer";

// import NavDropdown from 'react-bootstrap/NavDropdown'
// import Nav from 'react-bootstrap/Nav'

function scrollToSection(section: string) {
  scroller.scrollTo(section, {
    smooth: true,
    offset: -70,
    duration: 70,
  });
}

function App() {
  return (
    <div className="App">
      <Navbar
        collapseOnSelect
        expand="lg"
        bg="black"
        variant="dark"
        sticky="top"
      >
        {/* <div style={{display : 'flex', width : 750, justifyContent : 'space-evenly', alignItems : 'center', fontSize : 25}}>
            <a>Assignments</a>
            <a>Project</a>
            <a>About us</a>
        </div> */}

        <Navbar.Brand href="#">
          <img
            src={process.env.PUBLIC_URL + "/GYM-1.png"}
            className="App-logo"
            alt="logo"
          />
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

            <Nav.Link onClick={() => scrollToSection("about")}>About</Nav.Link>
            <Nav.Link onClick={() => scrollToSection("assignments")}>
              Assignments
            </Nav.Link>
            <Nav.Link onClick={() => scrollToSection("project")}>
              Project
            </Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Navbar>
      <div style={{ backgroundColor: "black" }}>
        <img
          src={process.env.PUBLIC_URL + "/jackedUp.png"}
          style={{ width: "50%", height: "20%" }}
        />
      </div>

      <div id="about">
        <div className="div1">
          <div className="section-title">
            <h2>About Us</h2>
            <h2>
              <strong>Group 31</strong>
            </h2>
          </div>
          {/* <LoremIpsum p={4} /> */}
          Hi there. We are the group 31 of IPM class and this is our web site.
          Here we present our assignments and project progress.
          <div
            style={{
              display: "flex",
              justifyContent: "space-evenly",
              flexWrap: "wrap",
              marginTop: 50,
              gap: 25,
            }}
          >
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
              profilePictureUrl="https://dub01pap003files.storage.live.com/y4m8_yABLOtHQp12DPFIEgwqEfIqS4ByHNaA4sIoW7aNbj7C3gUK--4cFLL3_frNd9fDLVM9UTj2dgb5WynU49r6NGTa1H7GjALxMf_b73oH1DZVgTIzTLZ-SUM3K1B0nlgTPt9kld0yYyXQcU_xpKOqVypkwLxICzqUrgxVS8bvy6DLLj41XJwCkqQY_eK5-Ul?width=2009&height=2015&cropmode=none"
              linkedinUrl="https://www.linkedin.com/"
              githubUrl="https://github.com/ftmateus"
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
        <div className="div1">
          <h2>Assignments</h2>
          {/* <LoremIpsum p={4} /> */}
          {/* <AssignmentContainer name="The good and Bad"> */}
				{/* <h2>The good and Bad</h2>
		  </AssignmentContainer> */}
        </div>
      </div>
      <div id="project">
        <div className="div1">
          <div className="section-title">
            <h2>Project</h2>
          </div>
          <ProjectContainer name="Stage 1: Project Proposal" pdfUrl={process.env.PUBLIC_URL + "/stage1_report.pdf"}>
          {/* {
            () => <iframe
              src={process.env.PUBLIC_URL + "/stage1_report.pdf"}
              width="100%"
              height="500px"
              style={{position : "relative"}}
              ></iframe>
          } */}
          </ProjectContainer>
          &nbsp;
          <ProjectContainer name="Stage 2: User and Task Analysis" pdfUrl={process.env.PUBLIC_URL + "/stage2_report.pdf"}>
          {/* {
            () => <iframe
              src={process.env.PUBLIC_URL + "/stage1_report.pdf"}
              width="100%"
              height="500px"
              style={{position : "relative"}}
              ></iframe>
          } */}
          </ProjectContainer>
        </div>
        
      </div>
      <footer style={{ background: "black", color: "white" }}>
        <img
          src={process.env.PUBLIC_URL + "/logo_nova-st_horiz_negativo.png"}
          style={{ width: 200, height: 50, background: "white" }}
        />
      </footer>
    </div>
  );
}

export default App;
