//
//  ViewController.h
//  Project2
//
//  Created by Russell Carlin on 10/3/12.
//  Copyright (c) 2012 Russell Carlin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 
{
    IBOutlet UILabel *calcDisplay;
    IBOutlet UILabel *operatorDisplay;
    IBOutlet UISegmentedControl *backgroundColor;
    IBOutlet UISwitch *onOffSwitch;
}

typedef enum
{
    ADD = 10,
    SUBTRACT,
    MULTIPLY,
    DIVIDE,
    EQUAL,
    CLEAR,
    SWITCH,
    BGSEGMENT,
    INFOBUTTON
}buttonTypes;

typedef enum
{
    WHITE,
    BLUE,
    GREEN
}colors;


@property NSString *numberOne;
@property NSString *numberTwo;
@property BOOL typingSwap;
@property int results;

-(IBAction)userControlsHandler:(id)sender;

-(void)getResults:(NSString*)first with:(NSString*)second;

-(void)operatorSwap:(int)op;

@end
