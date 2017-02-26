//
//  LocalDatabaseControl.swift
//  MathChallenge
//
//  Created by Matthew Ashley on 9/22/16.
//  Copyright © 2016 Matthew Ashley. All rights reserved.
//

import Foundation
import UIKit
import CloudKit

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}

/*Initializer for LocalDatabaseControl file so that functions in this file
 can be called within other files.*/
var LocDbc: LocalDatabaseControl = LocalDatabaseControl()

struct questions1 {
    var question = "Un-Named"
    var answer = "Un-Described"
}

struct questions2 {
    var question = "Un-Named"
    var answer = "Un-Described"
}

struct questions3 {
    var question = "Un-Named"
    var answer = "Un-Described"
}

struct questions4 {
    var question = "Un-Named"
    var answer = "Un-Described"
}

struct questions5 {
    var question = "Un-Named"
    var answer = "Un-Described"
}

struct questions6 {
    var question = "Un-Named"
    var answer = "Un-Described"
}

struct questions7 {
    var question = "Un-Named"
    var answer = "Un-Described"
}

struct questions8 {
    var question = "Un-Named"
    var answer = "Un-Described"
}

struct questions9 {
    var question = "Un-Named"
    var answer = "Un-Described"
}

struct questions10 {
    var question = "Un-Named"
    var answer = "Un-Described"
}

struct highScores {
    var score = "Un-Given"
}

class LocalDatabaseControl: NSObject {
    
    var question1 = [questions1]() //Stores the questions and answers for Level 1
    var question2 = [questions2]() //Stores the questions and answers for Level 2
    var question3 = [questions3]() //Stores the questions and answers for Level 3
    var question4 = [questions4]() //Stores the questions and answers for Level 4
    var question5 = [questions5]() //Stores the questions and answers for Level 5
    var question6 = [questions6]() //Stores the questions and answers for Level 6
    var question7 = [questions7]() //Stores the questions and answers for Level 7
    var question8 = [questions8]() //Stores the questions and answers for Level 8
    var question9 = [questions9]() //Stores the questions and answers for Level 9
    var question10 = [questions10]() //Stores the questions and answers for Level 10
    var highScore = [highScores]() //Stores the highest score achieved in the game
    
    var overallScore: String = "" //Stores the score of the last game played
    var pageTransfer: String = "" //Stores which page was used to view the high score page
    
    var tracking: Int = 0
    
