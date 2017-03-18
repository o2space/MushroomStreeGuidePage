//
//  XMMushroomStreetGuideView.m
//  仿蘑菇街GuidePage
//
//  Created by wukexiu on 17/3/16.
//  Copyright © 2017年 com.xm.guidepage. All rights reserved.
//

#import "XMMushroomStreetGuideView.h"

@interface XMMushroomStreetGuideView()<UIScrollViewDelegate>
{
    UIScrollView *svMain;
    UIView *vwOneContent,*vwTwoContent,*vwThreeContent,*vwFourContent;
    UIView *vwPhotoBox;
    
    //第一页
    UIImageView *ivOneBox,*ivOneBoxBottom;
    //第二页
    UIImageView *ivTwoTop,*ivTwo1,*ivTwo2,*ivTwo3,*ivTwoBottom;
    //第三页
    UIImageView *ivThree1,*ivThree2,*ivThree3,*ivThree4,*ivThree5,*ivThree6;
    //第四页
    UIImageView *ivFourTop,*ivFourCenter,*ivFourBottom1,*ivFourBottom2,*ivFourBottom3;
    
    UIView *vwPageControl;
    NSMutableArray * pageIndicatorArr;
}
@end

@implementation XMMushroomStreetGuideView

- (instancetype) init{
    self = [super init];
    if (self) {
        self.frame = kScreen_Bounds;
        self.backgroundColor = [UIColor whiteColor];
        [self setupView];
    }
    return self;
}

