//
//  FHAutoLayoutView.h
//  Spinner
//
//  Created by mac on 14-8-16.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

/*!
 *  autoLayoutView
 */
@interface UIView (AutoLayoutAttibute)

/*!
 *  初始化RootView,该rootview可以是self,也可以self的上层view
 */
-(id)initWithRootView:(UIView*)view;

/*!
 *  设置缩放比例
 *  @param scale 默认是1
 */
-(void)setScale:(CGFloat)scale;

//height
-(void)setFixHeight:(CGFloat)height;
-(void)setMaxHeight:(CGFloat)height;
-(void)setMinHeight:(CGFloat)height;
-(void)equalHeight:(UIView*)view;
-(void)setHeightEqualParent;


//width
-(void)equalWidth:(UIView*)view;
-(void)setWidthEqualParent;
-(void)setFixWidth:(CGFloat)width;
-(void)setMaxWidth:(CGFloat)width;
-(void)setMinWidth:(CGFloat)width;


//size
-(void)equalSize:(UIView*)view;
-(void)equalParentSize;

//对齐
-(void)alginLeft:(UIView*)view;
-(void)alginRight:(UIView*)view;
-(void)alginTop:(UIView*)view;
-(void)alginBottom:(UIView*)view;

-(void)alginParentTop;
-(void)alginParentLeft;
-(void)alginParentBottom;
-(void)alginParentRight;

//距离
-(void)paddingLeftView:(UIView*)view padding:(CGFloat)padding;
-(void)paddingBottomView:(UIView*)view padding:(CGFloat)padding;
-(void)paddingTopView:(UIView*)view padding:(CGFloat)padding;
-(void)paddingRightView:(UIView*)view padding:(CGFloat)padding;


-(void)paddingParentLeft:(CGFloat)padding;
-(void)paddingParentRight:(CGFloat)padding;
-(void)paddingParentBottom:(CGFloat)padding;
-(void)paddingParentTop:(CGFloat)padding;


//方向
-(void)toRight:(UIView*)view;
-(void)toLeft:(UIView *)view;
-(void)below:(UIView*)view;
-(void)toTop:(UIView*)view;

-(void)toRight:(UIView*)view padding:(CGFloat)padding;
-(void)below:(UIView*)view padding:(CGFloat)padding;
-(void)toLeft:(UIView *)view padding:(CGFloat)padding;
-(void)toUp:(UIView *)view padding:(CGFloat)padding;
@end
