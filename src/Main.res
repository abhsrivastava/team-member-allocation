%%raw("import './styles/Main.css'")
@scope("JSON") @val
external parseEmployee: string => array<Employee.employee> = "parse"

@react.component
let make = () => {
  let (selectedTeam, setSelectedTeam) = React.useState(() => {
    switch Dom.Storage.getItem("selectedTeam", Dom.Storage.localStorage) {
    | Some(st) => st
    | None => "All Teams"
    }
  })
  let (employeeList, setEmployeeList) = React.useState(() => {
    switch Dom.Storage.getItem("employeeList", Dom.Storage.localStorage) {
    | Some(el) => parseEmployee(el)
    | None => Employee.employeeList
    }
  })
  React.useEffect1(() => {
    Dom.Storage.setItem("employeeList", employeeList -> Js.Json.stringifyAny -> Belt.Option.getExn, Dom.Storage.localStorage)
    None
  }, [employeeList])
  React.useEffect1(() => {
    Dom.Storage.setItem("selectedTeam", selectedTeam, Dom.Storage.localStorage)
    None
  }, [selectedTeam])
  <div>
    <Header 
      selectedTeam
      employeeList
    />
    <Employees 
      selectedTeam
      employeeList
      setSelectedTeam
      setEmployeeList
    />
    <Footer />
  </div>
}