    //Creates and inserts in information for each table in the local database!
    func databaseSetup () {
        
        let filemgr = FileManager.default
        let databaseName = "Math.db"
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        
        let databasePath = docsDir.stringByAppendingPathComponent(databaseName)
        
        let mathDB = FMDatabase(path: databasePath as String)
        
        if filemgr.fileExists(atPath: databasePath as String) {
            
            if mathDB == nil {
                
                print("Error: \(mathDB?.lastErrorMessage())")
                
            }
            
            if (mathDB?.open())! {
                
                let sql_stmt1 = "CREATE TABLE IF NOT EXISTS LEVEL1 (ID INTEGER PRIMARY KEY AUTOINCREMENT, QUESTION TEXT(100), ANSWER TEXT(100))"
                
                let sql_stmt2 = "CREATE TABLE IF NOT EXISTS LEVEL2 (ID INTEGER PRIMARY KEY AUTOINCREMENT, QUESTION TEXT(100), ANSWER TEXT(100))"
                
                let sql_stmt3 = "CREATE TABLE IF NOT EXISTS LEVEL3 (ID INTEGER PRIMARY KEY AUTOINCREMENT, QUESTION TEXT(100), ANSWER TEXT(100))"
                
                let sql_stmt4 = "CREATE TABLE IF NOT EXISTS LEVEL4 (ID INTEGER PRIMARY KEY AUTOINCREMENT, QUESTION TEXT(100), ANSWER TEXT(100))"
                
                let sql_stmt5 = "CREATE TABLE IF NOT EXISTS LEVEL5 (ID INTEGER PRIMARY KEY AUTOINCREMENT, QUESTION TEXT(100), ANSWER TEXT(100))"
                
                let sql_stmt6 = "CREATE TABLE IF NOT EXISTS LEVEL6 (ID INTEGER PRIMARY KEY AUTOINCREMENT, QUESTION TEXT(100), ANSWER TEXT(100))"
                
                let sql_stmt7 = "CREATE TABLE IF NOT EXISTS LEVEL7 (ID INTEGER PRIMARY KEY AUTOINCREMENT, QUESTION TEXT(100), ANSWER TEXT(100))"
                
                let sql_stmt8 = "CREATE TABLE IF NOT EXISTS LEVEL8 (ID INTEGER PRIMARY KEY AUTOINCREMENT, QUESTION TEXT(100), ANSWER TEXT(100))"
                
                let sql_stmt9 = "CREATE TABLE IF NOT EXISTS LEVEL9 (ID INTEGER PRIMARY KEY AUTOINCREMENT, QUESTION TEXT(100), ANSWER TEXT(100))"
                
                let sql_stmt10 = "CREATE TABLE IF NOT EXISTS LEVEL10 (ID INTEGER PRIMARY KEY AUTOINCREMENT, QUESTION TEXT(100), ANSWER TEXT(100))"
                
                let sql_stmt11 = "CREATE TABLE IF NOT EXISTS HIGHSCORE (ID INTEGER PRIMARY KEY AUTOINCREMENT, SCORE TEXT(100))"
                
                //Has 110 questions!
                let insertSQLLevel1 = "INSERT INTO LEVEL1 (question, answer) VALUES ('0 + 0', '0'), ('0 + 1', '1'), ('0 + 2', '2'), ('0 + 3', '3'), ('0 + 4', '4'), ('0 + 5', '5'), ('0 + 6', '6'), ('0 + 7', '7'), ('0 + 8', '8'), ('0 + 9', '9'), ('1 + 0', '1'), ('2 + 0', '2'), ('3 + 0', '3'), ('4 + 0', '4'), ('5 + 0', '5'), ('6 + 0', '6'), ('7 + 0', '7'), ('8 + 0', '8'), ('9 + 0', '9'), ('1 + 1', '2'), ('1 + 2', '3'), ('1 + 3', '4'), ('1 + 4', '5'), ('1 + 5', '6'), ('1 + 6', '7'), ('1 + 7', '8'), ('1 + 8', '9'), ('2 + 1', '3'), ('3 + 1', '4'), ('4 + 1', '5'), ('5 + 1', '6'), ('6 + 1', '7'), ('7 + 1', '8'), ('8 + 1', '9'), ('2 + 2', '4'), ('2 + 3', '5'), ('2 + 4', '6'), ('2 + 5', '7'), ('2 + 6', '8'), ('2 + 7', '9'), ('3 + 2', '5'), ('4 + 2', '6'), ('5 + 2', '7'), ('6 + 2', '8'), ('7 + 2', '9'), ('3 + 3', '6'), ('3 + 4', '7'), ('3 + 5', '8'), ('3 + 6', '9'), ('4 + 3', '7'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('4 + 5', '9'), ('5 + 4', '9'), ('0 - 0', '0'), ('9 - 0', '9'), ('8 - 0', '8'), ('7 - 0', '7'), ('6 - 0', '6'), ('5 - 0', '5'), ('4 - 0', '4'), ('3 - 0', '3'), ('2 - 0', '2'), ('1 - 0', '1'), ('9 - 1', '8'), ('9 - 2', '7'), ('9 - 3', '6'), ('9 - 4', '5'), ('9 - 5', '4'), ('9 - 6', '3'), ('9 - 7', '2'), ('9 - 8', '1'), ('9 - 9', '0'), ('8 - 1', '7'), ('8 - 2', '6'), ('8 - 3', '5'), ('8 - 4', '4'), ('8 - 5', '3'), ('8 - 6', '2'), ('8 - 7', '1'), ('8 - 8', '0'), ('7 - 1', '6'), ('7 - 2', '5'), ('7 - 3', '4'), ('7 - 4', '3'), ('7 - 5', '2'), ('7 - 6', '1'), ('7 - 7', '0'), ('6 - 1', '5'), ('6 - 2', '4'), ('6 - 3', '3'), ('6 - 4', '2'), ('6 - 5', '1'), ('6 - 6', '0'), ('5 - 1', '4'), ('5 - 2', '3'), ('5 - 3', '2'), ('5 - 4', '1'), ('5 - 5', '0'), ('4 - 1', '3'), ('4 - 2', '2'), ('4 - 3', '1'), ('4 - 4', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('2 - 1', '1'), ('2 - 2', '0'), ('1 - 1', '0')"
            
                //Has 110 questions!
                let insertSQLLevel2 = "INSERT INTO LEVEL2 (question, answer) VALUES ('1 + 0', '1'), ('2 + 0', '2'), ('3 + 0', '3'), ('4 + 0', '4'), ('5 + 0', '5'), ('6 + 0', '6'), ('7 + 0', '7'), ('8 + 0', '8'), ('3 + 5', '8'), ('3 + 6', '9'), ('4 + 3', '7'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('4 + 5', '9'), ('5 + 4', '9'), ('0 - 0', '0'), ('9 - 0', '9'), ('8 - 0', '8'), ('7 - 0', '7'), ('6 - 0', '6'), ('5 - 0', '5'), ('4 - 3', '1'), ('4 - 4', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('2 - 1', '1'), ('2 - 2', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('1 - 1', '0'), ('9 + 1', '10'), ('9 + 2', '11'), ('9 + 3', '12'), ('9 + 4', '13'), ('9 + 5', '14'), ('9 + 6', '15'), ('9 + 7', '16'), ('9 + 8', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('2 + 9', '11'), ('3 + 9', '12'), ('4 + 9', '13'), ('5 + 9', '14'), ('6 + 9', '15'), ('7 + 9', '16'), ('8 + 9', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('19 - 0', '19'), ('19 - 1', '18'), ('19 - 2', '17'), ('19 - 3', '16'), ('19 - 4', '15'), ('19 - 5', '14'), ('19 - 6', '13'), ('19 - 7', '12'), ('19 - 8', '11'), ('19 - 9', '10'), ('18 - 0', '18'), ('18 - 1', '17'), ('18 - 2', '16'), ('18 - 3', '15'), ('18 - 4', '14'), ('18 - 5', '13'), ('18 - 6', '12'), ('18 - 7', '11'), ('18 - 8', '10'), ('17 - 0', '17'), ('17 - 1', '16'), ('17 - 2', '15'), ('17 - 3', '14'), ('17 - 4', '13'), ('17 - 5', '12'), ('17 - 6', '11'), ('17 - 7', '10'), ('16 - 0', '16'), ('16 - 1', '15'), ('16 - 2', '14'), ('16 - 3', '13'), ('16 - 4', '12'), ('16 - 5', '11'), ('16 - 6', '10'), ('15 - 0', '15'), ('15 - 1', '14'), ('15 - 2', '13'), ('15 - 3', '12'), ('15 - 4', '11'), ('15 - 5', '10'), ('14 - 0', '14'), ('14 - 1', '13'), ('14 - 2', '12'), ('14 - 3', '11'), ('14 - 4', '10'), ('13 - 0', '13'), ('13 - 1', '12'), ('13 - 2', '11'), ('13 - 3', '10'), ('12 - 0', '12'), ('12 - 1', '11'), ('12 - 2', '10'), ('11 - 0', '11'), ('11 - 1', '10'), ('10 - 0', '10')"
                
                let insertSQLLevel3 = "INSERT INTO LEVEL3 (question, answer) VALUES ('19 - 7', '12'), ('19 - 8', '11'), ('19 - 9', '10'), ('18 - 0', '18'), ('18 - 1', '17'), ('18 - 2', '16'), ('18 - 3', '15'), ('18 - 4', '14'), ('18 - 5', '13'), ('18 - 6', '12'), ('18 - 7', '11'), ('18 - 8', '10'), ('17 - 0', '17'), ('17 - 1', '16'), ('17 - 2', '15'), ('17 - 3', '14'), ('17 - 4', '13'), ('17 - 5', '12'), ('17 - 6', '11'), ('17 - 7', '10'), ('16 - 0', '16'), ('16 - 1', '15'), ('16 - 2', '14'), ('9 + 11', '20'), ('9 + 12', '21'), ('9 + 13', '22'), ('9 + 14', '23'), ('9 + 15', '24'), ('9 + 16', '25'), ('9 + 17', '26'), ('9 + 18', '27'), ('9 + 19', '28'), ('9 + 20', '29'), ('18 + 4', '22'), ('18 + 7', '25'), ('18 + 9', '27'), ('22 + 11', '33'), ('22 + 8', '30'), ('22 + 17', '39'), ('25 + 11', '36'), ('25 + 14', '39'), ('25 + 18', '43'), ('18 + 27', '45'), ('16 + 11', '27'), ('16 + 19', '35'), ('29 + 13', '42'), ('19 + 27', '46'), ('31 + 5', '36'), ('19 + 4', '23'), ('7 + 23', '30'), ('15 + 31', '46'), ('25 - 8', '17'), ('24 - 6', '18'), ('29 - 8', '21'), ('27 - 12', '15'), ('26 - 17', '9'), ('36 - 21', '15'), ('36 - 17', '19'), ('36 - 8', '28'), ('32 - 12', '20'), ('38 - 19', '19'), ('33 - 16', '17'), ('33 - 7', '26'), ('33 - 27', '6'), ('45 - 8', '37'), ('45 - 17', '28'), ('45 - 23', '22'), ('45 - 31', '14'), ('41 - 19', '22'), ('41 - 23', '18'), ('43 - 19', '24'), ('43 - 27', '16'), ('41 - 38', '3'), ('42 - 34', '8'), ('40 - 30', '10'), ('40 - 20', '20'), ('40 - 40', '0'), ('30 - 30', '0'), ('20 - 20', '0'), ('10 - 10', '0'), ('23 + 8', '31'), ('11 + 31', '42'), ('2 + 27', '29'), ('7 + 19', '26'), ('13 + 23', '36'), ('23 + 23', '46'), ('41 + 3', '44'), ('36 + 7', '43'), ('11 + 29', '40'), ('12 + 17', '29'), ('29 + 17', '46'), ('27 + 18', '45'), ('20 + 20', '40'), ('30 + 12', '42'), ('25 + 15', '40'), ('14 + 31', '45'), ('35 + 2', '37'), ('39 + 4', '43'), ('31 + 6', '37'), ('19 + 19', '38'), ('43 + 5', '48'), ('41 + 8', '49'), ('6 + 37', '43'), ('12 + 29', '41'), ('21 + 27', '48'), ('48 + 1', '49'), ('7 + 35', '42'), ('17 + 17', '34'), ('34 + 13', '47')" 
                
                let insertSQLLevel4 = "INSERT INTO LEVEL4 (question, answer) VALUES ('1 + 0', '1'), ('2 + 0', '2'), ('3 + 0', '3'), ('4 + 0', '4'), ('5 + 0', '5'), ('6 + 0', '6'), ('7 + 0', '7'), ('8 + 0', '8'), ('3 + 5', '8'), ('3 + 6', '9'), ('4 + 3', '7'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('4 + 5', '9'), ('5 + 4', '9'), ('0 - 0', '0'), ('9 - 0', '9'), ('8 - 0', '8'), ('7 - 0', '7'), ('6 - 0', '6'), ('5 - 0', '5'), ('4 - 3', '1'), ('4 - 4', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('2 - 1', '1'), ('2 - 2', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('1 - 1', '0'), ('9 + 1', '10'), ('9 + 2', '11'), ('9 + 3', '12'), ('9 + 4', '13'), ('9 + 5', '14'), ('9 + 6', '15'), ('9 + 7', '16'), ('9 + 8', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('2 + 9', '11'), ('3 + 9', '12'), ('4 + 9', '13'), ('5 + 9', '14'), ('6 + 9', '15'), ('7 + 9', '16'), ('8 + 9', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('19 - 0', '19'), ('19 - 1', '18'), ('19 - 2', '17'), ('19 - 3', '16'), ('19 - 4', '15'), ('19 - 5', '14'), ('19 - 6', '13'), ('19 - 7', '12'), ('19 - 8', '11'), ('19 - 9', '10'), ('18 - 0', '18'), ('18 - 1', '17'), ('18 - 2', '16'), ('18 - 3', '15'), ('18 - 4', '14'), ('18 - 5', '13'), ('18 - 6', '12'), ('18 - 7', '11'), ('18 - 8', '10'), ('17 - 0', '17'), ('17 - 1', '16'), ('17 - 2', '15'), ('17 - 3', '14'), ('17 - 4', '13'), ('17 - 5', '12'), ('17 - 6', '11'), ('17 - 7', '10'), ('16 - 0', '16'), ('16 - 1', '15'), ('16 - 2', '14'), ('16 - 3', '13'), ('16 - 4', '12'), ('16 - 5', '11'), ('16 - 6', '10'), ('15 - 0', '15'), ('15 - 1', '14'), ('15 - 2', '13'), ('15 - 3', '12'), ('15 - 4', '11'), ('15 - 5', '10'), ('14 - 0', '14'), ('14 - 1', '13'), ('14 - 2', '12'), ('14 - 3', '11'), ('14 - 4', '10'), ('13 - 0', '13'), ('13 - 1', '12'), ('13 - 2', '11'), ('13 - 3', '10'), ('12 - 0', '12'), ('12 - 1', '11'), ('12 - 2', '10'), ('11 - 0', '11'), ('11 - 1', '10'), ('10 - 0', '10')"
                
                let insertSQLLevel5 = "INSERT INTO LEVEL5 (question, answer) VALUES ('1 + 0', '1'), ('2 + 0', '2'), ('3 + 0', '3'), ('4 + 0', '4'), ('5 + 0', '5'), ('6 + 0', '6'), ('7 + 0', '7'), ('8 + 0', '8'), ('3 + 5', '8'), ('3 + 6', '9'), ('4 + 3', '7'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('4 + 5', '9'), ('5 + 4', '9'), ('0 - 0', '0'), ('9 - 0', '9'), ('8 - 0', '8'), ('7 - 0', '7'), ('6 - 0', '6'), ('5 - 0', '5'), ('4 - 3', '1'), ('4 - 4', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('2 - 1', '1'), ('2 - 2', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('1 - 1', '0'), ('9 + 1', '10'), ('9 + 2', '11'), ('9 + 3', '12'), ('9 + 4', '13'), ('9 + 5', '14'), ('9 + 6', '15'), ('9 + 7', '16'), ('9 + 8', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('2 + 9', '11'), ('3 + 9', '12'), ('4 + 9', '13'), ('5 + 9', '14'), ('6 + 9', '15'), ('7 + 9', '16'), ('8 + 9', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('19 - 0', '19'), ('19 - 1', '18'), ('19 - 2', '17'), ('19 - 3', '16'), ('19 - 4', '15'), ('19 - 5', '14'), ('19 - 6', '13'), ('19 - 7', '12'), ('19 - 8', '11'), ('19 - 9', '10'), ('18 - 0', '18'), ('18 - 1', '17'), ('18 - 2', '16'), ('18 - 3', '15'), ('18 - 4', '14'), ('18 - 5', '13'), ('18 - 6', '12'), ('18 - 7', '11'), ('18 - 8', '10'), ('17 - 0', '17'), ('17 - 1', '16'), ('17 - 2', '15'), ('17 - 3', '14'), ('17 - 4', '13'), ('17 - 5', '12'), ('17 - 6', '11'), ('17 - 7', '10'), ('16 - 0', '16'), ('16 - 1', '15'), ('16 - 2', '14'), ('16 - 3', '13'), ('16 - 4', '12'), ('16 - 5', '11'), ('16 - 6', '10'), ('15 - 0', '15'), ('15 - 1', '14'), ('15 - 2', '13'), ('15 - 3', '12'), ('15 - 4', '11'), ('15 - 5', '10'), ('14 - 0', '14'), ('14 - 1', '13'), ('14 - 2', '12'), ('14 - 3', '11'), ('14 - 4', '10'), ('13 - 0', '13'), ('13 - 1', '12'), ('13 - 2', '11'), ('13 - 3', '10'), ('12 - 0', '12'), ('12 - 1', '11'), ('12 - 2', '10'), ('11 - 0', '11'), ('11 - 1', '10'), ('10 - 0', '10')"
                
                let insertSQLLevel6 = "INSERT INTO LEVEL6 (question, answer) VALUES ('1 + 0', '1'), ('2 + 0', '2'), ('3 + 0', '3'), ('4 + 0', '4'), ('5 + 0', '5'), ('6 + 0', '6'), ('7 + 0', '7'), ('8 + 0', '8'), ('3 + 5', '8'), ('3 + 6', '9'), ('4 + 3', '7'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('4 + 5', '9'), ('5 + 4', '9'), ('0 - 0', '0'), ('9 - 0', '9'), ('8 - 0', '8'), ('7 - 0', '7'), ('6 - 0', '6'), ('5 - 0', '5'), ('4 - 3', '1'), ('4 - 4', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('2 - 1', '1'), ('2 - 2', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('1 - 1', '0'), ('9 + 1', '10'), ('9 + 2', '11'), ('9 + 3', '12'), ('9 + 4', '13'), ('9 + 5', '14'), ('9 + 6', '15'), ('9 + 7', '16'), ('9 + 8', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('2 + 9', '11'), ('3 + 9', '12'), ('4 + 9', '13'), ('5 + 9', '14'), ('6 + 9', '15'), ('7 + 9', '16'), ('8 + 9', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('19 - 0', '19'), ('19 - 1', '18'), ('19 - 2', '17'), ('19 - 3', '16'), ('19 - 4', '15'), ('19 - 5', '14'), ('19 - 6', '13'), ('19 - 7', '12'), ('19 - 8', '11'), ('19 - 9', '10'), ('18 - 0', '18'), ('18 - 1', '17'), ('18 - 2', '16'), ('18 - 3', '15'), ('18 - 4', '14'), ('18 - 5', '13'), ('18 - 6', '12'), ('18 - 7', '11'), ('18 - 8', '10'), ('17 - 0', '17'), ('17 - 1', '16'), ('17 - 2', '15'), ('17 - 3', '14'), ('17 - 4', '13'), ('17 - 5', '12'), ('17 - 6', '11'), ('17 - 7', '10'), ('16 - 0', '16'), ('16 - 1', '15'), ('16 - 2', '14'), ('16 - 3', '13'), ('16 - 4', '12'), ('16 - 5', '11'), ('16 - 6', '10'), ('15 - 0', '15'), ('15 - 1', '14'), ('15 - 2', '13'), ('15 - 3', '12'), ('15 - 4', '11'), ('15 - 5', '10'), ('14 - 0', '14'), ('14 - 1', '13'), ('14 - 2', '12'), ('14 - 3', '11'), ('14 - 4', '10'), ('13 - 0', '13'), ('13 - 1', '12'), ('13 - 2', '11'), ('13 - 3', '10'), ('12 - 0', '12'), ('12 - 1', '11'), ('12 - 2', '10'), ('11 - 0', '11'), ('11 - 1', '10'), ('10 - 0', '10')"
                
                let insertSQLLevel7 = "INSERT INTO LEVEL7 (question, answer) VALUES ('1 + 0', '1'), ('2 + 0', '2'), ('3 + 0', '3'), ('4 + 0', '4'), ('5 + 0', '5'), ('6 + 0', '6'), ('7 + 0', '7'), ('8 + 0', '8'), ('3 + 5', '8'), ('3 + 6', '9'), ('4 + 3', '7'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('4 + 5', '9'), ('5 + 4', '9'), ('0 - 0', '0'), ('9 - 0', '9'), ('8 - 0', '8'), ('7 - 0', '7'), ('6 - 0', '6'), ('5 - 0', '5'), ('4 - 3', '1'), ('4 - 4', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('2 - 1', '1'), ('2 - 2', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('1 - 1', '0'), ('9 + 1', '10'), ('9 + 2', '11'), ('9 + 3', '12'), ('9 + 4', '13'), ('9 + 5', '14'), ('9 + 6', '15'), ('9 + 7', '16'), ('9 + 8', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('2 + 9', '11'), ('3 + 9', '12'), ('4 + 9', '13'), ('5 + 9', '14'), ('6 + 9', '15'), ('7 + 9', '16'), ('8 + 9', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('19 - 0', '19'), ('19 - 1', '18'), ('19 - 2', '17'), ('19 - 3', '16'), ('19 - 4', '15'), ('19 - 5', '14'), ('19 - 6', '13'), ('19 - 7', '12'), ('19 - 8', '11'), ('19 - 9', '10'), ('18 - 0', '18'), ('18 - 1', '17'), ('18 - 2', '16'), ('18 - 3', '15'), ('18 - 4', '14'), ('18 - 5', '13'), ('18 - 6', '12'), ('18 - 7', '11'), ('18 - 8', '10'), ('17 - 0', '17'), ('17 - 1', '16'), ('17 - 2', '15'), ('17 - 3', '14'), ('17 - 4', '13'), ('17 - 5', '12'), ('17 - 6', '11'), ('17 - 7', '10'), ('16 - 0', '16'), ('16 - 1', '15'), ('16 - 2', '14'), ('16 - 3', '13'), ('16 - 4', '12'), ('16 - 5', '11'), ('16 - 6', '10'), ('15 - 0', '15'), ('15 - 1', '14'), ('15 - 2', '13'), ('15 - 3', '12'), ('15 - 4', '11'), ('15 - 5', '10'), ('14 - 0', '14'), ('14 - 1', '13'), ('14 - 2', '12'), ('14 - 3', '11'), ('14 - 4', '10'), ('13 - 0', '13'), ('13 - 1', '12'), ('13 - 2', '11'), ('13 - 3', '10'), ('12 - 0', '12'), ('12 - 1', '11'), ('12 - 2', '10'), ('11 - 0', '11'), ('11 - 1', '10'), ('10 - 0', '10')"
                
                let insertSQLLevel8 = "INSERT INTO LEVEL8 (question, answer) VALUES ('1 + 0', '1'), ('2 + 0', '2'), ('3 + 0', '3'), ('4 + 0', '4'), ('5 + 0', '5'), ('6 + 0', '6'), ('7 + 0', '7'), ('8 + 0', '8'), ('3 + 5', '8'), ('3 + 6', '9'), ('4 + 3', '7'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('4 + 5', '9'), ('5 + 4', '9'), ('0 - 0', '0'), ('9 - 0', '9'), ('8 - 0', '8'), ('7 - 0', '7'), ('6 - 0', '6'), ('5 - 0', '5'), ('4 - 3', '1'), ('4 - 4', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('2 - 1', '1'), ('2 - 2', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('1 - 1', '0'), ('9 + 1', '10'), ('9 + 2', '11'), ('9 + 3', '12'), ('9 + 4', '13'), ('9 + 5', '14'), ('9 + 6', '15'), ('9 + 7', '16'), ('9 + 8', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('2 + 9', '11'), ('3 + 9', '12'), ('4 + 9', '13'), ('5 + 9', '14'), ('6 + 9', '15'), ('7 + 9', '16'), ('8 + 9', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('19 - 0', '19'), ('19 - 1', '18'), ('19 - 2', '17'), ('19 - 3', '16'), ('19 - 4', '15'), ('19 - 5', '14'), ('19 - 6', '13'), ('19 - 7', '12'), ('19 - 8', '11'), ('19 - 9', '10'), ('18 - 0', '18'), ('18 - 1', '17'), ('18 - 2', '16'), ('18 - 3', '15'), ('18 - 4', '14'), ('18 - 5', '13'), ('18 - 6', '12'), ('18 - 7', '11'), ('18 - 8', '10'), ('17 - 0', '17'), ('17 - 1', '16'), ('17 - 2', '15'), ('17 - 3', '14'), ('17 - 4', '13'), ('17 - 5', '12'), ('17 - 6', '11'), ('17 - 7', '10'), ('16 - 0', '16'), ('16 - 1', '15'), ('16 - 2', '14'), ('16 - 3', '13'), ('16 - 4', '12'), ('16 - 5', '11'), ('16 - 6', '10'), ('15 - 0', '15'), ('15 - 1', '14'), ('15 - 2', '13'), ('15 - 3', '12'), ('15 - 4', '11'), ('15 - 5', '10'), ('14 - 0', '14'), ('14 - 1', '13'), ('14 - 2', '12'), ('14 - 3', '11'), ('14 - 4', '10'), ('13 - 0', '13'), ('13 - 1', '12'), ('13 - 2', '11'), ('13 - 3', '10'), ('12 - 0', '12'), ('12 - 1', '11'), ('12 - 2', '10'), ('11 - 0', '11'), ('11 - 1', '10'), ('10 - 0', '10')"
                
                let insertSQLLevel9 = "INSERT INTO LEVEL9 (question, answer) VALUES ('1 + 0', '1'), ('2 + 0', '2'), ('3 + 0', '3'), ('4 + 0', '4'), ('5 + 0', '5'), ('6 + 0', '6'), ('7 + 0', '7'), ('8 + 0', '8'), ('3 + 5', '8'), ('3 + 6', '9'), ('4 + 3', '7'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('4 + 5', '9'), ('5 + 4', '9'), ('0 - 0', '0'), ('9 - 0', '9'), ('8 - 0', '8'), ('7 - 0', '7'), ('6 - 0', '6'), ('5 - 0', '5'), ('4 - 3', '1'), ('4 - 4', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('2 - 1', '1'), ('2 - 2', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('1 - 1', '0'), ('9 + 1', '10'), ('9 + 2', '11'), ('9 + 3', '12'), ('9 + 4', '13'), ('9 + 5', '14'), ('9 + 6', '15'), ('9 + 7', '16'), ('9 + 8', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('2 + 9', '11'), ('3 + 9', '12'), ('4 + 9', '13'), ('5 + 9', '14'), ('6 + 9', '15'), ('7 + 9', '16'), ('8 + 9', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('19 - 0', '19'), ('19 - 1', '18'), ('19 - 2', '17'), ('19 - 3', '16'), ('19 - 4', '15'), ('19 - 5', '14'), ('19 - 6', '13'), ('19 - 7', '12'), ('19 - 8', '11'), ('19 - 9', '10'), ('18 - 0', '18'), ('18 - 1', '17'), ('18 - 2', '16'), ('18 - 3', '15'), ('18 - 4', '14'), ('18 - 5', '13'), ('18 - 6', '12'), ('18 - 7', '11'), ('18 - 8', '10'), ('17 - 0', '17'), ('17 - 1', '16'), ('17 - 2', '15'), ('17 - 3', '14'), ('17 - 4', '13'), ('17 - 5', '12'), ('17 - 6', '11'), ('17 - 7', '10'), ('16 - 0', '16'), ('16 - 1', '15'), ('16 - 2', '14'), ('16 - 3', '13'), ('16 - 4', '12'), ('16 - 5', '11'), ('16 - 6', '10'), ('15 - 0', '15'), ('15 - 1', '14'), ('15 - 2', '13'), ('15 - 3', '12'), ('15 - 4', '11'), ('15 - 5', '10'), ('14 - 0', '14'), ('14 - 1', '13'), ('14 - 2', '12'), ('14 - 3', '11'), ('14 - 4', '10'), ('13 - 0', '13'), ('13 - 1', '12'), ('13 - 2', '11'), ('13 - 3', '10'), ('12 - 0', '12'), ('12 - 1', '11'), ('12 - 2', '10'), ('11 - 0', '11'), ('11 - 1', '10'), ('10 - 0', '10')"
                
                let insertSQLLevel10 = "INSERT INTO LEVEL10 (question, answer) VALUES ('1 + 0', '1'), ('2 + 0', '2'), ('3 + 0', '3'), ('4 + 0', '4'), ('5 + 0', '5'), ('6 + 0', '6'), ('7 + 0', '7'), ('8 + 0', '8'), ('3 + 5', '8'), ('3 + 6', '9'), ('4 + 3', '7'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('4 + 5', '9'), ('5 + 4', '9'), ('0 - 0', '0'), ('9 - 0', '9'), ('8 - 0', '8'), ('7 - 0', '7'), ('6 - 0', '6'), ('5 - 0', '5'), ('4 - 3', '1'), ('4 - 4', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('5 + 3', '8'), ('6 + 3', '9'), ('4 + 4', '8'), ('2 - 1', '1'), ('2 - 2', '0'), ('3 - 1', '2'), ('3 - 2', '1'), ('3 - 3', '0'), ('1 - 1', '0'), ('9 + 1', '10'), ('9 + 2', '11'), ('9 + 3', '12'), ('9 + 4', '13'), ('9 + 5', '14'), ('9 + 6', '15'), ('9 + 7', '16'), ('9 + 8', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('2 + 9', '11'), ('3 + 9', '12'), ('4 + 9', '13'), ('5 + 9', '14'), ('6 + 9', '15'), ('7 + 9', '16'), ('8 + 9', '17'), ('9 + 9', '18'), ('1 + 9', '10'), ('19 - 0', '19'), ('19 - 1', '18'), ('19 - 2', '17'), ('19 - 3', '16'), ('19 - 4', '15'), ('19 - 5', '14'), ('19 - 6', '13'), ('19 - 7', '12'), ('19 - 8', '11'), ('19 - 9', '10'), ('18 - 0', '18'), ('18 - 1', '17'), ('18 - 2', '16'), ('18 - 3', '15'), ('18 - 4', '14'), ('18 - 5', '13'), ('18 - 6', '12'), ('18 - 7', '11'), ('18 - 8', '10'), ('17 - 0', '17'), ('17 - 1', '16'), ('17 - 2', '15'), ('17 - 3', '14'), ('17 - 4', '13'), ('17 - 5', '12'), ('17 - 6', '11'), ('17 - 7', '10'), ('16 - 0', '16'), ('16 - 1', '15'), ('16 - 2', '14'), ('16 - 3', '13'), ('16 - 4', '12'), ('16 - 5', '11'), ('16 - 6', '10'), ('15 - 0', '15'), ('15 - 1', '14'), ('15 - 2', '13'), ('15 - 3', '12'), ('15 - 4', '11'), ('15 - 5', '10'), ('14 - 0', '14'), ('14 - 1', '13'), ('14 - 2', '12'), ('14 - 3', '11'), ('14 - 4', '10'), ('13 - 0', '13'), ('13 - 1', '12'), ('13 - 2', '11'), ('13 - 3', '10'), ('12 - 0', '12'), ('12 - 1', '11'), ('12 - 2', '10'), ('11 - 0', '11'), ('11 - 1', '10'), ('10 - 0', '10')"
                
                if !(mathDB?.executeStatements(sql_stmt1))! {
                    
                    print("Error: \(mathDB?.lastErrorMessage())")
                    
                }
                
                let result1 = mathDB?.executeUpdate(insertSQLLevel1,
                                                  withArgumentsIn: nil)
                
                if !result1! {
                    print("Error: \(mathDB?.lastErrorMessage())")
                }
                
                if !(mathDB?.executeStatements(sql_stmt2))! {
                    
                    print("Error: \(mathDB?.lastErrorMessage())")
                    
                }
                
                let result2 = mathDB?.executeUpdate(insertSQLLevel2,
                                                   withArgumentsIn: nil)
                
                if !result2! {
                    print("Error: \(mathDB?.lastErrorMessage())")
                }

                if !(mathDB?.executeStatements(sql_stmt3))! {
                    
                    print("Error: \(mathDB?.lastErrorMessage())")
                    
                }
                
                let result3 = mathDB?.executeUpdate(insertSQLLevel3,
                                                   withArgumentsIn: nil)
                
                if !result3! {
                    print("Error: \(mathDB?.lastErrorMessage())")
                }

                if !(mathDB?.executeStatements(sql_stmt4))! {
                    
                    print("Error: \(mathDB?.lastErrorMessage())")
                    
                }
                
                let result4 = mathDB?.executeUpdate(insertSQLLevel4,
                                                   withArgumentsIn: nil)
                
                if !result4! {
                    print("Error: \(mathDB?.lastErrorMessage())")
                }
                
                if !(mathDB?.executeStatements(sql_stmt5))! {
                    
                    print("Error: \(mathDB?.lastErrorMessage())")
                    
                }
                
                let result5 = mathDB?.executeUpdate(insertSQLLevel5,
                                                   withArgumentsIn: nil)
                
                if !result5! {
                    print("Error: \(mathDB?.lastErrorMessage())")
                }
                
                if !(mathDB?.executeStatements(sql_stmt6))! {
                    
                    print("Error: \(mathDB?.lastErrorMessage())")
                    
                }
                
                let result6 = mathDB?.executeUpdate(insertSQLLevel6,
                                                   withArgumentsIn: nil)
                
                if !result6! {
                    print("Error: \(mathDB?.lastErrorMessage())")
                }

                if !(mathDB?.executeStatements(sql_stmt7))! {
                    
                    print("Error: \(mathDB?.lastErrorMessage())")
                    
                }
                
                let result7 = mathDB?.executeUpdate(insertSQLLevel7,
                                                   withArgumentsIn: nil)
                
                if !result7! {
                    print("Error: \(mathDB?.lastErrorMessage())")
                }
                
                if !(mathDB?.executeStatements(sql_stmt8))! {
                    
                    print("Error: \(mathDB?.lastErrorMessage())")
                    
                }
                
                let result8 = mathDB?.executeUpdate(insertSQLLevel8,
                                                   withArgumentsIn: nil)
                
                if !result8! {
                    print("Error: \(mathDB?.lastErrorMessage())")
                }
                
                if !(mathDB?.executeStatements(sql_stmt9))! {
                    
                    print("Error: \(mathDB?.lastErrorMessage())")
                    
                }
                
                let result9 = mathDB?.executeUpdate(insertSQLLevel9,
                                                   withArgumentsIn: nil)
                
                if !result9! {
                    print("Error: \(mathDB?.lastErrorMessage())")
                }
                
                if !(mathDB?.executeStatements(sql_stmt10))! {
                    
                    print("Error: \(mathDB?.lastErrorMessage())")
                    
                }
                
                let result10 = mathDB?.executeUpdate(insertSQLLevel10,
                                                   withArgumentsIn: nil)
                
                if !result10! {
                    print("Error: \(mathDB?.lastErrorMessage())")
                }
                
                if !(mathDB?.executeStatements(sql_stmt11))! {
                    
                    print("Error: \(mathDB?.lastErrorMessage())")
                    
                }
                
            }else {
                print("Error: \(mathDB?.lastErrorMessage())")
            }
            
            mathDB?.close()
            
        }
        
    }
    
