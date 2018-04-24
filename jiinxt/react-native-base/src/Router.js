import React from 'react';
import { Scene, Router, Actions } from 'react-native-router-flux';
import ExampleComponent from './components/ExampleComponent';

const RouterComponent = () =>
{
    return (
        <Router>
            <Scene key="root" hideNavBar>
                <Scene key="main">
                    <Scene key="exampleScene" component={ExampleComponent} title="Jiinxt" rightTitle="Skip-Scene" onRight={() => { Actions.exampleScene(); }} initial/>
                </Scene>
            </Scene>
        </Router>
    );
};

export default RouterComponent;