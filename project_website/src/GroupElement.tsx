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
            <div style={{display : "flex", alignItems : "center", justifyContent : "center"}}>
                {/* <img src={process.env.PUBLIC_URL + "/strong_arm_left.png"} style={{width : 100, height : 100}}></img> */}
                <img src={ profilePictureUrl}
                    style={{width : PICTURE_SIZE, height : PICTURE_SIZE, borderRadius : 25}}
                />
                {/* <img src={process.env.PUBLIC_URL + "/strong_arm_right.png"} style={{width : 100, height : 100}}></img> */}
            </div>
            <p style={{textAlign : "center", fontSize : 25}}><strong>{ elementName }</strong></p>
            <p style={{textAlign : "center"}}>{ elementNumber }</p>
            <div style={{display : "flex", justifyContent : "center", flexWrap: "wrap", gap : 25}}>
                {
                    githubUrl &&
                    <SocialIcon network="github" target="_blank" url={githubUrl}/>
                }
                {
                    linkedinUrl &&
                    <SocialIcon network="linkedin" target="_blank" url={linkedinUrl}/>
                }
            </div>
        </div>
    </>
}