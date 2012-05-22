//
//  Player.m
//  Blind Man's Bluff
//
//  Created by Brian Lewis on 4/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Player.h"

@implementation Player
@synthesize playerName, playerTypeHuman, chipCount, playerValueOfCard;
@synthesize playerIsWinner, playerHasChips, folds;

- (id) initPlayer:(NSString *)newName andWithValue:(int)chipsStartingOut andWithBool: (BOOL)playerTypeIsHuman andWithCardValue:(int)playerCardValue{
    playerName = newName;
    chipCount = chipsStartingOut;
    playerTypeHuman = playerTypeIsHuman;
    playerValueOfCard = playerCardValue;
    return self;
}

@end
