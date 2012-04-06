//
//  card.m
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "card.h"

@implementation Card
@synthesize suit;
@synthesize value;
@synthesize cardCenter;
@synthesize cardValueName;

-(id)initWithSuit:(NSString *)newSuit andWithValue:(int)cardValue andWithCenter:(CGPoint)theCenter
{
    self.suit = newSuit;
    self.value = cardValue;
    self.cardCenter = theCenter;
    return self;
}

-(void)logThisCard
{
    switch (value) {
        case 1:
            cardValueName = @"Ace";
            break;
        case 2:
            cardValueName = @"2";
            break;
        case 3:
            cardValueName = @"3";
            break;
        case 4:
            cardValueName = @"4";
            break;
        case 5:
            cardValueName = @"5";
            break;
        case 6:
            cardValueName = @"6";
            break;
        case 7:
            cardValueName = @"7";
            break;
        case 8:
            cardValueName = @"8";
            break;
        case 9:
            cardValueName = @"9";
            break;
        case 10:
            cardValueName = @"10";
            break;
        case 11:
            cardValueName = @"Jack";
            break;
        case 12:
            cardValueName = @"Queen";
            break;
        case 13:
            cardValueName = @"King";
            break;
        case 14:
            cardValueName = @"Ace";
            break;
        default:
            cardValueName = @"No Known Card";
            break;
    }
    NSLog(@"%@ of %@",cardValueName,suit);
    NSLog(@"Located at %.1f,%.1f", cardCenter.x,cardCenter.y);
}

@end
