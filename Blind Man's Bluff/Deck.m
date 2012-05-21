//
//  Deck.m
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 1/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Deck.h"

@implementation Deck
@synthesize cardDeck;

-(id)initWithFullDeck;
{
    if (!cardDeck) {
        cardDeck = [[NSMutableArray alloc]initWithCapacity:52];
    }
    
    for (int i = 2; i<=14; i++) {
        Card * temp1 = [[Card alloc]initWithSuit:@"Clubs" andWithValue:i andWithCenter:CGPointMake(1, 1)]; 
        Card * temp2 = [[Card alloc]initWithSuit:@"Spades" andWithValue:i andWithCenter:CGPointMake(1, 2)]; 
        Card * temp3 = [[Card alloc]initWithSuit:@"Hearts" andWithValue:i andWithCenter:CGPointMake(1, 1)]; 
        Card * temp4 = [[Card alloc]initWithSuit:@"Diamonds" andWithValue:i andWithCenter:CGPointMake(1, 1)]; 
        [cardDeck addObject:temp1];
        [cardDeck addObject:temp2];
        [cardDeck addObject:temp3];
        [cardDeck addObject:temp4];
    }
    
    return self;
}



-(void)logThisDeck
{
    for (int i=0; i < [cardDeck count]; i++) {
        [[cardDeck objectAtIndex:i] logThisCard];
    }
}

-(void)shuffle
{
    for (int i = [cardDeck count] - 1; i>0; i--) {
        int randomChoice = arc4random() % i;
        [cardDeck exchangeObjectAtIndex:i withObjectAtIndex:randomChoice];
    }
}

-(id)dealACard
{
    for (int i = 0; i < [cardDeck count]; i++) {
        Card * thisCard = [cardDeck objectAtIndex:i];
        [cardDeck removeObject:thisCard];
        return thisCard;
    }
    return self;
}

@end
