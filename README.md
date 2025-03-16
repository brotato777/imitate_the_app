# App 模擬專案

此專案使用 Flutter 框架建立，模擬特定應用程式的介面。

## 專案結構

主要程式位於 `lib/main.dart`，包含以下主要元件：

### 核心元件
- `MyApp`: 應用程式的根元件，設定基本主題和移除 debug 標籤
- `MyHomePage`: 主頁面佈局，整合所有主要元件
  - AppBar
  - Body
  - FloatingButton
  - BottomNavigationBar

### 頂部導航欄相關元件
- `MyAppBar`: 自定義應用程式頂部導航欄
- `UpperBar`: 上層白色導航欄
- `LowerBar`: 下層粉色導航欄，包含選單、Logo 和購物車
- `SHD`: 導航欄底部漸層陰影效果

### 浮動按鈕相關元件
- `MyFloatingButton`: 整合各種浮動按鈕的容器
- `SButton`: 全球配送按鈕
- `LanguageButton`: 語言選擇按鈕
- `CartButton`: 購物車浮動按鈕

### 主要內容區域元件
- `MyBody`: 主要內容區域容器
- `RBox`: 商品網格容器
- `NBox`: 單個商品展示卡片
  - 展示商品圖片
  - 商品名稱
  - 價格標籤
  - 售罄標籤

## 特色功能
- 響應式佈局
- 自定義導航欄設計
- 浮動按鈕群組
- 商品展示網格
- 多語言支持

## 設計特點
- 使用粉色系主題
- 圓角設計元素
- 陰影效果
- 固定寬度佈局
- 可滾動內容區域
