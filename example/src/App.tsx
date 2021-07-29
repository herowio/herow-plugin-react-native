import * as React from 'react';

import { Button, PermissionsAndroid, StyleSheet, View, Text } from 'react-native';
import { Platform } from 'react-native';
import HerowSdkModule from 'react-native-herow-sdk-module';

const requestLocationPermission = async () => {
  try {
  if  (Platform.OS == 'ios') {
    HerowSdkModule.askWhenInUseLocationPermission();
    return
  }
    const granted = await PermissionsAndroid.request(
      PermissionsAndroid.PERMISSIONS.ACCESS_FINE_LOCATION,
      {
        title: "Access Location Permission",
        message:
          "We need access to your GPS " +
          "to interact we geofence zones.",
        buttonNeutral: "Ask Me Later",
        buttonNegative: "Cancel",
        buttonPositive: "OK"
      }
    );
    if (granted === PermissionsAndroid.RESULTS.GRANTED) {
      console.log("You can use the GPS");
    } else {
      console.log("GPS permission denied");
    }
  } catch (err) {
    console.warn(err);
  }
};

const initialize = () => {
  HerowSdkModule.initialize("PRE_PROD", "xxx", "xxx")
  HerowSdkModule.setCustomId("reactnative")
  console.log("SDK initialized");
   if  (Platform.OS == 'ios') {
    HerowSdkModule.askNotificationsPermission();
     HerowSdkModule.requestIDFA();
    return
  }
}

const setOptinOn = () => {
  HerowSdkModule.acceptOptin()
  console.log("optin accepted");
}

const setOptinOff = () => {
  HerowSdkModule.refuseOptin()
  console.log("optin refused");
}

const startClickAndCollect = () => {
  HerowSdkModule.launchClickAndCollect()
  console.log("click and collect activated");
}
const stopClickAndCollect = () => {
  HerowSdkModule.stopClickAndCollect()
  console.log("click and collect desactivated");
}

const App = () => (
  <View style={styles.container}>
    <Text>Hello Herow!</Text>
    <Button title="1 - request permissions" onPress={requestLocationPermission} />
    <Button title="2 - initialize SDK" onPress={initialize} />
    <Button title="3 - accept Optin" onPress={setOptinOn} />
     <Button title="4 - refuse Optin" onPress={setOptinOff} />
    <Button title="5 - start click & collect" onPress={startClickAndCollect} />
     <Button title="5 - stop click & collect" onPress={stopClickAndCollect} />
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});

export default App;