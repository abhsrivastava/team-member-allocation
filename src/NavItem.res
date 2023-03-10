@react.component
let make = (~title: string, ~linkTo: string) => {
  <li className="nav-item" onClick={_ => RescriptReactRouter.push(linkTo)}>{title -> React.string}</li>
}