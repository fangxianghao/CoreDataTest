//
//  Classes+CoreDataProperties.m
//  CoreDataTest
//
//  Created by uwitec on 16/12/20.
//  Copyright © 2016年 FangXH. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Classes+CoreDataProperties.h"

@implementation Classes (CoreDataProperties)

+ (NSFetchRequest<Classes *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Classes"];
}

@dynamic c_Name;
@dynamic c_Id;
@dynamic c_Students;

@end
