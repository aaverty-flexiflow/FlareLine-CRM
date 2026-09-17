import 'package:faker/faker.dart' as fakerRandom;
import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_crm/pages/crm_layout.dart';
import 'package:flareline_crm/pages/integrations/add_integrations_widget.dart';
import 'package:flareline_crm/pages/integrations/integrations_state.dart';
import 'package:flareline_crm/pages/integrations/integrations_viewmodel.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/image/image_widget.dart';
import 'package:flareline_uikit/core/mvvm/bloc/bloc_base_stless_widget.dart';
import 'package:flutter/material.dart';

class IntegrationsPage extends CrmLayout {
  const IntegrationsPage({super.key});

  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => true;

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Integrations';
  }

  @override
  Widget breakTabRightWidget(BuildContext context) {
    // TODO: implement rightContentWidget
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 150,
          child: AddIntegrationsWidget(),
        )
      ],
    );
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return IntegrationsPageView();
  }
}

class IntegrationsPageView extends BlocBaseStlessWidget<IntegrationsViewModel,IntegrationsState> {
  IntegrationsPageView({super.key});

  @override
  Widget bodyWidget(
      BuildContext context, IntegrationsViewModel viewModel, IntegrationsState state) {
    var faker = fakerRandom.Faker();
    List<Widget> list = List.generate(50, (i) {
      return {
        "image": 'https://picsum.photos/200?$i',
        "title": faker.company.name(),
        "value": faker.company.position(),
        "pro": '20%',
        "days": faker.date.month()
      };
    }).map((item) {
      return itemBuilder(context, item);
    }).toList();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Wrap(
        runSpacing: 20,
        spacing: 32,
        children: list,
      ),
    );
  }

  @override
  IntegrationsViewModel viewModelBuilder(BuildContext context) {
    return IntegrationsViewModel(context);
  }

  Widget itemBuilder(BuildContext ctx, element) {
    return CommonCard(
      width: 300,
      height: 180,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageWidget(
                imageUrl: element['image'],
                width: 40,
                height: 40,
              ),
              const Spacer(),
              const SizedBox(
                width: 80,
                height: 32,
                child: ButtonWidget(
                  btnText: '+ Contact',
                  borderColor: CrmColors.primary,
                  textColor: CrmColors.primary,
                  fontSize: 12,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${element['title']}',
            style: const TextStyle(
                color: CrmColors.heading,
                fontSize: 13,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${element['value']}',
            style: const TextStyle(color: CrmColors.heading, fontSize: 13),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 18, color: CrmColors.paragraph),
              const SizedBox(
                width: 6,
              ),
              Expanded(
                  child: Text(element['days'],
                      style:
                          const TextStyle(fontSize: 12, color: CrmColors.paragraph)))
            ],
          )
        ],
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const Divider(
      height: 20,
      color: Colors.transparent,
    );
  }
}


