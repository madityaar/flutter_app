import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CounterCubitState extends Equatable {
  final String action;
  final int count;
  const CounterCubitState({this.action, this.count});

  @override
  List<Object> get props => [
        action,
        count,
      ];
}
