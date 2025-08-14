import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/core/base/state/base_view_state.dart';
import 'package:kaizen_tech_recipe/data/bloc/item_detail/item_detail_bloc.dart';
import 'package:kaizen_tech_recipe/data/bloc/item_detail/item_detail_event.dart';
import 'package:kaizen_tech_recipe/screen/item_detail/item_detail_screen.dart';

mixin ItemDetailScreenMixin on BaseViewState<ItemDetailScreen> {
  final ItemDetailBloc _itemDetailBloc = ItemDetailBloc();
  ItemDetailBloc get itemDetailBloc => _itemDetailBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.id != null) {
        _itemDetailBloc.add(ItemDetailInitAction(widget.id!));
      }
    });
  }
}