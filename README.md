# react-native-herow-sdk-module

SDK HEROW React Native Module

## Installation

If you need an empty React Native App'

```sh
npx react-native init herowApp
```

```sh
cd herowApp
npm install herow-plugin-react-native@7.1.2
```

You should update several configuration files before modifying your code.
## Android Steps
### First, edit `android/build.gradle` and add :

```
allprojects {
    repositories {
        mavenLocal()
        maven {
            // All of React Native (JS, Obj-C sources, Android binaries) is installed from npm
            url("$rootDir/../node_modules/react-native/android")
        }
        maven {
            // Android JSC is installed from npm
            url("$rootDir/../node_modules/jsc-android/dist")
        }

        google()
        jcenter()
        maven { url 'https://www.jitpack.io' }
        maven {
            name = "GitHubPackages"
            url = uri("https://maven.pkg.github.com/herowio/herow-sdk-android")
            credentials {
                // for more detail, please contact contact@herow.io
                username = "xxx"
                password = "xxx"
            }
        }
    }
}
```

For the moment this step is mandatory and we would be happy to provide you with the information by email at contact@herow.io.

## Second, set up the `kotlinVersion`

Edit `android/build.gradle` and add the key `kotlinVersion` :

```

buildscript {
    ext {
        buildToolsVersion = "29.0.2"
        minSdkVersion = 21
        compileSdkVersion = 29
        targetSdkVersion = 29
        kotlinVersion = '1.4.32'
    }
    ...
```

### Third, modify `AndroidManifest.xml`

Edit `android/app/src/main/AndroidManifest.xml`, you should adapt permissions..

```
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
```

and fix an issue by adding `tools:replace="android:name"`, like that :

```
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
  xmlns:tools="http://schemas.android.com/tools"
  package="com.example.reactnativeherowsdkmodule">
  ...
    <application
    tools:replace="android:name"
    ...
```

That's it !
## iOS Steps
### Modify your podfile to include `herow specs sources`
```
source 'https://github.com/herowio/Specs'
```

### Fixe your linking errors
You may receive error
```
linker command failed with exit code 1 (use -v to see invocation)"
```
And warnings:
```
ld: warning: Could not find auto-linked library 'swiftFoundation'

ld: warning: Could not find auto-linked library 'swiftDarwin'

ld: warning: Could not find auto-linked library 'swiftCoreFoundation'

ld: warning: Could not find auto-linked library 'swiftCore'
```
You have to follow this to fix the problem: 
Open ios/YourAppName.xcodeproj in Xcode
Right-click on Your App Name in the Project Navigator on the left, and click New File…
Create a single empty Swift file to the project (make sure that Your App Name target is selected when adding)
when Xcode asks, press Create Bridging Header and do not remove Swift file then. re-run your build.
This should fix the problem

### Update your `plist` to use `locations and idfa permissions` ( you should read the native iOS documentation [here](https://github.com/herowio/herow-sdk-ios)

## Usage
```js
import HerowSdkModule from "herow-plugin-react-native";

// ...

HerowSdkModule.initialize("PROD", "my_api_key", "my_secret_key")
HerowSdkModule.setCustomId("my_custom_id")
HerowSdkModule.acceptOptin() //( or  HerowSdkModule.refuseOptin())
HerowSdkModule.launchClickAndCollect()  //( or HerowSdkModule.stopClickAndCollect())

```

for `ios` you have to ask somes permissions: 
```js
if  (Platform.OS == 'ios') {
    HerowSdkModule.askWhenInUseLocationPermission()
    HerowSdkModule.askNotificationsPermission()
    HerowSdkModule.requestIDFA()
 }
 ```

### How to start locally

```sh
$ export ANDROID_HOME=/path/to/android-sdk
$ export PATH=$ANDROID_HOME/build-tools/30.0.3:$PATH
$ npx react-native run-android (or run-ios)
```

### Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
