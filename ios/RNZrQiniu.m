
#import "RNZrQiniu.h"
#import <QiniuSDK.h>

@interface RNZrQiniu ()

@property (nonatomic,strong) QNUploadManager *upManager;

@end

@implementation RNZrQiniu

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}

- (NSArray<NSString *> *)supportedEvents {
    return @[];
}

RCT_EXPORT_MODULE(RNZrQiniu)

RCT_EXPORT_METHOD(initQiniu) {
    _upManager = [[QNUploadManager alloc] init];
}

RCT_EXPORT_METHOD(upload:(NSString *)token filePath:(NSString *)path folder:(NSString *)folder callback:(RCTResponseSenderBlock)callback) {
    if (!_upManager) {
        callback(@[@NO, @{@"message": @"未初始化"}]);
        return;
    }
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (!data) {
        callback(@[@NO, @{@"message": @"文件不存在"}]);
        return;
    }
    NSString *fileName = [path lastPathComponent];
    NSString *fileExt = [path pathExtension];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMddHHmmss"];
    NSString *dateString = [formatter stringFromDate:[NSDate date]];
    int randomNum = arc4random_uniform(UINT32_MAX);
    NSString *key = [NSString stringWithFormat:@"%@-%@-%u", dateString, fileName, randomNum];
    
    if (folder && ![folder isEqualToString:@""]) {
        key = [NSString stringWithFormat:@"%@/%@",folder, key];
    }
    
    [_upManager putData:data key:key token:token
    complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        if (info.ok) {
                callback(@[@YES, resp]);
            } else {
                callback(@[@NO, @{@"message": info.error.localizedDescription}]);
            }
    } option:nil];
}


@end
  
