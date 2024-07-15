import 'package:flutter/material.dart';
import 'package:pharma_app/components/text_component.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,),
        body: Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(children: [
        Center(
          child: TextComponent(
            text: 'VỀ PHARMA TOWN',
            isTitle: true,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextComponent(text: 'Chuỗi nhà thuốc uy tín hàng đầu Việt Nam', weight: FontWeight.bold,size: 25,),
        const SizedBox(
          height: 15,
        ),
        TextComponent(
          text:
              'Với hơn 12 năm hoạt động, Pharmacity tự hào là người bạn đồng hành tin cậy của hàng triệu người dân Việt Nam trên hành trình nâng cao chất lượng sức khỏe. Hệ thống gần 1000 nhà thuốc đạt chuẩn GPP trên toàn quốc trải dài 40 tỉnh thành, cùng đội ngũ gần 5000 Dược sĩ, Pharmacity mang đến dịch vụ chăm sóc sức khỏe tận tâm và trải nghiệm mua sắm tiện lợi cho mọi khách hàng.',
          maxLines: 10,
        ),
        const SizedBox(
          height: 30,
        ),
        TextComponent(text: 'Sản phẩm chính hãng, giá tốt', weight: FontWeight.bold,size: 25,),
        const SizedBox(
          height: 15,
        ),
        TextComponent(
          maxLines: 22,
            text:
                ' Pharmacity cam kết cung cấp sản phẩm chính hãng, đa dạng từ thuốc cho các nhóm bệnh: Tiểu Đường, Huyết Áp, Mỡ Máu, Tiêu Hóa, Hô Hấp,… đến thực phẩm chức năng, sản phẩm chăm sóc sức khỏe, sắc đẹp, thiết bị y tế thuộc các thương hiệu hàng đầu thế giới như: Abbott, GSK, Sanofi, Astrazeneca, Pfizer, Mega Lifesciences, Goodlife, L’oreal, Durex,… và các thương hiệu uy tín tại Việt Nam như Dược Hậu Giang, Nam Hà,… Bên cạnh đó, chúng tôi luôn chú trọng bảo quản sản phẩm trong điều kiện tốt nhất, đảm bảo chất lượng đến tay người tiêu dùng.'),
        const SizedBox(
          height: 30,
        ),
        TextComponent(text: 'Dược sĩ tận tâm, tư vấn chuyên nghiệp',weight: FontWeight.bold,size: 25,),
        const SizedBox(
          height: 15,
        ),
        TextComponent(
          maxLines: 22,
            text:
                'Đội ngũ Dược sĩ Pharmacity được đào tạo bài bản, có chuyên môn cao và giàu kinh nghiệm. Luôn đặt lợi ích khách hàng lên hàng đầu, sẵn sàng tư vấn, giải đáp thắc mắc và hướng dẫn sử dụng sản phẩm hiệu quả, an toàn.'),
        const SizedBox(
          height: 30,
        ),
        TextComponent(text: 'Mua sắm tiện lợi, giao hàng nhanh chóng',weight: FontWeight.bold,size: 25,),
        const SizedBox(
          height: 15,
        ),
        TextComponent(
          maxLines: 22,
            text:
                'Thấu hiểu nhu cầu đa dạng của khách hàng, Pharmacity mang đến hệ thống mua sắm đa kênh vô cùng tiện lợi:'),
        TextComponent(
            text:
                '   - Mua trực tiếp tại nhà thuốc: Hệ thống gần 1000 nhà thuốc Pharmacity trải dài 40 tỉnh thành.'),
        TextComponent(
            text:'   - Mua hàng trực tuyến: Truy cập ứng dụng Pharmacity.'),
        TextComponent(
            text:
                '   - Giao hàng siêu tốc: Giao hàng nhanh chóng trong vòng 2 giờ tại các thành phố lớn.'),
        TextComponent(
            text:
                '   - Hợp tác với đối tác lớn, uy tín: Grab, Shopee, Lazada, Tiki…'),
                const SizedBox(
          height: 30,
        ),
        TextComponent(text: 'Chính sách ưu đãi dành cho khách hàng thân thiết',weight: FontWeight.bold,size: 25,),
        const SizedBox(
          height: 15,
        ),
        TextComponent(
            text:
                'Pharmacity triển khai chương trình P-Thành Viên hấp dẫn. Mỗi giao dịch mua sắm, khách hàng đều được tích điểm và có thể sử dụng điểm để trừ tiền cho các lần mua sau. Ngoài ra, Pharmacity luôn có các chương trình khuyến mãi, ưu đãi dành riêng cho khách hàng thân thiết.'),
        TextComponent(
            text:
                'Lựa chọn Pharmacity,  lựa chọn an tâm cho sức khỏe bản thân và gia đình!'),
      ]),
    ));
  }
}
