//
//  LeftShopViewController.m
//  FashionStoreObjC
//
//  Created by Tuan-Vi Phan on 9/20/16.
//  Copyright © 2016 Tuan-Vi Phan. All rights reserved.
//

#import "LeftShopViewController.h"
#import "Masonry.h"

@interface LeftShopViewController ()

@property (nonatomic, strong) NSArray *catalogWoman;
@property (nonatomic, strong) NSArray *catalogMan;

@property (nonatomic) UIView *container;
@property (nonatomic) UIImageView *bitmapView;
@property (nonatomic) UITableView *tableView;
@property (nonatomic) UIButton *womanButton;
@property (nonatomic) UIButton *manButton;

@end

@implementation LeftShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _catalogWoman = @[@"NEW IN", @"MOST POPULAR", @"RECENTLY VIEWED", @"PREMIUM", @"DRESS", @"ACCESSORIES", @"CLOTHING", @"OCCASIONS", @"GIFTS", @"WEDDINGS", @"DESIGNER", @"BRAND A-Z", @"OUTLET:UP TO 70% OFF"];
    _catalogMan = @[@"SPORT", @"SHOES", @"CLOTHING"];
    
    self.view.userInteractionEnabled = YES;
    
    [self setupViews];
                               
}

- (void)setupViews {
    _container = [[UIView alloc] init];
    _bitmapView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bitmapView"]];
    _bitmapView.userInteractionEnabled = YES;
    
    _womanButton = [[UIButton alloc] init];
    [_womanButton setTitle:@"WOMAN" forState:UIControlStateNormal];
    _womanButton.titleLabel.font = [UIFont fontWithName:@"Lato-Light" size:14];
    [_womanButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _womanButton.backgroundColor = [UIColor colorWithRed:33/255 green:33/255 blue:33/255 alpha:1];
    _womanButton.userInteractionEnabled = YES;
    _womanButton.selected = TRUE;
    [_womanButton setBackgroundImage:[UIImage imageNamed:@"buttonSelected"] forState:UIControlStateSelected];
    [_womanButton addTarget:self action:@selector(womanButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    _manButton = [[UIButton alloc] init];
    [_manButton setTitle:@"MAN" forState:UIControlStateNormal];
    _manButton.titleLabel.font = [UIFont fontWithName:@"Lato-Light" size:14];
    [_manButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _manButton.backgroundColor = [UIColor blackColor];
    _manButton.userInteractionEnabled = YES;
    [_manButton addTarget:self action:@selector(manButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    _tableView = [[UITableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorColor = [UIColor clearColor];
    [_tableView registerClass:UITableViewCell.self forCellReuseIdentifier:@"cellIdentifier"];
    
    [self.view addSubview:_bitmapView];
    [_bitmapView addSubview:_container];
    [_container addSubview:_womanButton];
    [_container addSubview:_manButton];
    [_container addSubview:_tableView];
    
    // setup constraints
    [_bitmapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsZero);
    }];
    
    [_container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        CGFloat padding = self.view.bounds.size.width;
        make.right.equalTo(self.view.mas_right).offset(-(padding*0.18));
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    [_womanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_container.mas_top).offset(30);
        make.left.equalTo(_container.mas_left).offset(10);
        make.right.equalTo(_manButton.mas_left).offset(-10);
        make.width.equalTo(_manButton.mas_width);
        make.height.equalTo(@44);
    }];
    
    [_manButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_container.mas_top).offset(30);
        make.right.equalTo(_container.mas_right).offset(-10);
        make.width.equalTo(_womanButton.mas_width);
        make.height.equalTo(@44);
    }];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_manButton.mas_bottom);
        make.left.equalTo(_container.mas_left);
        make.right.equalTo(_container.mas_right);
        make.bottom.equalTo(_container.mas_bottom).offset(-44);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_womanButton.selected){
        return _catalogWoman.count;
    } else {
        return _catalogMan.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    if (_womanButton.selected) {
        cell.textLabel.text = _catalogWoman[indexPath.row];
    } else if (_manButton.selected) {
        cell.textLabel.text = _catalogMan[indexPath.row];
    }
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont fontWithName:@"Lato-Light" size:14];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)womanButtonPressed {
    NSLog(@"womanButtonPressed");
    
    _womanButton.selected = YES;
    _womanButton.backgroundColor = [UIColor colorWithRed:33/255 green:33/255 blue:33/255 alpha:1];
    [_womanButton setBackgroundImage:[UIImage imageNamed:@"buttonSelected"] forState:UIControlStateSelected];
    _manButton.backgroundColor = [UIColor blackColor];
    _manButton.selected = false;
    
    [_tableView reloadData];
}

- (void)manButtonPressed {
    NSLog(@"manButtonPressed");
    
    _manButton.selected = YES;
    _manButton.backgroundColor = [UIColor colorWithRed:33/255 green:33/255 blue:33/255 alpha:1];
    [_manButton setBackgroundImage:[UIImage imageNamed:@"buttonSelected"] forState:UIControlStateSelected];
    _womanButton.backgroundColor = [UIColor blackColor];
    _womanButton.selected = false;
    
    [_tableView reloadData];
}

@end
