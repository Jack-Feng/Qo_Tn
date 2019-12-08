//
//  CalculateSize.m
//  GoldMaster
//
//  Created by fanweifeng on 15/7/10.
//  Copyright (c) 2015年 fanweifeng. All rights reserved.
//

#import "CalculateSize.h"
#import "MacroDefinitionHeader.h"

@implementation CalculateSize

+(CGSize)CalculateSizeString:(NSString*)str//需要计算的字符串
                     setSize:(float)fontSize//文字的大小
                     setFnot:(NSString*)FontName
                    setwithe:(float)withe{
    

    if (IS_IPHONE_6) {
        fontSize = fontSize+1;
    }else if (IS_IPHONE_6P){
        fontSize = fontSize+2;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont fontWithName:FontName size:fontSize], NSParagraphStyleAttributeName:paragraphStyle.copy};
   CGSize size = [str boundingRectWithSize:CGSizeMake(withe, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size;
    
}


+(CGSize)CalculateSizeString:(NSString*)str setSize:(float)fontSize  setwithe:(float)withe{
    if (IS_IPHONE_6) {
        fontSize = fontSize+1;
    }else
    if (IS_IPHONE_6P){
        fontSize = fontSize+2;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle.copy};
   CGSize size = [str boundingRectWithSize:CGSizeMake(withe,10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size;
    
}

+(CGSize)IphoneSizeString:(NSString*)str setSize:(float)fontSize  setwithe:(float)withe{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize size = [str boundingRectWithSize:CGSizeMake(withe,10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size;
    
}

+(CGSize)IphoneSizeString:(NSString*)str//需要计算的字符串
                  setSize:(float)fontSize//文字的大小
                  setFnot:(NSString*)FontName
                 setwithe:(float)withe{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize size = [str boundingRectWithSize:CGSizeMake(withe,10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size;

}

/*计算字符宽度，ihpne6上的*/
+(CGSize)IphoneSixSizeString:(NSString*)str//需要计算的字符串
                     setSize:(float)fontSize//文字的大小
                     setFnot:(NSString*)FontName
                    setwithe:(float)withe{
    
    if (IS_IPHONE_6P){
        fontSize = fontSize+2;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont fontWithName:FontName size:fontSize], NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize size = [str boundingRectWithSize:CGSizeMake(withe, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size;

    
}

+(CGSize)IphoneSixGeometricSizeString:(NSString *)str
                              setSize:(float)fontSize
                             setwithe:(float)withe{
    if (IS_IPHONE_6P){
        fontSize = fontSize+1;
    }else if (IS_IPHONE_4_OR_LESS
              || IS_IPHONE_5){
         fontSize = fontSize-1;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize size = [str boundingRectWithSize:CGSizeMake(withe,10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size;

}

/*计算字符宽度，ihpne6上字体原生的*/
+(CGSize)IphoneSixSizeString:(NSString*)str//需要计算的字符串
                     setSize:(float)fontSize//文字的大小
                    setwithe:(float)withe{
    
//        if (IS_IPHONE_6P){
//            fontSize = fontSize+2;
//        }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize size = [str boundingRectWithSize:CGSizeMake(withe,10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size;

    
}

+(CGSize)simpleGetStringSize:(NSString*)str//需要计算的字符串
                     setSize:(float)fontSize//文字的大小
                    setMaxWidth:(float)width{
    str = [NSString stringWithFormat:@"%@",str];
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],};
    CGSize textSize = [str boundingRectWithSize:CGSizeMake(width, width) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
    return textSize;
}

+(CGSize)simpleGetStringSize2:(NSString*)str//需要计算的字符串
                     setSize:(float)fontSize//文字的大小
                 setMaxWidth:(float)width{
    str = [NSString stringWithFormat:@"%@8",str];//此方法用于计算不精确，数字超框
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],};
    CGSize textSize = [str boundingRectWithSize:CGSizeMake(width, width) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    
    return textSize;
}


@end
