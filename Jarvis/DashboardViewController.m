//
//  DashboardViewController.m
//  Jarvis
//
//  Created by James Pickering on 11/17/15.
//  Copyright © 2015 James Pickering. All rights reserved.
//

#import "DashboardViewController.h"
#import "DashboardView.h"
#import "JVAWidget.h"

#import <PureLayout/PureLayout.h>

@interface DashboardViewController ()

@property (strong, nonatomic) JVAWidget *speechWidget;
@property (strong, nonatomic) NSArray<JVAWidget *> *dashboardWidgets;

@end

@implementation DashboardViewController

- (void)loadView {
    
    self.view = [[DashboardView alloc] init];
    
    self.dashboardWidgets = [[NSArray alloc] initWithObjects:[[JVAWidget alloc] init], [[JVAWidget alloc] init], [[JVAWidget alloc] init], [[JVAWidget alloc] init], [[JVAWidget alloc] init], [[JVAWidget alloc] init], nil];
    
    /*for (JVAWidget *w in self.dashboardWidgets) {
        
        [w.view setFrame:NSMakeRect(50, 50, 50, 50)];
        
        [self.view addSubview:w.view];
    }*/
    
    CGFloat side = [[NSScreen mainScreen] frame].size.height / 4;
    CGSize size = CGSizeMake(side, side);
    
    CGFloat padding = [[NSScreen mainScreen] frame].size.height / 4 - side / 2;
    CGFloat cornerRadius = side / 2;
    
    self.speechWidget = [[JVAWidget alloc] init];
    
    [self.view addSubview:self.speechWidget.view];
    
    [self.speechWidget.view autoCenterInSuperview];
    [self.speechWidget.view autoSetDimensionsToSize:size];
    
    self.speechWidget.view.layer.cornerRadius = cornerRadius;
    
    JVAWidget *widget1 = [[JVAWidget alloc] init];
    
    [self.view addSubview:widget1.view];
    
    [widget1.view autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [widget1.view autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:30];
    [widget1.view autoSetDimensionsToSize:size];
    
    widget1.view.layer.cornerRadius = cornerRadius;
    
    JVAWidget *widget2 = [[JVAWidget alloc] init];
    
    [self.view addSubview:widget2.view];
    
    [widget2.view autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:padding];
    [widget2.view autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:padding];
    [widget2.view autoSetDimensionsToSize:size];
    
    widget2.view.layer.cornerRadius = cornerRadius;
    
    JVAWidget *widget3 = [[JVAWidget alloc] init];
    
    [self.view addSubview:widget3.view];
    
    [widget3.view autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:padding];
    [widget3.view autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:padding];
    [widget3.view autoSetDimensionsToSize:size];
    
    widget3.view.layer.cornerRadius = cornerRadius;
    
    JVAWidget *widget4 = [[JVAWidget alloc] init];
    
    [self.view addSubview:widget4.view];
    
    [widget4.view autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [widget4.view autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:30];
    [widget4.view autoSetDimensionsToSize:size];
    
    widget4.view.layer.cornerRadius = cornerRadius;
    
    JVAWidget *widget5 = [[JVAWidget alloc] init];
    
    [self.view addSubview:widget5.view];
    
    [widget5.view autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:padding];
    [widget5.view autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:padding];
    [widget5.view autoSetDimensionsToSize:size];
    
    widget5.view.layer.cornerRadius = cornerRadius;
    
    JVAWidget *widget6 = [[JVAWidget alloc] init];
    
    [self.view addSubview:widget6.view];
    
    [widget6.view autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:padding];
    [widget6.view autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:padding];
    [widget6.view autoSetDimensionsToSize:size];
    
    widget6.view.layer.cornerRadius = cornerRadius;
}

@end
