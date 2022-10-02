

type AssignmentContainerProps = {
    name : string
    setShowModalWindow : React.Dispatch<React.SetStateAction<boolean>>
}

export default function AssignmentContainer({name, setShowModalWindow} : AssignmentContainerProps)
{
    return <>
        <button style={{
            backgroundColor : "orange", 
            width : "100%", 
            height : 100, 
            borderRadius : 25,
            display : "flex",
            justifyContent : "center",
            alignItems : "center"
        }}
        onClick={() => setShowModalWindow(true)}
        >
            <h1 style={{}}>{ name }</h1>
        </button>
    
    
    </>
}