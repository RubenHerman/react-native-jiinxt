# React Native Jiinxt
Jiinxt is a command line tool that makes creating boilerplate for Components, Reducers, Actions, and Types fast and easy. Developed and tested on MacOS 10.14.4 but Im sure it will work with anything that has bash. Reusable components provided by [Stephen Grider](https://github.com/StephenGrider) in his awesome udemy courses.

## Installation
1. Clone this project.
2. Run this command in terminal
```sh
    /bin/bash jiinxt-installer.sh
 ```
    
    
## Usage
1. `jiinxt init $project_name` 
   * Creates a new blank react-native project that can be used with the jiinxt tool. Also installs the following npm modules:
       * lodash
       * react-native-communications
       * react-native-router-flux
       * redux
       * react-redux
       * redux-thunk 
1. `jiinxt add-type $type_name`
   * Creates a new type in src/actions/types.js
1. `jiinxt add-reducer $reducer_name`
   * Creates a new reducer in src/reducers/ as well as adds it to CombineReducers in src/reducers/index.js
1. `jiinxt add-action $action_name`
   * Create a new actions file in src/actions/ and exports it in src/actions/index.js
1. `jiinxt add-component $component_name`
   * Creates a new component in src/components/ 