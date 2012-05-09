//
//  ViewController.h
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface ViewController : UIViewController
@property (nonatomic, strong) Deck * temp;

@property (nonatomic, strong)UIView * mainCardArea;
@property (nonatomic, strong)UIImageView * playingCardSprite;

@property (nonatomic, strong)UIView * mainCardArea2;
@property (nonatomic, strong)UIImageView * playingCardSprite2;

- (IBAction)dealCardsButton:(id)sender;
@property (nonatomic, strong)UIView * mainCardArea3;
@property (nonatomic, strong)UIImageView * playingCardSprite3;
// Code created by Brian Lewis
//Testing Github access
// End of code created by Brian Lewis

// Checking Clone to Ben Wolski


@end
