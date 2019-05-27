//
//  ApiMethod.swift
//  InduslandDemoApp
//
//  Created by Mac on 22/05/19.
//  Copyright © 2019 Mac software. All rights reserved.
//

import Foundation

class ApiMethod {
    public func login(aadhar: String) -> String {
        var response = ""
        if (aadhar.count == 12 && !aadhar.isEmpty) {
            if aadhar == "787612346756" {
                response = "{\"status\":\"Success\",\"Description\":\"Valid Aadhar Number\",\"name\":\"John\",\"age\":30,\"mobile\":9892065298,\"accounts\":[{\"accNumber\":\"100044334452\", \"accType\":\"Savings\"},{ \"accNumber\":\"543781200321\", \"accType\":\"Loan\"}]}"
                return response
            } else if aadhar == "908712345647" {
                response = "{\"status\":\"Success\",\"Description\":\"Valid Aadhar Number\"\"name\":\"Amit\",\"age\":30,\"mobile\":9819975645,\"accounts\":[{\"accNumber\":\"100034523123\", \"accType\":\"Savings\"}]}"
                return response
            } else if aadhar == "908709098923" {
                response = "{\"status\":\"Success\",\"Description\":\"Valid Aadhar Number\"\"name\":\"Rupam\",\"age\":30,\"mobile\":9819975696,\"accounts\":[{\"accNumber\":\"543216542345\", \"accType\":\"Loan\"}]}";
                return response
            } else {
                response = "{\"status\":\"Fail\",\"Description\":\"Please Enter Correct Aadhar Number\"}"
                return response
            }
        } else {
            response = "{\"status\":\"Fail\",\"Description\":\"Please Enter Correct Aadhar Number\"}"
            return response
        }
        
    }
    
    public func billFetch(billCatagory: String,mobileNo: String,billerName: String ,accountNo: String) -> String {
        var response = ""
        if billCatagory.isEmpty {
            response = "{\"status\":\"Fail\",\"\"Description\":\"Please Enter Bill Catagory\"}"
            return response
        } else if mobileNo.isEmpty {
            response = "{\"status\":\"Fail\",\"\"Description\":\"Please Enter Mobile No\"}"
            return response
        } else if billerName.isEmpty {
            response = "{\"status\":\"Fail\",\"\"Description\":\"Please Enter Biller Merchant Name\"}";
            return response
        } else if mobileNo == "9892065298" {
            response = "{\"status\":\"Success\",\"Description\":\"Valid Mobile No\",\"Amount\":\"500\",\"Name\":\"John\",\"BillerMerchantName\":\"" + billerName + "\"" + ",\"DueDate\":\"30/06/2019\",\"bIllNo\":10000498580,\"billAcctNo\":800987901}"
            return response
        } else if mobileNo == "9819975645" {
            response = "{\"status\":\"Success\",\"Description\":\"Valid Mobile No\",\"Amount\":\"500\",\"Name\":\"Amit\",\"BillerMerchantName\":\"" + billerName + "\"" + ",\"DueDate\":\"30/05/2019\",\"bIllNo\":10000498581,\"billAcctNo\":800987902}"
            return response
        } else if mobileNo == "9819975696" {
            response = "{\"status\":\"Success\",\"Description\":\"Valid Mobile No\",\"Amount\":\"500\",\"Name\":\"Rupam\",\"BillerMerchantName\":\"" + billerName + "\"" + ",\"DueDate\":\"30/07/2019\",\"bIllNo\":10000498582,\"billAcctNo\":800987903}"
            return response
        } else {
            response = "{\"status\":\"Fail\",\"\"Description\":\"Please Enter Correct Mobile Number\"}";
            return response
        }
    }
    
