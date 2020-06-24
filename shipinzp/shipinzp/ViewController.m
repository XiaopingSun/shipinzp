//
//  ViewController.m
//  shipinzp
//
//  Created by 房宇 on 2020/6/22.
//  Copyright © 2020 maita. All rights reserved.
//

#import "ViewController.h"

#import "UserRegisteredViewController.h"


#define WIDTH (NSInteger)self.view.bounds.size.width

#define HEIGHT (NSInteger)self.view.bounds.size.height


@interface ViewController ()

@property (nonatomic,strong) UIView * welcomeView;
@property (nonatomic,strong) UIScrollView * guideScrollView;


@end

@implementation ViewController

- (void)viewWillAppear{
    
    [self.view bringSubviewToFront:self.welcomeView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //判断是不是第一次启动应用
    
    
//    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
//    {
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
//        NSLog(@"第一次启动");
//        //如果是第一次启动的话,使用UserGuideViewController (用户引导页面) 作为根视图
//
//
//
////        [userGuideViewController sendBlock:^{
////
////            self.window.rootViewController = tabbarC;
////        }];
//
//    }
//    else
//    {
//        NSLog(@"不是第一次启动");
//        //如果不是第一次启动的话,使用LoginViewController作为根视图
//
//    }

    
    //欢迎页
    self.welcomeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    self.welcomeView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.welcomeView];
    
    
    UIImageView *welcomeImageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    welcomeImageView.backgroundColor = [UIColor whiteColor];
    [self.welcomeView addSubview:welcomeImageView];
    
    UIImage *welcomeImage = [UIImage imageNamed:@"welcome@3x.png"];
    welcomeImageView.contentMode = UIViewContentModeScaleAspectFit;
    welcomeImageView.image = welcomeImage;
    
    
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(removelunch) userInfo:nil repeats:NO];

    [NSTimer scheduledTimerWithTimeInterval:3.1 target:self selector:@selector(change) userInfo:nil repeats:NO];

    
    //引导图
    self.guideScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    [self.guideScrollView setContentSize:CGSizeMake(WIDTH * 3, 0)];
    self.guideScrollView.showsHorizontalScrollIndicator = FALSE;
    [self.guideScrollView setPagingEnabled:YES];//视图整页显示
    [self.guideScrollView setBounces:NO];//避免弹跳效果,避免把根视图露出来
    

    UIImageView *imageview1 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH / 2 - 140, 150, 280, 310)];
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"start_screen1" ofType:@"png"];
    imageview1.image = [UIImage imageWithContentsOfFile:path1];
    imageview1.contentMode = UIViewContentModeScaleAspectFit;

    [self.guideScrollView addSubview:imageview1];

    
    UIImageView *imageview2 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH + WIDTH / 2 - 140, 150, 280, 310)];
    
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"start_screen2" ofType:@"png"];
    imageview2.image = [UIImage imageWithContentsOfFile:path2];
    imageview2.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.guideScrollView addSubview:imageview2];

    
    UIImageView *imageview3 = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH * 2 + WIDTH / 2 - 140, 150, 280, 310)];
    
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"start_screen3" ofType:@"png"];
    imageview3.image = [UIImage imageWithContentsOfFile:path3];
    imageview3.contentMode = UIViewContentModeScaleAspectFit;

    [self.guideScrollView addSubview:imageview3];
    
    
    [self.view addSubview:self.guideScrollView];
    
    self.guideScrollView.userInteractionEnabled = YES;
    imageview1.userInteractionEnabled = YES;
    imageview2.userInteractionEnabled = YES;
    imageview3.userInteractionEnabled = YES;
    self.view.userInteractionEnabled = YES; //打开imageview3的用户交互;否则下面的button无法响应

    //打开imageview3的用户交互;否则下面的button无法响应


    
    //我要求职
    UIButton *userButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    userButton.frame = CGRectMake(self.view.frame.size.width/2 - 150, 500, 130, 35);
    
    NSString *wantJobPath = [[NSBundle mainBundle] pathForResource:@"wantjob@3x" ofType:@"png"];
    UIImage *wantJobImage = [UIImage imageWithContentsOfFile:wantJobPath];
    [userButton setBackgroundImage:wantJobImage forState:UIControlStateNormal];
    
    
    [userButton addTarget:self action:@selector(craeteUserRegisteredViewController) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:userButton];
    
    
//  我要招人
    UIButton *companyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    companyButton.frame = CGRectMake(self.view.frame.size.width/2 + 20, 500, 130, 35);

    NSString *wantPeoplePath = [[NSBundle mainBundle] pathForResource:@"wantpeople@3x" ofType:@"png"];
    UIImage *wantPeopleImage = [UIImage imageWithContentsOfFile:wantPeoplePath];
    [companyButton setBackgroundImage:wantPeopleImage forState:UIControlStateNormal];

    [self.view addSubview:companyButton];

    
    
    //欢迎页前置
    [self.view bringSubviewToFront:self.welcomeView];

    
    
    
    
}

-(void)removelunch{

    [self.welcomeView removeFromSuperview];

}

- (void)change{

    //self.view.window.rootViewController = [[firstVC alloc] init];

}


- (void)craeteUserRegisteredViewController{
    
    
    
    UserRegisteredViewController *userRegisteredVC = [[UserRegisteredViewController alloc] init];
    UINavigationController *userRegisteredNC = [[UINavigationController alloc] initWithRootViewController:userRegisteredVC];
    
    [self presentViewController:userRegisteredNC animated:YES completion:^{
        
        
    }];
}


@end
