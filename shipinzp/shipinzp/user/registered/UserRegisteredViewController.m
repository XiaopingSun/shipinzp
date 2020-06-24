//
//  UserRegisteredViewController.m
//  shipinzp
//
//  Created by 房宇 on 2020/6/23.
//  Copyright © 2020 maita. All rights reserved.
//

#import "UserRegisteredViewController.h"

#import "UserBasicInformationViewController.h"


@interface UserRegisteredViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation UserRegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"33333333");
    
    [self.loginButton addTarget:self action:@selector(createUserBasicInformationViewController) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}


- (void)createUserBasicInformationViewController{
    
    
    UserBasicInformationViewController *basicInformationVC = [[UserBasicInformationViewController alloc] init];
    
    [self.navigationController pushViewController:basicInformationVC animated:YES];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
