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
            cardCenter.x = (73*7)-36;
            break;
        case 2:
            cardValueName = @"2";
            cardCenter.x = (73*6)-36;
            break;
        case 3:
            cardValueName = @"3";
            cardCenter.x = (73*5)-36;
            break;
        case 4:
            cardValueName = @"4";
            cardCenter.x = (73*4)-36;
            break;
        case 5:
            cardValueName = @"5";
            cardCenter.x = (73*3)-36;
            break;
        case 6:
            cardValueName = @"6";
            cardCenter.x = (73*2)-36;
            break;
        case 7:
            cardValueName = @"7";
            cardCenter.x = (73*1)-36;
            break;
        case 8:
            cardValueName = @"8";
            cardCenter.x = -(73*1)+36;
            break;
        case 9:
            cardValueName = @"9";
            cardCenter.x = -(73*1)-36;
            break;
        case 10:
            cardValueName = @"10";
            cardCenter.x = -(73*2)-36;
            break;
        case 11:
            cardValueName = @"Jack";
            cardCenter.x = -(73*3)-36;
            break;
        case 12:
            cardValueName = @"Queen";
            cardCenter.x = -(73*4)-36;
            break;
        case 13:
            cardValueName = @"King";
            cardCenter.x = -(73*5)-36;
            break;
        case 14:
            cardValueName = @"Ace";
            cardCenter.x = (73*7)-36;
            break;
        default:
            cardValueName = @"No Known Card";
            break;
    }
    if ([suit isEqualToString:@"Hearts"]) {
        cardCenter.y = (0);
    }
    if ([suit isEqualToString:@"Clubs"]) {
        cardCenter.y = (+200);
    }
    if ([suit isEqualToString:@"Diamonds"]) {
        cardCenter.y = (-100);
    }
    if ([suit isEqualToString:@"Spades"]) {
        cardCenter.y = (+100);
    }
    
    NSLog(@"%@ of %@",cardValueName,suit);
    NSLog(@"Located at %.1f,%.1f", cardCenter.x,cardCenter.y);
}

@end
