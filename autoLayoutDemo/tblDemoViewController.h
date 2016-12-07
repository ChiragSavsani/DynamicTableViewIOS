//
//  tblDemoViewController.h
//  autoLayoutDemo
//
//  Created by RIGEL on 12/7/16.
//  Copyright © 2016 RIGEL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tblDemoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tblView;

@end
