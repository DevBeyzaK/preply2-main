import 'package:flutter/material.dart';
import 'package:preply_clone/academy_page.dart';
import 'package:preply_clone/insights.dart';
import 'package:preply_clone/messages.dart';
import 'package:preply_clone/schedule.dart';
import 'package:preply_clone/widgets/animatedkutu.dart';
import 'package:preply_clone/widgets/kisicardlar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  bool isOn=true;
  bool isVisible =true;//profile visibility için
  int selectedIndex = 0; 
  
  void openEndDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }
  
  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
    HomePage(onChangePage: (index ) {  setState(() {
      selectedIndex = index;
    }); },),  // Home sayfa, ayrı widget olmalı
    Messages(openDrawer: openEndDrawer),
    Schedule(),
    Insights(openDrawer: openEndDrawer),
  ];
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
  backgroundColor: Colors.white,
  width: MediaQuery.of(context).size.width,
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      Container( // <--- DrawerHeader yerine Container
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Drawer'ı kapatır
            },
          ),
        ),
      ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/beyza.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(height: 10),
             Text(
              'Beyza Kondu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: "Inter",
              ),
            ),
          ],
        ),
      ),
      //your profile bölümü
      ListTile(
        leading:Text("Your profile",style: TextStyle(fontSize: 20,fontFamily: "Inter",fontWeight: FontWeight.w900),),
      ),
      ListTile(
        leading: Icon(Icons.visibility),
        title: Text('Profile visibility'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 7,),
            Text(isOn ? "On": "Off",style: TextStyle(fontSize: 15,color: Colors.grey),),
            Icon(Icons.keyboard_arrow_right),
          ],
        ),
        onTap: () {
          _onButtonPressed();
          showModalBottomSheet(context: context, builder: (context){
            return Container(
            );
          });
          setState(() {
            selectedIndex = 0;
          });
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.account_balance_wallet_outlined),
        title: Text('Balance'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 7,),
            Text("USD 181.5",style: TextStyle(fontSize: 15,color: Colors.grey),),
            Icon(Icons.keyboard_arrow_right),
          ],
        ),
        onTap: () {
          showModalBottomSheet(context: context, builder: (context){
            return Container(
            );
          });
          setState(() {
            selectedIndex = 0;
          });
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.attach_money_rounded),
        title: Text('50 min lesson price'),
        
      ),
      ListTile(
        leading: Icon(Icons.wallet_giftcard_sharp),
        title: Text('Refer and earn \$25'),
        
      ),
      SizedBox(height: 15,),
      //help bölümü
      ListTile(
        leading:Text("Help",style: TextStyle(fontSize: 20,fontFamily: "Inter",fontWeight: FontWeight.w900),),
      ),
      ListTile(
        leading: Icon(Icons.info_outline),
        title: Text('Support center'),
        
      ),
      ListTile(
        leading: Icon(Icons.insert_drive_file_outlined),
        title: Text('Legal center'),
        
      ),
      ListTile(
        leading: Icon(Icons.people_rounded),
        title: Text('Community'),
        
      ),
      ListTile(
        leading: Icon(Icons.school_outlined),
        title: Text('Academy'),
        onTap: () {
    Navigator.pop(context); // önce Drawer'ı kapat
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AcademyPage()),
    );}
      ),
      SizedBox(height: 15,),
      //settings bölümü
      ListTile(
        leading:Text("Settings",style: TextStyle(fontSize: 20,fontFamily: "Inter",fontWeight: FontWeight.w900),),
      ),
      ListTile(
        leading: Icon(Icons.language),
        title: Text('App language'),
        
      ),
      ListTile(
        leading: Icon(Icons.access_time),
        title: Text('Time zone'),
        
      ),
      SizedBox(height: 15,),
      Divider(
        color: Colors.grey[300],
        thickness: 3,
      ),
      //delete account bölümü
      ListTile(
        leading:Icon(Icons.delete_forever),
        title: Text("Delete account"),
        
      ),
      Divider(
        color: Colors.grey[300],
        thickness: 3,
      ),
      //logout bölümü
      ListTile(
        leading: Icon(Icons.logout,color: const Color.fromARGB(255, 124, 34, 27),),
        title: Text("Log out"),
      ),
      ListTile(
        leading: Text("App version 6.71.0",style: TextStyle(color: Colors.grey),),
      )
      

    ],
  ),
),

      backgroundColor: Colors.white,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // İkonların boyutunu sabitler ve alt metinleri her zaman gösterir
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_sharp),
            label: 'Insights',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: const Color.fromRGBO(194, 95, 134, 1), // Seçilen ikonun rengi
        unselectedItemColor: Colors.grey, // Seçilmeyen ikonların rengi
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
       ), // Home sayfası için başlangıç indeksi
      );
  }
  
  void _onButtonPressed() async {
  bool? result = await showModalBottomSheet<bool>(
    context: context,
    isDismissible: true,
    builder: (context) {
      bool tempIsVisible = isVisible; // Modalda başlangıç değeri
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return Container(
            height: 320,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                              icon: Icon(Icons.close, color: Colors.black),
                              onPressed: () {
                                Navigator.pop(context); // Modalı kapat
                              }
                          ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Select your profile visibility state", style: TextStyle(fontSize: 18))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tempIsVisible ? Colors.grey[300] : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      side: BorderSide(
                        color: tempIsVisible ? Colors.black : Colors.grey,
                        width: tempIsVisible ? 2 : 1,
                      ),
                    ),
                    onPressed: () {
                      setModalState(() {
                        tempIsVisible = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.visibility, color: Colors.black, size: 30),
                        SizedBox(width: 20),
                        Text("Visible", style: TextStyle(fontSize: 20, color: Colors.black54)),
                        Spacer(),
                        Radio<bool>(
                          value: true,
                          groupValue: tempIsVisible,
                          onChanged: (bool? value) {
                            setModalState(() {
                              tempIsVisible = value!;
                            });
                          },
                          activeColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !tempIsVisible ? Colors.grey[300] : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      side: BorderSide(
                        color: !tempIsVisible ? Colors.black : Colors.grey,
                        width: !tempIsVisible ? 2 : 1,
                      ),
                    ),
                    onPressed: () {
                      setModalState(() {
                        tempIsVisible = false;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.visibility_off, color: Colors.black, size: 30),
                        SizedBox(width: 20),
                        Text("Hidden", style: TextStyle(fontSize: 20, color: Colors.black54)),
                        Spacer(),
                        Radio<bool>(
                          value: false,
                          groupValue: tempIsVisible,
                          onChanged: (bool? value) {
                            setModalState(() {
                              tempIsVisible = value!;
                            });
                          },
                          activeColor: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 121, 172, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side: BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, tempIsVisible); // Seçimi geri gönder
                      },
                      child: Text("Save",style: TextStyle(color: Colors.black,fontSize: 20),),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    },
  );

  setState(() {
  isVisible = result ?? false;  // null ise false olur
  isOn = isVisible;
});
}

  }
class HomePage extends StatelessWidget {
   final Function(int) onChangePage;

  const HomePage({Key? key, required this.onChangePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children:[ Column(
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 60),
                      child: Row(
                        children: [
                          Text(
                            "Good afternoon, Beyza",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          
                        ],
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(right: 100),
                    width: 300,
                    child: Image.asset("images/goodmorning.png")),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(255, 245, 195, 1),
                    ),
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            child: SizedBox(
                                height: 30, child: Image.asset("images/dikkat.png")),
                          ),
                        ),
                        Flexible(
                            child: Container(
                                child: Padding(
                          padding: const EdgeInsets.only(bottom: 14, left: 10),
                          child: Text(
                              "Your profile requires editing. Find helpful information in your email or in messages            we've sent you."),
                        )))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: 400,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(244, 243, 247, 1),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 20),
                                  child: Text(
                                    "Tackle pending actions",
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Check other actions available to you",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: ElevatedButton(
                                    onPressed: () {
                                       onChangePage(2); // Schedule sayfasına git
                                    },
                                    child: Text(
                                      "View action",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(255, 122, 172, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      side: BorderSide(
                                        color: Colors.black,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 250,
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Image.asset(
                                    "images/takvim.png",
                                    width: 100,
                                    height: 120,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Next lessons",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            onChangePage(2); // Schedule sayfasına git
                          },
                          child: Text(
                            "See All",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: "Inter",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Kisicardlar(
                    name: "Fatih K.",
                    date: "Tomorrow, Jul 2, 20:00-20:25",
                    imgUrl: "images/fatih.png"),
                Kisicardlar(
                    name: "İrem B.",
                    date: "Tomorrow, Jul 2, 20:30-21:20",
                    imgUrl: "images/irem.png"),
                Kisicardlar(
                    name: "İlay C.",
                    date: "Tomorrow, Jul 2, 21:30-22:20",
                    imgUrl: "images/kisi.png"),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Top actions",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Animatedkutu(
                    olayAdi: "Reply to potantial students",
                    subText:
                        "Check in later for potential students to connect with."),
                Animatedkutu(
                    olayAdi: "Help trial students get started",
                    subText:
                        "Check in later for potential students to connect with."),
                Animatedkutu(
                    olayAdi: "Engage active students",
                    subText: "Check in later for active students to connect with."),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Recommended",
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 300,
                            height: 380,
                            child: Card(
                              elevation: 2,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.grey, width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(244, 243, 247, 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Icon(Icons.card_travel_outlined),
                                        ),
                                        Icon(Icons.close)
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "Teaching working professionals course",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Skills to enhance your workplace-focused lessons to better teach and retain professionals.",
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 50),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              side: BorderSide(
                                                color: Colors.black,
                                                width: 2,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              "Take course",
                                              style: TextStyle(
                                                  fontSize: 15, color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 300,
                            height: 380,
                            child: Card(
                              elevation: 2,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(color: Colors.grey, width: 1)),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Color.fromRGBO(244, 243, 247, 1),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Icon(
                                            Icons.play_arrow,
                                            size: 35,
                                          ),
                                        ),
                                        Icon(Icons.close)
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "Get a Preply certificate ",
                                        style: TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Earn up to 70% more and stand out by completing the free Preply language teaching course -whether you're new to teaching or experienced.",
                                      style: TextStyle(fontSize: 16, color: Colors.black),
                                    ),
                                    SizedBox(height: 55),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              side: BorderSide(
                                                color: Colors.black,
                                                width: 2,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              "Start course",
                                              style: TextStyle(
                                                  fontSize: 15, color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
        top: 70,
        right: 20,
        child: GestureDetector(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: ClipRRect(borderRadius: BorderRadius.circular(5),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/beyza.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        ),
        ),
      ),
           ],
          ),
        ),
          ); 
  }
}

