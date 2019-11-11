//
//  UIImageView+SDWebImageManageS.m
//  FGUIKit
//
//  Created by 肥儿古德 on 2019/11/11.
//  Copyright © 2019 hh. All rights reserved.
//

#import "UIImageView+SDWebImageManageS.h"

@implementation UIImageView (SDWebImageManageS)

- (void)fg_setImageWithUrl:(NSString *)url{
    [self fg_setImageWithUrl:url placeholder:nil complete:nil];
}
- (void)fg_setImageWithUrl:(NSString *)url placeholder:(UIImage *)placeholder{
    [self fg_setImageWithUrl:url placeholder:placeholder complete:nil];
}
- (void)fg_setImageWithUrl:(NSString *)url placeholder:(UIImage *)placeholder complete:(void (^)(UIImage * _Nonnull, NSError * _Nonnull, NSInteger, NSURL * _Nonnull))complete{
//    @autoreleasepool {
//        NSData * data = [[MMGifCache sharedCache] objectForKey:urlString];
//        if (data) {
//            UIImage * image;
//            if ([urlString containsString:@".gif"]) {
//                image = [UIImage sd_animatedGIFWithData:data];
//            }else{
//                image = [UIImage imageWithData:data];
//            }
//            data = nil;
//            if (image) {
//                self.image = image;
//                image = nil;
//                return;
//            }else{
//                //图片出错继续执行加载流程
//            }
//        }
//    }
//    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
//    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration defaultSessionConfiguration];
//    //不要使用mainQueue 会堵塞
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    queue.name = @"Mutual Author";
//    NSURLSession *session = [NSURLSession sessionWithConfiguration:conf delegate:self delegateQueue:queue];
//    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        dispatch_async( dispatch_get_main_queue(), ^{
//            if (!error) {
//                @autoreleasepool {
//                    NSData * newData = [[MMGifCache sharedCache] encodingWithData:data url:response.URL.absoluteString];
//                    UIImage * image;
//                    if ([response.URL.absoluteString containsString:@".gif"]) {
//                        [[MMGifCache sharedCache] setObject:newData forKey:response.URL.absoluteString];
//                        if ([response.URL.absoluteString isEqualToString:urlString]) {
//                            self.image = [UIImage sd_animatedGIFWithData:newData];
//                        }
//                    }else{
//                        image = [UIImage imageWithData:newData];
//                        if (image) {
//                            image = [UIImage IMGCompressed:image targetWidth:640];
//                            NSData * yasuoData = UIImageJPEGRepresentation(image, .5);
//                            [[MMGifCache sharedCache] setObject:yasuoData forKey:response.URL.absoluteString];
//                            NSString * urlString = self.url;
//                            if ([response.URL.absoluteString isEqualToString:urlString]) {
//                                self.image = [UIImage imageWithData:yasuoData];
//                            }
//                        }
//                    }
//                    newData = nil;
//                    image = nil;
//                }
//            }else{
//            }
//        });
//    }];
//    [task resume];
}

@end
