//====================================================================================================
// Author: Peter Chen
// Created: 12/12/13
// Copyright 2013 Peter Chen
//====================================================================================================

#import "MyTableController.h"
#import "PCSButtonDragTableCell.h"

typedef NS_ENUM(int, Sections) {
   Section_Hello,
   Section_Count
};

@interface MyTableController()



@end

@implementation MyTableController

- (id)init {
   if ((self = [super initWithStyle:UITableViewStylePlain])) {
   }
   return self;
}

- (void)viewDidLoad {
   [super viewDidLoad];
   
   self.title = @"Button in Table View Cell";
   
   UITextView *headerTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.height, 50)];
   headerTextView.text = @"Long press and then drag the buttons in the table view cells";
   headerTextView.userInteractionEnabled = NO;
   headerTextView.backgroundColor = self.tableView.backgroundColor;
   self.tableView.tableHeaderView = headerTextView;
}

//====================================================================================================
#pragma mark - Table view
//====================================================================================================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   return Section_Count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *CellNormalButtonId = @"CellNormalButtonId";
   static NSString *CellButtonDragId = @"CellButtonDragId";
   
   if (indexPath.row == 0) {
      PCSButtonDragTableCell *cell = (PCSButtonDragTableCell *) [tableView dequeueReusableCellWithIdentifier:CellButtonDragId];
      if (cell == nil) {
         cell = [[PCSButtonDragTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellButtonDragId];
         
         UIButton *dragThisButton = [UIButton buttonWithType:UIButtonTypeSystem];
         dragThisButton.frame = CGRectMake(20, 0, 200, cell.contentView.frame.size.height);
         dragThisButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
         [dragThisButton setTitle:@"PCSButtonDragTableCell" forState:UIControlStateNormal];
         [dragThisButton addTarget:self action:@selector(_buttonTapped) forControlEvents:UIControlEventTouchUpInside];
         [cell.contentView addSubview:dragThisButton];
         
         [cell.buttonDragHelper trackButton:dragThisButton];
      }
      
      return cell;
   }
   else {
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellNormalButtonId];
      if (cell == nil) {
         cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellNormalButtonId];
         
         UIButton *dragThisButton = [UIButton buttonWithType:UIButtonTypeSystem];
         dragThisButton.frame = CGRectMake(20, 0, 200, cell.contentView.frame.size.height);
         dragThisButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
         [dragThisButton setTitle:@"UIButton" forState:UIControlStateNormal];
         [cell.contentView addSubview:dragThisButton];
      }
      
      return cell;
   }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//====================================================================================================
#pragma mark - Events
//====================================================================================================

- (void)_buttonTapped {
   NSLog(@"Button tapped!!");
}

@end
