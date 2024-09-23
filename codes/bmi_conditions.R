# BMI calculation
height = 1.7  # m
weight = 64   # kg
bmi = weight / (height ^ 2)
print(bmi)


## Use if statements
if (bmi < 18.5){
  print("You are underweight!")
}
if (bmi > 18.5){
  print("You are overweight!")
}
if ((bmi >= 18.5) & (bmi < 25)){
  print("You are normal!")
}

## Use if-else
if (bmi < 18.5){
  print("You are underweight!")
}else{
  print("You are overweight!")
}
  
## Use if-else-if 
if (bmi > 18.5){
  print("You are uderweight!")
}else if ((bmi >= 18.5) & (bmi < 25)){
  print("You are normal!")
}else{
  print("You are overweight!")
}
