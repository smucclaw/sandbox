import { useState, memo, createContext, useContext } from 'react';
import { QueryClient, QueryClientProvider, useQueryClient, useQuery } from 'react-query'
import 'bootstrap/dist/css/bootstrap.css'
import { getVariable, updateVariable } from './async.js';

import styles from './index.css'

const queryClient = new QueryClient()
const ProcessContext = createContext();
const StrategyContext = createContext();


export function App(props) {
  // queryClient enables use of external queries
  // contextProvider enables "global state"
  // queryClient provider wraps context provider
  return (
    <QueryClientProvider client={queryClient}>
      <StrategyProvider>
        <AppContent process_id={props.process_id} />
      </StrategyProvider>
    </QueryClientProvider>

  );
}

const AppContent = memo((props) => {
  return (
    <div>
      <ReportStrategy process_id={props.process_id} />
      <UserDetails />
    </div>
  );
});


function StrategyProvider({ children }) {
  const [amountSaved, setAmountSaved] = useState(0);

  return (
    <StrategyContext.Provider value={{ amountSaved, setAmountSaved }}>
      {children}
    </StrategyContext.Provider>
  );
}


function ReportStrategy(props) {
  const queryClient = useQueryClient()
  const { amountSaved } = useContext(StrategyContext)
  const { status } = useQuery(
    [props.process_id, 'amountSaved', amountSaved, "long"],
    updateVariable
  )
  
  const { data, isLoading, error } = useQuery(
    [props.process_id, 'investmentStrategy'],
    getVariable,
    { enabled: (status === "success")}
  )

  if (status === "loading") return <span>loading...</span>
  if (isLoading) return <span>loading...</span>;
  if (error) return <span>oop!! error occurred</span>;
  const strategy = JSON.stringify(data.data.value)
  return (
    <div>
      <pre>You should {strategy}.</pre>
    </div>
  );
}

function UserDetails() {
  const { amountSaved, setAmountSaved } = useContext(StrategyContext)

  return (
    <label>
      How much money do you have saved?
      <input type="number"
        value={amountSaved}
        onChange={(event) => {
          setAmountSaved(event.target.value)
        }}
        min="0"></input>
    </label>
  );
}