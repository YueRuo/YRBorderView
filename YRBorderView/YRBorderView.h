/*
 The MIT License (MIT)
 
 Copyright (c) 2014 YueRuo,王晓宇
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 */

#import <UIKit/UIKit.h>

@interface YRBorderView : UIView
@property (assign,nonatomic) UIEdgeInsets contentEdgeInsets;

@property (assign,nonatomic) BOOL needLineTop;
@property (assign,nonatomic) BOOL needLineLeft;
@property (assign,nonatomic) BOOL needLineBottom;
@property (assign,nonatomic) BOOL needLineRight;
//line width
@property (assign,nonatomic) CGFloat lineWidthTop;
@property (assign,nonatomic) CGFloat lineWidthLeft;
@property (assign,nonatomic) CGFloat lineWidthBottom;
@property (assign,nonatomic) CGFloat lineWidthRight;
//line color
@property (retain,nonatomic) UIColor *lineColorTop;
@property (retain,nonatomic) UIColor *lineColorLeft;
@property (retain,nonatomic) UIColor *lineColorBottom;
@property (retain,nonatomic) UIColor *lineColorRight;
//corner radius
@property (assign,nonatomic) CGFloat radiusTopLeft;
@property (assign,nonatomic) CGFloat radiusTopRight;
@property (assign,nonatomic) CGFloat radiusBottomLeft;
@property (assign,nonatomic) CGFloat radiusBottomRight;
//线段样式，0是实线，否则为线段宽度
@property (assign,nonatomic) CGFloat lineDashTop;
@property (assign,nonatomic) CGFloat lineDashLeft;
@property (assign,nonatomic) CGFloat lineDashRight;
@property (assign,nonatomic) CGFloat lineDashBottom;

//内部填充颜色
@property (retain,nonatomic) UIColor *fillColor;
//根据自身形状根据边线进行裁剪
@property (assign,nonatomic) BOOL clipsToBoundsWithBorder;

-(void)setNeedLineTop:(BOOL)needTop left:(BOOL)needLeft bottom:(BOOL)needBottom right:(BOOL)needRight;
-(void)setLineWidthTop:(CGFloat)widthTop left:(CGFloat)widthLeft bottom:(CGFloat)widthBottom right:(CGFloat)widthRight;
-(void)setLineColorTop:(UIColor *)colorTop left:(UIColor *)colorLeft bottom:(UIColor *)colorBottom right:(UIColor *)colorRight;
-(void)setRadiusTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight bottomLeft:(CGFloat)bottomLeft bottomRight:(CGFloat)bottomRight;
-(void)setLineDashTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;

@end
