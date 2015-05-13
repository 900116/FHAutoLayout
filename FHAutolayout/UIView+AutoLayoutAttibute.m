//
//  FHAutoLayoutView.m
//  Spinner
//
//  Created by mac on 14-8-16.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import "UIView+AutoLayoutAttibute.h"

static __unsafe_unretained UIView* _rootView = nil;
static CGFloat _scale;

@implementation UIView(AutoLayoutAttibute)
#pragma private
//设定高度宽度
-(void)setHorHValue:(CGFloat)value height:(BOOL)height equal:(int)equal
{
    NSLayoutAttribute attribute;
    NSLayoutRelation relation;
    if (height) {
        attribute = NSLayoutAttributeHeight;
    }
    else
    {
        attribute = NSLayoutAttributeWidth;
    }
    if (equal > 0) {
        relation = NSLayoutRelationGreaterThanOrEqual;
    }
    else if(equal == 0)
    {
        relation = NSLayoutRelationEqual;
    }
    else
    {
        relation = NSLayoutRelationLessThanOrEqual;
    }
    [_rootView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:relation toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:_scale constant:value]];
}

//设定高度宽度
-(void)setHorHView:(UIView*)view height:(BOOL)height equal:(int)equal
{
    NSLayoutAttribute attribute;
    NSLayoutRelation relation;
    if (height) {
        attribute = NSLayoutAttributeHeight;
    }
    else
    {
        attribute = NSLayoutAttributeWidth;
    }
    if (equal > 0) {
        relation = NSLayoutRelationGreaterThanOrEqual;
    }
    else if(equal == 0)
    {
        relation = NSLayoutRelationEqual;
    }
    else
    {
        relation = NSLayoutRelationLessThanOrEqual;
    }
    [_rootView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:relation toItem:view attribute:attribute multiplier:_scale constant:0]];
}

//设定高度宽度
-(void)setPaddingValueXOrY:(BOOL)XOrY LorRight:(BOOL)LorR padding:(float)padding equal:(int)equal toItem:(UIView*)item
{
    NSLayoutAttribute attribute;
    NSLayoutRelation relation;
    if (XOrY) {
        if (LorR) {
            attribute = NSLayoutAttributeLeft;
        }
        else
        {
            attribute = NSLayoutAttributeRight;
            padding = -padding;
        }
    }
    else
    {
        if (LorR) {
            attribute = NSLayoutAttributeTop;
        }
        else
        {
            attribute = NSLayoutAttributeBottom;
            padding = -padding;
        }
    }
    if (equal > 0) {
        relation = NSLayoutRelationGreaterThanOrEqual;
    }
    else if(equal == 0)
    {
        relation = NSLayoutRelationEqual;
    }
    else
    {
        relation = NSLayoutRelationLessThanOrEqual;
    }
    [_rootView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:relation toItem:item attribute:attribute multiplier:_scale constant:padding]];
}

//方位
-(void)toXOrY:(BOOL)XOrY LorRight:(BOOL)LorR padding:(float)padding equal:(int)equal toItem:(UIView*)item
{
    NSLayoutAttribute attribute;
    NSLayoutAttribute attribute2;
    NSLayoutRelation relation;
    if (XOrY) {
        if (LorR) {
            attribute = NSLayoutAttributeRight;
            attribute2 = NSLayoutAttributeLeft;
        }
        else
        {
            attribute = NSLayoutAttributeLeft;
            attribute2 = NSLayoutAttributeRight;
        }
    }
    else
    {
        if (LorR) {
            attribute = NSLayoutAttributeBottom;
            attribute2 = NSLayoutAttributeTop;
        }
        else
        {
            attribute = NSLayoutAttributeTop;
            attribute2 = NSLayoutAttributeBottom;
        }
    }
    if (equal > 0) {
        relation = NSLayoutRelationGreaterThanOrEqual;
    }
    else if(equal == 0)
    {
        relation = NSLayoutRelationEqual;
    }
    else
    {
        relation = NSLayoutRelationLessThanOrEqual;
    }
    [_rootView addConstraint:[NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:relation toItem:item attribute:attribute2 multiplier:_scale constant:padding]];
}

#pragma public


/*!
 *  初始化RootView
 */
-(id)initWithRootView:(UIView*)view
{
    self = [self initWithFrame:CGRectZero];
    if (self) {
        [self setTranslatesAutoresizingMaskIntoConstraints:NO];
        _rootView = view;
        _scale = 1.f;
    }
    return self;
}

//缩放比例
-(void)setScale:(CGFloat)scale
{
    _scale = scale;
}

-(void)setWidthEqualParent
{
    [self setHorHView:self.superview height:NO equal:0];
}

-(void)setHeightEqualParent
{
    [self setHorHView:self.superview height:YES equal:0];
}

//固定高度
-(void)setFixHeight:(CGFloat)height
{
    [self setHorHValue:height height:YES equal:0];
}

