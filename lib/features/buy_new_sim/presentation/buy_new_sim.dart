import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:teleco/constants/app_assets.dart';
import 'package:teleco/constants/app_size.dart';
import 'package:teleco/constants/colors_data.dart';
import 'package:teleco/extensions/color_extension.dart';
import 'package:teleco/features/checkout/presentation/checkout_without_register.dart';
import 'package:teleco/routing/app_router.dart';
import 'package:teleco/shared_widgets/alert_dialogs.dart';
import 'package:teleco/shared_widgets/appBar.dart';
import 'package:teleco/shared_widgets/custom_card_view.dart';
import 'package:teleco/shared_widgets/custom_image.dart';
import 'package:teleco/shared_widgets/custom_textfield.dart';
import '../../../constants/string_values.dart';
import '../../../shared_widgets/custom_scaffold_widget.dart';
import '../../home/presentation/home_page.dart';

class BuyNewSimCardPage extends ConsumerStatefulWidget {
  const BuyNewSimCardPage({Key? key}) : super(key: key);

  @override
  _BuyNewSimCardPageState createState() => _BuyNewSimCardPageState();
}

class _BuyNewSimCardPageState extends ConsumerState<BuyNewSimCardPage> {
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Home",
    },
    {
      "id": 1,
      "value": false,
      "title": "Travel1",
    },
    {
      "id": 2,
      "value": false,
      "title": "Travel2",
    },
    {
      "id": 3,
      "value": false,
      "title": "Use a different shipping address",
    },
  ];
  final governate = TextEditingController(),
      cCity = TextEditingController(),
      city = TextEditingController(),
      block = TextEditingController(),
      jadda = TextEditingController(),
      street = TextEditingController(),
      buildingNumber = TextEditingController(),
      floor = TextEditingController(),
      appartment = TextEditingController(),
      deliveryInstruction = TextEditingController(),
      country = TextEditingController(),
      cCountry = TextEditingController(),
      cState = TextEditingController(),
      state = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final quantity = ref.watch(quantityProvider);
    final theme = Theme.of(context);
    final shippingAddress = ref.watch(shippingAddressProvider);
    return Scaffold(
      appBar: AppBar(elevation: 0,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _simCardHeading(theme),
            gapH12,
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18),
              child: Column(
                children: [
                  QuantityWidget(
                    theme: theme,
                    value: quantity,
                  ),
                  gapH12,

                  if (shippingAddress
                      .contains('Use a different shipping address'))
                    _differentShoppingAddressWidget(theme),

                  if (!shippingAddress
                      .contains('Use a different shipping address'))
                    _shoppingAddressWidget(theme),

                  gapH12,

                  /// summary
                  _summaryWidget(theme, quantity),
                  gapH32,
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                        style: theme.elevatedButtonTheme.style!.copyWith(
                            backgroundColor:
                                MaterialStateProperty.all(kLightBlue)),
                        onPressed: () {
                          widgetClassDialog(context: context, title: '', content: CheckoutWithoutRegistration());
                        },
                        child: Text(Strings.checkout)),
                  ),

                ],
              ),
            ),
            gapH20,
            HeaderWidget(
              theme: theme,
            ),
          ],
        ),
      ),
    );
  }

   _shoppingAddressWidget(ThemeData theme) {
    return Container(
      color: kDarkBlue,
      child: Column(
        children: [
          Container(
              color: kLightBlue,
              height: 60,
              child: Row(
                children: [
                  gapW8,
                  Text(
                    Strings.shoppingAddress,
                    style: theme.textTheme.headline6,
                  ),
                ],
              )),
          gapH4,
          CustomSingleCheckedBoxList(
            items: checkListItems,
          ),
          gapH8,
          CustomCard(
              borderColor: kLightBlueOpacity08,
              height: 80,
              color: kNavyBlue,
              child: Center(
                  child: Text(
                Strings.toAddNewAddressOrChangeDefaultAddress,
                textAlign: TextAlign.center,
              ))),
          gapH12,
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                CustomTextFieldWithoutBorder(
                    readOnly: true,
                    textColor: kWhite,
                    labelColor: kWhite,
                    controller: country..text = 'Kuwait',
                    text: Strings.country),
                gapH12,
                CustomTextFieldWithoutBorder(
                    readOnly: true,
                    textColor: kWhite,
                    labelColor: kWhite,
                    controller: governate..text = 'Ahmadi Governorate',
                    text: Strings.governorate),
                gapH12,
                CustomTextFieldWithoutBorder(
                  readOnly: true,
                  textColor: kWhite,
                  labelColor: kWhite,
                  controller: city..text = 'Ar Rumaythiyah',
                  text: Strings.city,
                ),
                gapH12,
                CustomTextFieldWithoutBorder(
                  readOnly: true,
                  textColor: kWhite,
                  labelColor: kWhite,
                  controller: block..text = '1B',
                  text: Strings.block,
                ),
                gapH12,
                CustomTextFieldWithoutBorder(
                  readOnly: true,
                  textColor: kWhite,
                  labelColor: kWhite,
                  controller: jadda..text = '06',
                  text: Strings.jadda,
                ),
                gapH12,
                CustomTextFieldWithoutBorder(
                  readOnly: true,
                  textColor: kWhite,
                  labelColor: kWhite,
                  controller: street..text = 'Zain ul Abideen',
                  text: Strings.street,
                ),
                gapH12,
                CustomTextFieldWithoutBorder(
                    readOnly: true,
                    textColor: kWhite,
                    labelColor: kWhite,
                    controller: buildingNumber..text = '54',
                    text: 'Building Number'),
                gapH12,
                CustomTextFieldWithoutBorder(
                    readOnly: true,
                    textColor: kWhite,
                    labelColor: kWhite,
                    controller: floor..text = '14th',
                    text: Strings.floor),
                gapH12,
                CustomTextFieldWithoutBorder(
                    readOnly: true,
                    textColor: kWhite,
                    labelColor: kWhite,
                    controller: appartment..text = 'Qasar abdul',
                    text: Strings.apartment),
                gapH12,
              ],
            ),
          ),
          CustomCard(
            child: CustomTextFieldWithoutBorder(
                readOnly: true,
                textColor: kWhite,
                labelColor: kWhite,
                maxLine: 3,
                controller: deliveryInstruction
                  ..text = 'Delivery instruction here',
                text: Strings.deliveryInstructionHere),
          ),
          gapH16,
        ],
      ),
    );
  }

   _differentShoppingAddressWidget(ThemeData theme) {
    return Container(
      color: kDarkBlue,
      child: Column(
        children: [
          Container(
              height: 60,
              color: kLightBlue,
              child: Row(
                children: [
                  gapW8,
                  Text(
                    Strings.shoppingAddress,
                    style: theme.textTheme.headline6,
                  ),
                ],
              )),
          gapH8,
          CustomSingleCheckedBoxList(
            items: checkListItems,
          ),
          gapH8,
          CustomCard(
              borderColor: kLightBlue,
              height: 80,
              color: kNavyBlue,
              child: Center(
                  child: Text(
                Strings.toAddNewAddressOrChangeDefaultAddress,
                textAlign: TextAlign.center,
              ))),
          gapH24,
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                CountryStateCityPicker(
                  country: cCountry,
                  state: cState,
                  city: cCity,
                  textColor: kWhite,
                  inRow: true,
                  textFieldInputBorder: UnderlineInputBorder(),
                ),
                gapH12,
                CustomTextFieldWithoutBorder(
                  textColor: kWhite,
                  labelColor: kWhite,
                  controller: block,
                  text: Strings.block,
                ),
                gapH12,
                CustomTextFieldWithoutBorder(
                  textColor: kWhite,
                  labelColor: kWhite,
                  controller: jadda,
                  text: Strings.jadda,
                ),
                gapH12,
                CustomTextFieldWithoutBorder(
                    textColor: kWhite,
                    labelColor: kWhite,
                    controller: street,
                    text: Strings.street),
                gapH12,
                CustomTextFieldWithoutBorder(
                    textColor: kWhite,
                    labelColor: kWhite,
                    controller: buildingNumber,
                    text: Strings.buildingNumber),
                gapH12,
                CustomTextFieldWithoutBorder(
                  textColor: kWhite,
                  labelColor: kWhite,
                  controller: floor,
                  text: Strings.floor,
                ),
                gapH12,
                CustomTextFieldWithoutBorder(
                    textColor: kWhite,
                    labelColor: kWhite,
                    controller: appartment,
                    text: Strings.apartment),
                gapH12,
              ],
            ),
          ),
          CustomCard(
            child: CustomTextFieldWithoutBorder(
                textColor: kWhite,
                labelColor: kWhite,
                maxLine: 3,
                controller: deliveryInstruction,
                text: Strings.deliveryInstructionHere),
          ),
          gapH16,
        ],
      ),
    );
  }

  _summaryWidget(ThemeData theme, int quantity) {
    return Container(
      color: kDarkBlue,
      child: Column(
        children: [
          Container(
              color: kLightBlue,
              height: 60,
              child: Row(
                children: [
                  gapW8,
                  Text(
                    Strings.summary,
                    style: theme.textTheme.headline6,
                  ),
                ],
              )),
          gapH24,
          Row(
            children: [
              gapW8,
              Text(
                Strings.quantity,
                style: theme.textTheme.headline6,
              ),
              Spacer(),
              Text(
                Strings.amount,
                style: theme.textTheme.headline6,
              ),
              gapW8
            ],
          ),
          gapH16,
          Divider(
            color: kLightBlueOpacity08,
          ),
          gapH16,
          Row(
            children: [
              gapW8,
              Text(
                quantity.toString(),
                style: theme.textTheme.headline6,
              ),
              Spacer(),
              Text(
                '${quantity} * \u{20AC}10',
                style: theme.textTheme.headline6,
              ),
              gapW8
            ],
          ),
          gapH16,
          Divider(
            color: kLightBlueOpacity08,
          ),
          gapH32,
          Text(
            '\u{20AC} ' + (quantity * 10).toString(),
            style: theme.textTheme.headline4,
          ),
          gapH8,
          Text(
            Strings.total,
            style: theme.textTheme.headline6,
          ),
        ],
      ),
    );
  }

  Stack _simCardHeading(ThemeData theme) {
    return Stack(
      children: [
        CustomCard(
          color:HexColor.fromHex('#1C608B'),
          borderRadius: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gapW12,
              CustomImage(imageUrl: AppAsset.simChipBanner,),
              Spacer(),
              CustomImage(imageUrl: AppAsset.simChipBanner),
              gapW12,
            ],),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gapH4,
            SizedBox(width: double.maxFinite,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Strings.orderNewSimCar,
                  style: theme.textTheme.headline5,
                ),
                gapH8,
                RichText(
                    text: TextSpan(children: [
                      TextSpan(text: Strings.simPrice),
                      TextSpan(text: ' €10', style: theme.textTheme.headline5)
                    ]))
              ],
            )
          ],
        )
      ],
    );
  }
}