    //Pull information for tables in the local database and enters that information into the appropriate Array!
    func pullQuestionsFromDatabase () {
        
        //var count: Int = 0 //Test variable to test how many questions are in a table in the database
    
        let databaseName = "Math.db"
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        
        let databasePath = docsDir.stringByAppendingPathComponent(databaseName)
        
        let mathDB = FMDatabase(path: databasePath as String)
        
        if (mathDB?.open())! {
            
            let querySQLevel1 = "SELECT * FROM LEVEL1"
            
            let results1:FMResultSet? = mathDB?.executeQuery(querySQLevel1,
                                                           withArgumentsIn: nil)
            
            while (results1?.next() == true) {
                
                question1.append(questions1(question: (results1?.string(forColumn: "question"))!, answer: (results1?.string(forColumn: "answer"))!))
            
            }
            
            let querySQLevel2 = "SELECT * FROM LEVEL2"
            
            let results2:FMResultSet? = mathDB?.executeQuery(querySQLevel2,
                                                            withArgumentsIn: nil)
            
            while (results2?.next() == true) {
                
                question2.append(questions2(question: (results2?.string(forColumn: "question"))!, answer: (results2?.string(forColumn: "answer"))!))
                
            }
            
            let querySQLevel3 = "SELECT * FROM LEVEL3"
            
            let results3:FMResultSet? = mathDB?.executeQuery(querySQLevel3,
                                                            withArgumentsIn: nil)
            
            while (results3?.next() == true) {
                
                question3.append(questions3(question: (results3?.string(forColumn: "question"))!, answer: (results3?.string(forColumn: "answer"))!))
                
            }
            
            let querySQLevel4 = "SELECT * FROM LEVEL4"
            
            let results4:FMResultSet? = mathDB?.executeQuery(querySQLevel4,
                                                            withArgumentsIn: nil)
            
            while (results4?.next() == true) {
                
                question4.append(questions4(question: (results4?.string(forColumn: "question"))!, answer: (results4?.string(forColumn: "answer"))!))
                
            }
            
            let querySQLevel5 = "SELECT * FROM LEVEL5"
            
            let results5:FMResultSet? = mathDB?.executeQuery(querySQLevel5,
                                                            withArgumentsIn: nil)
            
            while (results5?.next() == true) {
                
                question5.append(questions5(question: (results5?.string(forColumn: "question"))!, answer: (results5?.string(forColumn: "answer"))!))
                
            }
            
            let querySQLevel6 = "SELECT * FROM LEVEL6"
            
            let results6:FMResultSet? = mathDB?.executeQuery(querySQLevel6,
                                                            withArgumentsIn: nil)
            
            while (results6?.next() == true) {
                
                question6.append(questions6(question: (results6?.string(forColumn: "question"))!, answer: (results6?.string(forColumn: "answer"))!))
                
            }
            
            let querySQLevel7 = "SELECT * FROM LEVEL7"
            
            let results7:FMResultSet? = mathDB?.executeQuery(querySQLevel7,
                                                            withArgumentsIn: nil)
            
            while (results7?.next() == true) {
                
                question7.append(questions7(question: (results7?.string(forColumn: "question"))!, answer: (results7?.string(forColumn: "answer"))!))
                
            }
            
            let querySQLevel8 = "SELECT * FROM LEVEL8"
            
            let results8:FMResultSet? = mathDB?.executeQuery(querySQLevel8,
                                                            withArgumentsIn: nil)
            
            while (results8?.next() == true) {
                
                question8.append(questions8(question: (results8?.string(forColumn: "question"))!, answer: (results8?.string(forColumn: "answer"))!))
                
            }
            
            let querySQLevel9 = "SELECT * FROM LEVEL9"
            
            let results9:FMResultSet? = mathDB?.executeQuery(querySQLevel9,
                                                            withArgumentsIn: nil)
            
            while (results9?.next() == true) {
                
                question9.append(questions9(question: (results9?.string(forColumn: "question"))!, answer: (results9?.string(forColumn: "answer"))!))
                
            }
            
            let querySQLevel10 = "SELECT * FROM LEVEL10"
            
            let results10:FMResultSet? = mathDB?.executeQuery(querySQLevel10,
                                                            withArgumentsIn: nil)
            
            while (results10?.next() == true) {
                
                question10.append(questions10(question: (results10?.string(forColumn: "question"))!, answer: (results10?.string(forColumn: "answer"))!))
                
            }
            
            mathDB?.close()
            
        }
     
    }
    
