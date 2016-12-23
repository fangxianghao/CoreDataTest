//
//  Student+CoreDataProperties.m
//  CoreDataTest
//
//  Created by uwitec on 16/12/20.
//  Copyright © 2016年 FangXH. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Student+CoreDataProperties.h"

@implementation Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Student"];
}

@dynamic s_Name;
@dynamic s_Sex;
@dynamic s_Id;
@dynamic s_Class;

@end
