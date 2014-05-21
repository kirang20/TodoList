#import <Foundation/Foundation.h>

@interface K3TodoItem : NSObject

@property NSString* name;
@property BOOL completed;
@property (readonly) NSDate* creationDate;

- (K3TodoItem *) initWithName:(NSString *) name;

@end