    //Deletes all the information from each table in the local database!
    func cleanDatabaseTables () {
        
        let databaseName = "Math.db"
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        
        let databasePath = docsDir.stringByAppendingPathComponent(databaseName)
        
        let mathDB = FMDatabase(path: databasePath as String)
        
        if (mathDB?.open())! {
            
            let deleteSQLevel1 = "DELETE FROM LEVEL1"
            
            let result1 = mathDB?.executeUpdate(deleteSQLevel1, withArgumentsIn: nil)
            
            if !result1! {
                print("Error: \(mathDB?.lastErrorMessage())")
            }
            
            
            let deleteSQLevel2 = "DELETE FROM LEVEL2"
            
            let result2 = mathDB?.executeUpdate(deleteSQLevel2, withArgumentsIn: nil)
            
            if !result2! {
                print("Error: \(mathDB?.lastErrorMessage())")
            }
            
            
            let deleteSQLevel3 = "DELETE FROM LEVEL3"
            
            let result3 = mathDB?.executeUpdate(deleteSQLevel3, withArgumentsIn: nil)
            
            if !result3! {
                print("Error: \(mathDB?.lastErrorMessage())")
            }
            
        
            let deleteSQLevel4 = "DELETE FROM LEVEL4"
            
            let result4 = mathDB?.executeUpdate(deleteSQLevel4, withArgumentsIn: nil)
            
            if !result4! {
                print("Error: \(mathDB?.lastErrorMessage())")
            }
            
            
            let deleteSQLevel5 = "DELETE FROM LEVEL5"
            
            let result5 = mathDB?.executeUpdate(deleteSQLevel5, withArgumentsIn: nil)
            
            if !result5! {
                print("Error: \(mathDB?.lastErrorMessage())")
            }
            
            
            let deleteSQLevel6 = "DELETE FROM LEVEL6"
            
            let result6 = mathDB?.executeUpdate(deleteSQLevel6, withArgumentsIn: nil)
            
            if !result6! {
                print("Error: \(mathDB?.lastErrorMessage())")
            }
            
            
            let deleteSQLevel7 = "DELETE FROM LEVEL7"
            
            let result7 = mathDB?.executeUpdate(deleteSQLevel7, withArgumentsIn: nil)
            
            if !result7! {
                print("Error: \(mathDB?.lastErrorMessage())")
            }
            
            
            let deleteSQLevel8 = "DELETE FROM LEVEL8"
            
            let result8 = mathDB?.executeUpdate(deleteSQLevel8, withArgumentsIn: nil)
            
            if !result8! {
                print("Error: \(mathDB?.lastErrorMessage())")
            }
            
            
            let deleteSQLevel9 = "DELETE FROM LEVEL9"
            
            let result9 = mathDB?.executeUpdate(deleteSQLevel9, withArgumentsIn: nil)
            
            if !result9! {
                print("Error: \(mathDB?.lastErrorMessage())")
            }
            
            
            let deleteSQLevel10 = "DELETE FROM LEVEL10"
            
            let result10 = mathDB?.executeUpdate(deleteSQLevel10, withArgumentsIn: nil)
            
            if !result10! {
                print("Error: \(mathDB?.lastErrorMessage())")
            }
            
            mathDB?.close()
            
        } else {
            print("Error: \(mathDB?.lastErrorMessage())")
        }

        
    }
    
