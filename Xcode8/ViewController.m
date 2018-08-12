//
//  ViewController.m
//  Xcode8
//
//  Created by 伟运体育 on 2017/9/21.
//  Copyright © 2017年 伟运体育. All rights reserved.
//

#import "ViewController.h"

#define mm ([UIScreen mainScreen].bounds.size.width - 100)/5

@interface ViewController ()

@property (nonatomic,strong)UIImageView *imageView;

@property (nonatomic,strong)UIImageView *imageV;

@property (nonatomic,assign)NSInteger count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    UIColor *color = [UIColor colorNamed:@"Color"];
////    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 88, 200, 100)];
////    label.backgroundColor = color;
////    [self.view addSubview:label];
////    label.font = [UIFont systemFontOfSize:22];
////    label.text = @"hi";
//
//    UIScrollView *scllow = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 88, CGRectGetWidth(self.view.frame), 200)];
//    scllow.backgroundColor = [UIColor yellowColor];
//    scllow.scrollEnabled = YES;
////    scllow.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAutomatic;
//    scllow.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame), 600);
//    [self.view addSubview:scllow];
//
//    for (int i = 0; i<5; i++) {
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, i*120, CGRectGetWidth(scllow.frame), 100)];
//
//        view.backgroundColor = color;
//        [scllow addSubview:view];
//    }
//
//    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 200) style:UITableViewStyleGrouped];
//    tableView.backgroundColor = [UIColor cyanColor];
//    [self.view addSubview:tableView];
    
    
//    NSInteger n = 12;
//    UIView *polygonView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
//
//    // 绘制正n变形
//    // 绘制正n变形
//
//    CGFloat X = polygonView.frame.size.width  * 0.5;
//
//    CGFloat Y = polygonView.frame.size.height * 0.5;
//
//    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
//
//    bezierPath.lineCapStyle = kCGLineCapRound;
//
//    bezierPath.lineJoinStyle = kCGLineCapRound;
//
//    CGFloat angle = labs(360/n);
//
//    [bezierPath moveToPoint: CGPointMake(X - X , Y)];
//
//    for (int i = 0; i < n - 1; i ++) {
//
//        CGFloat angle1 = angle *(i + 1);
//
//        CGFloat X1 = X + (X * (cos(M_PI *angle1/180)))*(-1);
//
//        CGFloat Y1 = Y + X * (sin(M_PI *angle1/180));
//
//        [bezierPath addLineToPoint: CGPointMake(X1, Y1)];
//
//    }
//
//    [bezierPath addLineToPoint: CGPointMake(X - X , Y)];
//
//    CAShapeLayer *layer = [CAShapeLayer layer];
//
//    layer.path = [bezierPath CGPath];
//
//    polygonView.backgroundColor = [UIColor redColor];
//
//    polygonView.layer.mask = layer;
//    [self.view addSubview:polygonView];
//
//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(200, 100, 100, 100)];
//    view.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:view];
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(200, 200, 100, 100);
//    [btn setImage:[UIImage imageNamed:@"微信图片_20180228105405_1"] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:@"微信图片_20180228105405_29"] forState:UIControlStateSelected];
//    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//
//    UIImageView *imageView = [[UIImageView alloc]init];
//    imageView.frame = CGRectMake(0, 0, 100, 100);
//    [btn addSubview:imageView];
//
//    NSMutableArray *array = [NSMutableArray array];
//    for (int i = 1; i<29; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"微信图片_20180228105405_%d",i]];
//        [array addObject:image];
//    }
//    imageView.animationImages = array;
//    imageView.animationRepeatCount = 1;
//
//    self.imageView = imageView;
    
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(100, 200, 100, 100);
    btn.clipsToBounds = YES;
    [btn setImage:[UIImage imageNamed:@"微信图片_20180228105405_1"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"微信图片_20180228105405_29"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 2900, 100)];
    imageV.image = [UIImage imageNamed:@"WechatIMG28"];
//    imageV.clipsToBounds = YES;
    [btn addSubview:imageV];
    
    self.imageV = imageV;

}

//-(void)btnClick:(UIButton *)btn
//{ 
//    if (btn.selected) {
//        btn.selected = NO;
//    }else{
//        [self.imageView startAnimating];
//        btn.selected = YES;
//    }
//}

-(void)btnClick:(UIButton *)btn
{
    if (btn.selected) {
        btn.selected = NO;
    }else{
        NSTimer *timer = [NSTimer timerWithTimeInterval:0.04 target:self selector:@selector(btnTimer:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        _count = 0;
        
        btn.selected = YES;
    }
}

-(void)btnTimer:(NSTimer *)timer
{
    if (self.count>28) {
        [timer invalidate];
        timer = nil;
    }else{
        self.count++;
        self.imageV.frame = CGRectMake(-(self.count*100), 0, 2900, 100);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
