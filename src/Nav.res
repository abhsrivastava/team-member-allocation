@react.component
let make = () => {
  <nav className="navbar navbar-expand-lg navbar-light bg-light">
    <ul className="navbar-nav me-auto mb-2 ml-2 mr-2 mb-lg-0">
      <NavItem title="Home" linkTo="/" />
      <NavItem title="Teams" linkTo="/GroupedTeamMembers" />
    </ul>
  </nav>
}