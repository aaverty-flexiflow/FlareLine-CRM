import 'package:faker/faker.dart' as fakerRandom;
import 'package:flareline_crm/core/theme/crm_colors.dart';
import 'package:flareline_crm/pages/crm_layout.dart';
import 'package:flareline_crm/pages/deals/add_deals_widget.dart';
import 'package:flareline_crm/pages/deals/deals_state.dart';
import 'package:flareline_crm/pages/deals/deals_viewmodel.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/image/image_widget.dart';
import 'package:flareline_uikit/core/mvvm/bloc/bloc_base_stless_widget.dart';
import 'package:flutter/material.dart';

class DealsPage extends CrmLayout {
  const DealsPage({super.key});

  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => false;

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Deals';
  }

  @override
  Widget breakTabRightWidget(BuildContext context) {
    // TODO: implement rightContentWidget
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 150,
          child: AddDealsWidget(),
        )
      ],
    );
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return DealsPageView();
  }
}

class DealsPageView extends BlocBaseStlessWidget<DealsViewModel,DealsState> {
  DealsPageView({super.key});

  @override
  Widget bodyWidget(
      BuildContext context, DealsViewModel viewModel, DealsState state) {
    var faker = fakerRandom.Faker();

    return Wrap(
      runSpacing: 20,
      spacing: 32,
      children: [
        _columnWidget(
            context,
            viewModel,
            'Next',
            'next',
            CrmColors.primary,
            List.generate(20, (i) {
              return {
                "image": 'https://picsum.photos/200?id=${faker.guid.guid()}',
                "title": faker.company.name(),
                "value": r'$40,000',
                "pro": '20%',
                "days": faker.date.month()
              };
            })),
        _columnWidget(
            context,
            viewModel,
            'Prospect',
            'prospect',
            CrmColors.sky,
            List.generate(20, (i) {
              return {
                "image": 'https://picsum.photos/200?id=${faker.guid.guid()}',
                "title": faker.company.name(),
                "value": r'$40,000',
                "pro": '20%',
                "days": faker.date.month()
              };
            })),
        _columnWidget(
            context,
            viewModel,
            'Proposal',
            'proposal',
            CrmColors.orange,
            List.generate(20, (i) {
              return {
                "image": 'https://picsum.photos/200?id=${faker.guid.guid()}',
                "title": faker.company.name(),
                "value": r'$40,000',
                "pro": '20%',
                "days": faker.date.month()
              };
            })),
        _columnWidget(
            context,
            viewModel,
            'Won',
            'won',
            CrmColors.green,
            List.generate(20, (i) {
              return {
                "image": 'https://picsum.photos/200?id=${faker.guid.guid()}',
                "title": faker.company.name(),
                "value": r'$40,000',
                "pro": '20%',
                "days": faker.date.month()
              };
            })),
      ],
    );
  }

  @override
  DealsViewModel viewModelBuilder(BuildContext context) {
    return DealsViewModel(context);
  }

  _columnWidget(BuildContext context, DealsViewModel viewModel, String title,
      String type, Color tagColor, List<dynamic> list) {
    return SizedBox(
      width: 300,
      height: 800,
      child: Column(
        children: [
          CommonCard(
            height: 60,
            child: Row(
              children: [
                Expanded(child: Text(title)),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: tagColor, borderRadius: BorderRadius.circular(4)),
                  width: 24,
                  height: 24,
                  child: const Text(
                    '5',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: ListView.separated(
            itemBuilder: (ctx, index) {
              return itemBuilder(ctx, index, list.elementAt(index));
            },
            itemCount: list.length,
            separatorBuilder: separatorBuilder,
          ))
        ],
      ),
    );
  }

  itemBuilder(BuildContext ctx, int index, element) {
    return CommonCard(
      width: 300,
      height: 180,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              ImageWidget(
                imageUrl: element['image'],
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: Text(element['title']))
            ],
          ),
          const Divider(
            color: CrmColors.border,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Value',
                style: TextStyle(fontSize: 12, color: CrmColors.paragraph),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(element['value'] ?? '',
                      style: const TextStyle(fontSize: 12)))
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              const Text('Probability',
                  style: TextStyle(fontSize: 12, color: CrmColors.paragraph)),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(element['pro'] ?? '',
                      style: const TextStyle(fontSize: 12)))
            ],
          ),
          const SizedBox(
            height: 10,
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

