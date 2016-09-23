//
//  ViewController.m
//  FashionStoreObjC
//
//  Created by Tuan-Vi Phan on 9/19/16.
//  Copyright © 2016 Tuan-Vi Phan. All rights reserved.
//

#import "SplashViewController.h"
#import "FeaturedViewController.h"
#import "ShopViewController.h"
#import "LeftShopViewController.h"
#import "RightShopViewController.h"
#import "Masonry.h"
#import "SWRevealViewController.h"

@interface SplashViewController ()
//@property (strong, nonatomic) UIScrollView *scrollView;
@end

@implementation SplashViewController

//- (id)init {
//    self = [super init];
//    if (!self) return nil;

//    UIScrollView *scrlView = UIScrollView.new;
//    self.scrollView = scrlView;
//    scrlView.backgroundColor = [UIColor grayColor];
//    [self.scrollView addSubview:scrlView];

//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViews];
}

- (void)setupViews {
    
    UIScrollView *scrollView = UIScrollView.new;
    scrollView.backgroundColor = [UIColor blackColor];
    scrollView.frame = self.view.bounds;
    
    UIView *contentView = UIView.new;
    contentView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bitmapView = UIImageView.new;
    bitmapView.image = [UIImage imageNamed:@"bitmapView"];
    [bitmapView setUserInteractionEnabled:YES];
    
    UIImageView *logoImgView = UIImageView.new;
    logoImgView.image = [UIImage imageNamed:@"logo"];
    
    UILabel *welcomeLabel = UILabel.new;
    welcomeLabel.textColor = [UIColor whiteColor];
    welcomeLabel.text = @"Welcome to Indeux";
    welcomeLabel.font = [UIFont fontWithName:@"Lato-Light" size:30];
    
    UILabel *detailLabel = UILabel.new;
    detailLabel.textColor = [UIColor whiteColor];
    detailLabel.text = @"Tell us your interests";
    detailLabel.font = [UIFont fontWithName:@"Lato-Light" size:16];
    
    UIImageView *womanImgView = UIImageView.new;
    womanImgView.image = [UIImage imageNamed:@"womanView"];
    womanImgView.contentMode = UIViewContentModeScaleAspectFit;
    [womanImgView setUserInteractionEnabled:YES];
    
    UIImageView *manImgView = UIImageView.new;
    manImgView.image = [UIImage imageNamed:@"manView"];
    manImgView.contentMode = UIViewContentModeScaleAspectFit;
    [manImgView setUserInteractionEnabled:YES];
    
    UIButton *womanButton = UIButton.new;
    [womanButton setTitle:@"Woman Fashion" forState: UIControlStateNormal];
    [womanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [womanButton titleLabel].font = [UIFont fontWithName:@"Lato-Light" size:14];
    womanButton.backgroundColor = [UIColor blackColor];
    [womanButton setUserInteractionEnabled:YES];
    [womanButton addTarget:self action:@selector(womanButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *manButton = UIButton.new;
    [manButton setTitle:@"Man Fashion" forState: UIControlStateNormal];
    [manButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [manButton titleLabel].font = [UIFont fontWithName:@"Lato-Light" size:14];
    manButton.backgroundColor = [UIColor blackColor];
    [manButton setUserInteractionEnabled:YES];
    [manButton addTarget:self action:@selector(manButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [scrollView addSubview:contentView];
    scrollView.contentSize = contentView.bounds.size;
    [self.view addSubview:scrollView];
    
    [contentView addSubview:bitmapView];
    [bitmapView addSubview:logoImgView];
    [bitmapView addSubview:welcomeLabel];
    [bitmapView addSubview:detailLabel];
    [bitmapView addSubview:womanImgView];
    [bitmapView addSubview:manImgView];
    [womanImgView addSubview:womanButton];
    [manImgView addSubview:manButton];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollView.mas_top);
        make.bottom.equalTo(scrollView.mas_bottom);
        make.width.equalTo(self.view.mas_width);
//        make.height.equalTo(@667);
    }];
    
    [bitmapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(contentView).insets(UIEdgeInsetsZero);
    }];

    [logoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(contentView);
        make.top.equalTo(contentView.mas_top).offset(70);
    }];
    
    [welcomeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(contentView);
        make.top.equalTo(logoImgView.mas_bottom).offset(30);
    }];
    
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(contentView);
        make.top.equalTo(welcomeLabel.mas_bottom).offset(10);
    }];
    
    [womanImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(detailLabel.mas_bottom).offset(10);
        make.right.equalTo(contentView.mas_right).offset(-10);
        make.left.equalTo(contentView.mas_left).offset(10);
    }];
    
    [manImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(womanImgView.mas_bottom).offset(10);
        make.right.equalTo(contentView.mas_right).offset(-10);
        make.left.equalTo(contentView.mas_left).offset(10);
    }];
    
    [womanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(womanImgView.mas_bottom).offset(-8);
        make.centerX.equalTo(womanImgView);
        make.height.equalTo(@30);
        make.width.equalTo(womanImgView.mas_width).multipliedBy(0.4);
    }];
    
    [manButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(manImgView.mas_bottom).offset(-8);
        make.centerX.equalTo(manImgView);
        make.height.equalTo(@30);
        make.width.equalTo(manImgView.mas_width).multipliedBy(0.4);
    }];
}

- (void)womanButtonPressed: (UIButton *) button {
    NSLog(@"womanButton");
    
    FeaturedViewController *featuredVC = FeaturedViewController.new;
    UINavigationController *featuredNav = [[UINavigationController alloc] initWithRootViewController:featuredVC];
    UITabBarItem *featuredItem = [[UITabBarItem alloc] initWithTitle:@"Featured" image:[UIImage imageNamed:@"featured"] tag:0];
    featuredVC.tabBarItem = featuredItem;
    
    // Shop View Controller
    ShopViewController *shopVC = ShopViewController.new;
    UINavigationController *shopNav = [[UINavigationController alloc] initWithRootViewController:shopVC];
    LeftShopViewController *leftShopVC = LeftShopViewController.new;
    RightShopViewController *rightShopVC = RightShopViewController.new;
    SWRevealViewController *revealController = [[SWRevealViewController alloc] initWithRearViewController:leftShopVC frontViewController:shopNav];
//    revealController.delegate = self;
    revealController.rightViewController = rightShopVC;
    _revealViewController = revealController;
    
    UITabBarItem *shopItem = [[UITabBarItem alloc] initWithTitle:@"Shop" image:[UIImage imageNamed:@"merchant"] tag:1];
    _revealViewController.tabBarItem = shopItem;
    
    UITabBarController *tabBarCtrl = [[UITabBarController alloc] init];
    tabBarCtrl.viewControllers = @[featuredNav, _revealViewController];
    
    [self presentViewController:tabBarCtrl animated:YES completion:nil];
}

- (void)manButtonPressed: (UIButton *) button {
    NSLog(@"manButton");
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
