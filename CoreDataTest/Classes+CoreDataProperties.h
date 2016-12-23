//
//  Classes+CoreDataProperties.h
//  CoreDataTest
//
//  Created by uwitec on 16/12/20.
//  Copyright © 2016年 FangXH. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Classes+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Classes (CoreDataProperties)

+ (NSFetchRequest<Classes *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *c_Name;
@property (nonatomic) int32_t c_Id;
@property (nullable, nonatomic, retain) NSSet<Student *> *c_Students;

@end

@interface Classes (CoreDataGeneratedAccessors)

- (void)addC_StudentsObject:(Student *)value;
- (void)removeC_StudentsObject:(Student *)value;
- (void)addC_Students:(NSSet<Student *> *)values;
- (void)removeC_Students:(NSSet<Student *> *)values;

@end

NS_ASSUME_NONNULL_END
