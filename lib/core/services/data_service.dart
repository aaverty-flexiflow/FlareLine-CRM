import '../models/contact_model.dart';
import '../models/deal_model.dart';
import '../models/task_model.dart';

abstract class DataService {
  // Contacts
  Future<List<ContactModel>> getContacts();
  Future<ContactModel> addContact(ContactModel contact);
  Future<ContactModel> updateContact(ContactModel contact);
  Future<bool> deleteContact(String id);

  // Deals
  Future<List<DealModel>> getDeals();
  Future<DealModel> addDeal(DealModel deal);
  Future<DealModel> updateDeal(DealModel deal);
  Future<bool> deleteDeal(String id);
  Future<DealModel> moveDeal(String id, String newStatus);

  // Tasks
  Future<List<TaskModel>> getTasks();
  Future<TaskModel> addTask(TaskModel task);
  Future<TaskModel> updateTask(TaskModel task);
  Future<bool> deleteTask(String id);
  Future<TaskModel> moveTask(String id, String newStatus);
}
