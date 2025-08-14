import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/enum/tab_type_enum.dart';

@immutable
abstract class ItemDetailAction {
  const ItemDetailAction();
}

@immutable
final class ItemDetailInitAction extends ItemDetailAction {
  const ItemDetailInitAction(this.id);
  final String id;
}

@immutable
final class ChangeSelectedTabEvent extends ItemDetailAction {
  const ChangeSelectedTabEvent(this.selectedTab);
  final TabType selectedTab;
}