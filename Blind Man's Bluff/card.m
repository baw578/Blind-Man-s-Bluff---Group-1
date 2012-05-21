//
//  card.m
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "card.h"
#import "ViewController.h"

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
            cardCenter.x = 474;
            break;
        case 2:
            cardValueName = @"2";
            cardCenter.x = 400;
            break;
        case 3:
            cardValueName = @"3";
            cardCenter.x = 327;
            break;
        case 4:
            cardValueName = @"4";
            cardCenter.x = 255.5;
            break;
        case 5:
            cardValueName = @"5";
            cardCenter.x = 181;
            break;
        case 6:
            cardValueName = @"6";
            cardCenter.x = 108.5;
            break;
        case 7:
            cardValueName = @"7";
            cardCenter.x = 36.5;
            break;
        case 8:
            cardValueName = @"8";
            cardCenter.x = -37;
            break;
        case 9:
            cardValueName = @"9";
            cardCenter.x = -110;
            break;
        case 10:
            cardValueName = @"10";
            cardCenter.x = -182.5;
            break;
        case 11:
            cardValueName = @"Jack";
            cardCenter.x = -256;
            break;
        case 12:
            cardValueName = @"Queen";
            cardCenter.x = -329;
            break;
        case 13:
            cardValueName = @"King";
            cardCenter.x = -401.5;
            break;
        case 14:
            cardValueName = @"Ace";
            cardCenter.x = 474;
            break;
        default:
            cardValueName = @"No Known Card";
            break;
    }
    if ([suit isEqualToString:@"Hearts"]) {
        cardCenter.y = (0);
    }
    if ([suit isEqualToString:@"Clubs"]) {
        cardCenter.y = (+196);
    }
    if ([suit isEqualToString:@"Diamonds"]) {
        cardCenter.y = (-98);
    }
    if ([suit isEqualToString:@"Spades"]) {
        cardCenter.y = (+98);
    }
    
    NSLog(@"%@ of %@ has a value of %d",cardValueName,suit,value);
    NSLog(@"Located at %.1f,%.1f", cardCenter.x,cardCenter.y);
}

    //Test for saving after commit

@end