class QuantityWidget extends ConsumerStatefulWidget {
  int value;

  QuantityWidget({
    Key? key,
    required this.theme,
    required this.value,
  }) : super(key: key);

  final ThemeData theme;

  @override
  _QuantityWidgetState createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends ConsumerState<QuantityWidget> {
  @override
  Widget build(BuildContext context) {
    final value = ref.watch(quantityProvider);
    return CustomCard(
      color: kDarkBlue,
      padding: 8,
      child: Row(
        children: [
          Text(
            Strings.quantity,
            style: widget.theme.textTheme.headline6,
          ),
          Spacer(),
          CustomTapAbleCard(
              color: kLightBlueOpacity08,
              onTap: () {
                if (value > 1) {
                  ref.read(quantityProvider.state).state -= 1;
                }
              },
              child: FaIcon(FontAwesomeIcons.minus)),
          CustomTapAbleCard(
              color: kWhite,
              padding: 8,
              width: 70,
              child: Center(
                  child: Text(
                value.toString(),
                style: TextStyle(color: kBlack, fontWeight: FontWeight.bold),
              ))),
          CustomTapAbleCard(
              onTap: () {
                ref.read(quantityProvider.state).state += 1;
              },
              color: kLightBlueOpacity08,
              child: Icon(Icons.add))
        ],
      ),
    );
  }
}

class CustomSingleCheckedBoxList extends ConsumerStatefulWidget {
  final List items;
  CustomSingleCheckedBoxList({Key? key, required this.items}) : super(key: key);

  @override
  _CustomSingleCheckedBoxListState createState() =>
      _CustomSingleCheckedBoxListState();
}

class _CustomSingleCheckedBoxListState
    extends ConsumerState<CustomSingleCheckedBoxList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
          widget.items.length,
          (index) => Theme(
                data: ThemeData(
                  unselectedWidgetColor: kWhite,
                ),
                child: CheckboxListTile(

                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  activeColor: kWhite,
                  checkColor: kDarkBlue,
                  title: Text(
                    widget.items[index]["title"],
                    style: TextStyle(
                        color: kWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  value: widget.items[index]["value"],
                  onChanged: (value) {
                    setState(() {
                      for (var element in widget.items) {
                        element["value"] = false;
                      }
                      widget.items[index]["value"] = value;
                    });
                    ref.read(shippingAddressProvider.state).state =
                        widget.items[index]["title"];
                  },
                  checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                ),
              ),
          growable: false),
    );
  }
}

// update
final quantityProvider = StateProvider<int>((ref) => 1);
final shippingAddressProvider = StateProvider<String>((ref) => '');
