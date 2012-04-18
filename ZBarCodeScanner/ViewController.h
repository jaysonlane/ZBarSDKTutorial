//
//  ViewController.h
//  ZBarCodeScanner
//
//  Created by Jayson Lane on 4/18/12.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface ViewController : UIViewController <ZBarReaderDelegate> {
    IBOutlet UIButton *scanButton;
    
}

@property (nonatomic, retain) IBOutlet UIButton *scanButton;

-(IBAction) scanButtonPress:sender;

@end
