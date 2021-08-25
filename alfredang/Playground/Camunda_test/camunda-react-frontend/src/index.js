import { useState, memo, createContext, useContext } from 'react';
import ReactDOM from 'react-dom';
import 'bootstrap/dist/css/bootstrap.css'
import styles from './index.css'

// https://www.youtube.com/watch?v=FzlurzsCW4M



export default function Home() {
  return (
  <CountryProvider>
    <HomeContent />
  </CountryProvider>
  )
}

const HomeContent = memo(() => {
  return (
    <div> 
      <CountryDetails />
      <CountryPicker />
    </div>
  )
});

const CountryContext = createContext();

function CountryProvider({ children }) {
  const [country, setCountry] = useState("CA")

  return <CountryContext.Provider value={{country, setCountry}}>
    {children}
  </CountryContext.Provider>
}

function CountryDetails() {
  const {country} = useContext(CountryContext)
  return (
    <h1>{country}</h1>
  )
}

function CountryPicker() {
  const {country, setCountry } = useContext(CountryContext)
  return (
    <select 
      value={country} 
      onChange={(event) => { 
        setCountry(event.target.value) 
      }}
    >
      <option value="CA">Canada</option>
      <option value="CO">Colombia</option>
    </select>
  )
}



ReactDOM.render(
  <Home />,
  document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals