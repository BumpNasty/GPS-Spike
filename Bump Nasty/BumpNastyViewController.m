//
//  BumpNastyViewController.m
//  Bump Nasty
//
//  Created by Tim Flapper on 23-04-13.
//  Copyright (c) 2013 Tim Flapper. All rights reserved.
//

#import "BumpNastyViewController.h"

@interface BumpNastyViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)updateGPS:(id)sender;
@end

@implementation BumpNastyViewController

@synthesize locationManager;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
//    [locationManager startUpdatingLocation];    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (abs(howRecent) < 15.0) {
        // If the event is recent, do something with it.
    
    NSString *loc = [[NSString alloc] initWithFormat:@"Latitude %+.6f\nLongitude %+.6f\n",
                         location.coordinate.latitude,
                         location.coordinate.longitude];
    
    self.label.text = loc;
        
    [manager stopUpdatingLocation];
        
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if ([error code] == kCLErrorDenied) {
        // This error indicates that the user has denied the application's request to use location services.
        [manager stopUpdatingLocation];
    }
}


- (IBAction)updateGPS:(id)sender {
    [locationManager startUpdatingLocation];
    
}
@end
