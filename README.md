# Estate_SpringBoot_MVC

**Lập trình mạng**

**QUẢN LÝ NHÂN SỰ CỦA CÔNG TY BẤT ĐỘNG SẢN**

Xây dựng một ứng dụng web bằng JSP, SERVLET theo mô hình MVC **Hướng dẫn cài đặt** :

- Dowload và cài đặt Tomcat 8.5
- Dowload và cài đặt Maven 3.6.0
- Dowload và cài đặt Java 8
- Dowload và cài đặt Intellij
- Dowload MySQL 8.0.29

**Hướng dẫn thực thi chương trình :**

- Bước 1: Trước khi thực thi chương trình thì phải cài đặt tất cả các thư viện cần có trong file pom.xml

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.001.jpeg)

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.002.jpeg)

Spring boot version 1.5.22.RELEASE

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.003.jpeg)

Tomcat, JSTL for JSP

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.004.jpeg)

Apache POI

- Bước 2: Sau đó mở Terminal và chạy câu lệnh “mvn clean install -DskipTests” như trong hình:
- Bước 3: Vì bài này em sử dụng file war nên phải dụng Tomcat ngoài để run chương trình, do đó để run được cần phải add Tomcat ngoài vào như sau:
1. Bấm vào Edit Configurations như hình:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.005.jpeg)

2. Sau đó bấm vào dấu cộng như hình:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.006.jpeg)

3. Kéo xuống và chọn vào Tomcat Server -> Local

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.007.jpeg)

4. Chọn Configure như trên hình:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.008.jpeg)

5. Sau đó sẽ hiện ra hình ảnh sau:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.009.jpeg)

Trong đó:

+ Name: là mình tự đặt tên theo tên và version của Tomcat

mà mình cài đặt vào

+ Tomcat Home: Trỏ đến thư mục apache-tomcat mà ta đã

tải về

+ Tomcat base directory cũng vậy: Trỏ đến thư mục

apache-tomat mà ta đã tải về

6. Sau đó bấm OK như hình:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.010.jpeg)

7. Tiếp theo bấm vào Fix như hình:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.011.jpeg)

8. Sau khi bấm vào Fix sẽ hiện ra giao diện sau:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.012.jpeg)

Lưu ý chọn vào: war exploded như hình

9. Sau đó xóa dữ liệu ở dòng Application context:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.013.jpeg)

10. Sau khi xóa xong ta sẽ bấm vào lại mục Server như hình sau:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.014.jpeg)

11. Sau đó hãy để ý và điều chỉnh On ‘Update’ action : Update

classes and resource theo hình mẫu sau:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.015.jpeg)

12. Cuối cùng ta đã cấu hình hoàn chỉnh Tomcat với hình ảnh

sau:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.016.jpeg)

Sau đó bấm Apply -> OK để kết thúc quá trình cấu hình Tomcat

13. Đây là tất cả các file có trong project và được thiết kế theo mô

hình MVC:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.017.jpeg)

14. Có 2 cách để start chương trình đó là run và debug đều được

cả:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.018.jpeg)

Mũi tên bên trái: là dùng để run chương trình.

Mũi tên bên phải: cũng dùng để run chương trình nhưng có thêm

debug nữa.

- Trên đây là tất cả những gì cần làm trước khi start chương trình:
- Lưu ý:
- Trước khi chương trình chạy được thì phải tạo database

nữa nhé!

**Hướng dẫn tạo database :**

+ Tạo cơ sở dữ liệu có tên: bat\_dong\_san

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.019.png)

+ Sau khi tạo thì fix lại thông tin trong đoạn code sau theo đúng thông tin trên máy tình của mình:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.020.jpeg)

Lưu ý:

- Chỉ cần tạo cơ sở dữ liệu có tên là bat\_dong\_san, còn các table trong cở sở dữ liệu không cần tạo vì sao khi run chương trình thì các table đó sẽ tự động được tạo
- Còn nếu muốn tạo nhanh các table có sẵn dữ liệu để thực thi chương trình thì vào thư mục database -> batdongsan.sql rồi copy đưa qua MySQL để thực thi (đây là dữ liệu mà nhóm em đã explorer ra ạ):

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.021.jpeg)

**Hướng dẫn sử dụng chương trình**

Xây dựng ứng dụng cung cấp các chức năng của hệ thống như sau:

- 3.1 Cho phép liệt kê tất cả các tòa nhà

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.022.jpeg)

- 3.3 Cho phép tìm kiếm thông tin theo các tiêu chí của tòa nhà

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.023.jpeg)

- 3.4 Thêm tòa nhà

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.024.jpeg)

- 3.5 Cho phép cập nhật thông tin của tòa nhà

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.025.jpeg)

- 3.6 Xoá thông tin của tòa nhà

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.026.jpeg)

- 3.7. Giao tòa nhà cho nhân viên nào quản lý

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.027.jpeg)

- 3.8. Quản lý khách hàng

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.028.jpeg)

3\.9. Tìm kiếm khách hàng theo tiêu chí:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.029.jpeg)

3\.10: Thêm mới khách hàng:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.030.jpeg)

3\.11: Cập nhập thông tin khách hàng và xem lịch sử giao dịch giữa khách hàng với nhân viên:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.031.jpeg)

3\.12: Giao khách hàng cho nhân viên quản lý:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.032.jpeg)

3\.13: Xóa khách hàng:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.033.jpeg)

3\.14: Quản lý nhân viên

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.034.jpeg)

3\.15: Tìm kiếm nhân viên theo tiêu chí:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.035.jpeg)

3\.16: Thêm mới nhân viên:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.036.jpeg)

3\.17: Cập nhập lại thông tin của nhân viên:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.037.jpeg)

3\.18: Xóa nhân viên:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.038.jpeg)

3\.19: Xem thông tin của admin:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.039.jpeg)

3\.20: Đổi mật khẩu của admin:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.040.jpeg)

3\.21: Đăng xuất khỏi hệ thống

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.041.jpeg)

3\.22: Xuất kết quả tìm kiếm của tòa nhà ra file excel để dễ quản lý và theo dõi hơn: Ví dụ: tìm kiếm theo từ khóa “Đà Nẵng”

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.042.jpeg)

Hình ảnh kết quả trên giao diện là:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.043.jpeg)

Hình ảnh kết quả xuất file excel:

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.044.jpeg)

3\.23: Login

![](Aspose.Words.5ad7e112-a02c-400c-9614-89c75f420ebc.045.jpeg)

Lưu ý:

- Để sử dụng chương trình phải thực hiện đăng nhập vào hệ thống với:
+ Tên tài khoản: nguyenvana
+ Mật khẩu: 123456
- Như vậy nhóm em đã hoàn thành đầy đủ tất cả các yêu cầu của đề bài ạ.