    /*Returns a random question from the local database and depending on the amount of questions answered
     correctly will determine which table the questions are taken from!*/
    func getRandomQuestion (_ row: Int, correct: Int) -> (String) {
     
        var question: String = ""
        
        if (correct <= 19) {
            
            question = question1[row].question
            
        }
        
        else if (correct > 19 &&  correct <= 39) {
            
            question = question2[row].question
            
        }
        
        else if (correct > 39 && correct <= 59) {
            
            question = question3[row].question
            
        }
        
        else if (correct > 59 && correct <= 79) {
            
            question = question4[row].question
            
        }
        
        else if (correct > 79 && correct <= 99) {
            
            question = question5[row].question
            
        }
        
        else if (correct > 99 && correct <= 119) {
            
            question = question6[row].question
            
        }
        
        else if (correct > 119 && correct <= 139) {
            
            question = question7[row].question
        }
        
        
        else if (correct > 139 && correct <= 159) {
            
            question = question8[row].question
            
        }
        
        
        else if (correct > 159 && correct <= 179) {
            
            question = question9[row].question
            
        }
        
        else if (correct > 179) {
            
            question = question10[row].question
            
        }
        
        return (question)
    }
    
    //Returns the correct answer for the given question being asked!
    func getRandomAnswer (_ row: Int, correct: Int) -> (String) {
        
        var answer: String = ""
        
        if (correct <= 19) {
            
            answer = question1[row].answer
            
        }
            
        else if (correct > 19 &&  correct <= 39) {
            
            answer = question2[row].answer
            
        }
            
        else if (correct > 39 && correct <= 59) {
            
            answer = question3[row].answer
            
        }
            
        else if (correct > 59 && correct <= 79) {
            
            answer = question4[row].answer
            
        }
            
        else if (correct > 79 && correct <= 99) {
            
            answer = question5[row].answer
            
        }
            
        else if (correct > 99 && correct <= 119) {
            
            answer = question6[row].answer
            
        }
            
        else if (correct > 119 && correct <= 139) {
            
            answer = question7[row].answer
        }
            
            
        else if (correct > 139 && correct <= 159) {
            
            answer = question8[row].answer
            
        }
            
            
        else if (correct > 159 && correct <= 179) {
            
            answer = question9[row].answer
            
        }
            
        else if (correct > 179) {
            
            answer = question10[row].answer
            
        }

        return (answer)
    }
    
