//
//  ViewController.m
//  Project2
//
//  Created by Russell Carlin on 10/3/12.
//  Copyright (c) 2012 Russell Carlin. All rights reserved.
//

#import "ViewController.h"
#import "infoViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize numberOne, numberTwo, typingSwap, results;

- (void)viewDidLoad
{
    typingSwap = NO;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)userControlsHandler:(id)sender
{
    UIButton *button = (UIButton*)sender;
    
//Checks to see if the switch is on or off. If on, allow use of calculator. If off, display an alert saying that it is off.
    if (onOffSwitch.on == FALSE){
        UIAlertView *switchedOff = [[UIAlertView alloc]initWithTitle:@"" message:@"Calculator switched off!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [switchedOff show];
    } else if (onOffSwitch.on == TRUE){
        
//Used a single switch statement for all of the controls. What is done is dependant on the tag of the control.
        switch (button.tag) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            {
                
//Checks if you just hit an operator or a number. If it is a number, you append the number to what is already there. If it is an operator, then the display is cleared and numbers start over.
                if (typingSwap == NO) {
                    calcDisplay.text = @"";
                }
                typingSwap = YES;
                NSString *castInt = [NSString stringWithFormat:@"%d", button.tag];
                calcDisplay.text = [calcDisplay.text stringByAppendingString:castInt];
            }
                break;
            
//This sets the the operator display depending on what operator was hit, and then controls what happens. If it is the first number, it simply saves that number. If it is the second number, it performs the operation hit.
            case ADD:
            case SUBTRACT:
            case MULTIPLY:
            case DIVIDE:
            {
                if (calcDisplay.text != @"") {
                    if (numberOne == nil){
                        numberOne = calcDisplay.text;
                        [self operatorSwap:button.tag];
                    } else if (numberTwo == nil){
                        if (typingSwap == NO){
                            [self operatorSwap:button.tag];
                        } else if (typingSwap == YES){
                            numberTwo = calcDisplay.text;
                            [self getResults:numberOne with:numberTwo];
                            [self operatorSwap:button.tag];
                        }
                    } else if (numberTwo != nil){
                        if (typingSwap == NO){
                            [self operatorSwap:button.tag];
                        } else if (typingSwap == YES){
                            numberTwo = calcDisplay.text;
                            [self getResults:numberOne with:numberTwo];
                            [self operatorSwap:button.tag];
                        }
                    }
                    typingSwap = NO;
                }
            }
                break;
            
//Here I wanted the feature to keep doing whatever operation you had previously hit. So, if you hit 5 + 5, it will calculate it and add 5 each time you hit the = button. Results in this example would be 10, 15, 20, 25, and so on.    
            case EQUAL:
            {
                if (calcDisplay.text != @"") {
                    if (numberOne == nil){
                        numberOne = calcDisplay.text;
                    } else if (numberTwo == nil){
                        if (typingSwap == NO){
                            [self operatorSwap:button.tag];
                        } else if (typingSwap == YES){
                            numberTwo = calcDisplay.text;
                            [self getResults:numberOne with:numberTwo];
                        }
                    } else if (numberTwo != nil){
                        if (typingSwap == NO){
                            [self getResults:numberOne with:numberTwo];
                        } else if (typingSwap == YES){
                            numberTwo = calcDisplay.text;
                            [self getResults:numberOne with:numberTwo];
                        }
                    }
                    typingSwap = NO;
                }
            }
                break;
                
//Simple clear feature.
            case CLEAR:
            {
                numberOne = nil;
                numberTwo = nil;
                calcDisplay.text = @"";
                operatorDisplay.text = @"";
            }
                break;
                
//Simple if check to see which color is selected, then switches the color.
            case BGSEGMENT:
            {
                if (backgroundColor.selectedSegmentIndex == WHITE){
                    [self.view setBackgroundColor:[UIColor whiteColor]];
                } else if (backgroundColor.selectedSegmentIndex == BLUE){
                    [self.view setBackgroundColor:[UIColor blueColor]];
                } else if (backgroundColor.selectedSegmentIndex == GREEN){
                    [self.view setBackgroundColor:[UIColor greenColor]];
                }
            }
                break;
                
//Presents the second view with the info on it.
            case INFOBUTTON:
            {
                infoViewController *infoView = [[infoViewController alloc]initWithNibName:@"infoView" bundle:nil];
                [self presentViewController:infoView animated:TRUE completion:nil];
            }
                break;
            
            
            default:
            {
                
            }
                break;
        }
    }
}

//This gets the results by taking the two NSStrings, turning them into ints, and then the switch determines which operation to do. Next, it does the operation, turns the int into a string, and displays it on the calcDisplay.
-(void)getResults:(NSString*)first with:(NSString*)second
{
    int castNumberOne = [first intValue];
    int castNumberTwo = [second intValue];
    
    switch (operatorDisplay.tag) {
        case ADD:
        {
            results = castNumberOne + castNumberTwo;
        }
            break;
        case SUBTRACT:
        {
            results = castNumberOne - castNumberTwo;
        }
            break;
        case MULTIPLY:
        {
            results = castNumberOne * castNumberTwo;
        }
            break;
        case DIVIDE:
        {
            results = castNumberOne / castNumberTwo;
        }
            break;
        default:
            break;
    }
    calcDisplay.text = [[NSNumber numberWithInt:results]stringValue];
    numberOne = calcDisplay.text;
}

-(void)operatorSwap:(int)op
{
    if (op == ADD){
        operatorDisplay.text = @"+";
        operatorDisplay.tag = ADD;
    } else if (op == SUBTRACT){
        operatorDisplay.text = @"-";
        operatorDisplay.tag = SUBTRACT;
    } else if (op == MULTIPLY){
        operatorDisplay.text = @"*";
        operatorDisplay.tag = MULTIPLY;
    } else if (op == DIVIDE){
        operatorDisplay.text = @"/";
        operatorDisplay.tag = DIVIDE;
    }
}
@end
