after creating the main.tf and variables.tf file excute the below commands.
terrform init
terraform plan
terraform apply


Note: In our real time project we use state.tf file which will restrict the recreation of instance as it is already created with same values.
state.tf is the heart and brain of the terrform.
