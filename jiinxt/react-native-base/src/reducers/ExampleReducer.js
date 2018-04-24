import { EXAMPLE_TYPE } from "../actions/types";

const INITIAL_STATE = { displayText: "" };

export default (state = INITIAL_STATE, action) =>
{
    switch(action.type)
    {
        case EXAMPLE_TYPE:
            return { ...state, displayText: action.payload };
        default:
            return state;
    }
}