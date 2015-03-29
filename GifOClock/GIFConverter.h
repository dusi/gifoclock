#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <dispatch/dispatch.h>

dispatch_queue_t backgroundQueue;

@interface GIFConverter: NSObject

@property (strong, nonatomic) AVAssetWriter *videoWriter;

- (void)exportUrl:(NSURL *)url size:(CGSize)size suiteName:(NSString *)suiteName filename:(NSString *)filename completion:(void (^)(NSInteger framesCount))completion;

@end
