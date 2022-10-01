import { SocialIcon } from 'react-social-icons';


type GroupElementProps = {
    elementName : string
    elementNumber : string
    profilePicture? : string
    githubUrl? : string 
    linkedinUrl? : string
}
 
const PICTURE_SIZE = 150

export default function GroupElement({elementName, elementNumber, profilePicture, githubUrl, linkedinUrl } : GroupElementProps)
{
    profilePicture = profilePicture ?? "/blank-profile-picture-973460_1280.png"

    return <>
        <div style={{width : PICTURE_SIZE}}>
            <img src={process.env.PUBLIC_URL + profilePicture}
                style={{width : PICTURE_SIZE, height : PICTURE_SIZE}}
            ></img>
            <p style={{textAlign : "center"}}>{ elementName }</p>
            <p style={{textAlign : "center"}}>{ elementNumber }</p>
            <div style={{display : "flex", justifyContent : "space-evenly", flexWrap: "wrap"}}>
                <SocialIcon network="github" url={githubUrl}></SocialIcon>
                <SocialIcon network="linkedin" url={linkedinUrl}></SocialIcon>
            </div>
        </div>
    </>
}