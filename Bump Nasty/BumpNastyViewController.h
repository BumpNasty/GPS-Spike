//
//  BumpNastyViewController.h
//  Bump Nasty
//
//  Created by Tim Flapper on 23-04-13.
//  Copyright (c) 2013 Tim Flapper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface BumpNastyViewController : UIViewController <CLLocationManagerDelegate> {
    
    CLLocationManager *locationManager;
    
    }

    @property (nonatomic, retain) CLLocationManager *locationManager;
    
@end
