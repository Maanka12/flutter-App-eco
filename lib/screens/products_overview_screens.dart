import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:shopping_app/screens/orders_screen.dart';
import 'package:shopping_app/widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../provider/cart.dart';


enum FilterOptions{
  Favorites,
  All
}

class ProductsOverViewScreen extends StatefulWidget {
  

  @override
  _ProductsOverViewScreenState createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
 

 




    var _showOnlyFavorites=false;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text("MyShop"),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue){
              setState(() {
                  if(selectedValue==FilterOptions.Favorites){
             _showOnlyFavorites=true;
          }else{
            _showOnlyFavorites=false;
          }
              });
        
            },
            icon: Icon(Icons.more_vert),
          itemBuilder: (_)=>[
            PopupMenuItem(child: Text("Only Fav"),value: FilterOptions.Favorites,),
            PopupMenuItem(child: Text("Show All"),value: FilterOptions.All,)

          ],
          ),
         Consumer<Cart> (builder: (_,cartDta, ch)=>Badge(
            child: ch,
          value: cartDta.itemCount.toString(),
          ),
          child: IconButton(icon:Icon (Icons.shopping_cart,
          ),
          onPressed: (){
            Navigator.of(context).pushNamed(CartScreen.routName);
          },
          ),
          ),
          

        ],
      ),
      drawer: AppDrawer(),
      
          

    
      
      body: Column(
        children: <Widget>[
          
          Expanded(child: ProductsGrid(_showOnlyFavorites)),
      
         
        ],
      ),
    );


  }
}
