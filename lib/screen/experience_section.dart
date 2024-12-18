import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  final List<Map<String, String>> experiences = [
    {
      'title': 'HealthCare',
      'company': 'Developer',
      'duration': '10-2024',
      'experience':
          'Trong thời gian làm việc tại dự án HealthCare, tôi đã tham gia vào việc phát triển và triển khai một hệ thống quản lý thông tin y tế điện tử cho một bệnh viện lớn. Vai trò của tôi chủ yếu là phân tích yêu cầu và thiết kế giao diện người dùng, nhằm đảm bảo rằng hệ thống đáp ứng nhu cầu của nhân viên y tế cũng như bệnh nhân. Một số điểm nổi bật:\n=> Phân tích yêu cầu: Tôi đã tiến hành khảo sát và phỏng vấn các bác sĩ, y tá, và nhân viên hành chính để hiểu rõ các nhu cầu và thách thức hiện tại trong việc quản lý hồ sơ bệnh án.\n=> Thiết kế giao diện: Dựa trên thông tin thu thập được, tôi đã thiết kế các nguyên mẫu giao diện người dùng thân thiện, với mục tiêu cải thiện trải nghiệm người dùng và giảm thời gian truy cập thông tin.\n=> Làm việc nhóm: Tôi đã cộng tác chặt chẽ với các lập trình viên và chuyên gia y tế, đảm bảo tính khả thi và tính chính xác của các chức năng trong hệ thống.\n=> Kiểm thử và đánh giá: Sau khi triển khai, tôi đã tham gia vào quá trình kiểm thử hệ thống để phát hiện lỗi và thu thập phản hồi từ người dùng, giúp chỉnh sửa và cải thiện ứng dụng trước khi ra mắt chính thức.Dự án đã đạt được nhiều kết quả tích cực, bao gồm việc giảm thời gian xử lý dữ liệu y tế và nâng cao hiệu quả trong việc phục vụ bệnh nhân.\nKinh nghiệm này đã giúp tôi củng cố kỹ năng phân tích, làm việc nhóm và khả năng giải quyết vấn đề trong môi trường khắc nghiệt của ngành Healthcare.',
    },
    {
      'title': 'PingMe',
      'company': 'Developer',
      'duration': '12-2024',
      'experience':
          'Trong dự án phát triển ứng dụng nhắn tin real-time PingMe, tôi đảm nhận vai trò kỹ sư phát triển phần mềm, tập trung vào việc thiết kế và triển khai các tính năng chính của ứng dụng. PingMe được xây dựng để cung cấp trải nghiệm nhắn tin nhanh chóng, bảo mật và dễ sử dụng cho người dùng.Một số điểm nổi bật trong dự án.\n=> Thiết kế kiến trúc: Tôi đã tham gia vào việc thiết kế kiến trúc ứng dụng, sử dụng công nghệ WebSocket để đảm bảo khả năng gửi và nhận tin nhắn trong thời gian thực, giúp người dùng có thể trò chuyện một cách liền mạch mà không gặp phải độ trễ.\n=> Phát triển tính năng: Tôi đã phát triển nhiều tính năng quan trọng như chat nhóm, gửi hình ảnh và video, cũng như thông báo đẩy để người dùng không bỏ lỡ tin nhắn quan trọng. Việc tích hợp API cho các dịch vụ bên ngoài cũng được thực hiện để nâng cao trải nghiệm người dùng.\n=> Bảo mật thông tin: An toàn và bảo mật thông tin là ưu tiên hàng đầu. Tôi đã áp dụng các biện pháp mã hóa dữ liệu và xác thực người dùng để đảm bảo rằng thông tin cá nhân của người dùng được bảo vệ.Kiểm thử và tối ưu hóa: Tôi đã thực hiện kiểm thử chức năng và hiệu suất của ứng dụng, đảm bảo rằng PingMe có thể hoạt động ổn định ngay cả khi có lượng người dùng lớn. Qua đó, tôi đã tối ưu hóa mã nguồn và cải thiện tốc độ tải ứng dụng.\n=> Phản hồi từ người dùng: Sau khi ra mắt, tôi đã thu thập phản hồi từ người dùng để cải thiện các tính năng và giao diện. Những thay đổi này đã giúp tăng cường sự hài lòng của người dùng và thu hút thêm nhiều người tham gia.\nDự án PingMe không chỉ giúp tôi nâng cao kỹ năng lập trình mà còn giúp tôi hiểu rõ hơn về quy trình phát triển ứng dụng và tầm quan trọng của việc lắng nghe phản hồi từ người dùng. Kinh nghiệm này đã trang bị cho tôi những kiến thức quý giá để phát triển các sản phẩm công nghệ trong tương lai.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Nền gradient
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade800, Colors.purple.shade700],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thanh tiêu đề
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context); // Quay lại màn hình trước đó
                      },
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Experience Section',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: experiences.length,
                  itemBuilder: (context, index) {
                    final experience = experiences[index];
                    return GestureDetector(
                      onTap: () {
                        _showExperienceDetails(context, experience);
                      },
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(16),
                          leading: Icon(Icons.work,
                              color: Colors.blueAccent, size: 30),
                          title: Text(
                            experience['title']!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          subtitle: Text(
                            '${experience['company']} • ${experience['duration']}',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          trailing:
                              Icon(Icons.arrow_forward_ios, color: Colors.grey),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hiển thị chi tiết kinh nghiệm
  void _showExperienceDetails(
      BuildContext context, Map<String, String> experience) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          title: Text(experience['title']!,
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: Text(
              'Company: ${experience['company']}\nDuration: ${experience['duration']}\nExperience :${experience['experience']}'),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
