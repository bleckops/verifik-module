/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React, {Component} from 'react';
import {StyleSheet, TouchableOpacity, Text, View, NativeModules} from 'react-native';
var {VerifikModule} = NativeModules;
class App extends Component {  


  onEnrollPress = () => {
    console.log(VerifikModule);
    VerifikModule.enroll("001",(error: String, success: String) => {
      console.log(`Error ${error} \n Success ${success}`);
    });
  };

  onAuthPress = () => {
    console.log(VerifikModule);
    VerifikModule.authenticate("001",(error: String, success: String) => {
      console.log(`Error ${error} \n Success ${success}`);
    });
  };

  onMatchIDPress = () => {
    console.log(VerifikModule);
    VerifikModule.matchID("001",(error: String, success: String) => {
      console.log(`Error ${error} \n Success ${success}`);
    });
  };

  onOCRPress = () => {
    console.log(VerifikModule);
    VerifikModule.ocr((error, success) => {
      console.log(`Error ${error} \n Success ${success}`);
    });
  };

  onAppRegisterPress = () => {
    console.log(VerifikModule);
    VerifikModule.appRegisterKYC("001",null,"5514968760",
      (error: String, success: String) => {
      console.log(`Error ${error} \n Success ${success}`);
    });
  };

  onAppLoginPress = () => {
    console.log(VerifikModule);
    VerifikModule.appLoginKYC("001",null,"5514968760",
      (error: String, success: String) => {
      console.log(`Error ${error} \n Success ${success}`);
    });
  };

  componentDidMount() {   
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcHBSZWdpc3RyYXRpb25JZCI6IjY0NTNlZDIxMjQyZmM4ZjEzNzc2OGMwNyIsImV4cGlyZXNBdCI6IjIwMjMtMDUtMDQgMTg6MTU6NTEiLCJhY2Nlc3NUeXBlIjoiYXBwX3JlZ2lzdHJhdGlvbl9jcmVhdGVkIiwiZW1haWwiOiJpYW1mZWxpcGVvQGdtYWlsLmNvbSIsInBob25lIjoiMzEwMjY5MjEzOCIsInByb2plY3QiOiI2M2M2Y2IyYWU3YzkyZGFkNTBiNjI4ODIiLCJpYXQiOjE2ODMyMjIzNTF9.dUenQm1IUi1c4pWY_rLX75BfbpdFWgEE-fz2SXnZKHk";
    VerifikModule.initVerifik(
      token, 
      (error, success) => {
        console.log(`Error ${error} \n Success ${success}`);
      });
  }

  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity style={styles.button} onPress={this.onEnrollPress}>
          <Text>Enroll</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.button} onPress={this.onAuthPress}>
          <Text>Authenticate</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.button} onPress={this.onMatchIDPress}>
          <Text>Match ID</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.button} onPress={this.onOCRPress}>
          <Text>OCR</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.button} onPress={this.onAppRegisterPress}>
          <Text>App Register</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.button} onPress={this.onAppLoginPress}>
          <Text>App Login</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  button: {
    alignItems: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
    marginBottom: 10,
  },
});

export default App;
