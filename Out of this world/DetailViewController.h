//
//  DetailViewController.h
//  Out of this world
//
//  Created by Anand Kumar on 9/1/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageController.h"
#import "ViewController.h"

@interface DetailViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) ImageController *spaceObject;


@end
