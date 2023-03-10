// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Nav from "./Nav.bs.js";
import * as React from "react";
import * as Footer from "./Footer.bs.js";
import * as Header from "./Header.bs.js";
import * as Employee from "./Employee.bs.js";
import * as Employees from "./Employees.bs.js";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Dom_storage from "rescript/lib/es6/dom_storage.js";
import * as PageNotFound from "./PageNotFound.bs.js";
import * as GroupedTeamMembers from "./GroupedTeamMembers.bs.js";
import * as RescriptReactRouter from "@rescript/react/src/RescriptReactRouter.bs.js";

import './styles/Main.css'
;

function fromUrl(url) {
  var match = url.path;
  if (match) {
    if (match.hd === "GroupedTeamMembers" && !match.tl) {
      return /* GroupedTeamMembers */1;
    } else {
      return /* PageNotFound */2;
    }
  } else {
    return /* Main */0;
  }
}

function Main(props) {
  var match = React.useState(function () {
        var st = Dom_storage.getItem("selectedTeam", localStorage);
        if (st !== undefined) {
          return st;
        } else {
          return "All Teams";
        }
      });
  var setSelectedTeam = match[1];
  var selectedTeam = match[0];
  var match$1 = React.useState(function () {
        var el = Dom_storage.getItem("employeeList", localStorage);
        if (el !== undefined) {
          return JSON.parse(el);
        } else {
          return Employee.employeeList;
        }
      });
  var employeeList = match$1[0];
  React.useEffect((function () {
          Dom_storage.setItem("employeeList", Belt_Option.getExn(JSON.stringify(employeeList)), localStorage);
        }), [employeeList]);
  React.useEffect((function () {
          Dom_storage.setItem("selectedTeam", selectedTeam, localStorage);
        }), [selectedTeam]);
  var match$2 = fromUrl(RescriptReactRouter.useUrl(undefined, undefined));
  if (match$2 !== undefined) {
    switch (match$2) {
      case /* Main */0 :
          return React.createElement("div", undefined, React.createElement(Nav.make, {}), React.createElement(Header.make, {
                          selectedTeam: selectedTeam,
                          employeeList: employeeList
                        }), React.createElement(Employees.make, {
                          selectedTeam: selectedTeam,
                          employeeList: employeeList,
                          setSelectedTeam: setSelectedTeam,
                          setEmployeeList: match$1[1]
                        }), React.createElement(Footer.make, {}));
      case /* GroupedTeamMembers */1 :
          return React.createElement("div", undefined, React.createElement(Nav.make, {}), React.createElement(Header.make, {
                          selectedTeam: selectedTeam,
                          employeeList: employeeList
                        }), React.createElement(GroupedTeamMembers.make, {
                          employeeList: employeeList,
                          selectedTeam: selectedTeam,
                          setSelectedTeam: setSelectedTeam
                        }), React.createElement(Footer.make, {}));
      case /* PageNotFound */2 :
          break;
      
    }
  }
  return React.createElement("div", undefined, React.createElement(Nav.make, {}), React.createElement(Header.make, {
                  selectedTeam: selectedTeam,
                  employeeList: employeeList
                }), React.createElement(PageNotFound.make, {}), React.createElement(Footer.make, {}));
}

var make = Main;

export {
  fromUrl ,
  make ,
}
/*  Not a pure module */
