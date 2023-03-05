@react.component
let make = () => {
  let date = Js.Date.make()
  <footer className="container">
    <div className="row justify-content-conter mt-3 mb-4">
      <div className="col-8">
        <h5>{`Team Allocation App - {${date -> Js.Date.getFullYear -> Belt.Float.toInt -> Belt.Int.toString}}`->React.string}</h5>
      </div>
    </div>
  </footer>
}