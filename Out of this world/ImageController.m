//
//  ImageController.m
//  Out of this world
//
//  Created by Anand Kumar on 8/28/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ImageController.h"
#import "AstronomicalData.h"
@implementation ImageController

-(id)init
{
    self = [self initWithData:nil andImage:nil];
    return self;
    
    
}


-(id)initWithData:(NSDictionary *)data andImage:(UIImage *)image
{
    
    self = [super init];
    
    self.name = data[PLANET_NAME];
    self.gravitationalForce = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLenght = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLenght = [data[PLANET_DAY_LENGTH] floatValue];
    self.temperature = [data[PLANET_TEMPERATURE] floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] intValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interestFact = data[PLANET_INTERESTING_FACT];
    
    self.spaceImage = image;
    
    return self;
    
}


@end
