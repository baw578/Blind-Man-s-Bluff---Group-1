//
//  GameController.h
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface GameController : UIViewController




@property (nonatomic, strong) Deck * temp;

@property (nonatomic, strong)UIView * mainCardArea;
@property (nonatomic, strong)UIImageView * playingCardSprite;

@property (nonatomic, strong)UIView * mainCardArea2;
@property (nonatomic, strong)UIImageView * playingCardSprite2;

- (IBAction)dealCardsButton:(id)sender;
@property (nonatomic, strong)UIView * mainCardArea3;
@property (nonatomic, strong)UIImageView * playingCardSprite3;

@end
