//
//  AddNewTimeViewController.h
//  BPDEstudoCoreData
//
//  Created by Rodrigo DAngelo Silva Machado on 5/18/15.
//  Copyright (c) 2015 Rodrigo DAngelo Silva Machado. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BPDTimes.h"
#import <CoreData/CoreData.h>

@interface AddNewTimeViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) BPDTimes *time;


@end
