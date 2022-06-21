# Imputation operator

##### Description

The `impute` operator imputes missing data.

##### Usage

Input projection|.
---|---
`y-axis`        | is the input data to be imputed, per cell 

Input parameters|.
---|---
`method`      | factor, imputation method (either constant, mean_per_row, or mean_per_column)
`value`       | numeric, value used for contant imputation

Output relations|.
---|---
`imputed`        | numeric, imputed data

##### Details

The operator takes all the values of a cell and replaces the NA using the 
specified imputation method. The imputation is done per cell.
