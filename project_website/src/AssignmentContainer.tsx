

type AssignmentContainerProps = {
    name : string
}

export default function AssignmentContainer({name} : AssignmentContainerProps)
{
    return <>
        <div style={{
            backgroundColor : "orange", 
            width : "100%", 
            height : 100, 
            borderRadius : 25,
            display : "flex",
            justifyContent : "center",
            alignItems : "center"
        }}>
            <h1 style={{}}>{ name }</h1>
        </div>
    
    
    </>
}