//
//  EditViewController.h
//  Out of this world
//
//  Created by Anand Kumar on 9/4/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageController.h"


//creating a protocol for the add and cancel button
@protocol EditViewControllerDelegate <NSObject>


@required

-(void)addSpaceObject:(ImageController*)spaceObject;
-(void)didCancel;

@end



@interface EditViewController : UIViewController

//made for the protocol on top
//weak is used to avoid retain cycle
//using id for type unknown
@property (weak, nonatomic) id <EditViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (weak, nonatomic) IBOutlet UITextField *diameterTextField;
@property (weak, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (weak, nonatomic) IBOutlet UITextField *noofmoonTextField;
@property (weak, nonatomic) IBOutlet UITextField *interestingfactTextfield;





- (IBAction)addButton:(id)sender;
- (IBAction)cancelButton:(id)sender;
@end
