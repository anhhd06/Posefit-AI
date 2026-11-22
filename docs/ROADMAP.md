Tuần 1: Dựng khung dự án & Web CRUD cơ bản
Mục tiêu: Xong phần xương sống Web + MySQL trong 7 ngày để yên tâm tập trung cho AI.
[ ] Ngày 1–2: Clone repo posefit, tạo venv, dựng cấu trúc thư mục, thiết kế và chạy database/schema.sql (4 bảng: users, exercises, workout_plans, workout_logs) trên MySQL Workbench.

[ ] Ngày 3–4: Dựng khung base.html bằng Bootstrap 5 CDN; làm Đăng ký (hash mật khẩu), Đăng nhập, Đăng xuất, Hồ sơ cá nhân (tính BMI).

[ ] Ngày 5–6: Làm CRUD Danh mục bài tập (có tìm kiếm/lọc) và CRUD Lập lịch tập theo ngày (chọn bài, đặt mục tiêu reps).

[ ] Ngày 7: Kiểm thử lại toàn bộ luồng CRUD với MySQL, đẩy code ổn định lên GitHub.

Tuần 2: Xây dựng & Huấn luyện mô hình AI (Độc lập với Web)
Mục tiêu: Có mô hình AI tự train chạy mượt trên cửa sổ OpenCV.

[ ] Ngày 8: Viết script test mở webcam + vẽ 33 điểm khung xương MediaPipe Pose.

[ ] Ngày 9–10: Thu thập video mẫu (tự quay nhanh + lấy thêm trên Kaggle) cho Squat & Bicep Curl (đúng tư thế + 1–2 lỗi sai). Chia sẵn thư mục Train/Test theo từng video để tránh Data Leakage.

[ ] Ngày 11: Viết script trích xuất landmarks, chuẩn hóa tọa độ theo hông/thân người + tính góc khớp $\rightarrow$ xuất dataset.csv.

[ ] Ngày 12: Train và so sánh Random Forest, SVM, MLP bằng Scikit-learn; lưu hình Confusion Matrix & bảng F1-score (để đưa vào báo cáo); xuất model tốt nhất ra file .pkl.

[ ] Ngày 13–14: Đóng gói class PoseAnalyzer (lọc mượt góc + State Machine đếm reps + cảnh báo lỗi). Test trực tiếp trên webcam và video .mp4. (Dư thời gian thì thêm Push-up).

Tuần 3: Tích hợp AI vào Web
Mục tiêu: Nối Tuần 1 và Tuần 2 thành một hệ thống hoàn chỉnh.

[ ] Ngày 15–16: Viết route MJPEG Streaming trong Flask truyền khung hình OpenCV lên giao diện phòng tập.

[ ] Ngày 17: Viết API trả về JSON trạng thái real-time (số reps, lỗi sai) + viết đoạn JavaScript (fetch / setInterval) cập nhật số liệu lên màn hình.

[ ] Ngày 18–19: Làm nút Bắt đầu / Kết thúc buổi tập $\rightarrow$ tự động lưu vào bảng workout_logs và cập nhật trạng thái Hoàn thành cho lịch tập hôm đó.

[ ] Ngày 20–21: Làm tính năng Upload video .mp4 để AI phân tích và chấm điểm (cực kỳ hữu ích khi đi bảo vệ).

Tuần 4: Thống kê, Hoàn thiện & Đóng gói bảo vệ
Mục tiêu: Sản phẩm đẹp, không crash, đủ tư liệu thuyết trình.

[ ] Ngày 22–23: Viết truy vấn SQL thống kê 7 ngày gần nhất + tích hợp Chart.js vẽ biểu đồ cột (tổng reps) và biểu đồ đường (tỷ lệ tập đúng) trên Dashboard.

[ ] Ngày 24: Xử lý các lỗi ngoại lệ (không có camera, không thấy người trong khung, sai định dạng file upload) và căn chỉnh lại giao diện cho gọn.

[ ] Ngày 25–26: Kiểm thử tổng thể (End-to-End); quay sẵn 2–3 video demo tập mẫu sắc nét làm phương án dự phòng.

[ ] Ngày 27–28: Hoàn thiện README.md, tổng hợp sơ đồ ERD, kiến trúc hệ thống và bảng thực nghiệm AI đưa vào báo cáo/slide.