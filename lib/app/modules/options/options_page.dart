import 'package:brickr/app/widgets/home_scaffold.dart';
import 'package:fluix/fluix.dart';
import 'package:fluix/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'options_controller.dart';

class OptionsPage extends StatefulWidget {
  final String title;
  const OptionsPage({Key key, this.title = "Options"}) : super(key: key);

  @override
  _OptionsPageState createState() => _OptionsPageState();
}

class _OptionsPageState extends ModularState<OptionsPage, OptionsController> {
  //use 'controller' variable to access controller

  TextEditingController text;

  @override
  void initState() {
    controller.load().then((_) {
      text = TextEditingController(text: controller.addAmount.toString());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FluidTheme.of(context);

    return HomeScaffold(
      'Options',
      willNavigate: controller.save,
      body: LayoutBuilder(
        builder: (_, size) => SingleChildScrollView(
          padding: size.maxWidth < 620
              ? EdgeInsets.all(16)
              : EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: size.maxWidth / 2 - 300,
                ),
          child: Observer(
            builder: (_) => FluidCard(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Customize Card Layout',
                        style: theme.typography.h2,
                      ),
                      CardConfigurator(
                        controller.useSecondary,
                        controller.useTap,
                        controller.addAmount,
                      ),
                    ],
                  ),
                  FluidListItem.checkbox(
                    value: controller.useSecondary,
                    onChanged: (b) => controller.useSecondary = b,
                    title: Text('Seperate Card in Top And Bottom'),
                  ),
                  FluidListItem(
                    trailing: SizedBox(
                      width: 100,
                      child: FluidInput(
                        controller: text,
                        hintText: 'Amount',
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (s) {
                          final n = int.tryParse(s);
                          if (n != null) controller.addAmount = n;

                          text.text = controller.addAmount.toString();
                        },
                      ),
                    ),
                    title: Text('Amount to add with the top section'),
                  ),
                  FluidListItem.checkbox(
                    value: !controller.useTap,
                    onChanged: (b) => controller.useTap = !b,
                    title: Text('Use longpress to trigger the details menu'),
                  ),
                  FluidListItem.head(title: Text('General')),
                  FluidListItem.checkbox(
                    value: controller.showSpare,
                    onChanged: (b) => controller.showSpare = b,
                    title: Text('Show Spare Parts'),
                  ),
                  FluidListItem.checkbox(
                    value: controller.showCompleted,
                    onChanged: (b) => controller.showCompleted = b,
                    title: Text('Show Completed Parts'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardConfigurator extends StatelessWidget {
  final bool useSecondaryButtons;
  final bool useTap;
  final int secondary;

  CardConfigurator(this.useSecondaryButtons, this.useTap, this.secondary);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (useSecondaryButtons || useTap)
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextContainer(
                        '- ${useSecondaryButtons ? secondary : 1}'),
                  ),
                  if (useTap)
                    Expanded(
                      child: TextContainer('Open'),
                    ),
                  Expanded(
                    child: TextContainer(
                        '+ ${useSecondaryButtons ? secondary : 1}'),
                  ),
                ],
              ),
            ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: TextContainer('- 1')),
                Expanded(child: TextContainer('+ 1')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  final String text;

  TextContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Liquids.sensitiveGrey.dark),
      ),
    );
  }
}
