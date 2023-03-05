type size = [#sm | #lg | #xl]
type buttonType = [#button | #reset | #submit | #null]
type transition = ElemType(React.element) | Bool(bool)
type variant = [#primary| #secondary| #success | #danger | #warning | #info | #light | #dark]

module Button = {
  @module("react-bootstrap/Button") @react.component
  external make: (
    ~active: bool=?,
    ~_as: string=?,
    ~className: string=?,
    ~disabled: bool=?,
    ~href: string=?,
    ~size: size=?,
    ~_type: buttonType=?,
    ~variant: variant=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "default"
}

module Container = {
  @module("react-bootstrap/Container") @react.component
  external make: (
    ~_as: string=?,
    ~fluid: [#sm | #md | #lg | #xl | #xxl]=?,
    ~children: React.element,
    ~className: string=?,
    ~bsPrefix: string=?,
  ) => React.element = "default"
}

module Alert = {
  @module("react-bootstrap/Alert") @react.component
  external make: (
    ~closeLabel: string=?,
    ~closeVariant: [#white]=?,
    ~dismissible: bool=?,
    ~onClose: (~show: bool) => bool=?,
    ~show: bool=?,
    ~transition: transition=?,
    ~variant: variant=?,
    ~className: string=?,
    ~children: React.element,
    ~bsPrefix: string=?,
  ) => React.element = "default"  
}