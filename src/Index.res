Js.Console.log("came inside the main application")
%%raw("import ('bootstrap/dist/css/bootstrap.min.css')")
switch ReactDOM.querySelector("#main") {
| Some(rootElement) =>
  ReactDOM.Client.Root.render(ReactDOM.Client.createRoot(rootElement), <Main />)
| None => 
  Js.Console.log("could not find main div")
  ()  
}