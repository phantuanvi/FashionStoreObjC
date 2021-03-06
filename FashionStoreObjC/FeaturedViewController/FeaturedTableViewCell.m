//
//  FeaturedTableViewCell.m
//  FashionStoreObjC
//
//  Created by Tuan-Vi Phan on 9/20/16.
//  Copyright © 2016 Tuan-Vi Phan. All rights reserved.
//

#import "FeaturedTableViewCell.h"
#import "Masonry.h"

@implementation FeaturedTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    
    _imgView = [[UIImageView alloc] init];
    _imgView.contentMode = UIViewContentModeScaleToFill;
    [self.contentView addSubview:_imgView];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsZero);
    }];
}

@end
