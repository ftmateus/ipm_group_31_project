import React from 'react';
import logo from './logo.svg';
import './App.css';
import { Nav, Navbar, NavDropdown } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.min.css';
import { scroller, animateScroll as scroll } from 'react-scroll';

// import NavDropdown from 'react-bootstrap/NavDropdown'
// import Nav from 'react-bootstrap/Nav'

function App() {
  return (
    <div className="App">
      <Navbar collapseOnSelect expand="lg" bg="dark" variant="dark"  sticky="top" >

        {/* <div style={{display : 'flex', width : 750, justifyContent : 'space-evenly', alignItems : 'center', fontSize : 25}}>
            <a>Assignments</a>
            <a>Project</a>
            <a>About us</a>
        </div> */}
        
        <Navbar.Brand href="#" >
          <img src={logo} className="App-logo" alt="logo" />
          IPM Project group 31
        </Navbar.Brand>
        <Navbar.Toggle aria-controls="responsive-navbar-nav" />
        <Navbar.Collapse id="responsive-navbar-nav">
          <Nav className="justify-content-end" activeKey="/home" >
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
                onClick={() => scroller.scrollTo('about', {
                  smooth: true,
                  offset: -70,
                  duration: 800,
                  })}>
                About
              </Nav.Link>
              <Nav.Link
                onClick={() => scroller.scrollTo('assignments', {
                  smooth: true,
                  offset: -70,
                  duration: 800,
                  })}>
                Assignments
              </Nav.Link>
              <Nav.Link
                onClick={() => scroller.scrollTo('project', {
                  smooth: true,
                  offset: -70,
                  duration: 800,
                  })}>
                Project
              </Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Navbar>

      <div id="about">

        <div className= "div1">
          <div className="section-title">
            <h4>About Us</h4>
            <h2><strong>Titulo do Project</strong> IPM</h2>  
          </div>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis placerat, mi in ornare fringilla, mauris mi condimentum nisi, vel laoreet magna lacus eget felis. Sed a gravida magna, et varius mauris. Donec eget gravida nisl. Nunc eu lacus sodales, finibus neque et, tempor lacus. Proin pretium sodales tortor ut fringilla. Etiam congue fringilla dolor, quis ultrices urna commodo et. Donec massa est, volutpat ut elit ut, sodales ornare lacus. Sed ut hendrerit dolor, a vehicula purus. Nam sed tempus arcu, a ultrices velit. Curabitur turpis lorem, imperdiet quis risus eget, fermentum vulputate magna. Nam viverra bibendum sem, id pharetra ligula accumsan eget. Duis hendrerit dictum magna id fermentum. Quisque pulvinar hendrerit justo, sit amet sagittis odio. Ut dignissim, dolor ut elementum gravida, risus urna blandit metus, sit amet dignissim eros metus eget sapien. Cras id vestibulum ante. Curabitur vehicula hendrerit mauris, et placerat orci dapibus eu.Ut imperdiet ipsum lectus, id mattis ipsum tristique commodo. Ut in ex vitae quam dictum pulvinar. Nulla facilisi. Proin mauris nisl, egestas quis nunc sit amet, vestibulum mollis quam. Donec hendrerit urna quis nulla ultrices suscipit. Nam luctus efficitur magna, et rutrum sapien luctus eget. Nullam maximus maximus orci, vitae aliquam orci pretium sed. Integer et erat nec justo dictum consequat.

Cras ac massa vel nisl viverra interdum. Pellentesque a orci bibendum, feugiat lectus sit amet, interdum turpis. Proin egestas lectus sed tellus dictum malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed lacinia eros ut quam suscipit rutrum. Suspendisse tempor arcu eu ligula dapibus ornare. Curabitur ut augue eu felis venenatis porta in et nunc.

Nullam et velit blandit, laoreet eros eget, elementum elit. Phasellus id porttitor arcu. Nam lobortis nibh orci, sed commodo turpis aliquam mattis. Proin sit amet est viverra dolor vestibulum venenatis sit amet at dolor. Aenean feugiat ut nulla at vestibulum. Curabitur laoreet neque eget volutpat blandit. Cras egestas felis in venenatis efficitur. Cras cursus massa a metus gravida euismod. Nullam dignissim odio odio, quis elementum elit ultrices non. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam lobortis, est scelerisque auctor elementum, elit mauris ornare mauris, sit amet gravida risus lorem nec enim. Sed id orci est. Proin ut sapien sed ligula ultrices cursus.

Mauris hendrerit, est at accumsan congue, ex lectus ultricies tortor, vitae hendrerit lacus quam at libero. Phasellus sed eros consequat magna aliquet consequat in a lectus. Aliquam rhoncus urna id suscipit malesuada. In suscipit pharetra felis sed posuere. In vel velit sit amet urna efficitur rhoncus. Mauris facilisis erat nec lacus iaculis sollicitudin. Ut ultricies posuere est sit amet ornare. Duis luctus efficitur elit, non blandit eros pulvinar et.
          </div>
        </div> 
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
      <div id="assignments">

        <div className= "div1">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis placerat, mi in ornare fringilla, mauris mi condimentum nisi, vel laoreet magna lacus eget felis. Sed a gravida magna, et varius mauris. Donec eget gravida nisl. Nunc eu lacus sodales, finibus neque et, tempor lacus. Proin pretium sodales tortor ut fringilla. Etiam congue fringilla dolor, quis ultrices urna commodo et. Donec massa est, volutpat ut elit ut, sodales ornare lacus. Sed ut hendrerit dolor, a vehicula purus. Nam sed tempus arcu, a ultrices velit. Curabitur turpis lorem, imperdiet quis risus eget, fermentum vulputate magna. Nam viverra bibendum sem, id pharetra ligula accumsan eget. Duis hendrerit dictum magna id fermentum. Quisque pulvinar hendrerit justo, sit amet sagittis odio. Ut dignissim, dolor ut elementum gravida, risus urna blandit metus, sit amet dignissim eros metus eget sapien. Cras id vestibulum ante. Curabitur vehicula hendrerit mauris, et placerat orci dapibus eu.

Ut imperdiet ipsum lectus, id mattis ipsum tristique commodo. Ut in ex vitae quam dictum pulvinar. Nulla facilisi. Proin mauris nisl, egestas quis nunc sit amet, vestibulum mollis quam. Donec hendrerit urna quis nulla ultrices suscipit. Nam luctus efficitur magna, et rutrum sapien luctus eget. Nullam maximus maximus orci, vitae aliquam orci pretium sed. Integer et erat nec justo dictum consequat.

Cras ac massa vel nisl viverra interdum. Pellentesque a orci bibendum, feugiat lectus sit amet, interdum turpis. Proin egestas lectus sed tellus dictum malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed lacinia eros ut quam suscipit rutrum. Suspendisse tempor arcu eu ligula dapibus ornare. Curabitur ut augue eu felis venenatis porta in et nunc.

Nullam et velit blandit, laoreet eros eget, elementum elit. Phasellus id porttitor arcu. Nam lobortis nibh orci, sed commodo turpis aliquam mattis. Proin sit amet est viverra dolor vestibulum venenatis sit amet at dolor. Aenean feugiat ut nulla at vestibulum. Curabitur laoreet neque eget volutpat blandit. Cras egestas felis in venenatis efficitur. Cras cursus massa a metus gravida euismod. Nullam dignissim odio odio, quis elementum elit ultrices non. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam lobortis, est scelerisque auctor elementum, elit mauris ornare mauris, sit amet gravida risus lorem nec enim. Sed id orci est. Proin ut sapien sed ligula ultrices cursus.

Mauris hendrerit, est at accumsan congue, ex lectus ultricies tortor, vitae hendrerit lacus quam at libero. Phasellus sed eros consequat magna aliquet consequat in a lectus. Aliquam rhoncus urna id suscipit malesuada. In suscipit pharetra felis sed posuere. In vel velit sit amet urna efficitur rhoncus. Mauris facilisis erat nec lacus iaculis sollicitudin. Ut ultricies posuere est sit amet ornare. Duis luctus efficitur elit, non blandit eros pulvinar et.
        </div>
      </div>        
      <div id ="project">        
        <div className= "div1">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis placerat, mi in ornare fringilla, mauris mi condimentum nisi, vel laoreet magna lacus eget felis. Sed a gravida magna, et varius mauris. Donec eget gravida nisl. Nunc eu lacus sodales, finibus neque et, tempor lacus. Proin pretium sodales tortor ut fringilla. Etiam congue fringilla dolor, quis ultrices urna commodo et. Donec massa est, volutpat ut elit ut, sodales ornare lacus. Sed ut hendrerit dolor, a vehicula purus. Nam sed tempus arcu, a ultrices velit. Curabitur turpis lorem, imperdiet quis risus eget, fermentum vulputate magna. Nam viverra bibendum sem, id pharetra ligula accumsan eget. Duis hendrerit dictum magna id fermentum. Quisque pulvinar hendrerit justo, sit amet sagittis odio. Ut dignissim, dolor ut elementum gravida, risus urna blandit metus, sit amet dignissim eros metus eget sapien. Cras id vestibulum ante. Curabitur vehicula hendrerit mauris, et placerat orci dapibus eu.

Ut imperdiet ipsum lectus, id mattis ipsum tristique commodo. Ut in ex vitae quam dictum pulvinar. Nulla facilisi. Proin mauris nisl, egestas quis nunc sit amet, vestibulum mollis quam. Donec hendrerit urna quis nulla ultrices suscipit. Nam luctus efficitur magna, et rutrum sapien luctus eget. Nullam maximus maximus orci, vitae aliquam orci pretium sed. Integer et erat nec justo dictum consequat.

Cras ac massa vel nisl viverra interdum. Pellentesque a orci bibendum, feugiat lectus sit amet, interdum turpis. Proin egestas lectus sed tellus dictum malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed lacinia eros ut quam suscipit rutrum. Suspendisse tempor arcu eu ligula dapibus ornare. Curabitur ut augue eu felis venenatis porta in et nunc.

Nullam et velit blandit, laoreet eros eget, elementum elit. Phasellus id porttitor arcu. Nam lobortis nibh orci, sed commodo turpis aliquam mattis. Proin sit amet est viverra dolor vestibulum venenatis sit amet at dolor. Aenean feugiat ut nulla at vestibulum. Curabitur laoreet neque eget volutpat blandit. Cras egestas felis in venenatis efficitur. Cras cursus massa a metus gravida euismod. Nullam dignissim odio odio, quis elementum elit ultrices non. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam lobortis, est scelerisque auctor elementum, elit mauris ornare mauris, sit amet gravida risus lorem nec enim. Sed id orci est. Proin ut sapien sed ligula ultrices cursus.

Mauris hendrerit, est at accumsan congue, ex lectus ultricies tortor, vitae hendrerit lacus quam at libero. Phasellus sed eros consequat magna aliquet consequat in a lectus. Aliquam rhoncus urna id suscipit malesuada. In suscipit pharetra felis sed posuere. In vel velit sit amet urna efficitur rhoncus. Mauris facilisis erat nec lacus iaculis sollicitudin. Ut ultricies posuere est sit amet ornare. Duis luctus efficitur elit, non blandit eros pulvinar et.
        </div>
      </div>
    </div>
  );
}

export default App;
