#Print Function
n = "Rohit Yadav"
print(n)

#Data Type:-

# Integer: A whole number, positive or negative, without any fractional part.
num_int = 18
print(type(num_int))

# Float: A number with a decimal point, representing a fractional or floating-point value.
num_float = 23.45
print(type(num_float))

# Boolean: A logical data type that can have one of two values: True or False.
bool_true = True
bool_false = False
print(type(bool_true))
print(type(bool_false))

# String: A sequence of characters enclosed in single quotes ('') or double quotes ("").
string_example = "Hello, Python"
print(type(string_example))

# List: An ordered collection of items, which can be of different data types. Lists are mutable (can be modified).
list_example = [1, 2, 3, "Banana", True]
print(type(list_example))

# Tuple: An ordered collection of items, similar to a list, but immutable (cannot be modified after creation).
tuple_example = (4, 5, 6, "Mango", False)
print(type(tuple_example))

# Set: An unordered collection of unique elements. Sets are mutable, and the elements are unordered and unique.
set_example = {1,9,8 ,"Yadav"}
print(type(set_example))

# Dictionary: An unordered collection of key-value pairs. Dictionaries are mutable, and the keys must be unique.

dict_example = {"name": "Rohit", "age": 20, "is_student": True}
print(type(dict_example))  

# loops:

# for loop:

# Iterate over a list of numbers
numbers = [1, 2, 3, 4, 5]

# For loop
for num in numbers:
    print(num)
    
# while loop:
counter = 0

# While loop condition
counter = 0
while counter < 5:
    print(f"Counter value: {counter}")
    
    counter += 1    
    
#if - else statement:
# Take user input
num = float(input("Enter a number: "))

if num > 0:
    print(f"{num} is a positive number.")
elif num < 0:
    print(f"{num} is a negative number.")
else:
    print(f"{num} is zero.")
    
# Lambda Function
#These functions are useful for short, single-expression operations, often used within other functions or as arguments themselves.

numbers = [1, 2, 3, 4, 5]
# Using a regular function
def square(x):
    return x ** 2

squared_numbers = list(map(square, numbers))
print("Using a regular function:", squared_numbers)

# Using a lambda function
squared_numbers_lambda = list(map(lambda x: x ** 2, numbers))
print("Using a lambda function:", squared_numbers_lambda) 
     