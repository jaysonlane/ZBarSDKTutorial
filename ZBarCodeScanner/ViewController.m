//
//  ViewController.m
//  ZBarCodeScanner
//
//  Created by Jayson Lane on 4/18/12.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize scanButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)scanButtonPress:(id)sender{
    
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    
    [reader.scanner setSymbology: ZBAR_UPCA config: ZBAR_CFG_ENABLE to: 0];
    reader.readerView.zoom = 1.0;
    
    [self presentModalViewController: reader
                            animated: YES];
    
    
    
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    
    ZBarSymbol *symbol = nil;
    
    for(symbol in results){
           
        NSString *upcString = symbol.data;
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Scanned UPC" message:[NSString stringWithFormat:@"The UPC read was: %@", upcString] delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        
        [alert show];
        
        [reader dismissModalViewControllerAnimated: YES];
        
    }
    
    
}


@end
