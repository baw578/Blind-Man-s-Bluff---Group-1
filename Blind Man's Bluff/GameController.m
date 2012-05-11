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
@synthesize temp, playingCardSprite, mainCardArea, playingCardSprite2, mainCardArea2, playingCardSprite3, mainCardArea3;

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
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
    [tempCard1 logThisCard];
    
    //display first delt card
    if (!playingCardSprite) {
        playingCardSprite = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cards.png"]];}
    if (!mainCardArea) {
        mainCardArea = [[UIView alloc] initWithFrame:CGRectMake(80, 60, 74, 100)]; }
    
    CGPoint currentPosition = playingCardSprite.center;
    currentPosition.x = tempCard1.cardCenter.x;
    currentPosition.y = tempCard1.cardCenter.y;
    playingCardSprite.center = currentPosition;
    
    mainCardArea.clipsToBounds = YES;
    
    [mainCardArea addSubview:playingCardSprite];
    [self.view addSubview:mainCardArea];
    
    
    
    Card * tempCard2 = [temp dealACard];
    [tempCard2 logThisCard];
    
    //display second delt card
    if (!playingCardSprite2) {
        playingCardSprite2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cards.png"]];}
    if (!mainCardArea2) {
        mainCardArea2 = [[UIView alloc] initWithFrame:CGRectMake(80, 180, 74, 100)]; }
    
    CGPoint currentPosition2 = playingCardSprite2.center;
    currentPosition2.x = tempCard2.cardCenter.x;
    currentPosition2.y = tempCard2.cardCenter.y;
    playingCardSprite2.center = currentPosition2;
    
    mainCardArea2.clipsToBounds = YES;
    
    [mainCardArea2 addSubview:playingCardSprite2];
    [self.view addSubview:mainCardArea2];
    
    Card * tempCard3 = [temp dealACard];
    [tempCard3 logThisCard]; 
    
    //display third delt card
    if (!playingCardSprite3) {
        playingCardSprite3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cards.png"]];}
    if (!mainCardArea3) {
        mainCardArea3 = [[UIView alloc] initWithFrame:CGRectMake(80, 300, 74, 100)]; }
    
    CGPoint currentPosition3 = playingCardSprite3.center;
    currentPosition3.x = tempCard3.cardCenter.x;
    currentPosition3.y = tempCard3.cardCenter.y;
    playingCardSprite3.center = currentPosition3;
    
    mainCardArea3.clipsToBounds = YES;
    
    [mainCardArea3 addSubview:playingCardSprite3];
    [self.view addSubview:mainCardArea3];
    
}

- (IBAction)dealCardsButton:(id)sender {
    [self dealCards];
}
@end
