import { Actions } from 'react-native-router-flux';
import { EXAMPLE_TYPE } from "./types";

export const exampleAction = (payloadText) =>
{
    return (dispatch) =>
    {
        dispatch({ type: EXAMPLE_TYPE, payload: payloadText });
        //Actions.main({ type: 'reset' })
    }
};