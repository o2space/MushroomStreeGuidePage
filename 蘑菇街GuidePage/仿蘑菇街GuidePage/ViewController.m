//
//  ViewController.m
//  蘑菇街GuidePage
//
//  Created by wukexiu on 17/3/16.
//  Copyright © 2017年 com.xm.guidepage. All rights reserved.
//

#import "ViewController.h"
#import "XMMushroomStreetGuideView.h"

@interface ViewController ()

@property(nonatomic, strong)XMMushroomStreetGuideView *guideView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.guideView];
}

-(XMMushroomStreetGuideView *)guideView{
    if (!_guideView) {
        _guideView = [[XMMushroomStreetGuideView alloc] init];
    }
    return _guideView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
