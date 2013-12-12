//====================================================================================================
// Author: Peter Chen
// Created: 12/12/13
// Copyright 2013 Peter Chen
//====================================================================================================

#import <UIKit/UIKit.h>


@interface PCSButtonDragTableCellHelper : NSObject

- (void)trackButton:(UIButton *)button;
- (void)untrackAllButtons;

- (BOOL)callSuperForTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (BOOL)callSuperForTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (BOOL)callSuperForTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (BOOL)callSuperForTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

@end
