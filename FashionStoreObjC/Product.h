//
//  Product.h
//  FashionStoreObjC
//
//  Created by Tuan-Vi Phan on 9/21/16.
//  Copyright © 2016 Tuan-Vi Phan. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Product : NSObject

@property (nonatomic)       UIImage *imgOfProduct;
@property (nonatomic, copy) NSString *nameOfProduct;
@property (nonatomic, copy) NSString *detailOfProduct;
@property (nonatomic)       int newCostOfProduct;
@property (nonatomic)       int oldCostOfProduct;
@property (nonatomic)       int quantityOfProduct;
@property (nonatomic)       UIColor *colorOfProduct;
@property (nonatomic)       int sizeOfProduct;
@property (nonatomic)       int totalCost;

- (instancetype)init:(UIImage *)imgOfProduct
                name:(NSString *)nameOfProduct
              detail:(NSString *)detailOfProduct
             newCost:(int)newCostOfProduct
             oldCost:(int)oldCostOfProduct
            quantity:(int)quantityOfProduct
               color:(UIColor *)colorOfProduct
                size:(int)sizeOfProduct;

@end
