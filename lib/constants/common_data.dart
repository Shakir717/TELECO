import 'package:telfoni/constants/app_assets.dart';
import 'package:telfoni/constants/string_values.dart';

class IntroSliderModel{
  final String description,image;

  IntroSliderModel({required this.description, required this.image});
}

List<IntroSliderModel> introSlider=[
  IntroSliderModel(description: Strings.sliderText1, image:AppAsset.slider1),
  IntroSliderModel(description: Strings.sliderText2, image:AppAsset.slider2),
  IntroSliderModel(description: Strings.sliderText3, image:AppAsset.slider3),
  IntroSliderModel(description: Strings.sliderText4, image:AppAsset.slider4),
  IntroSliderModel(description: Strings.sliderText5, image:AppAsset.slider5),
];

class BundlesPriceTag{
  final String? price,days,mbs,sharing;

  BundlesPriceTag({this.price, this.days, this.mbs, this.sharing});
}

List<BundlesPriceTag> bundlesList=[
  BundlesPriceTag(price: '\u{20AC} 1.00',days: '3 Days',mbs: '100 MB',sharing: 'No'),
  BundlesPriceTag(price: '\u{20AC} 19.95',days: '7 Days',mbs: 'Unlimited',sharing: 'No'),
  BundlesPriceTag(price: '\u{20AC} 69.95',days: '30 Days',mbs: 'Unlimited',sharing: 'No'),
  BundlesPriceTag(price: '\u{20AC} 89.95',days: '7 Days',mbs: '14 GB',sharing: 'Yes'),

];

class ProductTagModel{
  final String? name, des,price,image,des2;

  ProductTagModel({this.name, this.des, this.price,this.image,this.des2});
}

List<ProductTagModel> productList=[
  ProductTagModel(des2: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt tincidunt cras ante lacinia a viverra. Gravida vulputate sed amet sapien eget tortor nulla at. Tortor massa turpis ante velit arcu sit malesuada bibendum diam. Tellus dignissim pharetra id enim, ut. Tellus vestibulum aliquam quis nisl ac',image: AppAsset.simProduct,name: 'SIM CARD',des: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nunc ultrices adipiscing orci. At pellentesque aliquam ut sociis adipiscing massa.',price: '\u{20AC} 3.5'),
  ProductTagModel(des2: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt tincidunt cras ante lacinia a viverra. Gravida vulputate sed amet sapien eget tortor nulla at. Tortor massa turpis ante velit arcu sit malesuada bibendum diam. Tellus dignissim pharetra id enim, ut. Tellus vestibulum aliquam quis nisl ac',image: AppAsset.circuit,name: 'Lorem ipsum dolor ',des: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nunc ultrices adipiscing orci. At pellentesque aliquam ut sociis adipiscing massa.',price: '\u{20AC} 20.0'),
  ProductTagModel(des2: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt tincidunt cras ante lacinia a viverra. Gravida vulputate sed amet sapien eget tortor nulla at. Tortor massa turpis ante velit arcu sit malesuada bibendum diam. Tellus dignissim pharetra id enim, ut. Tellus vestibulum aliquam quis nisl ac',image: AppAsset.charger1,name: 'Lorem ipsum dolor ',des: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nunc ultrices adipiscing orci. At pellentesque aliquam ut sociis adipiscing massa.',price: '\u{20AC} 5.0'),
  ProductTagModel(des2: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tincidunt tincidunt cras ante lacinia a viverra. Gravida vulputate sed amet sapien eget tortor nulla at. Tortor massa turpis ante velit arcu sit malesuada bibendum diam. Tellus dignissim pharetra id enim, ut. Tellus vestibulum aliquam quis nisl ac',image:AppAsset.charger2,name: 'VIS CARD',des: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut nunc ultrices adipiscing orci. At pellentesque aliquam ut sociis adipiscing massa.',price: '\u{20AC} 4.5'),
];

List dropDownBundle=['3 Day | 100MB | No Sharing','7 Day | Unlimited | No Sharing','30 Day | Unlimited | No Sharing','7 Day | 14GB | Sharing'];