    public func payment(aadhar: String ,fromActNo: String ,toActNo: String ,typeOfAct: String ,amount: Double ,debitNarration: String ,creditNarration: String ,balance: Double ,panNo: String) -> String {
        var AvlBal = "{\"status\":\"success\",\"balance\":"
        if ((aadhar != "787612346756" || fromActNo != "100044334452") && (aadhar != "908712345647" || fromActNo != "100034523123")) {
            AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\" Description\":\"Please Enter Correct Aadhar and Account Number\"}"
            return AvlBal
        } else if (aadhar.count == 12 && !aadhar.isEmpty) {
            if fromActNo.isEmpty {
                AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\"Description\":\"Please Enter Correct From Account Number\"}"
                return AvlBal
            } else if toActNo.isEmpty {
                AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\"Description\":\"Please Enter Correct To Account Number\"}"
                return AvlBal
            } else if typeOfAct.isEmpty {
                AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\"Description\":\"Please Enter Type of Account\"}"
                return AvlBal
            } else if (amount >= 0.0 && amount != 0.0) {
                if (balance >= 0.0 && balance != 0.0) {
                    if !panNo.isEmpty {
                        
                        let regex = "[A-Z]{5}[0-9]{4}[A-Z]{1}"
                        let panNotest = NSPredicate(format: "SELF MATCHES %@", regex)
                        
                        if !panNotest.evaluate(with: panNo) {
                            AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\"Description\":\"Please Enter Valid PAN No\"}"
                            return AvlBal
                        }
                    }
                    
                    let newBal: Double = balance - amount
                    if (newBal < 0.0) {
                        AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\"Description\":\"Low Balance\"}"
                    } else {
                        AvlBal = "{\"status\":\"Success\",\"balance\":" + String(newBal) + "," + "\"Description\":\"Payment Success\"}"
                    }
                    
                    return AvlBal
                } else {
                    AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance)  + "," + "\"Description\":\"Please Enter Valid Amount\"}"
                    return AvlBal
                }
            } else {
                AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance)  + "," + "\"Description\":\"Please Enter Valid Amount\"}";
                return AvlBal
            }
        } else {
            AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance)  + "," + "\" Description\":\"Please Enter Correct Aadhar Number\"}"
            return AvlBal
        }
    }
    
    public func balWithdraw(aadhar: String, actNo: String, currency: String, amount: Double, debitNarration: String, creditNarration: String, balance: Double) -> String {
        var AvlBal = "{\"status\":\"success\",\"balance\":"
        if (aadhar == "787612346756" && actNo == "100044334452" || aadhar == "908712345647" && actNo == "100034523123") {
            if (aadhar.count == 12 && !aadhar.isEmpty) {
                if actNo.isEmpty {
                    AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance)  + "," + "\" Description\":\"Please Enter Correct Account Number\"}"
                    return AvlBal
                } else if currency.isEmpty {
                    AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance)  + "," + "\" Description\":\"Please Enter Correct Currency Code\"}"
                    return AvlBal
                } else if (amount >= 0.0 && amount != 0.0) {
                    if (balance >= 0.0 && balance != 0.0) {
                        let newBal: Double = balance - amount
                        if (newBal < 0.0) {
                            AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance)  + "," + "\"Description\":\"Low Balance\"}"
                        } else {
                            AvlBal = "{\"status\":\"Success\",\"balance\":" + String(newBal) + "," + "\"Description\":\"Withdrawal Success\"}"
                        }
                        
                        return AvlBal
                    } else {
                        AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance)  + "," + "\" Description\":\"Please Enter Valid Amount\"}";
                        return AvlBal
                    }
                } else {
                    AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance)  + "," + "\" Description\":\"Please Enter Valid Amount\"}"
                    return AvlBal
                }
            } else {
                AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance)  + "," + "\" Description\":\"Please Enter Correct Aadhar Number\"}"
                return AvlBal
            }
        } else {
            AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance)  + "," + "\" Description\":\"Please Enter Correct Aadhar and Account Number\"}"
            return AvlBal
        }
    }
    
    public func fundDeposit(aadhar: String, actNo:String, currency: String, amount: Double, debitNarration: String, creditNarration: String, balance: Double) -> String {
        var AvlBal = "{\"status\":\"success\",\"balance\":"
        if (aadhar == "787612346756" && actNo == "100044334452" || aadhar == "908712345647" && actNo == "100034523123") {
            if (aadhar.count == 12 && !aadhar.isEmpty) {
                if actNo.isEmpty {
                    AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\" Description\":\"Please Enter Correct Account Number\"}"
                    return AvlBal
                } else if currency.isEmpty {
                    AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\" Description\":\"Please Enter Correct Currency Code\"}"
                    return AvlBal
                } else if (amount >= 0.0 && amount != 0.0) {
                    if (balance >= 0.0 && balance != 0.0) {
                        let newBal: Double = balance + amount
                        if (newBal < 0.0) {
                            AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\" Description\":\"Low Balance\"}"
                        } else {
                            AvlBal = "{\"status\":\"Success\",\"balance\":" + String(newBal) + "," + "\" Description\":\"Deposit Success\"}"
                        }
                        
                        return AvlBal
                    } else {
                        AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\" Description\":\"Please Enter Valid Amount\"}"
                        return AvlBal
                    }
                } else {
                    AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\" Description\":\"Please Enter Valid Amount\"}"
                    return AvlBal
                }
            } else {
                AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\" Description\":\"Please Enter Correct Aadhar Number\"}"
                return AvlBal
            }
        } else {
            AvlBal = "{\"status\":\"Fail\",\"balance\":" + String(balance) + "," + "\" Description\":\"Please Enter Correct Aadhar and Account Number\"}"
            return AvlBal
        }
    }
    
    public func savingsAccountInquiry(accountNumber: String, aadhar: String) -> String {
        var response = ""
        if (aadhar.count == 12 && !aadhar.isEmpty) {
            if accountNumber.isEmpty {
                response = "{\"status\":\"Fail\",\"\"Description\":\"Please Enter Account Number\"}"
                return response
            } else if (aadhar == "787612346756" && accountNumber == "100044334452") {
                response = "{ \"status\":\"Success\", \"Description\":\"Valid Details\", \"acctName\":\"John\", \"balance\":\"2000.00\", \"currencyCode\": \"INR\", \"DOB\":\"02-Apr-1989\", \"acctOpenDate\": \"2005-05-22T00:00:00.000\", \"acctStatus\": \"Active\", \"custId\": \"12145468\", \"drawingPower\": \"9000.00\", \"jointHolderName1\": \"Arnold\", \"jointHolderName2\": \"\", \"jointHolderName3\": \"\", \"schemeCode\": \"SBSTF\", \"solId\": \"0018\", \"FreezeStatusCode\": \"\", \"PhoneNum\": \"9892065298\", \"TelephoneNum\": \"\", \"FaxNum\": \"\", \"EmailAddr\": \"arnold@ibl.com\", \"Addr1\": \"H/212 SEVEN HILLS NR SAMTA NAGAR\", \"Addr2\": \"CAMP ROAD TAMBARAM (E)\", \"Addr3\": \"\", \"City\": \"Chennai\", \"StateProv\": \"TamilNadu\", \"PostalCode\": \"600045\", \"Country\": \"IN\", \"Nominee\": \"Yes\", \"NomineeDOB\": \"27-Jun-1956\", \"NomineeName\": \"DAVID\", \"NomineeRelationship\": \"Brother\", \"NomineeContact\": \"8929526789\" }"
                return response
            } else if (aadhar == "908712345647" && accountNumber == "100034523123") {
                response = "{  \"status\":\"Success\", \"Description\":\"Valid Details\", \"acctName\":\"Amit\", \"balance\":\"6000.00\", \"currencyCode\": \"INR\", \"DOB\":\"02-May-1989\", \"acctOpenDate\": \"2001-05-22T00:00:00.000\", \"acctStatus\": \"Active\", \"custId\": \"21145468\", \"drawingPower\": \"20000.00\", \"jointHolderName1\": \"Agit\", \"jointHolderName2\": \"\", \"jointHolderName3\": \"\", \"schemeCode\": \"SBSTF\", \"solId\": \"0012\", \"FreezeStatusCode\": \"\", \"PhoneNum\": \"9819975645\", \"TelephoneNum\": \"\", \"FaxNum\": \"\", \"EmailAddr\": \"amit@ibl.com\", \"Addr1\": \"H/501 OBEROI PERL NR ASHOK NAGAR\", \"Addr2\": \"SIDCO Industrial Estate ANDHERI (E)\", \"Addr3\": \"\", \"City\": \"Mumbai\", \"StateProv\": \"Maharashtra\", \"PostalCode\": \"400047\", \"Country\": \"IN\", \"Nominee\": \"Yes\", \"NomineeDOB\": \"19-Jun-1952\", \"NomineeName\": \"MARK\", \"NomineeRelationship\": \"Brother\", \"NomineeContact\": \"9819526123\" }"
                return response
            } else {
                response = "{\"status\":\"Fail\",\"\"Description\":\"Please Enter Correct Aadhar Number or Account Number \"}"
                return response
            }
        } else {
            response = "{\"status\":\"Fail\",\"\"Description\":\"Please Enter Correct Aadhar Number\"}"
            return response
        }
    }
    
    public func loanAccountInquiry(accountNumber: String , aadhar: String) -> String {
        var response = ""
        if (aadhar.count == 12 && !aadhar.isEmpty) {
            if accountNumber.isEmpty {
                response = "{\"status\":\"Fail\",\"\"Description\":\"Please Enter Account Number\"}"
                return response
            } else if (aadhar == "787612346756" && accountNumber == "543781200321") {
                response = "{ \"status\":\"Success\", \"Description\":\"Valid Details\", \"acctName\":\"John\", \"ROI\":\"12%\", \"type\":\"personal\", \"Outstanding\":\"10000.00\", \"EMIThisMonth\":\"500.00\", \"custId\" : \"11145468\", \"currencyCode\" : \"INR\", \"Duration\":\"25\", \"acctOpenDate\" : \"2019-03-22T00:00:00.000\", \"acctStatus\" : \"Active\", \"jointHolderName1\" : \"John\", \"jointHolderName2\" : \"\", \"jointHolderName3\" : \"\", \"FreezeStatusCode\": \"\", \"PhoneNum\": \"9892065298\", \"TelephoneNum\" : \"\", \"FaxNum\" : \"\", \"EmailAddr\" : \"john@ibl.com\" , \"Addr1\": \"H/501 OBEROI PERL NR ASHOK NAGAR\", \"Addr2\": \"MILITARY ROAD MAROL ANDHERI (E)\", \"Addr3\" : \"\", \"City\" : \"Mumbai\", \"StateProv\" : \"Maharashtra\", \"PostalCode\" : \"400073\", \"Country\" : \"IN\" }"
                return response
            } else if (aadhar == "908709098923" && accountNumber == "543216542345") {
                response = "{\"status\":\"Success\", \"Description\":\"Valid Details\", \"acctName\":\"Rupam\", \"ROI\":\"10%\", \"type\":\"farmer\", \"Outstanding\":\"10000.00\", \"EMIThisMonth\":\"500.00\", \"custId\" : \"11145458\", \"currencyCode\" : \"INR\", \"Duration\":\"12\",  \"acctOpenDate\" : \"2019-04-22T00:00:00.000\", \"acctStatus\" : \"Active\", \"jointHolderName1\" : \"James\", \"jointHolderName2\" : \"\", \"jointHolderName3\" : \"\", \"FreezeStatusCode\": \"\", \"PhoneNum\": \"9819975696\", \"TelephoneNum\" : \"\", \"FaxNum\" : \"\", \"EmailAddr\" : \"Rupam@ibl.com\" , \"Addr1\": \"MARINE DRIVE NR TAJ HOTEL\", \"Addr2\": \" ANDHERI (W)\", \"Addr3\" : \"\", \"City\" : \"Mumbai\", \"StateProv\" : \"Maharashtra\", \"PostalCode\" : \"400073\", \"Country\" : \"IN\" }"
                return response
            } else {
                response = "{\"status\":\"Fail\",\"\"Description\":\"Please Enter Correct Aadhar Number or Account Number \"}"
                return response
            }
        } else {
            response = "{\"status\":\"Fail\",\"\"Description\":\"Please Enter Correct Aadhar Number\"}";
            return response
        }
    }
    
}
