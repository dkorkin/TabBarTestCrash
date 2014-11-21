//
//  ZMTabBar.m
//  TabBarTests
//
//  Created by Dmitriy Korkin on 10/28/14.
//  Copyright (c) 2014 Dmitriy Korkin. All rights reserved.
//

#import "ZMTabBar.h"

@interface ZMTabBar ()

@property (nonatomic, weak) UIImageView *imageViewSeparator;

@end

@implementation ZMTabBar

- (void)setupUIAfterInitWithoutNib
{
    [self createSeparator];
}

- (void)createSeparator
{
    UIImage *separatorImage = [UIImage imageFromColor:[UIColor barSeparatorColor]];
    UIImageView *imageViewSeparator = [[UIImageView alloc] init];
    imageViewSeparator.image = separatorImage;
    [self addSubview:imageViewSeparator];
    self.imageViewSeparator = imageViewSeparator;
    UIView *superView = self;
    [imageViewSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(superView.mas_trailing).offset(0);
        make.leading.equalTo(superView.mas_leading).offset(0);
        make.top.equalTo(superView.mas_top).offset(0);
        make.height.equalTo(@(1/SCREEN_SCALE));
    }];
}

- (void)customizeUI
{
    [super customizeUI];
    self.backgroundColor = [UIColor clearColor];
}

- (void)setTabs:(NSArray *)tabs
{
    _tabs = tabs;
    UIView *superView = self;
    UIImageView *separator = self.imageViewSeparator;
    for (int i = 0; i < [tabs count]; i++) {
        ZMTab *tab = tabs[i];
        tab.index = i;
        [self addSubview:tab];
        [tab addTarget:self action:@selector(tabPressed:) forControlEvents:UIControlEventTouchDown];
        [tab setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        
        if (i == 0) {
            [tab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(superView.mas_bottom).offset(0);
                make.leading.equalTo(superView.mas_leading).with.offset(0.0f);
                make.top.equalTo(separator.mas_bottom).offset(0);
            }];
        }
        else {
            ZMTab *previousTab = tabs[i - 1];
            [tab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(separator.mas_bottom).offset(0);
                make.bottom.equalTo(superView.mas_bottom).offset(0);
                make.width.equalTo(previousTab);
                make.left.equalTo(previousTab.mas_right).with.offset(0.0f);
                if (i == [tabs count] - 1) {
                    make.trailing.equalTo(superView.mas_trailing).with.offset(0.0f);
                }
            }];
        }
    }
}

- (void)tabPressed:(ZMTab *)selectedTab
{
    if (_selectedTab != selectedTab) {
        _selectedTab = selectedTab;
        _selectedTab.selected = YES;
        [self.delegate tabBar:selectedTab didSelectTabAtIndex:selectedTab.index];
        for (ZMTab *tab in _tabs) {
            if (tab != _selectedTab) {
                tab.selected = NO;
            }
        }
    }
}

- (void)selectTabAtIndex:(NSInteger)index
{
    if (index < self.tabs.count) {
        ZMTab *selectedTab = self.tabs[index];
        _selectedTab = selectedTab;
        _selectedTab.selected = YES;
        for (ZMTab *tab in _tabs) {
            if (tab != _selectedTab) {
                tab.selected = NO;
            }
        }
    }
}

- (void)setupBadgeValue:(NSString *)badgeValue atIndex:(NSInteger)index
{
    if (index < [self.tabs count]) {
        ZMTab *tab = [self.tabs objectAtIndex:index];
        tab.badgeValue = badgeValue;
    }
}

- (void)setupSeparatorConstraintsForState:(BOOL)isHidden
{
    UIImageView *separator = self.imageViewSeparator;
    [separator mas_updateConstraints:^(MASConstraintMaker *make) {
        if (isHidden) {
            make.height.equalTo(@0);
        }
        else {
            make.height.equalTo(@(1/SCREEN_SCALE));
        }
    }];
    [self layoutIfNeeded];
}

@end
