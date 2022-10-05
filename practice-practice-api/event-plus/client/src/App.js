// import './App.css';
import {useState} from 'react'

function App() {

    const [user, setUser] = useState({})
    const [userId, setUserId] = useState('')

    const [userName, setUserName] = useState('')
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [imageFile, setImageFile] = useState(null)
    const [imageBlob, setImageBlob] = useState(null)
    const [loaded, setLoaded] = useState(false)

    // debugger;
    const handleShow = (e) => {
        // debugger;
        e.preventDefault()
        fetch(`/api/users/${userId}`)
        .then(res => res.json())
        .then(userRecord => {
            console.log(userRecord)
            setUser(userRecord)
        })

    }

    const handleForm = (e) => {
        e.preventDefault();

        const userData = new FormData()
        userData.append('user_name', userName)
        userData.append('email', email)
        userData.append('password', password)
        if(imageFile){
            userData.append('image_file', imageFile)
        }

        console.log(userData)
        fetch("/api/users", {
            method: "POST",
            body: userData,
        })
            .then((response) => response.json()) 
            .then((new_obj) => {
                console.log("new_obj: ", new_obj);
            });
    }

    function loadImage(e) {
        const fileObj = e.currentTarget.files[0]
        var reader = new FileReader()
        reader.readAsDataURL(fileObj)
        // console.log(performance.now())
        reader.onloadend = () =>{
            setImageFile(reader.result)
        }
        debugger;
        var imgBlob = URL.createObjectURL(e.currentTarget.files[0])
        setImageFile(e.currentTarget.files[0])
        setImageBlob(imgBlob)
    }

    // const checkImage = (url, callback)=>{
    //     const img = new Image();
    //     img.src = url
    //     if (img.complete){
    //         callback(true);
    //     } else{
    //         img.onload = ()=>{
    //             callback(true)
    //         };
    //         img.onerror = ()=>{
    //             callback(false)
    //         };
    //     }
    // }

    // checkImage(user.image_url, (exists) =>{
    //     if(exists){
    //         console.log(user.image_url)
    //         return user.image_url
    //     } else{
    //         console.log("foto non okay")
    //         return ""
    //     }
    // })

    function testImage(url){
        const img = new Image();
        img.src = url
        return new Promise( (resolve, reject) =>{
            img.onload = () =>{
                resolve(img)
            }
            img.complete = () =>{
                resolve(img)
            }
            img.onerror = (e) =>{
                reject(url)
            }
        } )
    }

    // testImage(user.image_url)
    // .then(img => {
    //     console.log(`image width: ${img.width}`)
    // })
    // .catch(e=> console.log("error :", e))

    return (
        <div className="App">
            <div>
                <h2>show user with id</h2>
                <form onSubmit={handleShow}>
                    <label>user number</label>
                    <input type="text" onChange={(e)=>setUserId(e.currentTarget.value)}/>
                    <input type="submit" value="submit" />
                    <div>
                        {/* <label>user name</label> */}
                        <input type="text" value={user.user_name} />
                    </div>
                    <div>
                        <img src={user.image_url || "https://via.placeholder.com/200?text=profile"} alt="user_image" height={"100"} />
                        {/* "https://via.placeholder.com/200?text=profile" */}
                        {/* { user.image_url && <img src={user.image_url} alt="user_image" height={"100"} />} */}
                        
                    </div>
                </form>
            </div>
            
            
            <div>
                <h2>form</h2>
                <form onSubmit={handleForm}>
                    <label>user name</label>
                    <input type="text" value={userName} onChange={(e) => setUserName(e.currentTarget.value)}/>

                    <label>user email</label>
                    <input type="text" value={email} onChange={(e) => setEmail(e.currentTarget.value)}/>

                    <label>user password</label>
                    <input type="text" value={password} onChange={(e) => setPassword(e.currentTarget.value)}/>

                    <input type="file" accept='image/*' multiple={false} onChange={loadImage}/>


                    <input type="submit" value="submit"/>

                    <div>
                        <img 
                            src={imageBlob} 
                            height={"200"} 
                            style={loaded ? {} : { display: 'none' }}
                            onLoad={()=>setLoaded(true)}
                            onError={()=>setLoaded(false)}
                        />
                    </div>

                </form>
            </div>
        </div>
    );
}

export default App;
