//
//  Product.m
//  FashionStoreObjC
//
//  Created by Tuan-Vi Phan on 9/21/16.
//  Copyright © 2016 Tuan-Vi Phan. All rights reserved.
//

#import "Product.h"

@implementation Product

- (instancetype)init:(UIImage *)imgOfProduct
                name:(NSString *)nameOfProduct
              detail:(NSString *)detailOfProduct
             newCost:(int)newCostOfProduct
             oldCost:(int)oldCostOfProduct
            quantity:(int)quantityOfProduct
               color:(UIColor *)colorOfProduct
                size:(int)sizeOfProduct {
    self = [super init];
    
    if (self) {
        _imgOfProduct = imgOfProduct;
        _nameOfProduct = nameOfProduct;
        _detailOfProduct = detailOfProduct;
        _newCostOfProduct = newCostOfProduct;
        _oldCostOfProduct = oldCostOfProduct;
        _quantityOfProduct = quantityOfProduct;
        _colorOfProduct = colorOfProduct;
        _sizeOfProduct = sizeOfProduct;
    }
    return self;
}

@end
