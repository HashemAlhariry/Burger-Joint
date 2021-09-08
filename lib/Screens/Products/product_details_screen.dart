import 'package:burgerjoint/Models/cart.dart';
import 'package:burgerjoint/Models/extra.dart';
import 'package:burgerjoint/Models/product.dart';
import 'package:burgerjoint/Models/size.dart';
import 'package:burgerjoint/Models/combo_product.dart';
import 'package:burgerjoint/Providers/cart_provider.dart';
import 'package:burgerjoint/Utils/global.dart';
import 'package:burgerjoint/Widgets/drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart' as provider;


class ProductDetailsScreen extends StatefulWidget {

  final Product product;
  const ProductDetailsScreen({
    Key? key,
    required this.product
  }) : super(key: key);
  
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();

}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {


  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {

    extraBoolList =  List<bool>.generate(widget.product.extras.length, (i) => false);
    withOutBoolList =  List<bool>.generate(widget.product.productSizes[chosenSizesProduct].withOuts.length, (i) => false);
    totalPriceProduct = widget.product.productSizes[0].price;

  }



  //for extras items
  late List<bool> extraBoolList;

  //for without items
  late List<bool>  withOutBoolList;

  //for combo items clicked example( Combo Medium - Combo Large)
  int checkerForComboProductOpens=-1;

  //for expanding and closing ExpansionPanelList
  bool expandedExtras=false;


  //for expanding and closing ExpansionPanelList
  bool expandedWithOut=false;


  List<List<bool>> comboItemsClicked=[];


  //for choosing size of product
  int chosenSizesProduct=0;

  //total price for product
  late int totalPriceProduct;
  int comboPrice=0;


  late Cart cart;


  @override
  Widget build(BuildContext context) {
    cart = provider.Provider.of<CartProvider>(context, listen: true).cart;

    return Scaffold(
      key: _key,
      drawer: DrawerWidget(),
      body: SafeArea(
        child: Stack(
            children : [
              Padding(
                padding:  EdgeInsets.all(0.0),
                child: ListView(
                    children: [

                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: FittedBox(
                                  child: Text(
                                    widget.product.productTitle,
                                    style: GoogleFonts.bebasNeue(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Color(0xffF80009),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Hero(
                        tag: widget.product.productId,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * .3,
                          // width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Image.network(
                              widget.product.productImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          widget.product.productDescription,
                          style: GoogleFonts.ptSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Color(0xff5B5B5B),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      /*
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * .15,
                          width: MediaQuery.of(context).size.width * .7,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                100,
                              ),
                            ),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * .05,
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * .06,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF80009),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          20,
                                        ),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child:  Text(
                                      "SINGLE",
                                      style: GoogleFonts.ptSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * .05,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF80009),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          50,
                                        ),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "DOUBLE",
                                      style: GoogleFonts.ptSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                       */
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...List.generate(
                        widget.product.productSizes.length,
                            (i) => GestureDetector(
                              onTap: (){
                                setState(() {
                                  //RESET ALL THE EXTRA COMBO AND WITHOUT
                                  checkerForComboProductOpens=-1;
                                  chosenSizesProduct=i;
                                  comboPrice=0;
                                  totalPriceProduct=widget.product.productSizes[i].price;
                                  extraBoolList =  List<bool>.generate(widget.product.extras.length, (i) => false);
                                  withOutBoolList =  List<bool>.generate(widget.product.productSizes[i].withOuts.length, (i) => false);
                                });
                                //update product price
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:  chosenSizesProduct==i ? Color(0xFFF80009) :Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      100,
                                    ),
                                  ),
                                ),
                          height: MediaQuery.of(context).size.height * .08,
                          width: chosenSizesProduct==i ? MediaQuery.of(context).size.width * .4 :MediaQuery.of(context).size.width * .28,
                          padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               Container(
                                  child: Text( widget.product.productSizes[i].sizeName,style:GoogleFonts.ptSans(
                                    fontWeight: FontWeight.bold,
                                    color: chosenSizesProduct==i ? Colors.white : Color(0xFFF80009) ,
                                    fontSize: 15,
                                  ),),),

                              ],
                          ),
                        ),
                            ),),],
                    ),

                      /***FOR COMPO SIZES***/
                      if(widget.product.combo)
                      SizedBox(height: 20,),
                      if(widget.product.combo)
                      ...List.generate(
                          widget.product.comboProducts.length,
                            (i) =>  Container(
                            color: Colors.white,
                            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0,0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(checkerForComboProductOpens==i){

                                        checkerForComboProductOpens=-1;
                                        comboItemsClicked=[];
                                        totalPriceProduct-=comboPrice;
                                        comboPrice=0;

                                      }
                                      else{
                                        totalPriceProduct-=comboPrice;
                                        comboPrice=0;
                                        comboPrice= widget.product.comboProducts[i].price;
                                        totalPriceProduct+=comboPrice;


                                        comboItemsClicked=[];
                                        checkerForComboProductOpens=i;

                                        //for initializing  comboItemsClicked = -1;
                                        for(int j=0;j< widget.product.comboProducts[i].items.length;j++){
                                            List<bool>items=[];
                                            for(int k =0 ;k<widget.product.comboProducts[i].items[j].optionsProduct.length;k++) {
                                                items.add(false);
                                            }
                                            comboItemsClicked.add(items);
                                        }


                                      }

                                    });
                                  },
                                  child: Container(child: Text( widget.product.comboProducts[i].sizeName,style:GoogleFonts.ptSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),),),
                                ),
                                SizedBox(height: 10,),
                                if(checkerForComboProductOpens==i)
                                ...List.generate(
                                  widget.product.comboProducts[i].items.length,
                                      (j) =>  Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0,10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(child: Text(widget.product.comboProducts[i].items[j].productName,style:GoogleFonts.ptSans(
                                          fontSize: 15,
                                        ),),),
                                        ...List.generate(
                                          widget.product.comboProducts[i].items[j].optionsProduct.length,
                                              (k) =>  Container(
                                            color: Colors.white,
                                            padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(child: Text(  widget.product.comboProducts[i].items[j].optionsProduct[k].productName,style:GoogleFonts.ptSans(
                                                  fontSize: 12,
                                                ),),),

                                                Checkbox(
                                                  value:comboItemsClicked[j][k],
                                                  activeColor: Colors.red,
                                                  onChanged: (bool? value) {
                                                    //for initializing  comboItemsClicked = -1;
                                                    comboItemsClicked=[];
                                                    for(int j=0;j< widget.product.comboProducts[i].items.length;j++){
                                                      List<bool>items=[];
                                                      for(int k  =0 ;k<widget.product.comboProducts[i].items[j].optionsProduct.length;k++) {

                                                        items.add(false);
                                                      }
                                                      comboItemsClicked.add(items);
                                                    }

                                                    setState(() {
                                                      comboItemsClicked[j][k]=!comboItemsClicked[j][k];
                                                    });
                                                    print(comboItemsClicked);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),),

                                      ],
                                    ),
                                  ),),
                                SizedBox(height: 10,)
                              ],
                            ),
                          ),
                        ),
                      /***----------------------------------------***/

                      SizedBox(height: 10,),

                      /***FOR PRODUCT EXTRAS***/
                      if(widget.product.extras.length>0)
                      SizedBox(height: 10,),
                      /*
                    //EXTRAS
                      if (widget.product.extras.length>1)
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                        child: Text('Extras',style:GoogleFonts.ptSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),),

                   ...List.generate(
                        widget.product.extras.length,
                            (i) =>       Container(
                          color: Colors.white,
                          padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(child: Text( widget.product.extras[i].productName,style:GoogleFonts.ptSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),),
                              Expanded(child: Container()),
                              Container(child: Text(widget.product.extras[i].sizePrice.toString(),style:GoogleFonts.ptSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),),),
                              Checkbox(
                                value: extraBoolList[i],
                                activeColor: Colors.red,
                                onChanged: (bool? value) {
                                  setState(() {
                                    this.extraBoolList[i] = value! ;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),),

                      */
                      if( widget.product.extras.length>0)
                      ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return ExpansionPanelList(
                            animationDuration: Duration(milliseconds: 300),
                            dividerColor: Colors.red,
                            elevation: 1,
                            children: [
                              ExpansionPanel(
                                body: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: List.generate(
                                      widget.product.extras.length,
                                          (i) =>       Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(child: Text( widget.product.extras[i].productName,style:GoogleFonts.ptSans(

                                              fontSize: 15,
                                            ),),),
                                            Expanded(child: Container()),
                                            Container(child: Text(widget.product.extras[i].sizePrice.toString(),style:GoogleFonts.ptSans(

                                              fontSize: 15,
                                            ),),),
                                            Checkbox(
                                              value: extraBoolList[i],
                                              activeColor: Colors.red,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  this.extraBoolList[i] = value!;
                                                  if(extraBoolList[i]){
                                                    totalPriceProduct+=widget.product.extras[i].sizePrice;
                                                  }else{
                                                    totalPriceProduct-=widget.product.extras[i].sizePrice;
                                                  }
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),),
                                  ),
                                ),
                                headerBuilder: (BuildContext context, bool isExpanded) {
                                  return Container(
                                      padding: EdgeInsets.all(10),
                                    child: Text('Extras',style:GoogleFonts.ptSans(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),)
                                  );
                                },
                                isExpanded: expandedExtras,
                              )
                            ],
                            expansionCallback: (int item, bool status) {
                              setState(() {
                                expandedExtras = !expandedExtras;
                              });
                            },
                          );
                        },
                      ),
                      /***-----------------------------------------***/

                      SizedBox(height: 10,),

                      /***FOR PRODUCT WITHOUT TO REMOVE ITEMS***/
                      if(widget.product.productSizes.length>0)
                        SizedBox(height: 10,),
                      if(widget.product.productSizes.length>0)
                       ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return ExpansionPanelList(
                            animationDuration: Duration(milliseconds: 300),
                            dividerColor: Colors.red,
                            elevation: 1,
                            children: [
                              ExpansionPanel(
                                body: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: List.generate(
                                      widget.product.productSizes[chosenSizesProduct].withOuts.length,
                                          (i) =>       Container(
                                        color: Colors.white,
                                        padding: EdgeInsets.fromLTRB(15.0, 0, 15.0,0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(child: Text( widget.product.productSizes[chosenSizesProduct].withOuts[i].name,style:GoogleFonts.ptSans(
                                              fontSize: 15,
                                            ),),),

                                          Expanded(child: Container(),),
                                            Checkbox(
                                              value: withOutBoolList[i],
                                              activeColor: Colors.red,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  this.withOutBoolList[i] = value! ;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),),
                                  ),
                                ),
                                headerBuilder: (BuildContext context, bool isExpanded) {
                                  return Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text('Remove',style:GoogleFonts.ptSans(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),)
                                  );
                                },
                                isExpanded: expandedWithOut,
                              )
                            ],
                            expansionCallback: (int item, bool status) {
                              setState(() {
                                expandedWithOut = !expandedWithOut;
                              });
                            },
                          );
                        },
                      ),
                      /***-----------------------------------------***/


                      SizedBox(height: 70,),

                    ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Color(0xffED1C24),
                      iconSize: 26,
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                  Expanded(child: Container(),),
                  Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
                          child: Text("PRICE  "+ totalPriceProduct.toString()+" EGP",style:  GoogleFonts.bebasNeue(
                            fontSize: 25,
                          ),),
                        ),
                        Expanded(child: Container(),),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0,0,10.0,0),
                          child: FlatButton(color:Colors.red,
                              onPressed: (){

                            //updating the total price of a product after user added combo, extra etc...
                            widget.product.totalProductPrice=totalPriceProduct;

                            //List to get all user`s extra to add it to the product details
                            List<Extra> extraAddedByUser=[];
                            for(int i=0;i<extraBoolList.length;i++){
                              if(extraBoolList[i]){
                                extraAddedByUser.add(widget.product.extras[i]);
                              }
                            }

                            //List to get all user`s without to add it to the product details
                            List<WithOut> withOutAddedByUser=[];
                            for(int i=0;i<withOutBoolList.length;i++){
                              if(withOutBoolList[i]){
                                withOutAddedByUser.add(widget.product.productSizes[chosenSizesProduct].withOuts[i]);
                              }
                            }

                            //productSize where user clicked without items to be added in the order
                            List<ProductSize>productSizeWhichUserChoose=[];
                            ProductSize productSizeUserChoose = new ProductSize(
                                widget.product.productSizes[chosenSizesProduct].sizeId,
                                widget.product.productSizes[chosenSizesProduct].sizeName,
                                widget.product.productSizes[chosenSizesProduct].price,
                                withOutAddedByUser);
                            productSizeWhichUserChoose.add(productSizeUserChoose);

                            List<ComboProduct> comboProducts=[];
                            //to check if user click on combo or not and if clicked add the combo chosen by user

                            if(checkerForComboProductOpens!=-1){

                                List<Item> itemUsersChoose=[];
                                for(int i =0;i< widget.product.comboProducts[checkerForComboProductOpens].items.length;i++){
                                  List<OptionProduct> optionProductListClickedByUser = [];
                                 for(int j = 0;j<widget.product.comboProducts[checkerForComboProductOpens].items[i].optionsProduct.length;j++){

                                       if(comboItemsClicked[i][j]){
                                         OptionProduct optionProductClickedByUser = new OptionProduct(
                                             widget.product.comboProducts[checkerForComboProductOpens].items[i].optionsProduct[j].productComboOptionId,
                                             widget.product.comboProducts[checkerForComboProductOpens].items[i].optionsProduct[j].productName,
                                             widget.product.comboProducts[checkerForComboProductOpens].items[i].optionsProduct[j].productId,
                                             widget.product.comboProducts[checkerForComboProductOpens].items[i].optionsProduct[j].productSize,
                                             widget.product.comboProducts[checkerForComboProductOpens].items[i].optionsProduct[j].sizeId);
                                         optionProductListClickedByUser.add(optionProductClickedByUser);

                                       }
                                 }
                                 if(optionProductListClickedByUser.length==0 &&widget.product.comboProducts[checkerForComboProductOpens].items[i].optionsProduct.length>0 ){
                                   OptionProduct optionProductClickedByUser = new OptionProduct(
                                       widget.product.comboProducts[checkerForComboProductOpens].items[i].optionsProduct[0].productComboOptionId,
                                       widget.product.comboProducts[checkerForComboProductOpens].items[i].optionsProduct[0].productName,
                                       widget.product.comboProducts[checkerForComboProductOpens].items[i].optionsProduct[0].productId,
                                       widget.product.comboProducts[checkerForComboProductOpens].items[i].optionsProduct[0].productSize,
                                       widget.product.comboProducts[checkerForComboProductOpens].items[i].optionsProduct[0].sizeId);
                                   optionProductListClickedByUser.add(optionProductClickedByUser);
                                 }

                                  Item itemChosenByUser= new Item(
                                      widget.product.comboProducts[checkerForComboProductOpens].items[i].productCombo,
                                      widget.product.comboProducts[checkerForComboProductOpens].items[i].productName,
                                      widget.product.comboProducts[checkerForComboProductOpens].items[i].productId,
                                      widget.product.comboProducts[checkerForComboProductOpens].items[i].productSize,
                                      widget.product.comboProducts[checkerForComboProductOpens].items[i].sizeId,
                                      widget.product.comboProducts[checkerForComboProductOpens].items[i].options,
                                      optionProductListClickedByUser);
                                 itemUsersChoose.add(itemChosenByUser);
                                }

                                ComboProduct comboProductByUser = new ComboProduct(
                                    widget.product.comboProducts[checkerForComboProductOpens].comboSize,
                                    widget.product.comboProducts[checkerForComboProductOpens].sizeName,
                                    widget.product.comboProducts[checkerForComboProductOpens].price,
                                    itemUsersChoose);

                                comboProducts.add(comboProductByUser);
                            }

                            for(int i=0;i<comboProducts.length;i++){
                                    print(comboProducts[i].sizeName+" ");
                                    for(int j=0;j<comboProducts[i].items.length;j++){
                                      print(comboProducts[i].items[j].productName+" ");
                                      for(int k=0;k<comboProducts[i].items[j].optionsProduct.length;k++){
                                        print(comboProducts[i].items[j].optionsProduct[k].productName+" ");
                                      }
                                    }
                                  }

                            //add product to cart
                            //product to add to cart product to be update with all user choices to add it to the cart
                            Product productToAddToCart = new Product(
                                widget.product.status,
                                widget.product.productId,
                                widget.product.productDescription,
                                widget.product.productImage,
                                widget.product.productTitle,
                                widget.product.taxes,
                                widget.product.productPrice,
                                extraAddedByUser,
                                widget.product.combo,
                                comboProducts,
                                widget.product.discount,
                                productSizeWhichUserChoose,
                                widget.product.totalProductPrice,
                                1,
                                widget.product.relationId);
                            provider.Provider.of<CartProvider>(
                                context,
                                listen: false)
                                .addCart(productToAddToCart);

                            Global.toastMessage("Added to Cart");

                             },
                              child: Container(
                                width: 150,
                                child: Center(child: Text("Add To Cart",style: TextStyle(color: Colors.white),)),
                              )
                              ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ]

        ),
      ),
    );

  }

}


