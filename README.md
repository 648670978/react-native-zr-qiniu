
# react-native-zr-qiniu

## Getting started

`$ npm install react-native-zr-qiniu --save`

### Mostly automatic installation

`$ react-native link react-native-zr-qiniu`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-zr-qiniu` and add `RNZrQiniu.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNZrQiniu.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNZrQiniuPackage;` to the imports at the top of the file
  - Add `new RNZrQiniuPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-zr-qiniu'
  	project(':react-native-zr-qiniu').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-zr-qiniu/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-zr-qiniu')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNZrQiniu.sln` in `node_modules/react-native-zr-qiniu/windows/RNZrQiniu.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Zr.Qiniu.RNZrQiniu;` to the usings at the top of the file
  - Add `new RNZrQiniuPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNZrQiniu from 'react-native-zr-qiniu';

// TODO: What to do with the module?
RNZrQiniu;
```
  