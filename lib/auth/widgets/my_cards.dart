import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:getwidget/getwidget.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MyAwesomeCard extends StatelessWidget {
  const MyAwesomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GFCard(
        boxFit: BoxFit.cover,
        image: Image.network(
          'assets/images/login.png',
          fit: BoxFit.cover,
        ),
        title: GFListTile(
          avatar: Icon(Icons.favorite, color: Colors.red),
          titleText: 'عنوان الكارد',
          subTitleText: 'وصف قصير وجذاب',
        ),
        content: Text(
          "محتوى إضافي للكارد لو أردت.",
          style: TextStyle(color: Colors.grey),
        ),
        buttonBar: GFButtonBar(
          children: <Widget>[
            GFButton(
              onPressed: () {},
              text: 'تفاصيل',
              type: GFButtonType.solid,
            ),
            GFButton(
              onPressed: () {},
              text: 'مشاركة',
              type: GFButtonType.outline,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GFCard(
      boxFit: BoxFit.cover,
      image: Image.asset(
        'assets/images/login.png',
        fit: BoxFit.cover,
      ),
      title: GFListTile(
        titleText: 'رحلة ساحرة',
        subTitleText: 'اكتشف أماكن جديدة',
      ),
      content: Text("مغامرة لا تنسى بانتظارك."),
      buttonBar: GFButtonBar(
        children: <Widget>[
          GFButton(onPressed: () {}, text: 'انطلق'),
        ],
      ),
    );
  }
}

class ShadowCard extends StatelessWidget {
  const ShadowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(Icons.lightbulb_outline, color: Colors.amber),
        title: Text("أفكار مبتكرة"),
        subtitle: Text("حلول ذكية لمشاكلك اليومية."),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class AnimatedCard extends StatelessWidget {
  const AnimatedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      child: ListTile(
        leading: Icon(Icons.star, color: Colors.deepPurple),
        title: Text("تميز دائم"),
        subtitle: Text("كن أنت النجم الساطع."),
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3);
  }
}

class ModernCard extends StatelessWidget {
  const ModernCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.blueGrey.shade50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('مشروع جديد',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('ابدأ رحلتك في بناء شيء عظيم اليوم.'),
          ],
        ),
      ),
    );
  }
}

class GlassCard extends StatelessWidget {
  const GlassCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 300,
      height: 180,
      borderRadius: 20,
      blur: 15,
      alignment: Alignment.center,
      border: 2,
      linearGradient: LinearGradient(
        colors: [Colors.white, Colors.white38],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderGradient: LinearGradient(
        colors: [
          Colors.white24,
          Colors.white10,
        ],
      ),
      child: Center(
        child: Text(
          "بطاقة زجاجية",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CharacterCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final double rating;

  const CharacterCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFd4af37), Color(0xFFb8860b)], // ذهبي متدرج
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.6),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(18)),
              child: Image.asset(
                imageUrl,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.85),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(18)),
              ),
              child: Column(
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cinzel', // خط يعطي إحساس ملكي
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(5, (index) {
                        return Icon(
                          index < rating.floor()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 20,
                        );
                      }),
                      const SizedBox(width: 8),
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CharacterCard2 extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;

  const CharacterCard2({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amber, width: 3),
        gradient: const LinearGradient(
          colors: [Colors.black87, Colors.black54],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.6),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(17)),
            child: Image.asset(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.7),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(17)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cinzel', // خط يعطي إحساس بالبطاقات
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
