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

@property IBOutlet UILabel *calcDisplay;
@property IBOutlet UILabel *operatorDisplay;
@property NSString *numberOne;
@property NSString *numberTwo;
@property BOOL typingSwap;
@property int results;

-(IBAction)userControlsHandler:(id)sender;

-(void)getResults:(NSString*)first with:(NSString*)second;

@end
