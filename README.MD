# Terraform to implement a Hub Network with firewall enabled
### Created by Andre Passos



#### This code will implement a Hub Network where you can do a peer within another Vnets to connect to onpremise network through Express Route implementation. *This code dont implement Express Route Circuit.

## To begin, you need the following informations and requisites, it will be in tfvars file:
1 - Express Route Circuit ID

2 - A CIDR, at least a /25 range for VNET Hub, example 10.0.0.0/25.

3 - A name for Resource Group and region you want create the connection.

4 - Permission access to Express Route to create a connection

5 - You can use this code to create an online module, you only need upload this code to a repository, exclude the folder modules and in main.tf file, in source, change to the url where modules are uploaded.

6 - Enjoy the journey!

 