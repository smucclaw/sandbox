import axios from 'axios'

const engine = `http://localhost:8080/engine-rest`
const reqHandler = axios.create({
  baseURL: engine,
  headers: {'Content-Type': 'application/json'}
})

export const startInstance = async (processDefKey) => {
  // see https://docs.camunda.org/manual/7.15/reference/rest/process-definition/post-start-process-instance/#request-body
  // for request body
  const endpoint = `/process-definition/key/${processDefKey}/start`
  const reqBody = {}
  const data = await reqHandler.post(endpoint, reqBody)
  return data
}

export const getVariable= async (qObj) => {
    const procId = qObj.queryKey[0]
    const varName = qObj.queryKey[1]
    const endpoint = `/process-instance/${procId}/variables/${varName}`
    const data = await reqHandler.get(endpoint)
    return data
}

export const updateVariable= async (qObj) => {
  const procId = qObj.queryKey[0]
  const varName = qObj.queryKey[1]
  const newVal = qObj.queryKey[2]
  const newValType = qObj.queryKey[3]
  const endpoint = `/process-instance/${procId}/variables/${varName}`
  const payload = {"value": newVal, "type": newValType}
  const data = await reqHandler.put(endpoint, payload)
  sendSignal(procId)
  return data
}

const sendSignal = async (procId) => {
  const endpoint = `/message`
  const payload = {"messageName": "ui-updated", "processInstanceId": `${procId}`}
  const data = await reqHandler.post(endpoint, payload)
  console.log(data)
  return data
}





export const fetchCountry = async (qObj) => { // query object
  const country = qObj.queryKey[0]
  const data = await axios.get(
    `https://restcountries.eu/rest/v2/alpha/${country}`
  );
  return data;
}

export const updateCountry = async (country) => {
    const response = axios.post(engine + '/')
    const data = await response.json()
    return data
}