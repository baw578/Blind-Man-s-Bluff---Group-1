//
//  ViewController.h
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITextField *playerNameTextField;
- (IBAction)playerNameButton:(id)sender;


@end
