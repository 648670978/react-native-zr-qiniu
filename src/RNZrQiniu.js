import {
    NativeModules,Platform
} from 'react-native';
const { RNZrQiniu } = NativeModules;


export function upload(token,path, callback) {
    RNZrQiniu && RNZrQiniu.upload(token,path, (isSuccess,res)=>{
        if (Platform.OS === 'android' && isSuccess) {
            callback(isSuccess,JSON.parse(res))
        } else {
            callback(isSuccess,res)
        }
    });
}