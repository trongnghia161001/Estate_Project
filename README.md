# Estate_SpringBoot_MVC

REAL ESTATE COMPANY MANAGEMENT

To build a web application using JSP and Servlet in the MVC model, follow these installation instructions:

1. Download and install Tomcat 8.5.
2. Download and install Maven 3.6.0.
3. Download and install Java 8.
4. Download and install IntelliJ.
5. Download MySQL 8.0.29.

Execution instructions:

Step 1: Before running the program, make sure to install all the required libraries in the pom.xml file.

- Spring Boot version 1.5.22.RELEASE
- Tomcat and JSTL for JSP
- Apache POI
![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.001.jpeg)

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.002.jpeg)

Step 2: Open the Terminal and run the command "mvn clean install -DskipTests" as shown in the image.

Step 3: Since this project uses a WAR file, an external Tomcat server is required to run the program. To add an external Tomcat server, follow these steps:

- Click on Edit Configurations.
- Click on the plus icon.
- Scroll down and select Tomcat Server -> Local.
- Configure it as shown in the image:
   - Name: Set a name for the Tomcat server.
   - Tomcat Home: Specify the path to the downloaded Apache Tomcat directory.
   - Tomcat base directory: Specify the path to the downloaded Apache Tomcat directory.
- Click OK.

Next, click on Fix, and a dialog box will appear. Choose "war exploded" as shown in the image.

Remove the application context data from the Application context field.

After removing the data, click on the Server tab and adjust the "On 'Update' action" to "Update classes and resource" as shown in the image.

Finally, click Apply -> OK to finish configuring Tomcat.

The project contains all the necessary files designed according to the MVC model.

There are two ways to start the program: run and debug.

- Left arrow: Used to run the program.
- Right arrow: Used to run the program with debugging.

Please note that before the program can run successfully, you need to create a database.

Instructions for creating a database:

Create a database named "bat_dong_san".

After creating the database, update the following code snippet with the correct information on your machine:

Note:
Only create a database named "bat_dong_san." The tables in the database don't need to be created manually because they will be automatically generated when running the program.
If you want to quickly create tables with pre-existing data to execute the program, go to the database folder -> batdongsan.sql and execute it in MySQL (this is the data our team has explored).

Program usage instructions:

Build the application to provide the following system functions:

3.1 List all buildings.

3.2 View building details.

3.3 Search for building information based on criteria.

3.4 Add a new building.

3.5 Update building information.

3.6 Delete building information.

3.7 Assign a building to a specific employee.

3.8 Manage customers.

3.9 Search for customers based on criteria.

3.10 Add a new customer.

3.11 Update customer information and view transaction history between the customer and employees.

3.12 Assign a customer to a specific employee.

3.13 Delete a customer.

3.14 Manage employees.

3.15 Search for employees based on criteria.

3.16 Add a new employee.

3.17 Update employee information.

3.18 Delete an employee.

3.19 View admin information.

3.20 Change admin password.

3.21 Log out of the system.

3.22 Export search results for buildings to an Excel file for easier management and tracking. For example, search using the keyword "Đà Nẵng

".

Image of the search results on the interface:

Image of the exported Excel file results:

3.23 Login.


Note:
To use the program, you need to log in to the system with the following credentials:
Username: nguyenvana
Password: 123456
With that, our team has completed all the requirements of the assignment.
