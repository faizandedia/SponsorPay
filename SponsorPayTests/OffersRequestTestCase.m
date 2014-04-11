//
//  OffersRequestTestCase.m
//  SponsorPay
//
//  Created by Faizan Ali on 4/12/14.
//  Copyright (c) 2014 SponsorPay. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OffersRequest.h"

@interface OffersRequestTestCase : XCTestCase

@end

@implementation OffersRequestTestCase

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testApiKey {
    
    NSString *apiKey = @"1c915e3b5d42d05136185030892fbb846c278927";
    XCTAssertEqualObjects(@"1c915e3b5d42d05136185030892fbb846c278927", apiKey, @"The api key does not match");
}

- (void)testIP {
    
    NSString *apiKey = kIP;
    XCTAssertEqualObjects(@"109.235.143.113", apiKey, @"The IP address does not match");
}

@end
