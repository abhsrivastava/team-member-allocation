type groupedEmployee = {
  teamName: string, 
  teamMembers: array<Employee.employee>,
  collapsed: bool
}

@react.component
let make = (
  ~employeeList: array<Employee.employee>, 
  ~selectedTeam: string, 
  ~setSelectedTeam: (string => string) => unit) => {

  let groupEmployees = () : array<groupedEmployee> => {
    let mapping = Js.Dict.empty()
    employeeList 
    -> Belt.Array.forEach(e => {
      switch mapping -> Js.Dict.get(e.teamName) {
      | Some(el) => Js.Array.push(e, el) -> ignore
      | None => mapping -> Js.Dict.set(e.teamName, [e])
      }
    })
    mapping 
    -> Js.Dict.entries
    -> Belt.Array.map(((teamName, el)) => {
      teamName: teamName, 
      teamMembers: el, 
      collapsed: if (teamName == selectedTeam) {false} else {true}
    })
  }

  let (groupedEmployees, setGroupedEmployees) = React.useState(() => groupEmployees())
  let handleTeamClick = (event) => {
    let selectedTeam = ReactEvent.Mouse.target(event)["id"]
    setSelectedTeam(_ => selectedTeam)
    setGroupedEmployees(geList => geList -> Belt.Array.map(({teamName, teamMembers, _}) => {
      {teamName: teamName, teamMembers: teamMembers, collapsed: if (selectedTeam == teamName) {false} else {true}}
    }))
  }
  <main className="container">
    <div className="row justify-content-center">
    {
      groupedEmployees 
      -> Belt.Array.map(ge => {
        <div id={ge.teamName} className="card mt-2" style={{cursor: "pointer"}}>
          <h4 id={ge.teamName} className="card-header text-secondary bg-white" onClick={handleTeamClick}>
            {`Team Name ${ge.teamName}` -> React.string}
          </h4>
          <div id={`collapse_${ge.teamName}`} className={if (ge.collapsed) {"collapse"} else {""}}>
            <hr/>
            {
              ge.teamMembers 
              -> Belt.Array.map(e => {
                <div id={e.fullName} key={e.fullName} className="mt-2">
                  <h5 className="card-title mt-2">
                    <span className="text-dark">{`Full Name ${e.fullName}` -> React.string}</span>
                  </h5>
                  <p>{`Designation: ${e.designation}` -> React.string}</p>
                </div>
              }) 
              -> React.array
            }
          </div>
        </div>
      }) 
      -> React.array
    }
    </div>
  </main>
}