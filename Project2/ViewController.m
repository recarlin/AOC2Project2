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
@synthesize calcDisplay, operatorDisplay, onOffSwitch, backgroundColor, numberOne, numberTwo, typingSwap, results;

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
    
    if (onOffSwitch.on == FALSE){
        UIAlertView *switchedOff = [[UIAlertView alloc]initWithTitle:@"" message:@"Calculator switched off!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [switchedOff show];
    } else if (onOffSwitch.on == TRUE){
        
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
                if (typingSwap == NO) {
                    calcDisplay.text = @"";
                }
                typingSwap = YES;
                NSString *castInt = [NSString stringWithFormat:@"%d", button.tag];
                calcDisplay.text = [calcDisplay.text stringByAppendingString:castInt];
            }
                break;
            
            case ADD:
            case SUBTRACT:
            case MULTIPLY:
            case DIVIDE:
            {
                if (calcDisplay.text != @"") {
                    
                    typingSwap = NO;
                    if (button.tag == ADD){
                        operatorDisplay.text = @"+";
                        operatorDisplay.tag = ADD;
                    } else if (button.tag == SUBTRACT){
                        operatorDisplay.text = @"-";
                        operatorDisplay.tag = SUBTRACT;
                    } else if (button.tag == MULTIPLY){
                        operatorDisplay.text = @"*";
                        operatorDisplay.tag = MULTIPLY;
                    } else if (button.tag == DIVIDE){
                        operatorDisplay.text = @"/";
                        operatorDisplay.tag = DIVIDE;
                    }
                    
                    if (numberOne == nil){
                        numberOne = calcDisplay.text;
                    } else if (numberTwo == nil){
                        numberTwo = calcDisplay.text;
                        [self getResults:numberOne with:numberTwo];
                        numberTwo = nil;
                    } else if (numberTwo != nil){
                        numberTwo = nil;
                    }
                }
            }
                break;
            
            case EQUAL:
            {
                if (calcDisplay.text != @"") {
                    typingSwap = NO;
                    
                    if (numberOne == nil){
                        numberOne = calcDisplay.text;
                    } else if (numberTwo == nil){
                        numberTwo = calcDisplay.text;
                        [self getResults:numberOne with:numberTwo];
                    } else if (numberTwo != nil){
                        [self getResults:numberOne with:numberTwo];
                    }
                }
            }
                break;
            case CLEAR:
            {
                numberOne = nil;
                numberTwo = nil;
                calcDisplay.text = @"";
                operatorDisplay.text = @"";
            }
                break;
            case BGSEGMENT:
            {
                
                if (backgroundColor.selectedSegmentIndex == 0){
                    [self.view setBackgroundColor:[UIColor whiteColor]];
                } else if (backgroundColor.selectedSegmentIndex == 1){
                    [self.view setBackgroundColor:[UIColor blueColor]];
                } else if (backgroundColor.selectedSegmentIndex == 2){
                    [self.view setBackgroundColor:[UIColor greenColor]];
                }
            }
                break;
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
@end
