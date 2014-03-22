//
//  ViewController.m
//  YRBorderViewDemo
//
//  Created by 王晓宇 on 14-3-22.
//  Copyright (c) 2014年 王晓宇. All rights reserved.
//

#import "ViewController.h"
#import "YRBorderView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    {//demo1给四面添加上边线
        YRBorderView *borderView=[[YRBorderView alloc]initWithFrame:CGRectMake(30, 40, 100, 90)];
        [borderView setNeedLineTop:true left:true bottom:true right:true];
        [borderView setLineColorTop:[UIColor brownColor] left:[UIColor brownColor] bottom:[UIColor brownColor] right:[UIColor brownColor]];//用同一色边线
        [borderView setLineWidthTop:4 left:4 bottom:4 right:4];//设置线的粗细，这里可以随意调整
        [borderView setBackgroundColor:[UIColor purpleColor]];
        [self.view addSubview:borderView];
    }
    
    {//demo2给边线加上弧度
        YRBorderView *borderView=[[YRBorderView alloc]initWithFrame:CGRectMake(170, 40, 100, 90)];
        [borderView setNeedLineTop:true left:true bottom:true right:true];
        [borderView setLineColorTop:[UIColor blueColor] left:[UIColor greenColor] bottom:[UIColor brownColor] right:[UIColor redColor]];//设置不同的颜色
        [borderView setLineWidthTop:6 left:6 bottom:6 right:6];
        [borderView setRadiusTopLeft:28 topRight:26 bottomLeft:0 bottomRight:0];//边线加弧度
        [borderView setFillColor:[UIColor grayColor]];//增加内部填充颜色
        [borderView setBackgroundColor:[UIColor purpleColor]];
        [self.view addSubview:borderView];
    }
    
    {//demo3裁减掉边线外面的区域
        YRBorderView *borderView=[[YRBorderView alloc]initWithFrame:CGRectMake(30, 180, 100, 90)];
        [borderView setNeedLineTop:true left:false bottom:true right:true];//只保留三条线
        [borderView setLineColorTop:[UIColor blueColor] left:[UIColor greenColor] bottom:[UIColor brownColor] right:[UIColor redColor]];
        [borderView setLineWidthTop:6 left:6 bottom:6 right:6];
        [borderView setRadiusTopLeft:18 topRight:18 bottomLeft:0 bottomRight:20];
        [borderView setFillColor:[UIColor grayColor]];
        [borderView setBackgroundColor:[UIColor purpleColor]];
        [borderView setClipsToBoundsWithBorder:true];//裁剪掉边线外面的区域
        [self.view addSubview:borderView];
    }
    
    {//demo4处理上下两个线，顶部带弧度
        YRBorderView *borderView=[[YRBorderView alloc]initWithFrame:CGRectMake(170, 180, 100, 100)];
        [borderView setNeedLineTop:true left:false bottom:true right:false];
        [borderView setLineColorTop:[UIColor blueColor] left:[UIColor greenColor] bottom:[UIColor brownColor] right:[UIColor redColor]];
        [borderView setLineWidthTop:6 left:6 bottom:6 right:6];
        [borderView setRadiusTopLeft:20 topRight:20 bottomLeft:0 bottomRight:0];
        [borderView setFillColor:[UIColor grayColor]];
        [borderView setBackgroundColor:[UIColor purpleColor]];
//        [borderView setClipsToBoundsWithBorder:true];//裁剪掉边线外面的区域
        [self.view addSubview:borderView];
    }
    
    {//demo5处理个圆玩玩
        YRBorderView *borderView=[[YRBorderView alloc]initWithFrame:CGRectMake(80, 300, 100, 100)];
        [borderView setNeedLineTop:true left:true bottom:true right:true];
        [borderView setLineColorTop:[UIColor blueColor] left:[UIColor greenColor] bottom:[UIColor brownColor] right:[UIColor redColor]];
        [borderView setLineWidthTop:6 left:6 bottom:6 right:6];
        [borderView setRadiusTopLeft:50 topRight:50 bottomLeft:50 bottomRight:50];
        [borderView setFillColor:[UIColor grayColor]];
        [borderView setBackgroundColor:[UIColor purpleColor]];
        [borderView setClipsToBoundsWithBorder:true];//裁剪掉边线外面的区域
        [self.view addSubview:borderView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
