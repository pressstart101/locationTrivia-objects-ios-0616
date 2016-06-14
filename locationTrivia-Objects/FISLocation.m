//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Flatiron School on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation



-(instancetype)init{
    self = [self initWithName:@"" latitude:0.0 longitude:0.0];
    return self;
}
-(instancetype)initWithName:(NSString *)name
                   latitude:(CGFloat)latitude
                  longitude:(CGFloat)longitude{
    self = [super init];
    if (self){
        _name = name;
        _latitude =latitude;
        _longitude =longitude;
        _trivia = [[NSMutableArray alloc]init];
    }
    return self;
}
-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length{
    
    if (length < [self.name length]){
    NSString *substringOfName = [self.name substringToIndex:length];
            return substringOfName;
    }
    return self.name;
}
-(BOOL)hasValidData{
    if ([self.name isEqualToString:@""] || self.name == nil) {
        return NO;
    } else if(self.latitude < -90.0 || self.latitude > 90.0){
        return NO;
    }else if(self.longitude <= -180.0 || self.longitude > 180.0){
        return NO;
    }
else{
    return YES;
}
}

-(FISTrivium *)triviumWithMostLikes{
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:YES];
    NSArray *arr =[self.trivia sortedArrayUsingDescriptors:@[sort]];
    return [arr lastObject];
}
@end
