#import "NSDictionary+SMKeyValueObserving.h"


@implementation NSDictionary (SMKeyValueObserving)

- (NSUInteger)keyValueChangeKind  {
	return [[self objectForKey:NSKeyValueChangeKindKey] unsignedIntegerValue];
}

- (id)keyValueChangeNew {
	id value = [self objectForKey:NSKeyValueChangeNewKey];
    if ([value isEqual:[NSNull null]]) {
        return nil;
    }
    return value;
}

- (id)keyValueChangeOld {
	id value = [self objectForKey:NSKeyValueChangeOldKey];
    if ([value isEqual:[NSNull null]]) {
        return nil;
    }
    return value;
}

- (NSIndexSet *)keyValueChangeIndexes {
	return [self objectForKey:NSKeyValueChangeIndexesKey];
}

- (BOOL)keyValueChanged {
    if ([self keyValueChangeOld] == nil) {
        return [self keyValueChangeNew] != nil;
    }
    return ![[self keyValueChangeNew] isEqual:[self keyValueChangeOld]];
}

@end
