//
//  PHOneClickLoginCustomModel.m
//  PonHu
//
//  Created by 李凯 on 2021/4/6.
//  Copyright © 2021 Tom. All rights reserved.
//

#import "PHOneClickLoginCustomModel.h"

@implementation PHOneClickLoginCustomModel

+ (UMCustomModel *)createFullScreenModel {
    UMCustomModel *model = [[UMCustomModel alloc]init];
    model.navBackImage = TT_IMAGE_NAME(@"one_key_login_close_button");
    
    model.navColor = [UIColor whiteColor];
    model.navTitle = [NSMutableAttributedString new];
    model.logoIsHidden = YES;
    
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSFontAttributeName] = PF_Regular(FONT_SIZE_10);
    attributes[NSForegroundColorAttributeName] = UIColorFromRGB(0xCCCCCC);
    NSAttributedString * attributeStr = [[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@提供认证服务", [UMCommonUtils getCurrentCarrierName]] attributes:attributes];
    model.sloganText = attributeStr;
    
    model.numberColor = UIColorFromRGB(0x222222);
    model.numberFont = DIN_Medium(FONT_SIZE_28);
    model.numberFrameBlock = ^CGRect(CGSize screenSize, CGSize superViewSize, CGRect frame) {
        frame.origin.y = TTEqualSize(399);
        return frame;
    };
    
    [model.sloganText.attributes setValue:PF_Regular(FONT_SIZE_12) forKey:NSFontAttributeName];
    [model.sloganText.attributes setValue:[UIColor redColor] forKey:NSForegroundColorAttributeName];
    model.sloganFrameBlock = ^CGRect(CGSize screenSize, CGSize superViewSize, CGRect frame) {
        frame.origin.y = TTEqualSize(483);
        return frame;
    };
    
    model.changeBtnTitle = [[NSAttributedString alloc]initWithString:@"其他方式登录"];
    
    model.loginBtnText = [NSMutableAttributedString new];
    UIImage *loginBtnImg = TT_IMAGE_NAME(@"login_oneClick");
    model.loginBtnBgImgs = @[loginBtnImg, loginBtnImg, loginBtnImg];
    //协议
    model.privacyOne = @[@"《用户协议》", LOGIN_USER_UAGREEMENT];
    model.privacyTwo = @[@"《胖虎隐私政策》", LOGIN_PRIVACYPOLICY];
    model.privacyOperatorPreText = @"《";
    model.privacyOperatorSufText = @"》";
    model.privacyAlignment = NSTextAlignmentCenter;
    model.privacyFrameBlock = ^CGRect(CGSize screenSize, CGSize superViewSize, CGRect frame) {
        frame.origin.x = superViewSize.width - TTEqualSize(92.5);
        frame.size.width = superViewSize.width - TTEqualSize(165);
        return frame;
    };
    
    model.privacyNavColor = UIColor.whiteColor;
    model.privacyNavTitleFont = [UIFont systemFontOfSize:20.0];
    model.privacyNavTitleColor = UIColor.redColor;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // 欢迎登录胖虎 label
        UILabel *titleLabel = [UILabel new];
        // 本机号码登录 label
        UILabel *numberTopLabel = [UILabel new];
        
        model.customViewBlock = ^(UIView * _Nonnull superCustomView) {
            titleLabel.text = @"欢迎登录胖虎";
            [titleLabel addAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor] titleColor:UIColorFromRGB(0x222222) tag:10 font:PF_Medium(FONT_SIZE_28)];
            numberTopLabel.text = @"本机号码登录";
            [numberTopLabel addAlignment:NSTextAlignmentCenter backgroundColor:[UIColor clearColor] titleColor:UIColorFromRGB(0x222222) tag:10 font:PF_Regular(FONT_SIZE_14)];
            [superCustomView addSubview:titleLabel];
            [superCustomView addSubview:numberTopLabel];
        };
        
        model.customViewLayoutBlock = ^(CGSize screenSize, CGRect contentViewFrame, CGRect navFrame, CGRect titleBarFrame, CGRect logoFrame, CGRect sloganFrame, CGRect numberFrame, CGRect loginFrame, CGRect changeBtnFrame, CGRect privacyFrame) {
            titleLabel.frame = CGRectMake(0, TTEqualSize(168), SCREEN_WIDTH, TTEqualSize(78));
            numberTopLabel.frame = CGRectMake(0, TTEqualSize(340), SCREEN_WIDTH, TTEqualSize(40));
        };
    });
    
    return model;
}

@end
