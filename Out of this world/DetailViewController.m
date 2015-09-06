//
//  DetailViewController.m
//  Out of this world
//
//  Created by Anand Kumar on 9/1/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView = [[UIImageView alloc] initWithImage:self.spaceObject.spaceImage];
    
    
    self.scrollView.contentSize = self.imageView.frame.size;
    [self.scrollView addSubview:self.imageView];
    //self.scrollView.delegate = self;
    
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.minimumZoomScale = 0.5;
    
    // Do any additional setup after loading the view.
}


-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
   
    return self.imageView;    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
