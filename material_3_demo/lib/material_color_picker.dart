import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Color _lastPickerColor = Colors.blue;

Future<Color?> pickCustomColor(BuildContext context) async {
  TextEditingController textController = TextEditingController(
      text:
          '#2F19DB'); // The initial value can be provided directly to the controller.
  return showDialog<Color>(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                ColorPicker(
                  hexInputController: textController,
                  pickerColor: _lastPickerColor,
                  onColorChanged: (color) {
                    _lastPickerColor = color;
                  },
                  colorPickerWidth: 300,
                  pickerAreaHeightPercent: 0.7,
                  enableAlpha: true,
                  labelTypes: const [
                    ColorLabelType.hsl,
                    ColorLabelType.hsv,
                    ColorLabelType.hex,
                    ColorLabelType.rgb
                  ],
                  displayThumbColor: true,
                  paletteType: PaletteType.hslWithHue,
                  pickerAreaBorderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(2),
                    topRight: Radius.circular(2),
                  ),
                  //hexInputBar: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: textController,
                          decoration: const InputDecoration(
                              hintText: 'Enter a Hex value',
                              helperText: 'i.e: 3080BB'),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                        onPressed: () =>
                            Navigator.pop(context, _lastPickerColor),
                        icon: const Icon(Icons.check),
                        label: const Text('Ok'))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
