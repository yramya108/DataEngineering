from typing import Counter, List


class Solution:
    target = 9
    nums = [2,7,11,15]
    #twoSum(1, nums, target)
    str = "abc"
    print(str[::-1])
    
    numMap = {}
    n = len(nums)
    
    for i in range(n):
        numMap[nums[i]]=i
    print(numMap[7])
    for i in range(n):
        complement = target - nums[i]
        if complement in numMap and numMap[complement] != i:
            print( [i, numMap[complement]])
    
    
    def palindrome(x: int):
        if x < 0: 
            return False
        newNum = 0
        inputNum = x
        while(x>0):
            newNum = newNum * 10 + x%10
            x = x//10
        return newNum == inputNum  
n = 121
print(Solution.palindrome(n))
if(n<0):
    print( False)
print (str(n) == str(n)[::-1])
 
# Remove duplicated from sorted list
nums = [0,0,1,1,1,2,2,3,3,4]
print(set(nums))
sortedSet= set()
for i in range(len(nums)):
    sortedSet.add(nums[i])
print(sortedSet)

# Length of last word
str = "   fly me   to   the moon  "
lst = str.strip().split()
print(lst[-1] + " : "+ repr(len(lst[-1])))

# find the first occurance of the string
str = "leetcode"
input = "leet"
for i in range(len(str) - len(input)+1):
    if str[i : len(input)] == input:
        print(i)

list1 = [0,8,1,4,11]
list2 = [99,22,44,11]
list1.extend(list2)
print(list1) # if i give list1.sort() it is not printing sorted list 

c = Counter(p=4, q=2, r=1, s=-1)
c = Counter(s=6)
print(list(c.elements())) 
    
s = 'lkseropewdssafsdfafkpwe'
print("Original string: " + s)
print(Counter(s).most_common(5))
