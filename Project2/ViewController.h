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

@property IBOutlet UILabel *calcDisplay;
@property IBOutlet UILabel *operatorDisplay;
@property IBOutlet UISegmentedControl *backgroundColor;
@property IBOutlet UISwitch *onOffSwitch;
@property NSString *numberOne;
@property NSString *numberTwo;
@property BOOL typingSwap;
@property int results;

-(IBAction)userControlsHandler:(id)sender;

-(void)getResults:(NSString*)first with:(NSString*)second;

@end
