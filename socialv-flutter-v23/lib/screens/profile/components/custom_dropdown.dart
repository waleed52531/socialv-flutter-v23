import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:socialv/utils/colors.dart';


class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    Key? key,
    this.formKey,
    required this.dropDownItems,
    required this.prefixIcon,
    required this.labelText,
    // required this.dropDownLabel,
    required this.showSearch,
    this.onChanged,
    this.validate,
    required this.title,
  }) : super(key: key);

  var selectedITem;
  var onChanged;
  final Icon prefixIcon;
  var dropDownItems;
  String labelText;

  // String dropDownLabel;
  bool showSearch;
  String? selectedValue;
  var validate;
  var formKey;
  final String title;

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 10,left: 10,right: 10),
        padding: const EdgeInsets.all(10),
        child: DropdownSearch<dynamic>(
          key: formKey,
          popupProps: PopupProps.modalBottomSheet(
            //title: const Icon(Icons.horizontal_rule),
              title: Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )),
              showSearchBox: showSearch,
              fit: FlexFit.tight,
              searchFieldProps: TextFieldProps(
                  enableSuggestions: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  decoration: const InputDecoration(
                    filled: true,
                    labelStyle: TextStyle(color: appColorPrimary),
                    labelText: "Search",
                    prefixIconColor: appColorPrimary,
                    suffix: Icon(
                      Icons.search_outlined,
                      color: appColorPrimary,
                    ),
                    // fillColor: AppStyles.textFieldUnfocusedColor,
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: appLayoutBackground)),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: appOrangeColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: appLayoutBackground), borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  textInputAction: TextInputAction.done),
              modalBottomSheetProps: const ModalBottomSheetProps(
                elevation: 10,
                isScrollControlled: true,
                enableDrag: true,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                ),
                backgroundColor: appLayoutBackground,
              )),
          items: dropDownItems,
          dropdownButtonProps: const DropdownButtonProps(
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: appColorPrimary,
              )),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              suffixIconColor: appColorPrimary,
              labelText: labelText,
              labelStyle: const TextStyle(color: appColorPrimary),
              prefixIcon: prefixIcon,
              prefixIconColor: appColorPrimary,
              // suffixIcon: const Icon(Icons.ac_unit, color: appColorPrimary,),
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: appLayoutBackground),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: appLayoutBackground),
              ),
              // hintText: "country in menu mode",
            ),
          ),
          onChanged: onChanged,
          validator: validate,
          // selectedItem: "Brazil",
        ));
  }
}
