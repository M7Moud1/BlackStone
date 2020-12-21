
func fibonacci1(number : Int) -> Int {
    
    if number <= 1 {
        
        return number
    } else {
        
        return fibonacci1(number: number - 1) + fibonacci1(number: number - 2)
    }
}


print(fibonacci1(number: 9))

func fibonacci2(number : Int) -> Int {
    
    var fibArr = [Int]()
    
    fibArr.append(0)
    fibArr.append(1)
    
    for i in 2...number {
        print(i)
        fibArr.append((fibArr[i-1] + fibArr[i-2]))
    }
    
    return fibArr[number]
}

print(fibonacci2(number: 9))
