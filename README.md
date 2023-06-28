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

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 001](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/189f3867-a380-406a-85fc-eddbd7a49665)

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 002](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/f74f9fe1-d6c8-43b4-8067-91a3ccf23766)

- Spring Boot version 1.5.22.RELEASE

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 003](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/268a7b27-13ed-42bd-80fb-f901ed0a11f3)

- Tomcat and JSTL for JSP

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 004](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/2d991d7a-e7b2-4809-8b6e-6d2b15195195)

- Apache POI
Step 2: Open the Terminal and run the command "mvn clean install -DskipTests".
Step 3: Since this project uses a WAR file, an external Tomcat server is required to run the program. To add an external Tomcat server, follow these steps:
- Click on Edit Configurations.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 005](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/732a8dcd-1a93-43d3-be5d-36502f6e52b5)

- Click on the plus icon.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 006](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/5e7ad2bc-afba-4db3-9d94-6dae7d433a74)

- Scroll down and select Tomcat Server -> Local.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 007](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/94d087db-af5f-4d0c-b270-4fb710080c13)

- Configure it as shown in the image:

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 008](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/ab97c4cf-2058-4c2f-beb8-44b1ce0767e7)

- Then the following image will appear:

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 009](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/60fbb64a-f6e1-4d56-9af9-c2f1effcc176)

   - Name: Set a name for the Tomcat server.
   - Tomcat Home: Specify the path to the downloaded Apache Tomcat directory.
   - Tomcat base directory: Specify the path to the downloaded Apache Tomcat directory.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 010](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/eeb61aad-1510-4e76-ac05-df724b1df0c6)

- Click OK.
Next, click on Fix, and a dialog box will appear.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 011](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/1374aca6-7041-4955-9bed-894f708f328b)

Choose "war exploded" as shown in the image.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 012](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/3b3618c3-e858-43ab-82d4-7a22b6488cda)

Remove the application context data from the Application context field.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 013](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/b0fc8e6a-2db1-4abb-873d-c86df24606bd)

After removing the data, click on the Server

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 014](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/58cb6fc8-455f-419d-bfcb-68ed76d0108b)

Tab and adjust the "On 'Update' action" to "Update classes and resource" as shown in the image.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 015](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/c1a1241b-233a-4f4b-a3b1-d2aedf755356)

Finally, click Apply -> OK to finish configuring Tomcat.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 016](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/5c037ef3-fcfe-4b7d-bb78-95684bae5351)

The project contains all the necessary files designed according to the MVC model.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 017](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/89d7418b-fb37-4fc6-88ca-e68544c07244)

There are two ways to start the program: run and debug.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 018](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/9ff3ed3f-f6f3-4fee-9e02-c88e729cec5b)

- Left arrow: Used to run the program.
- Right arrow: Used to run the program with debugging.

Please note that before the program can run successfully, you need to create a database.

Instructions for creating a database:

Create a database named "bat_dong_san".

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 019](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/4537115f-4c46-427d-aa3e-a481e4bfc506)

After creating the database, update the following code snippet with the correct information on your machine:

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 020](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/c4ca9e22-3ec8-41c7-b8dd-271f98fae78b)

Note:
Only create a database named "bat_dong_san." The tables in the database don't need to be created manually because they will be automatically generated when running the program.
If you want to quickly create tables with pre-existing data to execute the program, go to the database folder -> batdongsan.sql and execute it in MySQL (this is the data our team has explored).

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 021](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/d658e2e9-f5a3-4340-b2b3-e1bc72f8f551)

Program usage instructions:
Build the application to provide the following system functions:

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 022](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/1fd5767f-cf40-48ab-96bf-085cf202d878)

3.1 List all buildings.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 023](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/1a119b88-e227-4b02-9a8b-7c89659d3795)

3.3 Search for building information based on criteria.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 024](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/fb44439e-2fed-4b25-830a-26048d8f2806)

3.4 Add a new building.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 025](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/6e462d68-f08b-4308-ac52-2e5d5c7ca43c)

3.5 Update building information.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 026](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/26c9cbe5-f0ba-4e31-ae66-4294b3680aae)

3.6 Delete building information.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 027](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/98a1b711-f1ae-4182-b5fb-e08e13ccfa3a)

3.7 Assign a building to a specific employee.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 028](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/7fd058ea-670e-4e11-8273-f2b6f6fe0d0b)

3.8 Manage customers.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 029](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/6f800fcb-4707-4292-925c-11ed501fce62)

3.9 Search for customers based on criteria.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 030](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/4c02a232-5178-4365-a62e-26059db47f34)

3.10 Add a new customer.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 031](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/96c667d5-a73d-4091-8324-e34d2b9c5e4f)

3.11 Update customer information and view transaction history between the customer and employees.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 032](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/0795e9ae-f77b-4905-aac0-e13ae809be81)

3.12 Assign a customer to a specific employee.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 033](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/09ffe941-04da-418c-8545-7497198574ca)

3.13 Delete a customer.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 034](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/5215349c-179a-428e-8b95-b0bd7d7c46b6)

3.14 Manage employees.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 035](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/12abcb29-096a-42bc-8e3f-9a75b39484c1)

3.15 Search for employees based on criteria.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 036](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/6dbbe522-5494-44a7-ac5a-1169efb978a4)

3.16 Add a new employee.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 037](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/c5d51a8e-ce4b-487b-b98f-ea6ea4f1a674)

3.17 Update employee information.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 038](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/f92458ea-f201-4af0-9065-98dca12f355a)

3.18 Delete an employee.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 039](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/78863931-9b09-4dfc-be7d-d1c290eb69b3)

3.19 View admin information.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 040](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/8f9341fb-efc9-4a3f-a7f5-5491b554e87f)

3.20 Change admin password.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 041](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/587cfc2c-e31b-4b1a-bffe-436329a949a2)

3.21 Log out of the system.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 042](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/d1949183-ad89-4989-8ad7-fba0f7d7c75e)

3.22 Export search results for buildings to an Excel file for easier management and tracking. For example, search using the keyword "Đà Nẵng".

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 042](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/855c3954-1179-4fa7-a371-688c8e86152c)

Image of the search results on the interface:

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 043](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/6b74edd7-67b2-4afc-80cb-499583a436de)

Image of the exported Excel file results:

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 044](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/062e8a02-0088-463d-836f-503e222db989)

3.23 Login.

![Aspose Words 5ad7e112-a02c-400c-9614-89c75f420ebc 045](https://github.com/trongnghia161001/Estate_SpringBoot_MVC/assets/75027006/f2b7c779-6b5a-4b9f-a90c-42f70521bf51)

Note:
To use the program, you need to log in to the system with the following credentials:
Username: nguyenvana
Password: 123456
With that, our team has completed all the requirements of the assignment.