-(void)setupView{
    // 容器初始化
    {
        svMain = ({
            UIScrollView *sv = [[UIScrollView alloc] initWithFrame:kScreen_Bounds];
            sv.pagingEnabled = YES;
            sv.showsHorizontalScrollIndicator = NO;
            sv.bounces = NO;
            sv.delegate = self;
            sv;
        });
        [self addSubview:svMain];
        
        CGRect tmpFrame = kScreen_Bounds;
        vwOneContent = [[UIView alloc] initWithFrame:tmpFrame];
        [svMain addSubview:vwOneContent];
        
        tmpFrame.origin.x += kScreen_Width;
        vwTwoContent = [[UIView alloc] initWithFrame:tmpFrame];
        [svMain addSubview:vwTwoContent];
        
        tmpFrame.origin.x += kScreen_Width;
        vwThreeContent = [[UIView alloc] initWithFrame:tmpFrame];
        [svMain addSubview:vwThreeContent];
        
        tmpFrame.origin.x += kScreen_Width;
        vwFourContent = [[UIView alloc] initWithFrame:tmpFrame];
        [svMain addSubview:vwFourContent];
        
    }
    // 相框
    {
        vwPhotoBox = ({
            UIView *vw = [[UIView alloc] init];
            vw.userInteractionEnabled = NO;
            vw.backgroundColor = [UIColor whiteColor];
            vw.layer.cornerRadius = 6;
            vw.layer.shadowOffset = CGSizeMake(0, 0);
            vw.layer.shadowColor = [UIColor lightGrayColor].CGColor;
            vw.layer.shadowRadius = 15;
            vw.layer.shadowOpacity = 0.6;
            vw.xm_y = 130;
            vw.xm_centerX = kScreen_Width / 2.0;
            vw;
        });
        [self addSubview:vwPhotoBox];
    }
    vwPhotoBox.frame = CGRectMake(0, 130, 260, 181);
    vwPhotoBox.xm_centerX = kScreen_Width / 2.0;
    // 第一页
    {
        UIImageView *ivTitle = [UIImageView imageViewWithName:@"guide_one_label"];
        ivTitle.xm_y = 40;
        ivTitle.xm_centerX = kScreen_Width / 2.0;
        [vwOneContent addSubview:ivTitle];
        
        UIImageView *ivBottom = [UIImageView imageViewWithName:@"guide_one_bottom"];
        ivBottom.xm_y = 318;
        ivBottom.xm_centerX = kScreen_Width / 2.0;
        [vwOneContent addSubview:ivBottom];
        
        
        ivOneBox = [UIImageView imageViewWithName:@"guide_one_box"];
        ivOneBox.xm_y = 5;
        ivOneBox.xm_x = 5;
        [vwPhotoBox addSubview:ivOneBox];
        
        ivOneBoxBottom = [UIImageView imageViewWithName:@"guide_one_box_bottom"];
        ivOneBoxBottom.xm_y = ivOneBox.xm_endY + 8;
        ivOneBoxBottom.xm_x = 8;
        [vwPhotoBox addSubview:ivOneBoxBottom];
        
    }
    // 第二页
    {
        UIImageView *ivTitle = [UIImageView imageViewWithName:@"guide_two_label"];
        ivTitle.xm_y = 40;
        ivTitle.xm_centerX = kScreen_Width / 2.0;
        [vwTwoContent addSubview:ivTitle];
        
        
        ivTwoTop = [UIImageView imageViewWithName:@"guide_two_top"];
        ivTwoTop.xm_y = 10;
        ivTwoTop.xm_x = 8;
        ivTwoTop.alpha = 0;
        [vwPhotoBox addSubview:ivTwoTop];
        
        ivTwo1 = [UIImageView imageViewWithName:@"guide_two_1"];
        ivTwo1.xm_y = ivTwoTop.xm_endY + 10;
        ivTwo1.xm_x = 5;
        ivTwo1.alpha = 0;
        [vwPhotoBox addSubview:ivTwo1];
        
        ivTwo2 = [UIImageView imageViewWithName:@"guide_two_2"];
        ivTwo2.xm_y = ivTwoTop.xm_endY + 10;
        ivTwo2.xm_x = ivTwo1.xm_endX + 5;
        ivTwo2.alpha = 0;
        [vwPhotoBox addSubview:ivTwo2];
        
        ivTwo3 = [UIImageView imageViewWithName:@"guide_two_3"];
        ivTwo3.xm_y = ivTwo2.xm_endY + 5;
        ivTwo3.xm_x = ivTwo1.xm_endX + 5;
        ivTwo3.alpha = 0;
        [vwPhotoBox addSubview:ivTwo3];
        
        ivTwoBottom = [UIImageView imageViewWithName:@"guide_two_bottom"];
        ivTwoBottom.xm_y = ivTwo3.xm_endY + 10;
        ivTwoBottom.xm_x = 8;
        ivTwoBottom.alpha = 0;
        [vwPhotoBox addSubview:ivTwoBottom];
    }
    // 第三页
    {
        UIImageView *ivTitle = [UIImageView imageViewWithName:@"guide_three_label"];
        ivTitle.xm_y = 40;
        ivTitle.xm_centerX = kScreen_Width / 2.0;
        [vwThreeContent addSubview:ivTitle];
        

        ivThree1 = [UIImageView imageViewWithName:@"guide_three_1"];
        ivThree1.xm_y =  4;
        ivThree1.xm_x =  4;
        ivThree1.alpha = 0;
        [vwPhotoBox addSubview:ivThree1];
        
        ivThree2 = [UIImageView imageViewWithName:@"guide_three_2"];
        ivThree2.xm_y =  4;
        ivThree2.xm_x =  ivThree1.xm_endX + 4;
        ivThree2.alpha = 0;
        [vwPhotoBox addSubview:ivThree2];
        
        ivThree3 = [UIImageView imageViewWithName:@"guide_three_3"];
        ivThree3.xm_y =  4;
        ivThree3.xm_x =  ivThree2.xm_endX + 4;
        ivThree3.alpha = 0;
        [vwPhotoBox addSubview:ivThree3];
        
        ivThree4 = [UIImageView imageViewWithName:@"guide_three_4"];
        ivThree4.xm_y =  ivThree1.xm_endY + 4;
        ivThree4.xm_x =  4;
        ivThree4.alpha = 0;
        [vwPhotoBox addSubview:ivThree4];
        
        ivThree5 = [UIImageView imageViewWithName:@"guide_three_5"];
        ivThree5.xm_y =  ivThree1.xm_endY + 4;
        ivThree5.xm_x =  ivThree4.xm_endX + 4;
        ivThree5.alpha = 0;
        [vwPhotoBox addSubview:ivThree5];
        
        ivThree6 = [UIImageView imageViewWithName:@"guide_three_6"];
        ivThree6.xm_y =  ivThree1.xm_endY + 4;
        ivThree6.xm_x =  ivThree5.xm_endX + 4;
        ivThree6.alpha = 0;
        [vwPhotoBox addSubview:ivThree6];
        
    }
    // 第四页
    {
        UIImageView *ivTitle = [UIImageView imageViewWithName:@"guide_four_label"];
        ivTitle.xm_y = 40;
        ivTitle.xm_centerX = kScreen_Width / 2.0;
        [vwFourContent addSubview:ivTitle];
        

        ivFourTop = [UIImageView imageViewWithName:@"guide_four_top"];
        ivFourTop.xm_y =  4;
        ivFourTop.xm_x =  4;
        ivFourTop.alpha = 0;
        [vwPhotoBox addSubview:ivFourTop];
        
        ivFourCenter = [UIImageView imageViewWithName:@"guide_four_center"];
        ivFourCenter.xm_y =  ivFourTop.xm_endY + 8;
        ivFourCenter.xm_x =  4;
        ivFourCenter.alpha = 0;
        [vwPhotoBox addSubview:ivFourCenter];
        
        ivFourBottom1 = [UIImageView imageViewWithName:@"guide_four_bottom_1"];
        ivFourBottom1.xm_y =  ivFourCenter.xm_endY + 8;
        ivFourBottom1.xm_x =  4;
        ivFourBottom1.alpha = 0;
        [vwPhotoBox addSubview:ivFourBottom1];
        
        ivFourBottom2 = [UIImageView imageViewWithName:@"guide_four_bottom_2"];
        ivFourBottom2.xm_y =  ivFourCenter.xm_endY + 8;
        ivFourBottom2.xm_x =  ivFourBottom1.xm_endX + 4;
        ivFourBottom2.alpha = 0;
        [vwPhotoBox addSubview:ivFourBottom2];
        
        ivFourBottom3 = [UIImageView imageViewWithName:@"guide_four_bottom_3"];
        ivFourBottom3.xm_y =  ivFourCenter.xm_endY + 8;
        ivFourBottom3.xm_x =  ivFourBottom2.xm_endX + 4;
        ivFourBottom3.alpha = 0;
        [vwPhotoBox addSubview:ivFourBottom3];
        
        
    }
    svMain.contentSize = CGSizeMake(kScreen_Width * 4, kScreen_Height);
    
    
    // pageControl
    {
        vwPageControl = [[UIView alloc] init];
        vwPageControl.userInteractionEnabled = NO;
        pageIndicatorArr = [NSMutableArray array];
        CGFloat radius = 10;
        CGRect tmp_Frame = CGRectMake(0, 0, radius, radius);
        for (int i=0; i<4; i++) {
            UIView *page = [[UIView alloc] initWithFrame:tmp_Frame];
            if (i == 0) {
                page.backgroundColor = XMUIColor(214, 214, 214, 1);
            }else {
                page.backgroundColor = [UIColor whiteColor];
            }
            
            page.layer.cornerRadius = radius/2.0f;
            page.layer.borderWidth = 2;
            page.layer.borderColor = XMUIColor(214, 214, 214, 1).CGColor;
            
            [pageIndicatorArr addObject:page];
            
            [vwPageControl addSubview:page];
            tmp_Frame.origin.x += tmp_Frame.size.width * 2.5;
        }
        vwPageControl.xm_h = radius;
        vwPageControl.xm_w = radius * 8.5;
        vwPageControl.xm_endY = kScreen_Height - 40;
        vwPageControl.xm_centerX = kScreen_Width/2.0;
        [self addSubview:vwPageControl];
    }
    
    [self bringSubviewToFront:svMain];
    [self bringSubviewToFront:vwPhotoBox];
    [self bringSubviewToFront:vwPageControl];
}

