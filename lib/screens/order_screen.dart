import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/components/cloth_card.dart';
import 'package:playground/models/cloth.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          if (_tabController.index < _tabController.length - 1) {
            _tabController.animateTo(_tabController.index + 1);
          }
        },
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          if (_tabController.index > 0) {
            _tabController.animateTo(_tabController.index - 1);
          }
        },
      },
      child: Focus(
        autofocus: true,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  context.go('/');
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              bottom: TabBar(
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(text: 'Completed'),
                  Tab(text: 'Canceled'),
                ],
              ),
              backgroundColor: Colors.white,
              title: const Center(
                child: Text(
                  'My Orders',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: const [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      ClothCard(
                        cloth: Cloth(
                          clothId: 'c1',
                          clothName: 'Henley Shirts',
                          clothPrice: 250,
                          clothUrl: 'assets/images/product_0.png',
                        ),
                        cartScreen: false,
                      ),
                      ClothCard(
                        cloth: Cloth(
                          clothId: 'c2',
                          clothName: 'Casual Shirts',
                          clothPrice: 320,
                          clothUrl: 'assets/images/product_1.png',
                        ),
                        cartScreen: false,
                      ),
                      ClothCard(
                        cloth: Cloth(
                          clothId: 'c3',
                          clothName: 'Casual Nolin',
                          clothPrice: 165,
                          clothUrl: 'assets/images/product_2.png',
                        ),
                        cartScreen: false,
                      ),
                      ClothCard(
                        cloth: Cloth(
                          clothId: 'c4',
                          clothName: 'Casual T-Shirt',
                          clothPrice: 165,
                          clothUrl: 'assets/images/product_3.png',
                        ),
                        cartScreen: false,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text('Orders That Are Cancelled Will Appear Here'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
