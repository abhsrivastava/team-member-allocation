type gender = Male | Female;

type employee = {
  id: int, 
  fullName: string, 
  designation: string,
  gender: gender,
  teamName: string
}

let employeeList = [
  {id: 1, fullName: "Bob Jones", designation: "JavaScript Developer", gender: Male, teamName: "Team A"},
  {id: 2, fullName: "Jill Bailey", designation: "Node Developer", gender: Female, teamName: "Team A"},
  {id: 3, fullName: "Gail Shepherd", designation: "Java Developer", gender: Female, teamName: "Team A"},
  {id: 4, fullName: "Sam Reynolds", designation: "React Developer", gender: Male, teamName: "Team B"},
  {id: 5, fullName: "David Henry", designation: "DotNet Developer", gender: Male, teamName: "Team B"},
  {id: 6, fullName: "Sarah Blake", designation: "SQL Server DBA", gender: Female, teamName: "Team B"},
  {id: 7, fullName: "James Bennet", designation: "Angular Developer", gender: Male, teamName: "Team C"},
  {id: 8, fullName: "Jessica Faye", designation: "API Developer", gender: Female, teamName: "Team C"},
  {id: 9, fullName: "Lita Stone", designation: "C++ Developer", gender: Female, teamName: "Team C"},
  {id: 10, fullName: "Daniel Young", designation: "Python Developer", gender: Male, teamName: "Team D"},
  {id: 11, fullName: "Adrian Jacobs", designation: "Vue Developer", gender: Male, teamName: "Team D"},
  {id: 12, fullName: "Devin Monroe", designation: "Graphic Designer", gender: Male, teamName: "Team D"}
]

let getTeamNames = () => {
  employeeList
  -> Belt.Array.map(e => e.teamName)
  -> Belt.Array.reduce(list{}, (result, i) => {
    switch result->Belt.List.some(x => x == i) {
    | true => result
    | false => result -> Belt.List.add(i)
    }
  })
  -> Belt.List.add("All Teams")
  ->Belt.List.toArray
  ->Belt.SortArray.stableSortBy((a,b) => {
    if (a == b) {0} else if (a < b) {-1} else {1}
  })
}