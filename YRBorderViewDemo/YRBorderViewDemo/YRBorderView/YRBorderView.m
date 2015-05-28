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

#import "YRBorderView.h"

@interface YRBorderView ()
@property (retain,nonatomic) UIBezierPath *pathForBorder;
@property (assign,nonatomic) BOOL needUpdatePathForBorder;
@end

@implementation YRBorderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _lineWidthTop = 0.5;
        _lineWidthLeft = 0.5;
        _lineWidthBottom = 0.5;
        _lineWidthRight = 0.5;
        
        _needLineTop = true;
        _needLineLeft = true;
        _needLineBottom = true;
        _needLineRight = true;
        
        _needUpdatePathForBorder = true;
        
        [self setUserInteractionEnabled:false];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}
-(void)dealloc{
    self.lineColorBottom = nil;
    self.lineColorLeft = nil;
    self.lineColorRight = nil;
    self.lineColorTop = nil;
    self.pathForBorder = nil;
#if ! __has_feature(objc_arc)
    [super dealloc];
#endif
}

///*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGFloat halfLineWidthTop = _lineWidthTop/2;
    CGFloat halfLineWidthLeft = _lineWidthLeft/2;
    CGFloat halfLineWidthBottom = _lineWidthBottom/2;
    CGFloat halfLineWidthRight = _lineWidthRight/2;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, self.bounds);
    CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
    CGContextFillRect(context, self.bounds);
    
    //填充背景
    if (_fillColor) {
        CGContextSetFillColorWithColor(context, _fillColor.CGColor);
        UIBezierPath *bezierPath = [self bezierPathForBorder];
        [bezierPath fill];
    }
    
    CGFloat startX = _contentEdgeInsets.left;
    CGFloat startY = _contentEdgeInsets.top;
    CGFloat endX = self.frame.size.width-_contentEdgeInsets.right;
    CGFloat endY = self.frame.size.height-_contentEdgeInsets.bottom;
    //画线
    if (_needLineTop) {
        if(_lineDashTop){
            CGFloat lengths[] = {_lineDashTop};
            CGContextSetLineDash(context, 0, lengths,1);
        }else{
            CGContextSetLineDash(context, 0, 0, 0);
        }
        CGContextSetLineWidth(context, _lineWidthTop);
        CGContextSetStrokeColorWithColor(context, (_lineColorTop?_lineColorTop:[UIColor blackColor]).CGColor);
        CGContextAddArc(context, endX-_radiusTopRight, startY+_radiusTopRight, _radiusTopRight-halfLineWidthTop, -M_PI_4+(_needLineRight?0:M_PI_4), -M_PI_2, 1);
        CGContextMoveToPoint(context, endX-_radiusTopRight, startY+halfLineWidthTop);
        CGContextAddLineToPoint(context, _radiusTopLeft+_contentEdgeInsets.left, halfLineWidthTop+_contentEdgeInsets.top);
        CGContextAddArc(context, startX+_radiusTopLeft, startY+_radiusTopLeft, _radiusTopLeft-halfLineWidthTop, -M_PI_2, -M_PI_2-M_PI_4-(_needLineLeft?0:M_PI_4), 1);
        CGContextStrokePath(context);
    }
    if (_needLineLeft) {
        if(_lineDashLeft){
            CGFloat lengths[] = {_lineDashLeft};
            CGContextSetLineDash(context, 0, lengths,1);
        }else{
            CGContextSetLineDash(context, 0, 0, 0);
        }
        CGContextSetLineWidth(context, _lineWidthLeft);
        CGContextSetStrokeColorWithColor(context, (_lineColorLeft?_lineColorLeft:[UIColor blackColor]).CGColor);
        CGContextAddArc(context, startX+_radiusTopLeft, startY+_radiusTopLeft, _radiusTopLeft-halfLineWidthLeft, -M_PI, -M_PI_2-M_PI_4+(_needLineTop?0:M_PI_4), 0);
        CGContextMoveToPoint(context, startX+halfLineWidthLeft, startY+_radiusTopLeft);
        CGContextAddLineToPoint(context, startX+halfLineWidthLeft, endY-_radiusBottomLeft);
        CGContextAddArc(context, startX+_radiusBottomLeft, endY-_radiusBottomLeft, _radiusBottomLeft-halfLineWidthLeft, M_PI, M_PI-M_PI_4-(_needLineBottom?0:M_PI_4), 1);
        CGContextStrokePath(context);
    }
    if (_needLineBottom) {
        if(_lineDashBottom){
            CGFloat lengths[] = {_lineDashBottom};
            CGContextSetLineDash(context, 0, lengths,1);
        }else{
            CGContextSetLineDash(context, 0, 0, 0);
        }
        CGContextSetLineWidth(context, _lineWidthBottom);
        CGContextSetStrokeColorWithColor(context, (_lineColorBottom?_lineColorBottom:[UIColor blackColor]).CGColor);
        CGContextAddArc(context, startX+_radiusBottomLeft, endY-_radiusBottomLeft, _radiusBottomLeft-halfLineWidthBottom, M_PI-M_PI_4+(_needLineLeft?0:M_PI_4), M_PI_2, 1);
        CGContextMoveToPoint(context, startX+_radiusBottomLeft, endY-halfLineWidthBottom);
        CGContextAddLineToPoint(context, endX-_radiusBottomRight, endY-halfLineWidthBottom);
        CGContextAddArc(context, endX-_radiusBottomRight, endY-_radiusBottomRight, _radiusBottomRight-halfLineWidthBottom, M_PI_2, M_PI_4-(_needLineRight?0:M_PI_4), 1);
        CGContextStrokePath(context);
    }
    if (_needLineRight) {
        if(_lineDashRight){
            CGFloat lengths[] = {_lineDashRight};
            CGContextSetLineDash(context, 0, lengths,1);
        }else{
            CGContextSetLineDash(context, 0, 0, 0);
        }
        CGContextSetLineWidth(context, _lineWidthRight);
        CGContextSetStrokeColorWithColor(context, (_lineColorRight?_lineColorRight:[UIColor blackColor]).CGColor);
        CGContextAddArc(context, endX-_radiusBottomRight, endY-_radiusBottomRight, _radiusBottomRight-halfLineWidthRight, M_PI_4+(_needLineBottom?0:M_PI_4), 0, 1);
        CGContextMoveToPoint(context, endX-halfLineWidthRight, endY-_radiusBottomRight);
        CGContextAddLineToPoint(context, endX-halfLineWidthRight, startY+_radiusTopRight);
        CGContextAddArc(context, endX-_radiusTopRight, startY+_radiusTopRight, _radiusTopRight-halfLineWidthRight, 0, -M_PI_4-(_needLineTop?0:M_PI_4), 1);
        CGContextStrokePath(context);
    }
    CGContextStrokePath(context);
}
//*/

