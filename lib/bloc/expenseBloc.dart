import 'dart:async';

import 'package:expense_tracker_app/model/expenseModel.dart';
import 'package:expense_tracker_app/model/profileModel.dart';
import 'package:expense_tracker_app/repository/expenseRepository.dart';
import 'package:expense_tracker_app/response/expenseApiResponse.dart';

class ExpenseBloc {
  late ExpenseRepository _expenseRepository;

  // controllers
  late StreamController<ExpenseApiResponse<List<expenseModel>>>
      _expenseListController;
  late StreamController<ExpenseApiResponse<profileModel>> _profileController;

  late StreamController<ExpenseApiResponse<expenseModel>>
      _expenseCreateController;

  // stream sink
  StreamSink<ExpenseApiResponse<List<expenseModel>>> get expenseListSink =>
      _expenseListController.sink;
  StreamSink<ExpenseApiResponse<profileModel>> get profileSink =>
      _profileController.sink;

  StreamSink<ExpenseApiResponse<expenseModel>> get expenseCreateSink =>
      _expenseCreateController.sink;

  // stream
  Stream<ExpenseApiResponse<List<expenseModel>>> get expenseListStream =>
      _expenseListController.stream;
  Stream<ExpenseApiResponse<profileModel>> get profileStream =>
      _profileController.stream;

  Stream<ExpenseApiResponse<expenseModel>> get expenseCreateStream =>
      _expenseCreateController.stream;

  // constructor

  ExpenseBloc() {
    _expenseListController =
        StreamController<ExpenseApiResponse<List<expenseModel>>>();
    _profileController = StreamController<ExpenseApiResponse<profileModel>>();
    _expenseCreateController =
        StreamController<ExpenseApiResponse<expenseModel>>();
    _expenseRepository = ExpenseRepository();
    fetchExpenseList();
    profile();
  }

  // functions

  fetchExpenseList() async {
    expenseListSink.add(ExpenseApiResponse.loading("Fetching data"));
    try {
      List<expenseModel> expenseDatas = await _expenseRepository.fetchData();
      expenseListSink.add(ExpenseApiResponse.completed(expenseDatas));
    } catch (e) {
      expenseListSink.add(ExpenseApiResponse.error(e.toString()));
      print(e);
    }
  }

  profile() async {
    profileSink.add(ExpenseApiResponse.loading("getting Data"));
    try {
      profileModel profileData = await _expenseRepository.getProfile();
      profileSink.add(ExpenseApiResponse.completed(profileData));
    } catch (e) {
      print(e);
      profileSink.add(ExpenseApiResponse.error(e.toString()));
    }
  }

  createExpense(String title, double amount, String incomeOrexpense) async {
    expenseCreateSink.add(ExpenseApiResponse.loading("posting data"));
    try {
      expenseModel expenseCreateData = await _expenseRepository.createExpense(
          title, amount, incomeOrexpense);
      expenseCreateSink.add(ExpenseApiResponse.completed(expenseCreateData));
    } catch (e) {
      print("op");
      print(e);
      expenseCreateSink.add(ExpenseApiResponse.error(e.toString()));
    }
  }
  // dispose

  dispose() {
    _expenseListController.close();
    _profileController.close();
    _expenseCreateController.close();
  }
}
