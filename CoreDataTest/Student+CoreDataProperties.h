//
//  Student+CoreDataProperties.h
//  CoreDataTest
//
//  Created by uwitec on 16/12/20.
//  Copyright © 2016年 FangXH. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Student+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *s_Name;
@property (nonatomic) BOOL s_Sex;
@property (nonatomic) int32_t s_Id;
@property (nullable, nonatomic, retain) Classes *s_Class;

@end

NS_ASSUME_NONNULL_END
