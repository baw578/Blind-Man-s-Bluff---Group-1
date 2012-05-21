//
//  Player.h
//  Blind Man's Bluff
//
//  Created by Brian Lewis on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface Player : NSObject
@property NSString * playerName;
@property int chipCount;
@property BOOL playerTypeHuman;
@property int playerValueOfCard;

- (id) initPlayer:(NSString *)newName andWithValue:(int)chipsStartingOut andWithBool: (BOOL)playerTypeIsHuman andWithCardValue:(int)playerCardValue;

@end
