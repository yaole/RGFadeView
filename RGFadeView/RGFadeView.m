//
//  RGFadeView.m
//  RGFadeView
//
//  Created by Arvin on 15/10/27.
//  Copyright © 2015年 com.roroge. All rights reserved.
//

#import "RGFadeView.h"
#import "UIView+RGSize.h"
#import "Constant.h"

@interface RGFadeView ()

@property (strong, nonatomic) IBOutlet UIView *customView;
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (weak, nonatomic) IBOutlet UILabel *placeStr;


@end

@implementation RGFadeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit {
    
    [[[NSBundle mainBundle] loadNibNamed:@"RGFadeView" owner:self options:nil] lastObject];
    self.customView.width = self.width;
    self.customView.height = 200;
    self.customView.bottom = self.bottom;
    self.backgroundColor = [UIColor clearColor];
    self.alpha = 0;
    [self addSubview:self.customView];
    
    UIView *maskView = [[UIView alloc] initWithFrame:self.bounds];
    maskView.backgroundColor = RGBA(0, 0, 0, 0.3);
    [self addSubview:maskView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(close:)];
    [maskView addGestureRecognizer:tap];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}

- (void)textViewDidChange:(UITextView *)textView {
    self.placeStr.hidden = self.msgTextView.text.length;
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    if (endFrame.origin.y == kScreen_Height) {
        [UIView animateWithDuration:0.25 animations:^{
            self.customView.top = kScreen_Height;
            self.alpha = 0;
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            self.alpha = 1;
            self.customView.bottom = kScreen_Height - endFrame.size.height;
        }];
    }

}

- (IBAction)close:(id)sender {
    [self.msgTextView resignFirstResponder];
    self.msgTextView.text = @"";
    self.placeStr.hidden = NO;
}

- (IBAction)send:(id)sender {
    NSLog(@"send success");
    [self close:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
    self.msgTextView.delegate = nil;
}

@end
