

func checkAnagrams(str1 : String , str2 : String  ) -> Bool {
    
    if str1.count != str2.count {
        
        return false
    } else {
        
        
        let SortedStr1 = str1.sorted()
        let SortedStr2 = str2.sorted()
        
        if SortedStr1 == SortedStr2 {
            
            return true
            
        } else {
            
            return false
        }
    }
    
}

if checkAnagrams(str1: "debit card", str2: "bad credit") {
    
    print("Are angrams")
} else {
    
    print("Aren't angrams")
}
