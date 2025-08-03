import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:litter_athkar/model/azkhar_model.dart';
import 'package:litter_athkar/screens/azkar_details_screen.dart';

class RembScreen extends StatefulWidget {
  const RembScreen({super.key});

  @override
  State<RembScreen> createState() => _RembScreenState();
}

class _RembScreenState extends State<RembScreen> {
  //List<Map<String, dynamic>> azkarList = [];
  List<AzkarModel> azkarList = [];
  @override
  void initState() {
    super.initState();
    loadAzkarlist();
  }

  Future<void> loadAzkarlist() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/azkar_all.json',
    );
    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      azkarList = jsonData.map((e) => AzkarModel.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      backgroundColor: const Color.fromARGB(255, 225, 210, 210),
      appBar: AppBar(
        iconTheme: IconThemeData(color: const Color.fromARGB(255, 38, 148, 91)),
        //  foregroundColor: const Color.fromARGB(255, 90, 160, 203),
        centerTitle: true,
        title: Text(
          ' كل الأذكــار',
          style: GoogleFonts.cairo(
            color: Color.fromARGB(255, 38, 148, 91),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,

            children: [
              _buildCard(
                './azkar_details_screen.dart',
                context,
                "أذكار الصباح والمساء",
                "assets/images/image_two.png",
                Color.fromARGB(255, 132, 220, 175),
              ),
              _buildCard(
                './azkar_details_screen.dart',
                context,
                "دعاء الإستيقاظ من النوم",
                "assets/images/image_one_1.png",
                Color.fromARGB(255, 132, 220, 175),
              ),
              _buildCard(
                './azkar_details_screen.dart',
                context,
                "دعاء الدخول الخلاء",
                "assets/images/image_one_2.png",
                Color.fromARGB(255, 132, 220, 175),
              ),
              _buildCard(
                './azkar_details_screen.dart',
                context,
                "دعاء الخروج من الخلاء",
                "assets/images/image_one_3.png",
                Color.fromARGB(255, 132, 220, 175),
              ),

              _buildCard(
                './azkar_details_screen.dart',
                context,
                "دعاء الخروج من المنزل",
                "assets/images/image_one_5.png",
                Color.fromARGB(255, 132, 220, 175),
              ),
              _buildCard(
                './azkar_details_screen.dart',
                context,
                "دعاء دخول المنزل",
                "assets/images/image_one_6.png",
                Color.fromARGB(255, 132, 220, 175),
              ),
              _buildCard(
                './azkar_details_screen.dart',
                context,
                "دعاء دخول السوق",
                "assets/images/image_one_4.png",
                Color.fromARGB(255, 132, 220, 175),
              ),

              _buildCard(
                './azkar_details_screen.dart',
                context,
                " دعاء قبل  الطعام",
                "assets/images/image_one_7.png",
                Color.fromARGB(255, 132, 220, 175),
              ),
              _buildCard(
                './azkar_details_screen.dart',
                context,
                " دعاء عند الفراغ من الطعام",
                "assets/images/image_one_8.png",
                Color.fromARGB(255, 132, 220, 175),
              ),
              _buildCard(
                './azkar_details_screen.dart',
                context,
                "دعاء الخلود للنوم",
                "assets/images/image_one_9.png",
                Color.fromARGB(255, 132, 220, 175),
              ),
              // _buildCard(
              //   './azkar_details_screen.dart',
              //   context,
              //   "دعاء الإستيقاظ من النوم",
              //   "assets/images/image_one_10.png",
              //   Colors.blueAccent,
              // ),
            ],
          ),
        ),
      ),
      // ),
    );
  }

  Widget _buildCard(
    String route,
    BuildContext context,
    String nameCard,
    String iconCard,
    Color colorCard,
  ) {
    return InkWell(
      onTap: () {
        final AzkarModel? selected = azkarList.firstWhere(
          (item) => item.title.trim() == nameCard.trim(),
          orElse: () => AzkarModel(
            title: nameCard,
            texts: ["الذكر غير موجود"],
            image: iconCard,
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AzkarDetailScreen(
              title: selected!.title,
              texts: selected.texts,
              image: selected.image,
            ),
          ),
        );
      },
      child: Container(
        width: 300,
        height: 400,
        decoration: BoxDecoration(
          color: colorCard,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconCard, height: 70),
            const SizedBox(height: 10),
            Text(
              nameCard,
              style: GoogleFonts.cairo(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 17, 98, 56),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
  String getAzkarText(String name) {
    switch (name) {
      case "دعاء الدخول الخلاء":
        return "اللهم إني أعوذ بك من الخبث والخبائث";
      case "دعاء الخروج الخلاء":
        return "غفرانك";
      case "دعاء قبل تناول الطعام":
        return "بسم الله";
      case "دعاء الدخول للمنزل":
        return "اللهم إني أسألك خير المولج وخير المخرج";
      case "دعاء الخروج من المنزل":
        return "بسم الله توكلت على الله ولا حول ولا قوة إلا بالله";
      case "دعاء الإستيقاظ من النوم":
        return "الحمد لله الذي أحيانا بعدما أماتنا وإليه النشور";
      case "دعاء الخلود للنوم":
        return "باسمك اللهم أموت وأحيا";
      case "دعاء الدخول للسوق":
        return "لا إله إلا الله وحده لا شريك له...";
      case "دعاء أثناء تناول الطعام":
        return "الحمد لله الذي أطعمنا وسقانا...";
      case "أذكار الصباح والمساء":
        return "اللهم بك أصبحنا وبك أمسينا...";
      default:
        return "ذكر غير متوفر حالياً";
    }
  }
}

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      /* azkarList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: azkarList.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  color: Colors.white,
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      azkarList[index],
                      textAlign: TextAlign.right,
                      style: GoogleFonts.cairo(
                        fontSize: 18,
                        height: 1.6,
                        color: const Color(0xff4E3D42),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
*/
*/
