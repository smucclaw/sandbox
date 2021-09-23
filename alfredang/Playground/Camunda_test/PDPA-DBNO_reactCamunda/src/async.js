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

export const getVariable = async (procId, varName) => {
    const endpoint = `/process-instance/${procId}/variables/${varName}`
    const {data} = await reqHandler.get(endpoint)
    return data
}

export const updateVariable= async (procId, varName, newVal, newValType) => {
  const endpoint = `/process-instance/${procId}/variables/${varName}`
  const payload = {"value": newVal, "type": newValType};
  const {data} = await reqHandler.put(endpoint, payload)
  sendSignal(procId)
  return data
}

export const getAllVariables = async (procId) => {
  const endpoint = `/process-instance/${procId}/variables`;
  const {data} = await reqHandler.get(endpoint)
  return data
}

const sendSignal = async (procId) => {
  const endpoint = `/message`
  const payload = {"messageName": "ui-updated", "processInstanceId": `${procId}`}
  const data = await reqHandler.post(endpoint, payload)
  return data
}

