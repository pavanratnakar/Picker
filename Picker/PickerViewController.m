//
//  PickerViewController.m
//  Picker
//
//  Created by Pavan Ratnakar on 10/14/12.
//  Copyright (c) 2012 Pavan Ratnakar. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()
@property (nonatomic, retain) NSMutableArray *pickerItems;
@end

@implementation PickerViewController
@synthesize pickerCarousel;
@synthesize pickerLabel;
@synthesize pickerItems;

- (void)awakeFromNib
{
    NSDictionary *pickerItem;
    self.pickerItems = [NSMutableArray array];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"batty.png", @"image",
                  @"Bat", @"title",
            nil];
    [self.pickerItems addObject:pickerItem];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"dog1.png", @"image",
                  @"Dog", @"title",
                  nil];
    [self.pickerItems addObject:pickerItem];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"dog2.png", @"image",
                  @"Dog", @"title",
                  nil];
    [self.pickerItems addObject:pickerItem];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"ducky.png", @"image",
                  @"Ducky", @"title",
                  nil];
    [self.pickerItems addObject:pickerItem];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"elephant.png", @"image",
                  @"Elephant", @"title",
                  nil];
    [self.pickerItems addObject:pickerItem];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"foxy.png", @"image",
                  @"Fox", @"title",
                  nil];
    [self.pickerItems addObject:pickerItem];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"froggy.png", @"image",
                  @"Frog", @"title",
                  nil];
    [self.pickerItems addObject:pickerItem];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"kitty.png", @"image",
                  @"Cat", @"title",
                  nil];
    [self.pickerItems addObject:pickerItem];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"lion.png", @"image",
                  @"Lion", @"title",
                  nil];
    [self.pickerItems addObject:pickerItem];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"panda.png", @"image",
                  @"Panda", @"title",
                  nil];
    [self.pickerItems addObject:pickerItem];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"penguin.png", @"image",
                  @"Penguin", @"title",
                  nil];
    [self.pickerItems addObject:pickerItem];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"ratty.png", @"image",
                  @"Rat", @"title",
                  nil];
    [self.pickerItems addObject:pickerItem];
    
    pickerItem = [NSDictionary dictionaryWithObjectsAndKeys:
                  @"tuqui.png", @"image",
                  @"Tuqui", @"title",
                  nil];
    [self.pickerItems addObject:pickerItem];
    
    //NSLog(@"%@",self.pickerItems);
}

- (void)dealloc
{
    pickerCarousel.delegate = nil;
    pickerCarousel.dataSource = nil;
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    pickerCarousel.type = iCarouselTypeCoverFlow2;
}

- (void)viewDidUnload
{
    [self setPickerCarousel:nil];
    [self setPickerLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark -
#pragma mark iCarousel methods

- (UIView*)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[pickerItems objectAtIndex:index] objectForKey:@"image"]]];
    return view;
}

- (void)carouselDidScroll:(iCarousel *)carousel
{
    pickerLabel.text = [NSString stringWithFormat:@"Congratulations! Select your reward.\n%@", [[pickerItems objectAtIndex:carousel.currentItemIndex] objectForKey:@"title"] ];
}

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [self.pickerItems count];
}

- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
    return 0;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionFadeMin:
            return -0.2;
        case iCarouselOptionFadeMax:
            return 0.2;
        case iCarouselOptionFadeRange:
            return 2.0;
        default:
            return value;
    }
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    pickerLabel.text = [NSString stringWithFormat:@"Testing! You have selected .\n%@", [[pickerItems objectAtIndex:carousel.currentItemIndex] objectForKey:@"title"] ];
}


@end