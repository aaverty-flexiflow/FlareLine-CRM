import '../models/contact_model.dart';
import '../models/deal_model.dart';
import '../models/task_model.dart';
import 'data_service.dart';

class EmptyDataService implements DataService {
  @override
  Future<List<ContactModel>> getContacts() async {
    return [];
  }

  @override
  Future<ContactModel> addContact(ContactModel contact) async {
    throw UnimplementedError('Data service not available in dev mode');
  }

  @override
  Future<ContactModel> updateContact(ContactModel contact) async {
    throw UnimplementedError('Data service not available in dev mode');
  }

  @override
  Future<bool> deleteContact(String id) async {
    throw UnimplementedError('Data service not available in dev mode');
  }

  @override
  Future<List<DealModel>> getDeals() async {
    return [];
  }

  @override
  Future<DealModel> addDeal(DealModel deal) async {
    throw UnimplementedError('Data service not available in dev mode');
  }

  @override
  Future<DealModel> updateDeal(DealModel deal) async {
    throw UnimplementedError('Data service not available in dev mode');
  }

  @override
  Future<bool> deleteDeal(String id) async {
    throw UnimplementedError('Data service not available in dev mode');
  }

  @override
  Future<DealModel> moveDeal(String id, String newStatus) async {
    throw UnimplementedError('Data service not available in dev mode');
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    return [];
  }

  @override
  Future<TaskModel> addTask(TaskModel task) async {
    throw UnimplementedError('Data service not available in dev mode');
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) async {
    throw UnimplementedError('Data service not available in dev mode');
  }

  @override
  Future<bool> deleteTask(String id) async {
    throw UnimplementedError('Data service not available in dev mode');
  }

  @override
  Future<TaskModel> moveTask(String id, String newStatus) async {
    throw UnimplementedError('Data service not available in dev mode');
  }
}
