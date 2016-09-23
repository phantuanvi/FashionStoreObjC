//
//  ShopCollectionViewCell.m
//  FashionStoreObjC
//
//  Created by Tuan-Vi Phan on 9/21/16.
//  Copyright © 2016 Tuan-Vi Phan. All rights reserved.
//

#import "ShopCollectionViewCell.h"
#import "Masonry.h"

@interface ShopCollectionViewCell()

@property (nonatomic, strong) UIView *containerCostLabel;

@end

@implementation ShopCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    _imgProduct = [[UIImageView alloc] init];
    _imgProduct.contentMode = UIViewContentModeScaleAspectFit;
    
    _nameProductLabel = [[UILabel alloc] init];
    _nameProductLabel.textColor = [UIColor blackColor];
    _nameProductLabel.textAlignment = NSTextAlignmentCenter;
    _nameProductLabel.font = [UIFont fontWithName:@"Lato-Medium" size:12];
    
    _detailProductLabel = [[UILabel alloc] init];
    _detailProductLabel.textColor = [UIColor colorWithRed:142/255 green:144/255 blue:152/255 alpha:1];
    _detailProductLabel.textAlignment = NSTextAlignmentCenter;
    _detailProductLabel.font = [UIFont fontWithName:@"Lato-Regular" size:12];
    
    _nCostProductLabel = [[UILabel alloc] init];
    _nCostProductLabel.textColor = [UIColor blackColor];
    _nCostProductLabel.textAlignment = NSTextAlignmentCenter;
    [_nCostProductLabel sizeToFit];
    _nCostProductLabel.font = [UIFont fontWithName:@"Lato-Medium" size:14];
    
    _oldCostProductLabel = [[UILabel alloc] init];
    _oldCostProductLabel.textColor = [UIColor colorWithRed:142/255 green:144/255 blue:152/255 alpha:1];
    _oldCostProductLabel.textAlignment = NSTextAlignmentCenter;
    [_oldCostProductLabel sizeToFit];
    _oldCostProductLabel.font = [UIFont fontWithName:@"Lato-Medium" size:14];
    
    _containerCostLabel = [[UIView alloc] init];
    [_containerCostLabel sizeToFit];
    
    [self.contentView addSubview:_imgProduct];
    [self.contentView addSubview:_nameProductLabel];
    [self.contentView addSubview:_detailProductLabel];
    [self.contentView addSubview:_containerCostLabel];
    [_containerCostLabel addSubview:_nCostProductLabel];
    [_containerCostLabel addSubview:_oldCostProductLabel];
    
    NSLog(@"done setupViews");
    
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsZero);
    }];
    
    [_imgProduct mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.centerX.equalTo(self.contentView);
    }];
    
    CGFloat width = self.bounds.size.width-30;
    [_nameProductLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(_imgProduct.mas_bottom).offset(5);
        make.width.equalTo(@(width));
        make.height.equalTo(@20);
    }];
    
    [_detailProductLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(_nameProductLabel.mas_bottom).offset(5);
        make.width.equalTo(@(width));
        make.height.equalTo(@20);
    }];
    
    [_containerCostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(_detailProductLabel.mas_bottom).offset(5);

    }];
    
    [_nCostProductLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_containerCostLabel.mas_top);
        make.left.equalTo(_containerCostLabel.mas_left);
        make.right.equalTo(_oldCostProductLabel.mas_left).offset(-5);
        make.bottom.equalTo(_containerCostLabel.mas_bottom);
    }];
    
    [_oldCostProductLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_containerCostLabel.mas_top);
        make.right.equalTo(_containerCostLabel.mas_right);
        make.bottom.equalTo(_containerCostLabel.mas_bottom);
    }];
}

- (void)configureCell:(Product *)product {
    
    NSLog(@"%@", product.nameOfProduct);
    _imgProduct.image = product.imgOfProduct;
    _nameProductLabel.text = product.nameOfProduct;
    _detailProductLabel.text = product.detailOfProduct;
    _nCostProductLabel.text = [NSString stringWithFormat:@"$%d", product.newCostOfProduct];
    if (product.oldCostOfProduct != 0) {
        NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"$%d", product.oldCostOfProduct] attributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
        _oldCostProductLabel.attributedText = attrString;
    }
}

@end
