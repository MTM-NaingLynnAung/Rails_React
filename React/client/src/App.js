import './App.css';
import { useState } from 'react'
import axios from 'axios'

function App() {

  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')

  const login = (e) => {
    e.preventDefault();
    axios.post("http://localhost:8080/login", {
      email: email,
      password: password
    }
    ).then(response => {
      console.log(response)
    }).catch(err => {
      console.log("login error" + err)
    })
  }


  return (
    <div className="App">
      <form className='col-3 m-auto mt-5' onSubmit={(e) => login(e)}>
      <h2>Login</h2>
        <div>
          <label>Email</label>
          <input type="text" className="form-control" value={email} onChange={(e) => setEmail(e.target.value)} />
        </div>
        <div className='my-3'>
          <label>Password</label>
          <input type="password" className="form-control" value={password} onChange={(e) => setPassword(e.target.value)} />
        </div>
        <button type='submit' className='btn btn-primary'>Login</button>
      </form>
    </div>
  );
}

export default App;
