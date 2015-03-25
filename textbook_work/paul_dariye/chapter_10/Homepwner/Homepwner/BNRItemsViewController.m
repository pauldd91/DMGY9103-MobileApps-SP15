//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Paul Dariye on 2/24/15.
//  Copyright (c) 2015 Pearl-Labs. All rights reserved.
//




#import "BNRItemsViewController.h"


#import "BNRItemStore.h"
#import "BNRItem.h"



@interface BNRItemsViewController ()

//@property (nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation BNRItemsViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}


// changing the designated initializer to 'init'

- (instancetype)init
{
    // call super cass designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
//        for (int i = 0; i < 5; i++) {
//            [[BNRItemStore sharedStore] createItem];
//        }
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"Homepwner";
        
        // create a new bar button item that will send addNewItem to BNRItemsViewController
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
        
        // Set bbi as right item in navigationItem
        
        navItem.rightBarButtonItem = bbi;
        navItem.leftBarButtonItem = self.editButtonItem;
        
    }
    
    
    return self;
    
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    // override the superclass's designated initializer
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    // Get a new or recycled cell

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    
    
    
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
//    UIView *header = self.headerView;
//    [self.tableView setTableHeaderView:header];
}

// headerView implementation and methods

//- (UIView *)headerView
//{
//    // check if headerView has been loaded
//    if (!_headerView) {
//        // Load HeaderView.xib
//        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
//    }
//    
//    return _headerView;
//}

- (IBAction)addNewItem:(id)sender
{
    // Make new row for the 0th section
//    NSInteger lastRow = [self.tableView numberOfRowsInSection:0];
    // Create a new BNRItem and add the store
    
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    // find new item in the array
    NSInteger lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    // insert new row into table
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
    
    
}


//- (IBAction)toggleEditingMode:(id)sender
//{
//    // Check if user is in editing mode
//    
//    if (self.isEditing) {
//        // Turn off editing mode
//        [self setEditing:NO animated:YES];
//        // Inform user of state
//        [sender setTitle:@"Edit" forState:UIControlStateNormal];
//        
//    } else {
//        
//        // Enter editing mode
//        [self setEditing:YES animated:YES];
//        
//        // Inform user of state
//        [sender setTitle:@"Done" forState:UIControlStateNormal];
//        
//        
//    }
//    
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // if table view requests a deletion command
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Remove item from store
        NSArray *items = [[BNRItemStore sharedStore] allItems];
        BNRItem *item = items[indexPath.row];
        [[BNRItemStore sharedStore] removeItem:item];
        
        // Remove item from tableview
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[BNRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BNRDetailViewController *detailViewController = [[BNRDetailViewController alloc] init];
    
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *selectedItem = items[indexPath.row];
    
    // Assign detail view controller a pointer to the item object in row
    
    detailViewController.item = selectedItem;
    
    // Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:detailViewController animated:YES];
}


@end
