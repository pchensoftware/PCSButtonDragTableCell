//====================================================================================================
// Author: Peter Chen
// Created: 12/12/13
// Copyright 2013 Peter Chen
//====================================================================================================

#import "PCSButtonDragTableCellHelper.h"

@interface PCSButtonDragTableCellHelper()

@property (nonatomic, strong) NSMutableSet *buttons;
@property (nonatomic, weak) UIButton *touchBeganOverButton;

@end

@implementation PCSButtonDragTableCellHelper

- (id)init {
   if ((self = [super init])) {
      self.buttons = [NSMutableSet set];
   }
   return self;
}

- (void)trackButton:(UIButton *)button {
   if (! button)
      return;
   
   //if ([button isDescendantOfView:self.contentView])
   //   return;
   
   button.userInteractionEnabled = NO;
   [self.buttons addObject:button];
}

- (void)untrackButton:(UIButton *)button {
   [self.buttons removeObject:button];
}

- (void)untrackAllButtons {
   [self.buttons removeAllObjects];
}

//====================================================================================================
#pragma mark - Touches
//====================================================================================================

- (BOOL)callSuperForTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
   UITouch *touch = [touches anyObject];
   
   self.touchBeganOverButton = nil;
   for (UIButton *button in self.buttons) {
      CGPoint location = [touch locationInView:button.superview];
      if (CGRectContainsPoint(button.frame, location)) {
         self.touchBeganOverButton = button;
         break;
      }
   }
   
   if (self.touchBeganOverButton) {
      self.touchBeganOverButton.highlighted = YES;
      return NO;
   }
   else {
      return YES;
   }
}

- (BOOL)callSuperForTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
   if (self.touchBeganOverButton) {
      return NO;
   }
   else {
      return YES;
   }
}

- (BOOL)callSuperForTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
   if (self.touchBeganOverButton) {
      self.touchBeganOverButton.highlighted = NO;
      [self.touchBeganOverButton sendActionsForControlEvents:UIControlEventTouchUpInside];
      return NO;
   }
   else {
      return YES;
   }
}

// This automatically gets called when the table view is dragged vertically past a threshold of about 15px
- (BOOL)callSuperForTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
   if (self.touchBeganOverButton) {
      self.touchBeganOverButton.highlighted = NO;
      self.touchBeganOverButton = nil;
      return NO;
   }
   else {
      return YES;
   }
}

@end
