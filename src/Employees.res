%%raw("import './styles/Employees.css'")

let getImage = (g: Employee.gender) => {
  switch g {
  | Male => "./images/maleProfile.jpg"
  | Female => "./images/femaleProfile.jpg"
  }
}

@react.component
let make = (
  ~selectedTeam : string, 
  ~employeeList: array<Employee.employee>, 
  ~setSelectedTeam: (string => string) => unit, 
  ~setEmployeeList: (array<Employee.employee> => array<Employee.employee>) => unit
  ) => {
  let handleSelectedTeamChanged = event => {
    setSelectedTeam(ReactEvent.Form.target(event)["value"])
  }
  let handleEmployeeCardClick = event => {
    let clickedEmployeeId = 
      ReactEvent.Mouse.currentTarget(event)["id"] 
      -> Belt.Int.fromString 
      -> Belt.Option.getExn

    setEmployeeList(e => e -> Belt.Array.map(e => {
      if (e.id != clickedEmployeeId || selectedTeam == "All Teams") {
        e
      } else {
        if (e.teamName == selectedTeam) {
          {...e, teamName: ""}
        } else {
          {...e, teamName: selectedTeam}
        }        
      }
    }))
  }
  let getSelectedEmployeeClassName = (teamName: string) => {
    if (teamName == selectedTeam) {
      "card m-2 card-mouse-pointer standout"
    } else {
      "card m-2 card-mouse-pointer"
    }
  }
  <main className="container">
    <div className="row justify-content-center mt-3 mb-3">
      <div className="col-6">
        <select className="form-select form-select-lg" value={selectedTeam} onChange={handleSelectedTeamChanged}>
          {
            Employee.getTeamNames()
            -> Belt.Array.map(t => {
              <option key={t} value={t}>{t->React.string}</option>
            })
            ->React.array
          }
        </select>
      </div>
    </div>
    <div className="row justify-content-center mt-3 mb-3">
      <div className="col-8">
        <div className="card-collection">
          {
            employeeList
            ->Belt.Array.map(e => {
              <div id={e.id->Belt.Int.toString} key={e.id->Belt.Int.toString} className={getSelectedEmployeeClassName(e.teamName)} onClick={handleEmployeeCardClick}>
                <img src={getImage(e.gender)} className="card-img-top" />
                <div className="card-body">
                  <h5 className="card-title">{e.fullName -> React.string}</h5>
                  <p className="card-text"><b>{"Designation:"->React.string}</b> {e.designation->React.string}</p>
                </div>
              </div>
            }) 
            -> React.array
          }
        </div>
      </div>
    </div>
  </main>
}