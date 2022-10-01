import { SocialIcon } from 'react-social-icons';


type GroupElementProps = {
    elementName : string
    elementNumber : string
    profilePictureUrl? : string
    githubUrl? : string 
    linkedinUrl? : string
}
 
const PICTURE_SIZE = 150

export default function GroupElement({elementName, elementNumber, profilePictureUrl, githubUrl, linkedinUrl } : GroupElementProps)
{
    profilePictureUrl = profilePictureUrl ?? process.env.PUBLIC_URL + "/blank-profile-picture-973460_1280.png"

    return <>
        <div style={{width : PICTURE_SIZE}}>
            <img src={ profilePictureUrl}
                style={{width : PICTURE_SIZE, height : PICTURE_SIZE}}
            />
            <p style={{textAlign : "center"}}>{ elementName }</p>
            <p style={{textAlign : "center"}}>{ elementNumber }</p>
            <div style={{display : "flex", justifyContent : "space-evenly", flexWrap: "wrap"}}>
                {
                    githubUrl &&
                    <SocialIcon network="github" url={githubUrl}/>
                }
                {
                    linkedinUrl &&
                    <SocialIcon network="linkedin" url={linkedinUrl}/>
                }
            </div>
        </div>
    </>
}