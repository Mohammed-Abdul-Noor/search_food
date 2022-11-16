import 'package:flutter/material.dart';
import 'package:search_food/food.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      //appBar: AppBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black87,
                    size: 25.0,
                  ),
                  Text('Search Food',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                  ),
                  ),
                  CircleAvatar(
                    child: Image.asset("assets/avatar.jpg"),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20,top: 40,right: 20,bottom: 30),
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child:
                Row(
                  children: [
                    Icon(Icons.search),
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'search',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.yellow,
                      ),
                      child: Icon(Icons.shopping_cart,
                      color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Text('Found \n80 Results',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              StaggeredDualView(itemBuilder: (context, index){
                return FoodItem(
                  food:foods[index],
                );
              }, itemCount: foods.length)


            ],

          ),
        ),

      ),
    
    );
  }
}
class FoodItem extends StatelessWidget {
  const FoodItem({Key? key,required this.food}) : super(key: key);
final Food food;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            
            child: ClipOval(
              child:
              Image.network(
                food.image, 
                fit:BoxFit.cover,
                ),
            ),
          ),
          Expanded(
            child: Column(
            children: [
              Text(food.name,maxLines: 2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
              ),
              Text(food.price,maxLines: 2,style: TextStyle(fontWeight: FontWeight.w300,fontSize: 16,color: Colors.green)

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) =>Icon(Icons.star,
                color: Colors.yellow,))
                  
                  
                
              )
            ],
          ),
          ),
        ],
      ),
    );
  }
}

class StaggeredDualView extends StatelessWidget {
  const StaggeredDualView({Key? key,
    required this.itemBuilder,
     this.aspectRatio=0.5,
    required this.itemCount,
     this.spacing=0.0,
  }) :
        super(key: key);
final IndexedWidgetBuilder itemBuilder;
final int itemCount;
final double spacing;
final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      childAspectRatio: aspectRatio,
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
    ),
        itemBuilder:itemBuilder,);
  }
}

