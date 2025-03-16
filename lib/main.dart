import 'package:flutter/material.dart';

// 應用程式入口點
void main() {
  runApp(const MyApp());
}

// 應用程式根元件，設定基本主題並移除 debug 標籤
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

// 全球配送按鈕元件
// 實現方式：使用 FloatingActionButton 搭配多層 Container 實現邊框效果
// 外層灰色容器作為邊框，內層白色容器包含圖片和文字
class SButton extends StatelessWidget {
  const SButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 80,
      child: FloatingActionButton(
        child: Container(
          width: 68,
          height: 80,

          decoration: BoxDecoration(
            color: Color.fromARGB(255, 100, 101, 103),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), // 左上圓角
              bottomRight: Radius.circular(10), // 右下圓角
              topRight: Radius.circular(10), // 右上方角
              bottomLeft: Radius.circular(10), // 左下方角
            ),
          ),
          child: Center(
            child: Container(
              width: 63,
              height: 75,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), // 左上圓角
                  bottomRight: Radius.circular(10), // 右下圓角
                  topRight: Radius.circular(10), // 右上方角
                  bottomLeft: Radius.circular(10), // 左下方角
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 3),
                  Image.asset('assets/image.png'),
                  Text('Global Shipping', style: TextStyle(fontSize: 11)),
                ],
              ),
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

// 語言選擇按鈕元件
// 實現方式：使用 FloatingActionButton 配合 Row 佈局
// 設定粉色背景，包含文字和下拉箭頭圖示
class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 239, 239),
        child: Center(
          child: Row(
            children: [
              SizedBox(width: 30),
              Text('中文(繁體)', style: TextStyle(color: Colors.black)),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

// 購物車浮動按鈕元件
// 實現方式：使用圓形 FloatingActionButton
// 通過 shape: CircleBorder() 實現圓形效果
class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50, // 添加固定高度確保是圓形
      child: FloatingActionButton(
        shape: const CircleBorder(), // 設定為圓形
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle, // 確保容器也是圓形
            color: Colors.blue,
          ),
          child: Center(
            child: Image.asset(
              'assets/chatbot_sp2_100x.png',
              width: 55,
            ), // 稍微縮小圖片
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}

// 浮動按鈕群組容器
// 實現方式：使用 Stack 進行絕對定位
// 將三個浮動按鈕放置在指定位置
class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 520,
          height: 200,
          color: const Color.fromARGB(0, 33, 149, 243),
        ),
        Positioned(right: 4, bottom: 5, child: CartButton()),
        Positioned(left: 20, bottom: 0, child: LanguageButton()),
        Positioned(right: -11, bottom: 120, child: SButton()),
      ],
    );
  }
}

// 主頁面佈局
// 實現方式：使用 Scaffold 建立基本頁面結構
// 包含自定義 AppBar、內容區域、浮動按鈕和底部導航欄
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: const MyBody(),
      floatingActionButton: const MyFloatingButton(),
      bottomNavigationBar: const UpperBar(),
    );
  }
}

// 上層白色導航欄
// 實現方式：簡單的白色容器，高度固定為 24
class UpperBar extends StatelessWidget {
  const UpperBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 24, color: Color.fromARGB(255, 250, 248, 255));
  }
}

// 下層粉色導航欄
// 實現方式：使用 Row 佈局排列選單圖示、Logo 和購物車圖示
// 通過 SizedBox 控制間距
class LowerBar extends StatelessWidget {
  const LowerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69,
      color: Color.fromARGB(255, 255, 196, 202),
      child: Center(
        child: Row(
          children: [
            SizedBox(width: 14.7),
            Column(
              children: [
                SizedBox(height: 21),
                Image.asset('assets/icon_menu.png', width: 30.8),
              ],
            ),
            SizedBox(width: 50),
            Column(
              children: [
                SizedBox(height: 7),
                Image.asset('assets/logo_chiikawamarket_600x.png', width: 216),
              ],
            ),
            SizedBox(width: 41),
            Column(
              children: [
                SizedBox(height: 11),
                Image.asset('assets/en_btn_cart_112x.png', width: 44),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 導航欄底部漸層陰影
// 實現方式：使用 LinearGradient 實現從淺粉到深粉的漸變效果
class SHD extends StatelessWidget {
  const SHD({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.0, // 設定漸層區域高度為 6 像素
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFE8B8BF), // 起始顏色：較淺的粉色
            Color(0xFFF6C4CB), // 結束顏色：較深的粉色
          ],
          begin: Alignment.topCenter, // 漸層起點：頂部中心
          end: Alignment.bottomCenter, // 漸層終點：底部中心
        ),
      ),
    );
  }
}

// 自定義 AppBar
// 實現方式：實現 PreferredSizeWidget 接口
// 整合 UpperBar、LowerBar 和 SHD 三個元件
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(75.0);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Column(
        children: [
          AppBar(
            flexibleSpace: const Column(
              children: [UpperBar(), LowerBar(), SHD()],
            ),
          ),
        ],
      ),
    );
  }
}

