//
//  tblDemoViewController.m
//  autoLayoutDemo
//
//  Created by RIGEL on 12/7/16.
//  Copyright © 2016 RIGEL. All rights reserved.
//

#import "tblDemoViewController.h"

@interface tblDemoViewController ()
{
    NSMutableArray *tblArray;
    
    UITextField *txtField;
}
@end

@implementation tblDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tblArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableview Datasource method

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tblArray.count + 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (tblArray.count < 1) {
        cell = (UITableViewCell *)[self.tblView dequeueReusableCellWithIdentifier:@"cell"];
        
        txtField = [cell viewWithTag:1];
        
        UIButton *btn = [cell viewWithTag:2];
        [btn addTarget:self action:@selector(tblAddBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
    } else {
        if (indexPath.row <= tblArray.count - 1) {
            cell = (UITableViewCell *)[self.tblView dequeueReusableCellWithIdentifier:@"list"];
            cell.textLabel.text = [tblArray objectAtIndex:indexPath.row];
        } else {
        cell = (UITableViewCell *)[self.tblView dequeueReusableCellWithIdentifier:@"cell"];
        
        txtField = [cell viewWithTag:1];
        
        UIButton *btn = [cell viewWithTag:2];
        [btn addTarget:self action:@selector(tblAddBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    return cell;
}

-(void)tblAddBtnClicked:(UIButton *)sender
{
    if (![txtField.text isEqualToString:@""]) {
        [tblArray addObject:txtField.text];
        txtField.text = @"";
        [self.tblView reloadData];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Info" message:@"Please enter some sext in textfield." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
