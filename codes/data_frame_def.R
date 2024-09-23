# Make a data frame

data = data.frame(
  patient_id = 101:105,
  age = c(12, 15, 20, 40, 10),
  gender = c("m", "m", "f", "f", "f")
)

data

colnames(data)
rownames(data)

data[1,1]
data[1,]

# call a col.
data[,2]
data[,"age"]
data$age


# add a new col.
data$smoker = c("y", "n", "y", "n", NA)

# query
data$gender == "f"
data_f = data[data$gender == "f" , ]

data_f_age = data[data$age >= 20 | data$gender == "f", "smoker"]























