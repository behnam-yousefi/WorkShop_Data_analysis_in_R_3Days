## Read SLE data
rm(list = ls())
setwd("/Users/behnam/Desktop/R_Root/Teaching")
data = readRDS("Data/GSE49454_data.RDS")

X = t(data[["expr"]])
pheno = data[["pheno"]]

X_sle = X[pheno$disease == "SLE",]

dim(X)
dim(X_sle)

x_sle_gapdh =  X[pheno$disease == "SLE", "GAPDH"]
x_h_gapdh =  X[pheno$disease == "Healthy", "GAPDH"]

# x_sle_for2genes =  X[pheno$disease == "SLE", c("GAPDH", "IPO13")]

boxplot(x_sle_gapdh, x_h_gapdh)

p_val = t.test(x_sle_gapdh, x_h_gapdh)$p.value
p_val

# p_val = wilcox.test(x_sle_gapdh, x_h_gapdh)$p.value

## for loop
# for (i in 1:10){
#   print(i)
# }

gene_names = colnames(X)
length(gene_names)

p_val_all = c()
for (gene in gene_names){
  x_sle_gene_i =  X[pheno$disease == "SLE", gene]
  x_h_gene_i =  X[pheno$disease == "Healthy", gene]
  p_val = t.test(x_sle_gene_i, x_h_gene_i)$p.value
  p_val_all = c(p_val_all, p_val)
}

p_val_all[1:10]
hist(p_val_all)

# best gene
min(p_val_all)
which.min(p_val_all)
gene_names[which.min(p_val_all)]

# top 10-genes
top_10_indices = order(p_val_all, decreasing = FALSE)[1:10]
gene_names[top_10_indices]

# find the genes with p-val < 0.05
sig_genes = gene_names[p_val_all < 0.05]
length(sig_genes)

q_val_all = p.adjust(p_val_all, method = "BH")
sig_genes = gene_names[q_val_all < 0.05]
length(sig_genes)


## Fisher's exact test
# check for na
pheno_disease_gender = pheno[ , c("disease" , "gender") ]
tab = table(pheno_disease_gender)
tab
fisher.test(tab)$p.value

tab_prob = prop.table(tab)
tab_prob
barplot(tab_prob)

# correlation
x_gapdh =  X[, "GAPDH"]
x_loc64 =  X[, "LOC643334"]
plot(x_gapdh, x_mt2a, pch = 19)

cor(x_gapdh, x_mt2a)
cor.test(x_gapdh, x_mt2a)$p.value

# PCA
PCA = prcomp(X)
Q = PCA$rotation     # Eigen-vectorS. each col. corresrponds to a q
Lambda = PCA$sdev    # Eigen-valueS
plot(Lambda, pch = 19)

PC = PCA$x

color = rep("red", 177)
color[pheno$disease == "Healthy"] = "green"
plot(PC[,1], PC[,2], pch = 20, col = color)


# k-means
PC_20 = PC[,1:20]
dim(PC_20)
clusters = kmeans(PC_20, 3)$cluster
plot(PC[,1], PC[,2], pch = 20, col = clusters)

# Hclust



































