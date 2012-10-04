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
@synthesize calcDisplay, operatorDisplay, numberOne, numberTwo;

- (void)viewDidLoad
{
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
            NSString *castInt = [NSString stringWithFormat:@"%d", button.tag];
            calcDisplay.text = [calcDisplay.text stringByAppendingString:castInt];
        }
            break;
        
        case ADD:
        {
            operatorDisplay.text = @"+";
            operatorDisplay.tag = ADD;
            if (numberOne == nil){
                numberOne = calcDisplay.text;
                calcDisplay.text = @"";
            } else if (numberTwo == nil){
                numberTwo = calcDisplay.text;
                [self getResults:numberOne with:numberTwo];
            } else if (numberTwo != nil){
                [self getResults:numberOne with:numberTwo];
                numberTwo = nil;
            }
        }
        case SUBTRACT:
        case MULTIPLY:
        case DIVIDE:
        {
            
        }
            break;
        
        case EQUAL:
        {
            numberTwo = calcDisplay.text;
            [self getResults:numberOne with:numberTwo];
        }
            break;
        case CLEAR:
        {
            numberOne = @"";
            numberTwo = @"";
            calcDisplay.text = @"";
            operatorDisplay.text = @"";
        }
            break;
        case SWITCH:
        {
            
        }
            break;
        case BGSEGMENT:
        {
            
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

-(void)getResults:(NSString*)first with:(NSString*)second
{
    int castNumberOne = [first intValue];
    int castNumberTwo = [second intValue];
    
    switch (operatorDisplay.tag) {
        case ADD:
        {
            int added = castNumberOne + castNumberTwo;
            calcDisplay.text = [[NSNumber numberWithInt:added]stringValue];
            numberOne = calcDisplay.text;
        }
            break;
        case SUBTRACT:
        {
            
        }
            break;
        case MULTIPLY:
        {
            
        }
            break;
        case DIVIDE:
        {
            
        }
            break;
        default:
            break;
    }
}
@end
