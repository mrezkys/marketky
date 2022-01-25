import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketky/constant/app_color.dart';
import 'package:marketky/core/model/Category.dart';
import 'package:marketky/core/model/Product.dart';
import 'package:marketky/core/services/CategoryService.dart';
import 'package:marketky/core/services/ProductService.dart';
import 'package:marketky/views/screens/empty_cart_page.dart';
import 'package:marketky/views/screens/message_page.dart';
import 'package:marketky/views/screens/search_page.dart';
import 'package:marketky/views/widgets/category_card.dart';
import 'package:marketky/views/widgets/custom_icon_button_widget.dart';
import 'package:marketky/views/widgets/dummy_search_widget_1.dart';
import 'package:marketky/views/widgets/item_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> categoryData = CategoryService.categoryData;
  List<Product> productData = ProductService.productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Section 1
          Container(
            height: 190,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 26),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Find the best \noutfit for you.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          height: 150 / 100,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Row(
                        children: [
                          CustomIconButtonWidget(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EmptyCartPage()));
                            },
                            value: 0,
                            icon: SvgPicture.asset(
                              'assets/icons/Bag.svg',
                              color: Colors.white,
                            ),
                          ),
                          CustomIconButtonWidget(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MessagePage()));
                            },
                            value: 2,
                            margin: EdgeInsets.only(left: 16),
                            icon: SvgPicture.asset(
                              'assets/icons/Chat.svg',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                DummySearchWidget1(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SearchPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // Section 2 - category
          Container(
            width: MediaQuery.of(context).size.width,
            color: AppColor.secondary,
            padding: EdgeInsets.only(top: 12, bottom: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View More',
                          style: TextStyle(color: Colors.white.withOpacity(0.7), fontWeight: FontWeight.w400),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Category list
                Container(
                  margin: EdgeInsets.only(top: 12),
                  height: 96,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: categoryData.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        data: categoryData[index],
                        onTap: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Section 3 - banner
          // Container(
          //   height: 106,
          //   padding: EdgeInsets.symmetric(vertical: 16),
          //   child: ListView.separated(
          //     padding: EdgeInsets.symmetric(horizontal: 16),
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 3,
          //     separatorBuilder: (context, index) {
          //       return SizedBox(width: 16);
          //     },
          //     itemBuilder: (context, index) {
          //       return Container(
          //         width: 230,
          //         height: 106,
          //         decoration: BoxDecoration(color: AppColor.primarySoft, borderRadius: BorderRadius.circular(15)),
          //       );
          //     },
          //   ),
          // ),

          // Section 4 - product list

          Padding(
            padding: EdgeInsets.only(left: 16, top: 16),
            child: Text(
              'Todays recommendation...',
              style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(
                productData.length,
                (index) => ItemCard(
                  product: productData[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
