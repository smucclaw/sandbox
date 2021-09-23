import { useState, createContext, useContext } from 'react';
import { QueryClient, QueryClientProvider, useQueryClient, useQuery, useMutation } from 'react-query'
import { ReactQueryDevtools } from 'react-query/devtools'

import 'bootstrap/dist/css/bootstrap.css'
import { updateVariable, getAllVariables } from './async.js';
import { varLabelMap } from './varLabelMap.js';

import styles from './index.css'

const queryClient = new QueryClient();
const ProcessContext = createContext();
const VariableContext = createContext();

export function App(props) {
  // queryClient enables use of external queries
  // contextProvider enables "global state"
  // queryClient provider wraps context provider
  const process_id = props.process_id;
  const [schema, setSchema] = useState({});

  return (
    <QueryClientProvider client={queryClient}>
      <ProcessContext.Provider value={process_id}>
          <VariableContext.Provider value={{ schema, setSchema }}>
            <AppContent />
          </VariableContext.Provider>
      </ProcessContext.Provider>
      <ReactQueryDevtools initialIsOpen />
    </QueryClientProvider>
  );
}

function AppContent() {
  const queryClient = useQueryClient()
  const process_id = useContext(ProcessContext);
  const { setSchema } = useContext(VariableContext);

  const { data: allData, isLoading, error } = useQuery(
    ["allData"], () => getAllVariables(process_id), {
      refetchInterval: 200
    });

  if (isLoading) return <span>Loading...</span>
  if (error) return <span>Error occured!</span>

  varLabelMap.map((keyVal) => {
    const toMod = allData[`${keyVal[0]}`]
    allData[`${keyVal[0]}`] = { ...toMod, label: keyVal[1] };
    return keyVal;
  })
  setSchema(allData);

  return (
    <div>
      <ReportNotifiable />
      <BreachDetails />
    </div>
  );
}

function ReportNotifiable() {
  const { schema } = useContext(VariableContext);
  const varName = 'act26b_1'

  return (
    <div>
      { JSON.stringify(schema) === "{}" ? <span></span> : <span><b>The breach is </b><h1>{schema[varName].value ? "NOTIFIABLE" : "NOT NOTIFIABLE"}.</h1></span> }
    </div>
  );
}

function BreachDetails() {
  const { schema } = useContext(VariableContext);
  if (JSON.stringify(schema) === "{}") return <span></span>;

  return (
    <div>
      {varLabelMap.map((k, _) => {
        return (
          <CheckBox
            key={k[0]}
            varName={k[0]}
          />);
      })
      }
    </div>
  );
}



// Actual 
function CheckBox({ varName }) {
  const queryClient = useQueryClient()
  const process_id = useContext(ProcessContext);
  const { schema, setSchema } = useContext(VariableContext);
  const type = "Boolean";

  // update function
  const { mutate } = useMutation(vars => { 
    updateVariable(vars.process_id, vars.varName, vars.newState, vars.componentType)
  }, 
  {
    onMutate: (vars) => {
      queryClient.cancelQueries(["allData"]);

      const current = queryClient.getQueryData(["allData"]);

      queryClient.setQueryData(["allData"], (data) => {
        const newData = {};
        const childObj = {};
        childObj["type"] = vars.type;
        childObj["value"] = vars.newState; 
        childObj["label"] = data[vars.varName].label;
        newData[vars.varName] = childObj;
        return {...data, ...newData};
      })

      return current;
    },
    onError: (error, newData, rollback) => rollback(),
    onSettled: () => queryClient.refetchQueries(["allData"])
  })


  return (
    <div>
        <label>
          <input type="checkbox"
            checked={schema[varName].value}
            onChange={(event) => {
              const newState = event.target.checked;
              mutate({ process_id, varName, newState, type});
            }}
          ></input>
          <span>{schema[varName].label}</span>
        </label>
    </div>
  );
}