- (void)setCurrentPageControlWithOffset:(CGFloat)
offset{
    int curIndex = offset / kScreen_Width;
    int nextIndex = curIndex + 1;
    CGFloat alpha = 1 - (offset - curIndex * kScreen_Width)/kScreen_Width;
    UIView *view = pageIndicatorArr[curIndex];
    view.backgroundColor = XMUIColor(214, 214, 214, alpha);
    if (nextIndex < pageIndicatorArr.count) {
        alpha = (offset - curIndex * kScreen_Width)/kScreen_Width;
        view = pageIndicatorArr[nextIndex];
        view.backgroundColor = XMUIColor(214, 214, 214, alpha);
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = scrollView.contentOffset.x;
    [self setCurrentPageControlWithOffset:offset];
    
    //相框旋转还原默认 以免影响下面坐标设置
    vwPhotoBox.transform = CGAffineTransformMakeRotation(0);
    //相框变化
    {
        //相框y轴变化
        if (offset < kScreen_Width / 2.0) {
            vwPhotoBox.xm_y = calculate(130, 80, 0, kScreen_Width / 2.0, offset);
        }else if (offset < kScreen_Width){
            vwPhotoBox.xm_y = calculate(80, 150, kScreen_Width / 2.0, kScreen_Width, offset);
        }else if (offset < kScreen_Width * 3 / 2.0){
            vwPhotoBox.xm_y = calculate(150, 112, kScreen_Width, kScreen_Width * 3 / 2.0, offset);
        }else if (offset < kScreen_Width * 2){
            vwPhotoBox.xm_y = calculate(112, 150, kScreen_Width * 3 / 2.0, kScreen_Width * 2, offset);
        }else if (offset <= kScreen_Width * 3){
            vwPhotoBox.xm_y = calculate(150, 165, kScreen_Width * 2 , kScreen_Width * 3, offset);
        }else if (offset > kScreen_Width * 3){
            vwPhotoBox.xm_y = 165;
        }
        
        //相框宽度变化
        if (offset <= kScreen_Width * (8 + 5) / 8.0) {
            vwPhotoBox.xm_w = 260;
        }else if (offset <= kScreen_Width * (8 + 8) / 8.0) {
            vwPhotoBox.xm_w = calculate(260, 226, kScreen_Width * (8 + 5) / 8.0, kScreen_Width * (8 + 8) / 8.0, offset);
        }else if (offset < kScreen_Width * (8 + 8 + 3.5) / 8.0){
            vwPhotoBox.xm_w = 226;
        }else if (offset <= kScreen_Width * (8 + 8 + 8) / 8.0) {
            vwPhotoBox.xm_w = calculate(226, 172, kScreen_Width * (8 + 8 + 3.5) / 8.0, kScreen_Width * (8 + 8 + 8) / 8.0, offset);
        }else if (offset > kScreen_Width * (8 + 8 + 8) / 8.0){
            vwPhotoBox.xm_w = 172;
        }
        vwPhotoBox.xm_centerX = kScreen_Width / 2.0;
        
        //相框高度变化
        if (offset < kScreen_Width * 4 / 8.0) {
            vwPhotoBox.xm_h = calculate(181, 330, 0, kScreen_Width / 2.0, offset);
        }else if (offset < kScreen_Width * (8 + 4) / 8.0) {
            vwPhotoBox.xm_h = calculate(330, 327, kScreen_Width, kScreen_Width * (8 + 4) / 8.0, offset);
        }else if (offset < kScreen_Width * (8 + 8 + 3.5) / 8.0){
            vwPhotoBox.xm_h = 327;
        }else if (offset <= kScreen_Width * (8 + 8 + 8) / 8.0) {
            vwPhotoBox.xm_h = calculate(327, 262.5, kScreen_Width * (8 + 8 + 3.5) / 8.0, kScreen_Width * (8 + 8 + 8) / 8.0, offset);
        }else if (offset > kScreen_Width * (8 + 8 + 8) / 8.0){
            vwPhotoBox.xm_h = 262.5;
        }
    }
    
    //第一页
    {
        if (offset <= kScreen_Width / 4.0) {
            ivOneBox.xm_y = calculate(5, 10, 0, kScreen_Width / 4.0, offset);
            ivOneBox.alpha = calculate(1, 0, 0, kScreen_Width / 4.0, offset);
        }else{
            ivOneBox.xm_y = 10;
            ivOneBox.alpha = 0;
        }
        
        if (offset <= kScreen_Width / 3.0) {
            ivOneBoxBottom.alpha = calculate(1, 0, 0,kScreen_Width / 3.0, offset);
        }else{
            ivOneBoxBottom.alpha = 0;
        }
        ivOneBox.xm_centerX = vwPhotoBox.xm_w / 2.0;
        ivOneBoxBottom.xm_y = ivOneBox.xm_endY + 8;
        ivOneBoxBottom.xm_x = ivOneBox.xm_x;
    }
    
    //第二页
    {
        if (offset <= kScreen_Width * 4 / 8.0) {
            ivTwoTop.alpha = 0;
        }else if (offset <= kScreen_Width * 8 / 8.0){
            ivTwoTop.alpha = calculate(0, 1, kScreen_Width * 4 / 8.0, kScreen_Width * 8 / 8.0, offset);
        }else if (offset <= kScreen_Width * 8 / 8.0){
            ivTwoTop.alpha = 1;
        }else if (offset <= kScreen_Width * (8 + 2) / 8.0){
            ivTwoTop.alpha = calculate(1, 0, kScreen_Width * 8 / 8.0, kScreen_Width * (8 + 2) / 8.0, offset);
        }else if (offset > kScreen_Width * (8 + 2) / 8.0){
            ivTwoTop.alpha = 0;
        }
        
        
        
        
        if (offset <= kScreen_Width * 2 / 8.0) {
            ivTwo1.alpha = 0;
        }else if (offset <= kScreen_Width * 4 / 8.0){
            ivTwo1.alpha = calculate(0, 1, kScreen_Width * 2 / 8.0, kScreen_Width * 4 / 8.0, offset);
        }else if (offset <= kScreen_Width * 8 / 8.0){
            ivTwo1.alpha = 1;
        }else if (offset <= kScreen_Width * (8 + 2) / 8.0){
            ivTwo1.alpha = calculate(1, 0, kScreen_Width * 8 / 8.0, kScreen_Width * (8 + 2) / 8.0, offset);
        }else if (offset > kScreen_Width * (8 + 2) / 8.0){
            ivTwo1.alpha = 0;
        }
        
        if (offset <= kScreen_Width * 2 / 8.0) {
            ivTwo1.xm_w = 50;
            ivTwo1.xm_h = 50;
        }else if (offset <= kScreen_Width * 4 / 8.0){
            ivTwo1.xm_w = calculate(50, 165, kScreen_Width * 2 / 8.0, kScreen_Width * 4 / 8.0, offset);
            ivTwo1.xm_h = calculate(50, 165, kScreen_Width * 2 / 8.0, kScreen_Width * 4 / 8.0, offset);
        }else if (offset > kScreen_Width * 4 / 8.0){
            ivTwo1.xm_w = 165;
            ivTwo1.xm_h = 165;
        }
        
        
        
        if (offset <= kScreen_Width  * 3 / 8.0) {
            ivTwo2.alpha = 0;
        }else if (offset <= kScreen_Width * 5 / 8.0){
            ivTwo2.alpha = calculate(0, 1, kScreen_Width * 3 / 8.0, kScreen_Width * 5 / 8.0, offset);
        }else if (offset <= kScreen_Width * (8 + 1.5) / 8.0){
            ivTwo2.alpha = 1;
        }else if (offset <= kScreen_Width * (8 + 2.5) / 8.0){
            ivTwo2.alpha = calculate(1, 0, kScreen_Width * (8 + 1.5) / 8.0, kScreen_Width * (8 + 2.5) / 8.0, offset);
        }else if (offset > kScreen_Width * (8 + 2.5) / 8.0){
            ivTwo2.alpha = 0;
        }
        
        if (offset <= kScreen_Width * 3 / 8.0) {
            ivTwo2.xm_w = 30;
            ivTwo2.xm_h = 30;
        }else if (offset <= kScreen_Width * 5 / 8.0){
            ivTwo2.xm_w = calculate(30, 80, kScreen_Width * 3 / 8.0, kScreen_Width * 5 / 8.0, offset);
            ivTwo2.xm_h = calculate(30, 80, kScreen_Width * 3 / 8.0, kScreen_Width * 5 / 8.0, offset);
        }else if (offset > kScreen_Width * 5 / 8.0){
            ivTwo2.xm_w = 80;
            ivTwo2.xm_h = 80;
        }
        
        
        
        if (offset <= kScreen_Width * 4 / 8.0) {
            ivTwo3.alpha = 0;
        }else if (offset <= kScreen_Width * 6 / 8.0){
            ivTwo3.alpha = calculate(0, 1, kScreen_Width * 4 / 8.0, kScreen_Width * 6 / 8.0, offset);
        }else if (offset <= kScreen_Width * (8 + 2) / 8.0){
            ivTwo3.alpha = 1;
        }else if (offset <= kScreen_Width * (8 + 3) / 8.0){
            ivTwo3.alpha = calculate(1, 0, kScreen_Width * (8 + 2) / 8.0, kScreen_Width * (8 + 3) / 8.0, offset);
        }else if (offset > kScreen_Width * (8 + 3) / 8.0){
            ivTwo3.alpha = 0;
        }
        
        if (offset <= kScreen_Width * 4 / 8.0) {
            ivTwo3.xm_w = 30;
            ivTwo3.xm_h = 30;
        }else if (offset <= kScreen_Width * 6 / 8.0){
            ivTwo3.xm_w = calculate(30, 80, kScreen_Width * 4 / 8.0, kScreen_Width * 6 / 8.0, offset);
            ivTwo3.xm_h = calculate(30, 80, kScreen_Width * 4 / 8.0, kScreen_Width * 6 / 8.0, offset);
        }else if (offset > kScreen_Width * 6 / 8.0){
            ivTwo3.xm_w = 80;
            ivTwo3.xm_h = 80;
        }

        
        
        
        if (offset <= kScreen_Width * 4 / 8.0) {
            ivTwoBottom.alpha = 0;
        }else if (offset <= kScreen_Width * 8 / 8){
            ivTwoBottom.alpha = calculate(0, 1, kScreen_Width * 4 / 8.0, kScreen_Width * 8 / 8, offset);
        }else if (offset <= kScreen_Width * 8 / 8.0){
            ivTwoBottom.alpha = 1;
        }else if (offset <= kScreen_Width * (8 + 2) / 8.0){
            ivTwoBottom.alpha = calculate(1, 0, kScreen_Width * 8 / 8.0, kScreen_Width * (8 + 2) / 8.0, offset);
        }else if (offset > kScreen_Width * (8 + 2) / 8.0){
            ivTwoBottom.alpha = 0;
        }
        
    }
    
    //第三页
    {
        ivThree1.transform = CGAffineTransformMakeScale(1.0,1.0);
        if (offset <=  kScreen_Width * (8 + 2) / 8.0) {
            ivThree1.alpha = 0;
        }else if (offset <= kScreen_Width * (8 + 3.5) / 8.0){
            ivThree1.alpha = calculate(0, 1, kScreen_Width * (8 + 2) / 8.0, kScreen_Width * (8 + 3.5) / 8.0, offset);
        }
        ivThree1.xm_centerX = vwPhotoBox.xm_w / 2.0 - 4 - ivThree1.xm_w;
        ivThree1.xm_centerY = vwPhotoBox.xm_h / 2.0 - 4 / 2.0 - ivThree1.xm_h / 2.0;
        if (offset <= kScreen_Width * (8 + 8 + 2) / 8.0) {
            ivThree1.transform = CGAffineTransformMakeScale(1.0,1.0);
        }else if (offset <= kScreen_Width * (8 + 8 + 3.5) /8.0){
            CGFloat scale = calculate(1, 0 , kScreen_Width * (8 + 8 + 2) / 8.0, kScreen_Width * (8 + 8 + 3.5) /8.0, offset);
            ivThree1.transform = CGAffineTransformMakeScale(scale,scale);
        }else if (offset > kScreen_Width * (8 + 8 + 3.5) /8.0){
            ivThree1.transform = CGAffineTransformMakeScale(0,0);
        }
        
        
        
        ivThree2.transform = CGAffineTransformMakeScale(1.0,1.0);
        if (offset <=  kScreen_Width * (8 + 2.5) / 8.0) {
            ivThree2.alpha = 0;
        }else if (offset <= kScreen_Width * (8 + 4) / 8.0){
            ivThree2.alpha = calculate(0, 1, kScreen_Width * (8 + 2.5) / 8.0, kScreen_Width * (8 + 4) / 8.0, offset);
        }
        ivThree2.xm_centerX = vwPhotoBox.xm_w / 2.0;
        ivThree2.xm_centerY = vwPhotoBox.xm_h / 2.0 - 4 / 2.0 - ivThree2.xm_h / 2.0;
        if (offset <= kScreen_Width * (8 + 8 + 1.5) / 8.0) {
            ivThree2.transform = CGAffineTransformMakeScale(1.0,1.0);
        }else if (offset <= kScreen_Width * (8 + 8 + 3) /8.0){
            CGFloat scale = calculate(1, 0 , kScreen_Width * (8 + 8 + 1.5) / 8.0, kScreen_Width * (8 + 8 + 3) /8.0, offset);
            ivThree2.transform = CGAffineTransformMakeScale(scale,scale);
        }else if (offset > kScreen_Width * (8 + 8 + 3) /8.0){
            ivThree2.transform = CGAffineTransformMakeScale(0,0);
        }
        
        
        ivThree3.transform = CGAffineTransformMakeScale(1.0,1.0);
        if (offset <=  kScreen_Width * (8 + 3) / 8.0) {
            ivThree3.alpha = 0;
        }else if (offset <= kScreen_Width * (8 + 4.5) / 8.0){
            ivThree3.alpha = calculate(0, 1, kScreen_Width * (8 + 3) / 8.0, kScreen_Width * (8 + 4.5) / 8.0, offset);
        }
        ivThree3.xm_centerX = vwPhotoBox.xm_w / 2.0 + 4 + ivThree3.xm_w;
        ivThree3.xm_centerY = vwPhotoBox.xm_h / 2.0 - 4 / 2.0 - ivThree3.xm_h / 2.0;
        if (offset <= kScreen_Width * (8 + 8 + 1) / 8.0) {
            ivThree3.transform = CGAffineTransformMakeScale(1.0,1.0);
        }else if (offset <= kScreen_Width * (8 + 8 + 2.5) /8.0){
            CGFloat scale = calculate(1, 0 , kScreen_Width * (8 + 8 + 1) / 8.0, kScreen_Width * (8 + 8 + 2.5) /8.0, offset);
            ivThree3.transform = CGAffineTransformMakeScale(scale,scale);
        }else if (offset > kScreen_Width * (8 + 8 + 2.5) /8.0){
            ivThree3.transform = CGAffineTransformMakeScale(0,0);
        }
        
        
        
        ivThree4.transform = CGAffineTransformMakeScale(1.0,1.0);
        if (offset <=  kScreen_Width * (8 + 3.5) / 8.0) {
            ivThree4.alpha = 0;
        }else if (offset <= kScreen_Width * (8 + 5) / 8.0){
            ivThree4.alpha = calculate(0, 1, kScreen_Width * (8 + 3.5) / 8.0, kScreen_Width * (8 + 5) / 8.0, offset);
        }
        ivThree4.xm_centerX = vwPhotoBox.xm_w / 2.0 - 4 - ivThree4.xm_w;
        ivThree4.xm_centerY = vwPhotoBox.xm_h / 2.0 + 4 / 2.0 + ivThree4.xm_h / 2.0;
        if (offset <= kScreen_Width * (8 + 8 + 1) / 8.0) {
            ivThree4.transform = CGAffineTransformMakeScale(1.0,1.0);
        }else if (offset <= kScreen_Width * (8 + 8 + 2.5) /8.0){
            CGFloat scale = calculate(1, 0 , kScreen_Width * (8 + 8 + 1) / 8.0, kScreen_Width * (8 + 8 + 2.5) /8.0, offset);
            ivThree4.transform = CGAffineTransformMakeScale(scale,scale);
        }else if (offset > kScreen_Width * (8 + 8 + 2.5) /8.0){
            ivThree4.transform = CGAffineTransformMakeScale(0,0);
        }
        
        
        
        ivThree5.transform = CGAffineTransformMakeScale(1.0,1.0);
        if (offset <=  kScreen_Width * (8 + 4) / 8.0) {
            ivThree5.alpha = 0;
        }else if (offset <= kScreen_Width * (8 + 5.5) / 8.0){
            ivThree5.alpha = calculate(0, 1, kScreen_Width * (8 + 4) / 8.0, kScreen_Width * (8 + 5.5) / 8.0, offset);
        }
        ivThree5.xm_centerX = vwPhotoBox.xm_w / 2.0;
        ivThree5.xm_centerY = vwPhotoBox.xm_h / 2.0 + 4 / 2.0 + ivThree5.xm_h / 2.0;
        if (offset <= kScreen_Width * (8 + 8 + 1.5) / 8.0) {
            ivThree5.transform = CGAffineTransformMakeScale(1.0,1.0);
        }else if (offset <= kScreen_Width * (8 + 8 + 3) /8.0){
            CGFloat scale = calculate(1, 0 , kScreen_Width * (8 + 8 + 1.5) / 8.0, kScreen_Width * (8 + 8 + 3) /8.0, offset);
            ivThree5.transform = CGAffineTransformMakeScale(scale,scale);
        }else if (offset > kScreen_Width * (8 + 8 + 3) /8.0){
            ivThree5.transform = CGAffineTransformMakeScale(0,0);
        }
        
        
        ivThree6.transform = CGAffineTransformMakeScale(1.0,1.0);
        if (offset <=  kScreen_Width * (8 + 4.5) / 8.0) {
            ivThree6.alpha = 0;
        }else if (offset <= kScreen_Width * (8 + 6) / 8.0){
            ivThree6.alpha = calculate(0, 1, kScreen_Width * (8 + 4.5) / 8.0, kScreen_Width * (8 + 6) / 8.0, offset);
        }
        ivThree6.xm_centerX = vwPhotoBox.xm_w / 2.0 + 4 + ivThree6.xm_w;
        ivThree6.xm_centerY = vwPhotoBox.xm_h / 2.0 + 4 / 2.0 + ivThree6.xm_h / 2.0;
        if (offset <= kScreen_Width * (8 + 8 + 2) / 8.0) {
            ivThree6.transform = CGAffineTransformMakeScale(1.0,1.0);
        }else if (offset <= kScreen_Width * (8 + 8 + 3.5) /8.0){
            CGFloat scale = calculate(1, 0 , kScreen_Width * (8 + 8 + 2) / 8.0, kScreen_Width * (8 + 8 + 3.5) /8.0, offset);
            ivThree6.transform = CGAffineTransformMakeScale(scale,scale);
        }else if (offset > kScreen_Width * (8 + 8 + 3.5) /8.0){
            ivThree6.transform = CGAffineTransformMakeScale(0,0);
        }
    }
    //第四页
    {
        if (offset <= kScreen_Width * (8 + 8 + 3) /8.0) {
            ivFourTop.alpha = 0;
        }else if (offset <= kScreen_Width * (8 + 8 + 5) /8.0){
            ivFourTop.alpha = calculate(0, 1, kScreen_Width * (8 + 8 + 3) /8.0, kScreen_Width * (8 + 8 + 5) /8.0, offset);
        }else if (offset > kScreen_Width * (8 + 8 + 5) /8.0){
            ivFourTop.alpha = 1;
        }
        ivFourTop.xm_centerX = vwPhotoBox.xm_w / 2.0;
        ivFourTop.xm_y = (vwPhotoBox.xm_h - 262.5)/2 + 4;
        
        
        
        if (offset <= kScreen_Width * (8 + 8 + 3.5) /8.0) {
            ivFourCenter.alpha = 0;
        }else if (offset <= kScreen_Width * (8 + 8 + 5) /8.0){
            ivFourCenter.alpha = calculate(0, 1, kScreen_Width * (8 + 8 + 3.5) /8.0, kScreen_Width * (8 + 8 + 5) /8.0, offset);
        }else if (offset > kScreen_Width * (8 + 8 + 5) /8.0){
            ivFourCenter.alpha = 1;
        }
        ivFourCenter.xm_x = ivFourTop.xm_x;
        ivFourCenter.xm_y = ivFourTop.xm_endY + 8;
        
        
        if (offset <= kScreen_Width * (8 + 8 + 4) /8.0) {
            ivFourBottom1.alpha = 0;
            ivFourBottom1.xm_w = 0;
            ivFourBottom1.xm_h = 0;
        }else if (offset <= kScreen_Width * (8 + 8 + 6) /8.0){
            ivFourBottom1.alpha = calculate(0, 1, kScreen_Width * (8 + 8 + 4) /8.0, kScreen_Width * (8 + 8 + 6) /8.0, offset);
            ivFourBottom1.xm_w = calculate(0, 52, kScreen_Width * (8 + 8 + 4) /8.0, kScreen_Width * (8 + 8 + 6) /8.0, offset);
            ivFourBottom1.xm_h = calculate(0, 80, kScreen_Width * (8 + 8 + 4) /8.0, kScreen_Width * (8 + 8 + 6) /8.0, offset);;
        }else if (offset > kScreen_Width * (8 + 8 + 6) /8.0){
            ivFourBottom1.alpha = 1;
            ivFourBottom1.xm_w = 52;
            ivFourBottom1.xm_h = 80;
        }
        ivFourBottom1.xm_x = ivFourTop.xm_x;
        ivFourBottom1.xm_y = ivFourCenter.xm_endY + 8;
        
        
        if (offset <= kScreen_Width * (8 + 8 + 4.5) /8.0) {
            ivFourBottom2.alpha = 0;
            ivFourBottom2.xm_w = 0;
            ivFourBottom2.xm_h = 0;
        }else if (offset <= kScreen_Width * (8 + 8 + 6.5) /8.0){
            ivFourBottom2.alpha = calculate(0, 1, kScreen_Width * (8 + 8 + 4.5) /8.0, kScreen_Width * (8 + 8 + 6.5) /8.0, offset);
            ivFourBottom2.xm_w = calculate(0, 52, kScreen_Width * (8 + 8 + 4.5) /8.0, kScreen_Width * (8 + 8 + 6.5) /8.0, offset);;
            ivFourBottom2.xm_h = calculate(0, 80, kScreen_Width * (8 + 8 + 4.5) /8.0, kScreen_Width * (8 + 8 + 6.5) /8.0, offset);;
        }else if (offset > kScreen_Width * (8 + 8 + 6.5) /8.0){
            ivFourBottom2.alpha = 1;
            ivFourBottom2.xm_w = 52;
            ivFourBottom2.xm_h = 80;
        }
        ivFourBottom2.xm_x = ivFourTop.xm_x + 52 + 4;
        ivFourBottom2.xm_y = ivFourCenter.xm_endY + 8;
        
        
        if (offset <= kScreen_Width * (8 + 8 + 5) /8.0) {
            ivFourBottom3.alpha = 0;
            ivFourBottom3.xm_w = 0;
            ivFourBottom3.xm_h = 0;
        }else if (offset <= kScreen_Width * (8 + 8 + 7) /8.0){
            ivFourBottom3.alpha = calculate(0, 1, kScreen_Width * (8 + 8 + 5) /8.0, kScreen_Width * (8 + 8 + 7) /8.0, offset);
            ivFourBottom3.xm_w = calculate(0, 52, kScreen_Width * (8 + 8 + 5) /8.0, kScreen_Width * (8 + 8 + 7) /8.0, offset);
            ivFourBottom3.xm_h = calculate(0, 80, kScreen_Width * (8 + 8 + 5) /8.0, kScreen_Width * (8 + 8 + 7) /8.0, offset);
        }else if (offset > kScreen_Width * (8 + 8 + 7) /8.0){
            ivFourBottom3.alpha = 1;
            ivFourBottom3.xm_w = 52;
            ivFourBottom3.xm_h = 80;
        }
        ivFourBottom3.xm_x = ivFourTop.xm_x + 52 + 4 + 52 + 4;
        ivFourBottom3.xm_y = ivFourCenter.xm_endY + 8;
        
    }
    
    //相框旋转
    {
        if (offset <= kScreen_Width * 3) {
            CGFloat angle = calculate(0, 15*M_PI/180.0 , kScreen_Width * 4 / 2.0, kScreen_Width * 3, offset);
            NSLog(@"angle:%lf",angle);
            vwPhotoBox.transform = CGAffineTransformMakeRotation(-angle);
        }
    }
}


float calculate(float begin, float end, float lowerBound, float upperBound, float curVal){
    float res;
    
    if (curVal<lowerBound) {
        curVal = lowerBound;
    }
    if (curVal>upperBound) {
        curVal = upperBound;
    }
    float t = (curVal-lowerBound) / (upperBound-lowerBound);
    
    res = begin + (end-begin)*t;
    
    return res;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
