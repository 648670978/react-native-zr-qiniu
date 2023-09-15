import {
    NativeModules,Platform
} from 'react-native';
const { RNZrQiniu } = NativeModules;


export function upload(token,path,folder) {
    return new Promise((resolve, reject) => {
        path = path.replace("file://", "");
        RNZrQiniu && RNZrQiniu.upload(token,path,folder, (isSuccess,res)=>{
            if (Platform.OS === 'android' && isSuccess) {
                resolve({isSuccess,data:JSON.parse(res)})
            } else {
                resolve({isSuccess,data:res})
            }
        });
    })
}