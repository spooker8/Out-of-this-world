//
//  ImageController.h
//  Out of this world
//
//  Created by Anand Kumar on 8/28/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ImageController : NSObject


@property (strong, nonatomic) NSString *name;
@property (nonatomic)float gravitationalForce;
@property(nonatomic)float diameter;
@property (nonatomic)float yearLenght;
@property (nonatomic)float dayLenght;
@property (nonatomic)float temperature;
@property (nonatomic)int numberOfMoons;
@property  (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic)    NSString *interestFact;


@property (strong,nonatomic)UIImage *spaceImage;

-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image;



@end
