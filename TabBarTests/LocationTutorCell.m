

#import "LocationTutorCell.h"

@interface LocationTutorCell ()

@property (nonatomic, strong) UIImageView *imageViewTutor;
@property (nonatomic, strong) UILabel *labelTitle;

@end

@implementation LocationTutorCell

#pragma mark - creation section

- (void)setupUIAfterInitWithoutNib
{
    [self createImageView];
    [self createTitleLabel];
    [self createConstraints];
}

- (void)createImageView
{
    UIImageView *imageViewTutor = [[UIImageView alloc] init];
    imageViewTutor.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:imageViewTutor];
    self.imageViewTutor = imageViewTutor;
}

- (void)createTitleLabel
{
    UILabel *labelTitle = [[UILabel alloc] init];
    labelTitle.numberOfLines = 0;
    labelTitle.lineBreakMode = NSLineBreakByWordWrapping;
    labelTitle.font = [UIFont textDefaultFontWithSize:15];
    labelTitle.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:labelTitle];
    self.labelTitle = labelTitle;
}

- (void)createConstraints
{
    UIImageView *imageViewTutor = self.imageViewTutor;
    UILabel *labelTitle = self.labelTitle;
    UIView *contentView = self.contentView;
    [imageViewTutor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@29);
        make.width.equalTo(@29);
        make.leading.equalTo(contentView).offset(15);
    }];
    
    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageViewTutor.mas_right).offset(10);
        make.right.equalTo(@-15);
        make.height.equalTo(@42);
        make.centerY.equalTo(imageViewTutor);
    }];
}

#pragma mark - setters

- (void)setAttributedTextTutor:(NSAttributedString *)attributedTextTutor
{
    self.labelTitle.attributedText = attributedTextTutor;
}

- (void)setImageTutor:(UIImage *)imageTutor
{
    self.imageViewTutor.image = imageTutor;
}

@end
