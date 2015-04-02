//
//  CountersListViewController.m
//  counter
//
//  Created by Paul Dariye on 4/1/15.
//  Copyright (c) 2015 tanookilabs. All rights reserved.
//

#import "CountersListViewController.h"
#import "Counter.h"

@implementation CountersListViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Counters";
    
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        
        
        navItem.rightBarButtonItem = bbi;
        
        //navItem.leftBarButtonItem = self.editButtonItem;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 2;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    NSMutableArray *counters = [[NSMutableArray alloc] init];
    
    Counter *counter1 = [[Counter alloc]init];
    counter1.counterName = @"Coffee";
    
    Counter *counter2 = [[Counter alloc]init];
    counter2.counterName = @"Miles";
    
    [counters addObject:counter1];
    [counters addObject:counter2];
    
    Counter *ctr = counters[indexPath.row];
    
    cell.textLabel.text = ctr.counterName;
    
    return cell;
}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
////    
////    Counter *counter1 = [[Counter alloc] init];
////    counter1.counterName = @"Coffee";
////    
////    Counter *counter2 = [[Counter alloc] init];
////    counter2.counterName = @"Miles";
////    
////    NSMutableArray *counters = [[NSMutableArray alloc] init];
////    [counters addObject:counter1];
////    [counters addObject:counter2];
////    
////    Counter *ctr = counters[indexPath.row];
////    
////    cell.textLabel.text = @"sdlfjsdlfkj";
////    
////    return cell;
//}

- (void)addNewItem
{
    
}

@end
