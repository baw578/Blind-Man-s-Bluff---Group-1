//
//  GameController.m
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 5/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameController.h"

@interface GameController ()

@end

@implementation GameController
@synthesize player1NameLabel;
@synthesize player2NameLabel;
@synthesize player3NameLabel;
@synthesize player4NameLabel;
@synthesize temp, playingCardSprite, mainCardArea, playingCardSprite2, mainCardArea2, playingCardSprite3, mainCardArea3,playingCardSprite4, mainCardArea4;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self dealCards];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setPlayer1NameLabel:nil];
    [self setPlayer2NameLabel:nil];
    [self setPlayer3NameLabel:nil];
    [self setPlayer4NameLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return interfaceOrientation == UIDeviceOrientationLandscapeLeft || 
    interfaceOrientation == UIDeviceOrientationLandscapeRight;
	return YES;
}

-(void) dealCards{
    temp = [[Deck alloc]initWithFullDeck];
    
    [temp shuffle];
    Card * tempCard1 = [temp dealACard];
    
    //pick card value
    //tempCard1.value = 13;
    
    [tempCard1 logThisCard];
    
    //display first delt card
    if (!playingCardSprite) {
        playingCardSprite = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cards.png"]];}
    if (!mainCardArea) {
        mainCardArea = [[UIView alloc] initWithFrame:CGRectMake(125, 125, 70, 96)]; }
    
    CGPoint currentPosition = playingCardSprite.center;
    currentPosition.x = tempCard1.cardCenter.x;
    currentPosition.y = tempCard1.cardCenter.y;
    playingCardSprite.center = currentPosition;
    
    mainCardArea.clipsToBounds = YES;
    
    [mainCardArea addSubview:playingCardSprite];
    [self.view addSubview:mainCardArea];
    
    
    
    Card * tempCard2 = [temp dealACard];
    
    //pick card value
    //tempCard2.value = 14;
    
    [tempCard2 logThisCard];
    
    //display second delt card
    if (!playingCardSprite2) {
        playingCardSprite2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cards.png"]];}
    if (!mainCardArea2) {
        mainCardArea2 = [[UIView alloc] initWithFrame:CGRectMake(824, 125, 70, 96)]; }
    
    CGPoint currentPosition2 = playingCardSprite2.center;
    currentPosition2.x = tempCard2.cardCenter.x;
    currentPosition2.y = tempCard2.cardCenter.y;
    playingCardSprite2.center = currentPosition2;
    
    mainCardArea2.clipsToBounds = YES;
    
    [mainCardArea2 addSubview:playingCardSprite2];
    [self.view addSubview:mainCardArea2];
    
    Card * tempCard3 = [temp dealACard];
    
    //pick card value
    //tempCard3.value = 12;
    
    [tempCard3 logThisCard]; 
    
    //display third delt card
    if (!playingCardSprite3) {
        playingCardSprite3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cards.png"]];}
    if (!mainCardArea3) {
        mainCardArea3 = [[UIView alloc] initWithFrame:CGRectMake(824, 523, 70, 96)]; }
    
    CGPoint currentPosition3 = playingCardSprite3.center;
    currentPosition3.x = tempCard3.cardCenter.x;
    currentPosition3.y = (tempCard3.cardCenter.y-1);
    playingCardSprite3.center = currentPosition3;
    
    mainCardArea3.clipsToBounds = YES;
    
    [mainCardArea3 addSubview:playingCardSprite3];
    [self.view addSubview:mainCardArea3];
    
    Card * tempCard4 = [temp dealACard];
    
    //pick card value
    //tempCard4.value = 12;
    
    [tempCard4 logThisCard]; 
    
    //display third delt card
    if (!playingCardSprite4) {
        playingCardSprite4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cards.png"]];}
    if (!mainCardArea4) {
        mainCardArea4 = [[UIView alloc] initWithFrame:CGRectMake(125, 523, 70, 96)]; }
    
    CGPoint currentPosition4 = playingCardSprite4.center;
    currentPosition4.x = tempCard3.cardCenter.x;
    currentPosition4.y = (tempCard3.cardCenter.y-1);
    playingCardSprite4.center = currentPosition4;
    
    mainCardArea4.clipsToBounds = YES;
    
    [mainCardArea4 addSubview:playingCardSprite4];
    [self.view addSubview:mainCardArea4];
    
}

- (IBAction)dealCardsButton:(id)sender {
    [self dealCards];
}
@end
