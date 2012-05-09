//
//  ViewController.m
//  Blind Man's Bluff
//
//  Created by Ben Wolski on 11/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController
@synthesize temp, playingCardSprite, mainCardArea, playingCardSprite2, mainCardArea2, playingCardSprite3, mainCardArea3;

 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self dealCards];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (IBAction)dealCardsButton:(id)sender {
    [self dealCards];
}
@end
