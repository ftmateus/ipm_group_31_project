import { useState } from "react";
import { Button, Modal } from "react-bootstrap";

type ProjectContainerProps = {
  name: string;
  children: any;
  pdfUrl : string;
  // setShowModalWindow : React.Dispatch<React.SetStateAction<boolean>>
};

export default function ProjectContainer({
  name,
  children,
  pdfUrl
}: ProjectContainerProps) {
  const [show, setShow] = useState(false);

  //const handleShow = () => setShow(true)
  //const handleClose = () => setShow(false)

  function openPdf()
  {
    window.open(pdfUrl, '_blank', 'noopener,noreferrer');
  }
  
  return (
    <>
      <button
        className="projectBtn"
        onClick={openPdf}
      >
        <h1 style={{}}>{name}: Project Proposal</h1>
        {/* <Modal
          show={show}
          onHide={handleClose}
          centered
          size="lg"
        >
          
          <Modal.Body>
            { children() }
          </Modal.Body>
          <Modal.Footer>
            {/* <Button variant="secondary" onClick={() => setShowModalWindow(false)}>
                    Close
                </Button>
                <Button variant="primary" onClick={() => setShowModalWindow(false)}>
                    Save Changes
                </Button> */}
          {/* </Modal.Footer>
        </Modal> */}
        {children}
      </button>
    </>
  );
}
