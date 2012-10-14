//
//  PickerViewController.h
//  Picker
//
//  Created by Pavan Ratnakar on 10/14/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface PickerViewController : UIViewController <iCarouselDataSource, iCarouselDelegate>

@property (weak, nonatomic) IBOutlet iCarousel *pickerCarousel;

@property (weak, nonatomic) IBOutlet UILabel *pickerLabel;

@end