-(UIBezierPath*)bezierPathForBorder{
    if (self.needUpdatePathForBorder||!self.pathForBorder) {
        CGFloat startX = _contentEdgeInsets.left;
        CGFloat startY = _contentEdgeInsets.top;
        CGFloat endX = self.frame.size.width-_contentEdgeInsets.right;
        CGFloat endY = self.frame.size.height-_contentEdgeInsets.bottom;
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint:CGPointMake(endX-_radiusTopRight, startY)];
        [bezierPath addLineToPoint:CGPointMake(startX+_radiusTopLeft, startY)];
        [bezierPath addArcWithCenter:CGPointMake(startX+_radiusTopLeft, startY+_radiusTopLeft) radius:_radiusTopLeft startAngle:M_PI+M_PI_2 endAngle:M_PI clockwise:0];
        [bezierPath addLineToPoint:CGPointMake(startX, endY-_radiusBottomLeft)];
        [bezierPath addArcWithCenter:CGPointMake(startX+_radiusBottomLeft, endY-_radiusBottomLeft) radius:_radiusBottomLeft startAngle: M_PI endAngle:M_PI_2 clockwise:0];
        [bezierPath addLineToPoint:CGPointMake(endX-_radiusBottomRight, endY)];
        [bezierPath addArcWithCenter:CGPointMake(endX-_radiusBottomRight, endY-_radiusBottomRight) radius:_radiusBottomRight startAngle: M_PI_2 endAngle:0 clockwise:0];
        [bezierPath addLineToPoint:CGPointMake(endX, startY+_radiusTopRight)];
        [bezierPath addArcWithCenter:CGPointMake(endX-_radiusTopRight, startY+_radiusTopRight) radius:_radiusTopRight startAngle: 0 endAngle:-M_PI_2 clockwise:0];
        
        self.pathForBorder = bezierPath;
        self.needUpdatePathForBorder = false;
    }
    return self.pathForBorder;
}

