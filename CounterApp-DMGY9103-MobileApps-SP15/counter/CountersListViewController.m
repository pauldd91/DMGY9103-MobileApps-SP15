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
    
    _counters = [[NSMutableArray alloc] init];
    
    Counter *counter1 = [[Counter alloc]init];
    counter1.counterName = @"Coffee";
    
    Counter *counter2 = [[Counter alloc]init];
    counter2.counterName = @"Miles";
    
    [_counters addObject:counter1];
    [_counters addObject:counter2];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_counters count];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
{
    return [self init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    
    Counter *ctr = _counters[indexPath.row];
    
    cell.textLabel.text = ctr.counterName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i",ctr.count];
    cell.detailTextLabel.textAlignment = UITextAlignmentRight;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CounterViewController *cvc = [[CounterViewController alloc]init];
    
    Counter *ctr = _counters[indexPath.row];
    
    NSLog(@"index %i", indexPath.row);
    
    cvc.item = ctr;
    
    [self.navigationController pushViewController:cvc animated:YES];
}

- (void)addNewItem
{
    
}

@end
