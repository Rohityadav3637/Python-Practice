# creating class
class student:
    name = Rohit
    
# creating object(instance of class)
s1 = student()
print(s1.name) # it will print name of student 
    
#consturture:- All class have a function called __init__(), which is always executed when the object is being initiated    

# 1. __init__ function

class student:
    def __init__ (self,name):
        print("Adding new student database.")
s1= student("Rohit")
print(s1.name)  
s2= student("Siddharth")
print(s2.name)

#Another Example
class student:
   #default constructors 
    def __init__ (self):
        pass
   #parameterized constructors
    def __init__ (self,name,marks):
        print("Adding new student database.")
s1= student("Rohit",70)
print(s1.name)  
s2= student("Siddharth",65)
print(s2.name) 
    
# instance attributes  

class student :
    collage_name = "lovely professional univerty"
    name = "B.tech" #class Attribute
    
    def __init__ (self,name,marks):
        self.name = name #object attribute (object attibute>class attibutr )
        self.marks = marks

s1= student("Rohit",70)
print(s1.name)

# Pactice Question:- Create student class that takes name & marks of 3 subjects as arguments in constructor.Then create a method to print the average.
class student:
    def __init__(self,name,marks):
        self.name = name
        self.mark = marks
        
    def get_avg(self ):
        sum=0
        for i in self.mark:
            sum = sum + i
        print("hi", self.name, "Your avg score is", sum/3)
s1 = student("Siddharth" [99,98,97])   
s1.get_avg()

#static mehthod:- this method that don't use self parameter (work at class level)              
class MathOperations:
    @staticmethod
    def add(x, y):
        return x + y
    
    @staticmethod
    def multiply(x, y):
        return x * y

# Using static methods
print(MathOperations.add(5, 3))       # Output: 8
print(MathOperations.multiply(4, 6))   # Output: 24

#Abstracting:- Hiding the implementation detail of class and showing the essential features to the user.
class Car:
    def __init__(self):
        self.acc = False
        self.brk = False
        self.clutch = False
    
    def start(self):
        self.acc = True
        self.brk = False
        self.clutch = True
        print("Car started.")
car1 = car() 
car1.start()           

#Encapsulation:-Wrapping data and Functions into a single unit (object).
class Account:
    def __init__(self, bal, acc):
        self.balance = bal
        self.account_no = acc
    #debit mehtod    
    def debit(self, amount):
        self.balance =- amount
        print("Rs.", amount, "was debited")    
    def credit(self,amount):
        self.balance =- amount
        print("Rs.", amount, "was debited") 
    def get_balance(self):
        return self.balance
        
acc1 = Account(10000, 12345)
acc1.debit(1000)
acc1.credit(500)
print(acc1.balance)
print(acc1.account_no)  
         