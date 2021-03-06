# React Native Jiinxt
Jiinxt is a command line tool that makes creating boilerplate for Components, Reducers, Actions, and Types fast and easy. Developed and tested on MacOS 10.14.4 but Im sure it will work with anything that has bash. Reusable components provided by [Stephen Grider](https://github.com/StephenGrider) in his awesome udemy courses.

## Installation
1. Clone this project.
2. Run this command in terminal
```sh
    /bin/bash jiinxt-installer.sh
 ```
## Requirements
Note that the installer does not check that these dependencies are installed, be sure you have all these components before utilizing this tool.
* React-Native
* React-Native-CLI
* CURL
* Bash
* NPM
* grep
* sed

## Usage
1. `jiinxt init $project_name` || `jiinxt init expo` 
   * Creates a new blank react-native project that can be used with the jiinxt tool. 
   * If you use `jiinxt init expo` it will turn an expo project into a project that can be used with both expo and jiinxt
   * Also installs the following npm modules:
       * lodash
       * react-native-communications
       * react-native-router-flux
       * redux
       * react-redux
       * redux-thunk 
       * react-native-elements
1. `jiinxt add-type $type_name`
   * Creates a new type in src/actions/types.js
1. `jiinxt add-reducer $reducer_name`
   * Creates a new reducer in src/reducers/ as well as adds it to CombineReducers in src/reducers/index.js
1. `jiinxt add-action $action_name`
   * Create a new actions file in src/actions/ and exports it in src/actions/index.js
1. `jiinxt add-component $component_name`
   * Creates a new component in src/components/ 
1. `jiinxt update-jiinxt`
   * Updates jiinxt tool with latest from github release.
1. `jiinxt --help`
   * Manual Page
1. `jiinxt --version`
   * Shows what version the jiinxt tool is currently running.