    //Saves the final score of the game just played to be displayed in the ThirdViewController!
    func saveScore (_ score: String) {
        
        overallScore = score
        
    }
    
    //Returns the final score of the pervious game!
    func returnFinalScore () -> String {
        
        return (overallScore)
    }
    
    //Pulls in the stored high score from the local database
    func setHighScores () {
        
        let databaseName = "Math.db"
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        
        let databasePath = docsDir.stringByAppendingPathComponent(databaseName)
        
        let mathDB = FMDatabase(path: databasePath as String)
        
        if (mathDB?.open())! {
            
            if (tracking == 0) {
                
                let querySQLScores = "SELECT * FROM HIGHSCORE"
                
                let results11:FMResultSet? = mathDB?.executeQuery(querySQLScores, withArgumentsIn: nil)
                
                while (results11?.next()) == true {
                    
                    highScore.append(highScores(score: (results11?.string(forColumn: "score"))!))
                    
                }
                
                tracking = 1
                
            }
            
            mathDB?.close()
        }
        
    }
    
    /*Saves the score of the last game in the local database and into the array for high scores if the
     score of the game beats the highest score.*/
    func addHighScore (_ gameScore: String) {
        
        let finalScore: Int = Int(gameScore)!
        
        if (highScore.count > 0) {
            
            if (finalScore > Int(highScore[0].score)) {
                
                highScore.removeAll()
                
                let databaseName = "Math.db"
                let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                let docsDir = dirPaths[0]
                
                let databasePath = docsDir.stringByAppendingPathComponent(databaseName)
                
                let mathDB = FMDatabase(path: databasePath as String)
                
                if (mathDB?.open())! {
                    
                    let deleteSQL = "DELETE FROM HIGHSCORE"
                    
                    let resultDelete = mathDB?.executeUpdate(deleteSQL, withArgumentsIn: nil)
                    
                    if !resultDelete! {
                        print("Error: \(mathDB?.lastErrorMessage()) Maybe")
                    }
                    
                    let insertSQL = "INSERT INTO HIGHSCORE (score) VALUES ('\(gameScore)')"
                    
                    let resultInsert = mathDB?.executeUpdate(insertSQL,
                                                       withArgumentsIn: nil)
                    if !resultInsert! {
                        print("Error: \(mathDB?.lastErrorMessage())")
                    }
                    
                } else {
                    print("Error: \(mathDB?.lastErrorMessage()!)")
                }
                
                highScore.append(highScores(score: gameScore))
                
                mathDB?.close()
            }
            
        } else {
            
            highScore.append(highScores(score: gameScore))
            
        }
    }
    

    
    
} //Closing bracket for class











/** THIS IS A AREA FOR UN-FINISHED AND UN-INTEGRATED FEATURES!!!!*/

/** Will sort high scores in Array highScore in ascending order. May use later*/

/*highScore.append(highScores(score: gameScore))
 let arrayCount: Int = (highScore.count - 1)
 
 for i: Int in 0 ..< arrayCount {
 
 for j: Int in stride(from: (i + 1), to: (arrayCount + 1), by: 1) {
 
 if ((Int(highScore[j].score)) > (Int(highScore[i].score))) {
 temp = highScore[i].score;
 highScore[i] = highScore[j];
 highScore[j].score = temp;
 }
 }
 }*/



























