//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISLocation.h"
@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}



-(NSArray *)allLocationNames{
            NSMutableArray *arr= [[NSMutableArray alloc]init];
    for (FISLocation *item in self.locations){
        [arr addObject:item.name];
        
    }
    //NSLog(@"\n\n\n\n\n\n\n%@\n\n\n\n\n\n\n", );
    return arr;
}
-(FISLocation *)locationNamed:(NSString *)name{
    //return FISLocation name == name
    for (FISLocation *item in self.locations){
        if ([item.name isEqualToString:name]){
            return item;
        }
    }
    return nil;
}
-(NSArray *)locationsNearLatitude:(CGFloat)latitude
                        longitude:(CGFloat)longitude
                           margin:(CGFloat)margin{
    
    //return array of locations within margin from given location
    
    //for self.locations array return arrays "margin" away from "long/lat"
    //if hadValidData
    //CGFloat f = -123.4f;
    //CGFloat g = fabs(f);
    //[item.longitude - longitude integerValue]
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for(FISLocation *item in self.locations){
        
        CGFloat lon = item.longitude - longitude;
        CGFloat lat = item.latitude - latitude;
        CGFloat lonFabs = fabs(lon);
        CGFloat latFabs = fabs(lat);
        if (lonFabs <= margin && latFabs <= margin){
            [arr addObject:item];
        }
    }
    return arr;
}
@end
