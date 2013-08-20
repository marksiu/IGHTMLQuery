//
//  IGXMLNodeSet.m
//  IGHTMLQuery
//
//  Created by Francis Chong on 20/8/13.
//  Copyright (c) 2013 Ignition Soft. All rights reserved.
//

#import "IGXMLNodeSet.h"
#import "IGXMLNode.h"

@interface IGXMLNodeSet()
@property (nonatomic, copy) NSOrderedSet* nodes;
@end

@implementation IGXMLNodeSet

-(id) initWithNodes:(NSArray*)nodes {
    self = [super init];
    if (self) {
        _nodes = [NSOrderedSet orderedSetWithArray:nodes];
    }
    return self;
}

-(NSUInteger) count {
    return [_nodes count];
}

#pragma NSFastEnumeration -

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len {
    return [self.nodes countByEnumeratingWithState:state objects:buffer count:len];
}

-(NSArray *) allObjects {
    return [self.nodes array];
}

-(IGXMLNode*) firstObject {
    if ([self.nodes count] > 0) {
        return self.nodes[0];
    } else {
        return nil;
    }
}

#pragma mark -

- (id)objectAtIndexedSubscript:(NSUInteger)idx {
    return [self.nodes objectAtIndexedSubscript:idx];
}

@end