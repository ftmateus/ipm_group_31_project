import { useState } from "react";
import { Button, Modal } from "react-bootstrap";

type AssignmentContainerProps = {
  name: string;
  children: any;
  // setShowModalWindow : React.Dispatch<React.SetStateAction<boolean>>
};

export default function AssignmentContainer({
  name,
  children,
}: AssignmentContainerProps) {
  const [showModalWindow, setShowModalWindow] = useState(false);

  return (
    <>
      <button
        style={{
          backgroundColor: "orange",
          width: "100%",
          height: 100,
          borderRadius: 25,
          display: "flex",
          justifyContent: "center",
          alignItems: "center",
        }}
        onClick={() => setShowModalWindow(true)}
      >
        <h1 style={{}}>{name}</h1>
        <Modal
          show={showModalWindow}
          onHide={() => setShowModalWindow(false)}
          centered
        >
          <Modal.Header closeButton>
            <Modal.Title>Modal heading</Modal.Title>
          </Modal.Header>
          <Modal.Body>{children}</Modal.Body>
          <Modal.Footer>
            <Button
              variant="secondary"
              onClick={() => setShowModalWindow(false)}
            >
              Close
            </Button>
            <Button variant="primary" onClick={() => setShowModalWindow(false)}>
              Save Changes
            </Button>
          </Modal.Footer>
        </Modal>
        {children}
      </button>
    </>
  );
}
