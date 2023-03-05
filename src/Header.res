@react.component
let make = (
  ~selectedTeam: string, 
  ~employeeList: array<Employee.employee>
  ) => {
  <header className="container">
    <div className="row justify-content-center mt-3 mb-4">
      <div className="col-8">
        <h1 
          className="mt-4 p5 bg-warning text-white rounded">
            {
              if (selectedTeam == "All Teams") {
                `${selectedTeam} Size: ${
                  employeeList -> Belt.Array.size -> Belt.Int.toString}`
                  -> React.string
              } else {
                `${selectedTeam} Size: ${
                  employeeList 
                  -> Belt.Array.keep(e => e.teamName == selectedTeam) 
                  -> Belt.Array.size 
                  -> Belt.Int.toString}
                ` -> React.string
              }
            }
        </h1>
      </div>
    </div>
  </header>
}