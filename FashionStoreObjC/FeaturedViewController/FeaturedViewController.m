//
//  FeaturedTableViewController.m
//  FashionStoreObjC
//
//  Created by Tuan-Vi Phan on 9/20/16.
//  Copyright © 2016 Tuan-Vi Phan. All rights reserved.
//

#import "FeaturedViewController.h"
#import "FeaturedTableViewCell.h"

static NSString * const cellReuseIdentifier = @"cellReuseIdentifier";

@interface FeaturedViewController ()

@property (nonatomic, strong) NSArray *banners;
@property (nonatomic) CGFloat heightCell;

@end

@implementation FeaturedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _banners = @[@"banner1", @"banner2", @"banner3"];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *titleImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logoNav"]];
    titleImg.contentMode = UIViewContentModeScaleAspectFit;
    self.navigationItem.titleView = titleImg;
    
    // Change NavigationBar Color
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    [self.tableView registerClass:FeaturedTableViewCell.class forCellReuseIdentifier:cellReuseIdentifier];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _banners.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeaturedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier forIndexPath:indexPath];
    
    cell.imgView.image = [UIImage imageNamed: _banners[indexPath.row]];
    //cell.imageView.image = [UIImage imageNamed: _banners[indexPath.row]];
    _heightCell = [UIImage imageNamed: _banners[indexPath.row]].size.height;
    
//    NSLog(@"%f", _heightCell);
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _heightCell;
}

@end