// 商品展示卡片
// 實現方式：使用 Stack 疊加佈局
// 包含商品圖片、售罄標籤、商品名稱和價格
class NBox extends StatelessWidget {
  final String imagePath;
  final String text;

  const NBox({super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 188,
          height: 288.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10), // 設定圓角半徑
          ),
        ),
        Positioned(
          left: 8,
          top: 8.5,
          child: Image.asset(imagePath, width: 172),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 45,
            height: 32,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 34, 34, 34),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), // 左上圓角
                bottomRight: Radius.circular(10), // 右下圓角
                topRight: Radius.circular(0), // 右上方角
                bottomLeft: Radius.circular(0), // 左下方角
              ),
            ),
            child: Center(
              child: Text(
                '售罄',
                style: TextStyle(
                  fontFamily: 'Apple2',
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 7,
          top: 184,
          child: SizedBox(
            width: 172,
            child: Text(
              '吉伊卡哇×MLB TOKYO S',
              style: TextStyle(
                fontFamily: 'Apple2',
                fontSize: 15.5,
                color: Color.fromARGB(255, 41, 41, 41),
              ),
            ),
          ),
        ),
        Positioned(
          left: 7,
          top: 208,
          child: SizedBox(
            width: 170,
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Apple2',
                fontSize: 15.5,
                color: Color.fromARGB(255, 41, 41, 41),
              ),
            ),
          ),
        ),
        Positioned(
          right: 7,
          bottom: 7,
          child: Text(
            '¥1,980',
            style: TextStyle(
              fontFamily: 'Apple2',
              fontSize: 16,
              color: Color.fromARGB(255, 41, 41, 41),
            ),
          ),
        ),
      ],
    );
  }
}

// 商品網格容器
// 實現方式：使用 Column 和 Row 組合排列商品卡片
// 通過 SizedBox 控制間距
class RBox extends StatelessWidget {
  const RBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 420,
      color: Color(0xFFF6C4CB),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 14),
              NBox(
                imagePath: 'assets/4571609359234_1_300x.jpg',
                text: 'ERIES 吊飾 吉伊卡哇（道奇隊）',
              ),
              SizedBox(width: 8),
              NBox(
                imagePath: 'assets/4571609359241_1_300x.jpg',
                text: 'ERIES 吊飾 小八貓（道奇隊）',
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 14),
              NBox(
                imagePath: 'assets/4571609359258_1_300x.jpg',
                text: 'ERIES 吊飾 兔兔（道奇隊）',
              ),
              SizedBox(width: 8),
              NBox(
                imagePath: 'assets/4571609359265_1_300x.jpg',
                text: 'ERIES 吊飾 吉伊卡哇（小熊隊）',
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 14),
              NBox(
                imagePath: 'assets/4571609359272_1_300x.jpg',
                text: 'ERIES 吊飾 小八貓（道奇隊）',
              ),
              SizedBox(width: 8),
              NBox(
                imagePath: 'assets/4571609359289_1_300x.jpg',
                text: 'ERIES 吊飾 小八貓（道奇隊）',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 主要內容區域
// 實現方式：使用 SingleChildScrollView 實現滾動效果
// 包含標題文字和商品網格
class MyBody extends StatelessWidget {
  const MyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 420,
          height: 1700,
          color: Color.fromARGB(255, 255, 194, 202),
          child: const Column(
            children: [
              SizedBox(height: 12.8),
              Text(
                '新着商品',
                style: TextStyle(
                  fontFamily: 'Apple2',
                  fontSize: 16.2,
                  color: Color.fromARGB(255, 41, 41, 41),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'NEW ITEMS',
                style: TextStyle(
                  fontFamily: 'Apple',
                  fontSize: 22.5,
                  color: Color.fromARGB(255, 41, 41, 41),
                ),
              ),
              SizedBox(height: 20),
              RBox(),
            ],
          ),
        ),
      ),
    );
  }
}
