# impute operator

##### Description

`impute` operator replaces NA with zero.

##### Usage

Input projection|.
---|---
`y-axis`        | is the input data for the imputation, per cell 

Input parameters|.
---|---
`value`        | numeric, value used for the imputation, default is 0


Output relations|.
---|---
`impute`        | numeric, a copy of the input data with NA replaces with zeros 

##### Details

The operator takes all the values of a cell and replaces the NA with zero. The imputation is done per cell. There is one value calculated and returned for each of the input cell.
