import {useState} from 'react'

export default function Login() {

    const [email, setEmail] = useState('')
    const [password, setPassowrd] = useState('')
    
    const handleForm = (e) =>{
        fetch("/session", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ email: email, password: password})
        })
        .then(res => res.json())
        .then(data => console.log(data))
        .catch(err => console.error(err))
    }

    return (
        <div>
            <form action="/session" onSubmit={handleForm}>
                <label htmlFor="user_name">User Email</label>
                <input type="text" name="user_name" onChange={(e)=>setEmail(e.currentTarget.value)}/>
                <label htmlFor="password">Password</label>
                <input type="text" name="password" onChange={(e)=>setPassowrd(e.currentTarget.value)}/>
                <input type="submit" value="Login" />
            </form>
        </div>
    )
}
