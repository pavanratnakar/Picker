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
    pickerCarousel.type = iCarouselTypeWheel;
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
    //create new view if no view is available for recycling
    if (view == nil)
    {
        FXImageView *imageView = [[[FXImageView alloc] initWithFrame:CGRectMake(0, 0,175.0f, 175.0f)] autorelease];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.asynchronous = YES;
        imageView.reflectionScale = 0.5f;
        imageView.reflectionAlpha = 0.25f;
        imageView.reflectionGap = 10.0f;
        imageView.shadowOffset = CGSizeMake(0.0f, 2.0f);
        imageView.shadowBlur = 5.0f;
        imageView.cornerRadius = 10.0f;
        view = imageView;
    }
    //show placeholder
    //((FXImageView *)view).processedImage = [UIImage imageNamed:@"placeholder.png"];
    ((FXImageView *)view).image = [UIImage imageNamed:[[pickerItems objectAtIndex:index] objectForKey:@"image"]];
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

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
            return YES;
        case iCarouselOptionFadeMin:
            return -0.2;
        case iCarouselOptionFadeMax:
            return 0.2;
        case iCarouselOptionFadeRange:
            return 2.0;
        case iCarouselOptionSpacing:
            return value * 1.05f;
        case iCarouselOptionVisibleItems:
            return 20;
        case iCarouselOptionShowBackfaces:
            return YES;
        default:
            return value;
    }
}


- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    pickerLabel.text = [NSString stringWithFormat:@"Testing! You have selected .\n%@", [[pickerItems objectAtIndex:carousel.currentItemIndex] objectForKey:@"title"] ];
}

@end