//
//  ShopCollectionViewCell.h
//  FashionStoreObjC
//
//  Created by Tuan-Vi Phan on 9/21/16.
//  Copyright © 2016 Tuan-Vi Phan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface ShopCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imgProduct;
@property (nonatomic, strong) UILabel *nameProductLabel;
@property (nonatomic, strong) UILabel *detailProductLabel;
@property (nonatomic, strong) UILabel *nCostProductLabel;
@property (nonatomic, strong) UILabel *oldCostProductLabel;


- (void)configureCell: (Product *)product;

@end
