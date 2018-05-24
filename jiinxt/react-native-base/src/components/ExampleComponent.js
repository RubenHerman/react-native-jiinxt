import React, { Component } from 'react';
import { Text } from 'react-native';
import { connect } from 'react-redux';
import { exampleAction } from '../actions';
import { Card, CardSection, Button } from './common';

class ExampleComponent extends Component
{
    render()
    {
        this.props.exampleAction("Example action that creates button text!");
        return (
            <Card>
                <CardSection style={styles.containerStyle}>
                    <Text>
                        This is an example app created with Jiinxt.
                    </Text>
                </CardSection>
                <CardSection style={styles.containerStyle}>
                    <Text>
                        Utilizing: Redux, React-Redux, Redux-Thunk, React-Native-Router-Flux, React-Native-Communications, and React-Native-Elements.
                    </Text>
                </CardSection>
                <CardSection style={styles.containerStyle}>
                    <Text>
                        Thank you to Stephen Grider for the reusable components and teaching me react!
                    </Text>
                </CardSection>
                <CardSection>
                    <Button>
                        {this.props.exampleText}
                    </Button>
                </CardSection>
            </Card>
        );
    }
}

const styles = {
  containerStyle: {
      justifyContent: "center"
  }
};

const mapStateToProps = (state) =>
{
    return ({
        exampleText: state.example.displayText,
    });
};

export default connect(mapStateToProps, { exampleAction })(ExampleComponent);