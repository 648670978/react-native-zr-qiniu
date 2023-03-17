
package com.RNZrQiniu;

import android.util.Log;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.qiniu.android.http.ResponseInfo;
import com.qiniu.android.storage.Configuration;
import com.qiniu.android.storage.UpCompletionHandler;
import com.qiniu.android.storage.UploadManager;

import org.json.JSONObject;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RNZrQiniuModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;
  private UploadManager uploadManager;

  public RNZrQiniuModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
    uploadManager = new UploadManager();
  }

  @Override
  public String getName() {
    return "RNZrQiniu";
  }

  @ReactMethod
  public void upload(String token, String filePath, Callback callback) {
    File file = new File(filePath);
    if (!file.exists()) {
      callback.invoke(false, "文件不存在");
      return;
    }
    String fileName = file.getName();
    String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);
    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    String dateString = formatter.format(new Date());
    // String key = String.format("%s-%s-%d.%s", dateString, fileName, (int) (Math.random() * 1000), fileExt);
    String key = String.format("%s-%s-%d", dateString, fileName, (int) (Math.random() * 1000));

    uploadManager.put(file, key, token,
            new UpCompletionHandler() {
              @Override
              public void complete(String key, ResponseInfo info, JSONObject res) {
                //res 包含 hash、key 等信息，具体字段取决于上传策略的设置
                if (info.isOK()) {
                  callback.invoke(true, res.toString());
                } else {
                  callback.invoke(false, info.error);
                }
              }
            }, null);
  }


}