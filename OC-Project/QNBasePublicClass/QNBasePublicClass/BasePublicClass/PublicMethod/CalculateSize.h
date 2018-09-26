
//
//  CalculateSize.h
//  GoldMaster
//
//  Created by fanweifeng on 15/7/10.
//  Copyright (c) 2015年 fanweifeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CalculateSize : NSObject

/*计算字符宽度，字体原生的*/
+(CGSize)CalculateSizeString:(NSString*)str//需要计算的字符串
                     setSize:(float)fontSize//文字的大小
                    setwithe:(float)withe;//限制的宽度

/*计算字符宽度，字体可以设置的*/
+(CGSize)CalculateSizeString:(NSString*)str//需要计算的字符串
                     setSize:(float)fontSize//文字的大小
                     setFnot:(NSString*)FontName
                    setwithe:(float)withe;//限制的宽度
/*计算字符宽度，ihpne5上的*/
+(CGSize)IphoneSizeString:(NSString*)str//需要计算的字符串
                     setSize:(float)fontSize//文字的大小
                     setFnot:(NSString*)FontName
                    setwithe:(float)withe;//限制的宽度
/*计算字符宽度，ihpne5上字体原生的*/
+(CGSize)IphoneSizeString:(NSString*)str//需要计算的字符串
                     setSize:(float)fontSize//文字的大小
                    setwithe:(float)withe;//限制的宽度

/*计算字符宽度，ihpne6上的*/
+(CGSize)IphoneSixSizeString:(NSString*)str//需要计算的字符串
                  setSize:(float)fontSize//文字的大小
                  setFnot:(NSString*)FontName
                 setwithe:(float)withe;//限制的宽度

/*计算字符宽度，ihpne6上字体原生的*/
+(CGSize)IphoneSixSizeString:(NSString*)str//需要计算的字符串
                  setSize:(float)fontSize//文字的大小
                 setwithe:(float)withe;//限制的宽度

/*计算字符宽度，ihpne6上字体原生的,5上的字体缩小一个单位*/
+(CGSize)IphoneSixGeometricSizeString:(NSString*)str//需要计算的字符串
                     setSize:(float)fontSize//文字的大小
                    setwithe:(float)withe;//限制的宽度

+(CGSize)simpleGetStringSize:(NSString*)str//需要计算的字符串
                     setSize:(float)fontSize//文字的大小
                 setMaxWidth:(float)width;

+(CGSize)simpleGetStringSize2:(NSString*)str//需要计算的字符串
                      setSize:(float)fontSize//文字的大小
                  setMaxWidth:(float)width;

@end