-(void)willMoveToSuperview:(UIView *)newSuperview{
    if ([self clipsToBoundsWithBorder]) {
        UIBezierPath *bezierPath = [self bezierPathForBorder];
        CAShapeLayer* maskLayer = [CAShapeLayer new];
        maskLayer.frame = self.bounds;
        maskLayer.path = bezierPath.CGPath;
        self.layer.mask = maskLayer;
    }
}
-(void)setContentEdgeInsets:(UIEdgeInsets)contentEdgeInsets{
    if (!UIEdgeInsetsEqualToEdgeInsets(contentEdgeInsets, _contentEdgeInsets)) {
         _contentEdgeInsets = contentEdgeInsets;
        self.needUpdatePathForBorder = true;
        [self setNeedsDisplay];
    }
}

-(void)setFrame:(CGRect)frame{
    if (!CGRectEqualToRect(self.frame, frame)) {
        self.needUpdatePathForBorder = true;
    }
    [super setFrame:frame];
    [self setNeedsDisplay];
}

-(void)setNeedLineTop:(BOOL)needTop left:(BOOL)needLeft bottom:(BOOL)needBottom right:(BOOL)needRight{
    self.needLineTop = needTop;
    self.needLineLeft = needLeft;
    self.needLineRight = needRight;
    self.needLineBottom = needBottom;
}
-(void)setLineColorTop:(UIColor *)colorTop left:(UIColor *)colorLeft bottom:(UIColor *)colorBottom right:(UIColor *)colorRight{
    self.lineColorTop = colorTop;
    self.lineColorLeft = colorLeft;
    self.lineColorBottom = colorBottom;
    self.lineColorRight = colorRight;
}
-(void)setLineWidthTop:(CGFloat)widthTop left:(CGFloat)widthLeft bottom:(CGFloat)widthBottom right:(CGFloat)widthRight{
    self.lineWidthTop = widthTop;
    self.lineWidthLeft = widthLeft;
    self.lineWidthBottom = widthBottom;
    self.lineWidthRight = widthRight;
}
-(void)setRadiusTopLeft:(CGFloat)topLeft topRight:(CGFloat)topRight bottomLeft:(CGFloat)bottomLeft bottomRight:(CGFloat)bottomRight{
    self.radiusTopLeft = topLeft;
    self.radiusTopRight = topRight;
    self.radiusBottomLeft = bottomLeft;
    self.radiusBottomRight = bottomRight;
}
-(void)setLineDashTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right{
    self.lineDashTop = top;
    self.lineDashLeft = left;
    self.lineDashBottom = bottom;
    self.lineDashRight = right;
}

-(void)setRadiusBottomLeft:(CGFloat)radiusBottomLeft{
    if (_radiusBottomLeft != radiusBottomLeft) {
        _radiusBottomLeft = radiusBottomLeft;
        self.needUpdatePathForBorder = true;
    }
}
-(void)setRadiusBottomRight:(CGFloat)radiusBottomRight{
    if (_radiusBottomRight != radiusBottomRight) {
        _radiusBottomRight = radiusBottomRight;
        self.needUpdatePathForBorder = true;
    }
}
-(void)setRadiusTopLeft:(CGFloat)radiusTopLeft{
    if (_radiusTopLeft != radiusTopLeft) {
        _radiusTopLeft = radiusTopLeft;
        self.needUpdatePathForBorder = true;
    }
}
-(void)setRadiusTopRight:(CGFloat)radiusTopRight{
    if (_radiusTopRight != radiusTopRight) {
        _radiusTopRight = radiusTopRight;
        self.needUpdatePathForBorder = true;
    }
}
-(void)setLineWidthBottom:(CGFloat)lineWidthBottom{
    if (_lineWidthBottom != lineWidthBottom) {
        _lineWidthBottom = lineWidthBottom;
        self.needUpdatePathForBorder = true;
    }
}
-(void)setLineWidthLeft:(CGFloat)lineWidthLeft{
    if (_lineWidthLeft != lineWidthLeft) {
        _lineWidthLeft = lineWidthLeft;
        self.needUpdatePathForBorder = true;
    }
}
-(void)setLineWidthTop:(CGFloat)lineWidthTop{
    if (_lineWidthTop != lineWidthTop) {
        _lineWidthTop = lineWidthTop;
        self.needUpdatePathForBorder = true;
    }
}
-(void)setLineWidthRight:(CGFloat)lineWidthRight{
    if (_lineWidthRight != lineWidthRight) {
        _lineWidthRight = lineWidthRight;
        self.needUpdatePathForBorder = true;
    }
}

@end
