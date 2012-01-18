/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "CloudWatchMetricAlarmUnmarshaller.h"

@implementation CloudWatchMetricAlarmUnmarshaller


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    [super parser:parser didStartElement:elementName namespaceURI:namespaceURI qualifiedName:qName attributes:attributeDict];


    if ([elementName isEqualToString:@"OKActions"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.oKActions withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"OKActions";
        listUnmarshaller.entryElementName   = @"member";
        listUnmarshaller.delegateClass      = [AmazonValueUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"AlarmActions"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.alarmActions withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"AlarmActions";
        listUnmarshaller.entryElementName   = @"member";
        listUnmarshaller.delegateClass      = [AmazonValueUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"InsufficientDataActions"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.insufficientDataActions withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"InsufficientDataActions";
        listUnmarshaller.entryElementName   = @"member";
        listUnmarshaller.delegateClass      = [AmazonValueUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }

    if ([elementName isEqualToString:@"Dimensions"]) {
        AmazonListUnmarshaller *listUnmarshaller = [[[AmazonListUnmarshaller alloc] initWithCaller:self withParentObject:self.response.dimensions withSetter:@selector(addObjectsFromArray:)] autorelease];
        listUnmarshaller.endListElementName = @"Dimensions";
        listUnmarshaller.entryElementName   = @"member";
        listUnmarshaller.delegateClass      = [CloudWatchDimensionUnmarshaller class];

        [parser setDelegate:listUnmarshaller];
    }



    if ([elementName isEqualToString:@"Error"]) {
        [parser setDelegate:[[[AmazonServiceExceptionUnmarshaller alloc] initWithCaller:self withParentObject:self.response withSetter:@selector(setException:)] autorelease]];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    [super parser:parser didEndElement:elementName namespaceURI:namespaceURI qualifiedName:qName];


    if ([elementName isEqualToString:@"AlarmName"]) {
        self.response.alarmName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"AlarmArn"]) {
        self.response.alarmArn = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"AlarmDescription"]) {
        self.response.alarmDescription = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"AlarmConfigurationUpdatedTimestamp"]) {
        self.response.alarmConfigurationUpdatedTimestamp = [AmazonSDKUtil convertStringToDate:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"ActionsEnabled"]) {
        self.response.actionsEnabled = [self.currentText boolValue];
        return;
    }

    if ([elementName isEqualToString:@"StateValue"]) {
        self.response.stateValue = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"StateReason"]) {
        self.response.stateReason = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"StateReasonData"]) {
        self.response.stateReasonData = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"StateUpdatedTimestamp"]) {
        self.response.stateUpdatedTimestamp = [AmazonSDKUtil convertStringToDate:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"MetricName"]) {
        self.response.metricName = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"Namespace"]) {
        self.response.namespace = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"Statistic"]) {
        self.response.statistic = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"Period"]) {
        self.response.period = [AmazonSDKUtil convertStringToNumber:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"Unit"]) {
        self.response.unit = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"EvaluationPeriods"]) {
        self.response.evaluationPeriods = [AmazonSDKUtil convertStringToNumber:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"Threshold"]) {
        self.response.threshold = [AmazonSDKUtil convertStringToNumber:self.currentText];
        return;
    }

    if ([elementName isEqualToString:@"ComparisonOperator"]) {
        self.response.comparisonOperator = self.currentText;
        return;
    }

    if ([elementName isEqualToString:@"MetricAlarm"]) {
        if (caller != nil) {
            [parser setDelegate:caller];
        }

        if (parentObject != nil && [parentObject respondsToSelector:parentSetter]) {
            [parentObject performSelector:parentSetter withObject:self.response];
        }

        return;
    }
}

-(CloudWatchMetricAlarm *)response
{
    if (nil == response) {
        response = [[CloudWatchMetricAlarm alloc] init];
    }
    return response;
}


-(void)dealloc
{
    [response release];
    [super dealloc];
}

@end
