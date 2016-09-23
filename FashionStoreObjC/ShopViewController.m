//
//  ShopViewController.m
//  FashionStoreObjC
//
//  Created by Tuan-Vi Phan on 9/20/16.
//  Copyright © 2016 Tuan-Vi Phan. All rights reserved.
//

#import "ShopViewController.h"
#import "SWRevealViewController.h"
#import "LeftShopViewController.h"
#import "RightShopViewController.h"
#import "Product.h"
#import "ShopCollectionViewCell.h"
#import "Masonry.h"

static NSString * const cellReuseIdentifier = @"cell";

@interface ShopViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>
@property (nonatomic) NSArray *products;
@property (nonatomic) UICollectionView *collectionView;
@end

@implementation ShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    // set title
    UIImageView *titleImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logoNav"]];
    titleImg.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = titleImg;
    
    // Change NavigationBar Color
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [revealController panGestureRecognizer];
    [revealController tapGestureRecognizer];
    
    // set Left Bar Button Item
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"dress"] forState:UIControlStateNormal];
    [leftButton addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame = CGRectMake(0, 0, 53, 31);
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(-1, -10, 0, 32);
    UILabel *labelLeftButton = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 50, 20)];
    labelLeftButton.font = [UIFont fontWithName:@"Lato-Regular" size:14];
    labelLeftButton.text = @"DRESS";
    labelLeftButton.textAlignment = NSTextAlignmentCenter;
    labelLeftButton.textColor = [UIColor whiteColor];
    labelLeftButton.backgroundColor = [UIColor clearColor];
    [leftButton addSubview:labelLeftButton];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftBarButton;
    
    // set Right Bar Button Item
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"filter"] forState:UIControlStateNormal];
    [rightButton addTarget:revealController action:@selector(rightRevealToggle:) forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame = CGRectMake(0, 0, 53, 31);
    rightButton.imageEdgeInsets = UIEdgeInsetsMake(-1, 32, 0, -10);
    UILabel *labelRightButton = [[UILabel alloc] initWithFrame:CGRectMake(-15, 5, 50, 20)];
    labelRightButton.font = [UIFont fontWithName:@"Lato-Regular" size:14];
    labelRightButton.text = @"FILTER";
    labelRightButton.textAlignment = NSTextAlignmentCenter;
    labelRightButton.textColor = [UIColor whiteColor];
    labelRightButton.backgroundColor = [UIColor clearColor];
    [rightButton addSubview:labelRightButton];
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    [self setupViews];
    [self addProducts];
}

- (void)setupViews {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CGRect frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - 20, self.view.frame.size.width, self.view.frame.size.height);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.bounces = YES;
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[ShopCollectionViewCell class] forCellWithReuseIdentifier:cellReuseIdentifier];
    
    [self.view addSubview:_collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)addProducts {
    
    Product *product1 = [[Product alloc] init:[UIImage imageNamed:@"product1"] name:@"CALVIN KLEIN" detail:@"Such A Duchess Dress" newCost:125 oldCost:0 quantity:3 color:[UIColor orangeColor] size:14];
    Product *product2 = [[Product alloc] init:[UIImage imageNamed:@"product2"] name:@"MANGO" detail:@"Jennifer Maxi" newCost:50 oldCost:100 quantity:4 color:[UIColor orangeColor] size:16];
    Product *product3 = [[Product alloc] init:[UIImage imageNamed:@"product3"] name:@"MICHAEL KORS" detail:@"Tribal Ceremony Gown" newCost:55 oldCost:100 quantity:1 color:[UIColor orangeColor] size:18];
    Product *product4 = [[Product alloc] init:[UIImage imageNamed:@"product4"] name:@"ZARA" detail:@"Lace me in Teal Dress" newCost:125 oldCost:0 quantity:2 color:[UIColor orangeColor] size:20];
    Product *product5 = [[Product alloc] init:[UIImage imageNamed:@"product5"] name:@"MANGONER" detail:@"Jennifer Maximum" newCost:60 oldCost:120 quantity:2 color:[UIColor orangeColor] size:22];
    Product *product6 = [[Product alloc] init:[UIImage imageNamed:@"product6"] name:@"KORS" detail:@"Tribal Gown" newCost:40 oldCost:80 quantity:2 color:[UIColor orangeColor] size:22];
    _products = @[product1, product2, product3, product4, product5, product6];

}

- (int)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (int)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ShopCollectionViewCell *cell = (ShopCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
    Product *productTemp = _products[indexPath.row];
    [cell configureCell:productTemp];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = self.view.bounds.size.width/2-6;
    CGFloat heigth = 250;
    
    return CGSizeMake(width, heigth);
}

@end
