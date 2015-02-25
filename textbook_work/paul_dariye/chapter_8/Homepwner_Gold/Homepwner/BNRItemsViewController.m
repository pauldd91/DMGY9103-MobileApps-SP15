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


@implementation BNRItemsViewController

// changing the designated initializer to 'init'


- (instancetype)init
{
    // call super cass designated initializer
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
    
}


- (instancetype)initWithStyle:(UITableViewStyle)style
{
    // override the superclass's designated initializer
    return [self init];
}


// -------------------------------------------------------------------------------
//	viewDidLoad
// -------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    // Add 20pts space at the top (think padding or margin)
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.tableView.contentInset = inset;
}



// -------------------------------------------------------------------------------
//	tableView:numberOfSectionsInTableView:
// -------------------------------------------------------------------------------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Set number of sections to 2
    return 2;
}

// -------------------------------------------------------------------------------
//	tableView:titleForHeaderInSection:
// -------------------------------------------------------------------------------

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // Define array with section headers
    NSArray *sectionHeaderTitles = [[NSArray alloc] initWithObjects:@"Items > $50", @"Others", nil];
    
    // Set section headers
    return [sectionHeaderTitles objectAtIndex:section];
}

// -------------------------------------------------------------------------------
//	tableView:numberOfRowsInSection:
// -------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Filter > 50
    NSPredicate *greaterThanFifty = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        BNRItem *value = (BNRItem *)evaluatedObject;
        
        return value.valueInDollars > 50;
    }];
    
    // Filter < 50
    NSPredicate *lessThanFifty = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        BNRItem *value = (BNRItem *)evaluatedObject;
        
        return value.valueInDollars < 50;
    }];
    
    // Assign corresponding number of rows to each section
    
    if (section == 0) {
        NSArray *filteredArray = [[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:greaterThanFifty];
        
        return [filteredArray count];
    } else {
        
         NSArray *filteredArray = [[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:lessThanFifty];
        
        return [filteredArray count];
    }
}



// -------------------------------------------------------------------------------
//	tableView:cellForRowAtIndexPath:
// -------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    // Get a new or recycled cell
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    
    
    // Filter > 50
    NSPredicate *greaterThanFifty = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        BNRItem *value = (BNRItem *)evaluatedObject;
        
        return value.valueInDollars > 50;
    }];
    
    // Filter < 50
    NSPredicate *lessThanFifty = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        BNRItem *value = (BNRItem *)evaluatedObject;
        
        return value.valueInDollars < 50;
    }];
    
    NSInteger totalRow = [tableView numberOfRowsInSection:indexPath.section];
    
    switch (indexPath.section) {
        case 0:
        {
            // assign cell item text at indexPath.row
            cell.textLabel.text = [[[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:greaterThanFifty][indexPath.row] itemName];
            
            // Gold Challenge
            cell.textLabel.font = [UIFont systemFontOfSize:20.00];
            break;
        }
        case 1:
        {
            // assingn cell item text at indexPath.row
            cell.textLabel.text =[[[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:lessThanFifty][indexPath.row] itemName];
            // Gold Challenge
            cell.textLabel.font = [UIFont systemFontOfSize:20.00];
            // check if last row of table
            // http://stackoverflow.com/questions/20603598/get-last-cell-in-a-uitableview-section
            if (indexPath.row == totalRow - 1) {
                // set label text to 'No More Items'
                cell.textLabel.text = @"No more items!";
            }
            
            break;
        }
        default:
            break;
    }

    
    return cell;
}


/* =====================================================
 
                Gold Challenge: 
 
 1. Set all row heights to 60pts save the last one which should be 44pts
 2. Change font-size of each row element to 20 pts
 3. Make image background of UITableView
 
 */

// -------------------------------------------------------------------------------
//	tableView:heightForRowAtIndexPath:
// -------------------------------------------------------------------------------

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.00;
}

@end
