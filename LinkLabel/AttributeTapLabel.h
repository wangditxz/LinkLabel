//
//  AttributeTapLabel.h
//  taochejian_ios_sdk
//
//  Created by 王迪 on 2019/1/28.
//  Copyright © 2019 Cindy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class AttributeTapLabel;
@class AttributeModel;
@protocol AttributeTapLabelDelegate <NSObject>
- (void)attributeTapLabel:(AttributeTapLabel *)label didSelectModel:(AttributeModel *)model;
@end

typedef void (^AttributeTapLabelTapBlock)(NSString * string);

@interface AttributeModel : NSObject
@property (nonatomic, copy) NSString    *string;   //高亮字符串
@property (nonatomic, assign) NSRange   range;      //字符串位置
@property (nonatomic, strong) NSDictionary  * attributeDic; //富文本颜色字体等配置
@end

@interface AttributeTapLabel : UILabel

@property (nonatomic, copy) AttributeTapLabelTapBlock tapBlock;   //目标点击回调
@property (nonatomic, weak) id<AttributeTapLabelDelegate> delegate; /**< 代理 */

/**
 设置文本
 
 @param text 文本内容
 @param attr 富文本样式 （样式中务必设置字体，若使用系统默认字体可能导致点击无响应或者响应混乱）
 @param stringArray 需要处理点击的文本
 */
- (void)setText:(NSString *)text attributes:(NSDictionary *)attr tapStringArray:(NSArray <AttributeModel *>*)stringArray;

@end

NS_ASSUME_NONNULL_END
