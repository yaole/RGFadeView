//
//  ViewController.m
//  RGFadeView
//
//  Created by roroge on 15/10/27.
//  Copyright © 2015年 com.roroge. All rights reserved.
//

#import "ViewController.h"
#import "RGFadeView.h"
#import "Constant.h"
#import "UIView+RGSize.h"

@interface ViewController ()

@property (strong, nonatomic) RGFadeView *rgFadeView;
@property (weak, nonatomic) IBOutlet UIButton *editBtn;
@property (weak, nonatomic) IBOutlet UIImageView *head;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.head.layer.cornerRadius = self.head.width / 2;
//    self.editBtn.backgroundColor = [UIColor whiteColor];
    self.editBtn.layer.cornerRadius = 10;
    self.editBtn.layer.borderWidth = 1;
    self.editBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    
}

- (IBAction)goEdit:(id)sender {
    if (!self.rgFadeView) {
        self.rgFadeView = [[RGFadeView alloc] initWithFrame:kScreen_Frame];
        [self.view addSubview:self.rgFadeView];
    }
    [self.rgFadeView.msgTextView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