//最小高度
-(void)setMinHeight:(CGFloat)height
{
    [self setHorHValue:height height:YES equal:1];
}

//最大高度
-(void)setMaxHeight:(CGFloat)height
{
    [self setHorHValue:height height:YES equal:-1];
}

//固定宽度
-(void)setFixWidth:(CGFloat)width
{
    [self setHorHValue:width height:NO equal:0];
}

//最小宽度
-(void)setMinWidth:(CGFloat)width
{
    [self setHorHValue:width height:NO equal:1];
}

//最大高度
-(void)setMaxWidth:(CGFloat)width
{
    [self setHorHValue:width height:NO equal:-1];
}

-(void)equalHeight:(UIView *)view
{
    [self setHorHView:view height:YES equal:0];
}

-(void)equalWidth:(UIView *)view
{
    [self setHorHView:view height:NO equal:0];
}

-(void)equalSize:(UIView *)view
{
    [self equalWidth:view];
    [self equalHeight:view];
}

-(void)equalParentSize
{
    [self equalSize:self.superview];
}




-(void)alginLeft:(UIView *)view
{
    [self setPaddingValueXOrY:YES LorRight:YES padding:0 equal:0 toItem:view];
}
-(void)alginRight:(UIView *)view
{
    [self setPaddingValueXOrY:YES LorRight:NO padding:0 equal:0 toItem:view];
}
-(void)alginTop:(UIView *)view
{
    [self setPaddingValueXOrY:NO LorRight:YES padding:0 equal:0 toItem:view];
}
-(void)alginParentTop
{
    [self setPaddingValueXOrY:NO LorRight:YES padding:0 equal:0 toItem:self.superview];
}
-(void)alginParentBottom
{
    [self setPaddingValueXOrY:NO LorRight:NO padding:0 equal:0 toItem:self.superview];
}
-(void)alginParentLeft
{
    [self setPaddingValueXOrY:YES LorRight:YES padding:0 equal:0 toItem:self.superview];
}
-(void)alginParentRight
{
    [self setPaddingValueXOrY:YES LorRight:NO padding:0 equal:0 toItem:self.superview];
}
-(void)alginBottom:(UIView *)view
{
    [self setPaddingValueXOrY:NO LorRight:NO padding:0 equal:0 toItem:view];
}



-(void)paddingLeftView:(UIView *)view padding:(CGFloat)padding
{
    [self setPaddingValueXOrY:YES LorRight:YES padding:padding equal:0 toItem:view];
}
-(void)paddingBottomView:(UIView *)view padding:(CGFloat)padding
{
    [self setPaddingValueXOrY:NO LorRight:NO padding:padding equal:0 toItem:view];
}
-(void)paddingTopView:(UIView *)view padding:(CGFloat)padding
{
    [self setPaddingValueXOrY:NO LorRight:YES padding:padding equal:0 toItem:view];
}
-(void)paddingRightView:(UIView *)view padding:(CGFloat)padding
{
    [self setPaddingValueXOrY:YES LorRight:NO padding:padding equal:0 toItem:view];
}
-(void)paddingParentLeft:(CGFloat)padding
{
    [self setPaddingValueXOrY:YES LorRight:YES padding:padding equal:0 toItem:self.superview];
}
-(void)paddingParentRight:(CGFloat)padding
{
    [self setPaddingValueXOrY:YES LorRight:NO padding:padding equal:0 toItem:self.superview];
}
-(void)paddingParentBottom:(CGFloat)padding
{
    [self setPaddingValueXOrY:NO LorRight:NO padding:padding equal:0 toItem:self.superview];
}
-(void)paddingParentTop:(CGFloat)padding
{
    [self setPaddingValueXOrY:NO LorRight:YES padding:padding equal:0 toItem:self.superview];
}




-(void)toRight:(UIView *)view
{
    [self toXOrY:YES LorRight:NO padding:0 equal:0 toItem:view];
}
-(void)toLeft:(UIView *)view
{
    [self toXOrY:YES LorRight:YES padding:0 equal:0 toItem:view];
}
-(void)below:(UIView *)view
{
   [self toXOrY:NO LorRight:NO padding:0 equal:0 toItem:view];
}
-(void)toTop:(UIView *)view
{
    [self toXOrY:NO LorRight:YES padding:0 equal:0 toItem:view];

}
-(void)toRight:(UIView *)view padding:(CGFloat)padding
{
    [self toXOrY:YES LorRight:NO padding:padding equal:0 toItem:view];
}
-(void)below:(UIView *)view padding:(CGFloat)padding
{
    [self toXOrY:NO LorRight:NO padding:padding equal:0 toItem:view];
}
-(void)toLeft:(UIView *)view padding:(CGFloat)padding
{
    [self toXOrY:YES LorRight:YES padding:padding equal:0 toItem:view];
}
-(void)toUp:(UIView *)view padding:(CGFloat)padding
{
    [self toXOrY:NO LorRight:YES padding:padding equal:0 toItem:view];
}


@end
