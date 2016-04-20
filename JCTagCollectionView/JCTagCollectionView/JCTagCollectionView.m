//
//  JCTagCollectionView.m
//  DemoCollectionView
//
//  Created by Jam on 16/4/20.
//  Copyright © 2016年 Jam. All rights reserved.
//

#import "JCTagCollectionView.h"

#import "JCCollectionViewFlowLayout.h"

#import "JCTagCollectionViewCell.h"

@interface JCTagCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

static NSString * const reuseIdentifier = @"tagCollectionViewCell";

@implementation JCTagCollectionView

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setup {
    
    self.tags = [NSMutableArray array];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[JCCollectionViewFlowLayout alloc] init]];
    [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.collectionView setDelegate:self];
    [self.collectionView setDataSource:self];
    [self.collectionView registerClass:[JCTagCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView setBackgroundColor:[UIColor clearColor]];

    [self addSubview:self.collectionView];
    
    NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_collectionView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_collectionView)];
    NSArray *constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_collectionView]|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_collectionView)];
    
    [self addConstraints:constraint_H];
    [self addConstraints:constraint_V];
}

#pragma mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tags.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JCTagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.layer.cornerRadius = 5.0f;
    [cell.titleLabel setText:self.tags[indexPath.row]];
    
    return cell;
}

#pragma mark UICollectionDelegate

#pragma mark UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    JCCollectionViewFlowLayout *layout = (JCCollectionViewFlowLayout *)collectionView.collectionViewLayout;
    CGSize maxSize = CGSizeMake(collectionView.frame.size.width - layout.sectionInset.left - layout.sectionInset.right, layout.itemSize.height);
    
    CGRect frame = [self.tags[indexPath.item] boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14.0f]} context:nil];
    
    return CGSizeMake(frame.size.width + 20.0f, layout.itemSize.height);
}

@end
