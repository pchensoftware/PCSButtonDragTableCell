//====================================================================================================
// Author: Peter Chen
// Created: 12/12/13
// Copyright 2013 Peter Chen
//====================================================================================================

#import "PCSButtonDragTableCell.h"

@interface PCSButtonDragTableCell()

@end

@implementation PCSButtonDragTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
   if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
      self.buttonDragHelper = [[PCSButtonDragTableCellHelper alloc] init];
   }
   return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
   [super setSelected:selected animated:animated];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
   if ([self.buttonDragHelper callSuperForTouchesBegan:touches withEvent:event])
      [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
   if ([self.buttonDragHelper callSuperForTouchesMoved:touches withEvent:event])
      [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
   if ([self.buttonDragHelper callSuperForTouchesEnded:touches withEvent:event])
      [super touchesEnded:touches withEvent:event];
}

// This automatically gets called when the table view is dragged vertically past a threshold of about 15px
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
   if ([self.buttonDragHelper callSuperForTouchesCancelled:touches withEvent:event])
      [super touchesCancelled:touches withEvent:event];
}

@end
