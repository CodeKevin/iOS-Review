//
//  MusicCell.m
//  iOS_Review
//
//  Created by Kevin on 2019/5/11.
//  Copyright © 2019年 Kevin. All rights reserved.
//

#import "MusicCell.h"
@interface MusicCell()
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *desLabel;
@property(nonatomic,strong)UIImageView *coverView;
@end
@implementation MusicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initAllComponents];
    }
    return self;
}
- (void)initAllComponents {
    [self addSubview:self.titleLabel];
    [self addSubview:self.desLabel];
    [self addSubview:self.coverView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(@15);
        make.right.equalTo(@(-15));
        make.height.equalTo(@40);
    }];
    
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.titleLabel.mas_left);
        make.right.equalTo(self.titleLabel.mas_right);
        make.height.equalTo(self.titleLabel.mas_width).multipliedBy(3/4.f);
    }];
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverView.mas_bottom).offset(10);
        make.left.equalTo(self.titleLabel.mas_left);
        make.right.equalTo(self.titleLabel.mas_right);
        make.height.equalTo(@40);
    }];
    
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    _titleLabel.backgroundColor = [UIColor blueColor];
    return _titleLabel;
}
- (UILabel *)desLabel {
    if (!_desLabel) {
        _desLabel = [[UILabel alloc] init];
    }
    _desLabel.backgroundColor = [UIColor greenColor];
    return _desLabel;
}
- (UIImageView *)coverView {
    if (!_coverView) {
        _coverView = [[UIImageView alloc] init];
    }
    _coverView.backgroundColor = [UIColor redColor];
    return _coverView;
}
- (void)updataWithModel:(Model *)model {
    self.titleLabel.text = model.title;
    [self.coverView sd_setImageWithURL:[NSURL URLWithString:model.cover_url]];
    self.desLabel.text = model.descrip;
}
@end
