//
//  METCallCustomerViewController.h
//  Metropolitan
//
//  Created by Kevin Whinnery on 2/14/14.
//  Copyright (c) 2014 Kevin Whinnery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwilioClient.h"

typedef void (^CloseBlock)();

@interface METCallCustomerViewController : UIViewController<TCDeviceDelegate, TCConnectionDelegate>

@property (readwrite, copy) CloseBlock onClose;

@end
