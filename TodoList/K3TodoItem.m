#import "K3TodoItem.h"

@implementation K3TodoItem

- (K3TodoItem *) initWithName:(NSString *) name {
    self = [super init];
    _name = name;
    return self;
}

@end
