%%raw("import './styles/Main.css'")
@scope("JSON") @val
external parseEmployee: string => array<Employee.employee> = "parse"
type route = 
| Main
| GroupedTeamMembers
| PageNotFound

let fromUrl = (url: RescriptReactRouter.url) => {
  switch url.path {
  | list{} => Main -> Some
  | list{"GroupedTeamMembers"} => GroupedTeamMembers -> Some
  | _ => PageNotFound -> Some
  }
}

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
  let useRouter = () => RescriptReactRouter.useUrl()->fromUrl
  switch useRouter() {
  | Some(Main) => 
    <div>
      <Nav />
      <Header selectedTeam employeeList />
      <Employees selectedTeam employeeList setSelectedTeam setEmployeeList />
      <Footer />
    </div>
  | Some(GroupedTeamMembers) => 
    <div>
      <Nav />
      <Header selectedTeam employeeList />
      <GroupedTeamMembers employeeList selectedTeam setSelectedTeam/>
      <Footer />
    </div>
  | _ => 
    <div>
      <Nav />
      <Header selectedTeam employeeList />
      <PageNotFound />
      <Footer />
    </div>
  }
}