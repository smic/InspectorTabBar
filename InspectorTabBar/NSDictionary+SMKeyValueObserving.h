#import <Foundation/Foundation.h>


@interface NSDictionary (SMKeyValueObserving)

@property (readonly) NSUInteger keyValueChangeKind;
@property (readonly) id keyValueChangeNew;
@property (readonly) id keyValueChangeOld;
@property (readonly) NSIndexSet *keyValueChangeIndexes;
@property (readonly) BOOL keyValueChanged;

@end
