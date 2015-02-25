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

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [[[BNRItemStore sharedStore] allItems] count];
//}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
////    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
//    // Get a new or recycled cell
//
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
//    
//    
//    
//    
//    NSArray *items = [[BNRItemStore sharedStore] allItems];
//    BNRItem *item = items[indexPath.row];
//    
//    cell.textLabel.text = [item description];
//    
//    return cell;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

/* ===========================================================
    
                Bronze Challenge:
     1. Create two sections in table view
     2. Then add two titles for eact section
     3. Make sure that number of rows in each section correspond to # items
     4. Populate items under each section by sorting by price

 
 ============================================================= */


// Return umber of sections
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Set number of sections to 2
    return 2;
}

// Set section headers
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // Define array with section headers
    NSArray *sectionHeaderTitles = [[NSArray alloc] initWithObjects:@"Items > $50", @"Others", nil];
    
    // Set section headers
    return [sectionHeaderTitles objectAtIndex:section];
}

// Return appropriate number of rows for each section
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

//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
//    // Get a new or recycled cell
//    
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
//    
//    
//    
//    // Filter > 50
//    NSPredicate *greaterThanFifty = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
//        BNRItem *value = (BNRItem *)evaluatedObject;
//        
//        return value.valueInDollars > 50;
//    }];
//    
//    // Filter < 50
//    NSPredicate *lessThanFifty = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
//        BNRItem *value = (BNRItem *)evaluatedObject;
//        
//        return value.valueInDollars < 50;
//    }];
//    
//    NSInteger totalRow = [tableView numberOfRowsInSection:indexPath.section];
//
//    switch (indexPath.section) {
//        case 0:
//        {
//            // assign cell item text at indexPath.row
//            cell.textLabel.text = [[[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:greaterThanFifty][indexPath.row] description];
//
//
//            break;
//        }
//        case 1:
//        {
//            // assingn cell item text at indexPath.row
//            cell.textLabel.text =[[[[BNRItemStore sharedStore] allItems] filteredArrayUsingPredicate:lessThanFifty][indexPath.row] description];
//            // check if last row of table
//            if (indexPath.row == totalRow - 1) {
//                // set label text to 'No More Items'
//                cell.textLabel.text = @"No more items!";
//            }
//
//            break;
//        }
//        default:
//            break;
//    }
//
////    
////    NSInteger row = [indexPath row];
////    
////    if (row == [[[BNRItemStore sharedStore] allItems] count]) {
//////        cell.textLabel.text = @"No More Items";
////        cell.textLabel.text = [self.tableView ]
////        
//////        [self.tableView insertRowsAtIndexPaths: withRowAnimation:<#(UITableViewRowAnimation)#>]
////        
////        
////    }
////    
////    NSArray *items = [[BNRItemStore sharedStore] allItems];
////    BNRItem *item = items[indexPath.row];
//    
//    
//    return cell;
//}


/* ================================================
 
 Silver Challenge:
 Append last row with 'No more items'
 
 1. find the last row
 2. Add text 'No more items'
 
 
 ================================================== */

// Find out number of rows in table view

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.00;
}

@end
