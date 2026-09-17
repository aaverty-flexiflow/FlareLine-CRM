import 'package:faker/faker.dart';
import '../models/contact_model.dart';
import '../models/deal_model.dart';
import '../models/task_model.dart';
import 'data_service.dart';

class MockDataService implements DataService {
  final Faker _faker = Faker();
  
  // Mock data storage
  final List<ContactModel> _contacts = [];
  final List<DealModel> _deals = [];
  final List<TaskModel> _tasks = [];

  MockDataService() {
    _initializeMockData();
  }

  void _initializeMockData() {
    // Initialize contacts
    for (int i = 0; i < 20; i++) {
      _contacts.add(ContactModel(
        id: _faker.guid.guid(),
        name: _faker.person.name(),
        email: _faker.internet.email(),
        phone: _faker.phoneNumber.us(),
        company: _faker.company.name(),
        avatar: 'https://picsum.photos/200?id=${_faker.guid.guid()}',
        status: 'active',
      ));
    }

    // Initialize deals
    final dealStatuses = ['next', 'prospect', 'proposal', 'won'];
    for (int i = 0; i < 80; i++) {
      _deals.add(DealModel(
        id: _faker.guid.guid(),
        image: 'https://picsum.photos/200?id=${_faker.guid.guid()}',
        title: _faker.company.name(),
        value: '\$${(_faker.randomGenerator.integer(100000, min: 10000) / 1000).round()}k',
        probability: '${_faker.randomGenerator.integer(100, min: 10)}%',
        days: _faker.date.month(),
        status: dealStatuses[i % dealStatuses.length],
      ));
    }

    // Initialize tasks
    final taskStatuses = ['todo', 'inprogress', 'needreview', 'done'];
    for (int i = 0; i < 80; i++) {
      _tasks.add(TaskModel(
        id: _faker.guid.guid(),
        image: 'assets/crm/task1.svg',
        name: _faker.internet.userName(),
        task: _faker.job.title(),
        days: _faker.date.month(),
        users: [
          'https://picsum.photos/200?id=${_faker.guid.guid()}',
          'https://picsum.photos/200?id=${_faker.guid.guid()}'
        ],
        status: taskStatuses[i % taskStatuses.length],
      ));
    }
  }

  @override
  Future<List<ContactModel>> getContacts() async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay
    return List.from(_contacts);
  }

  @override
  Future<ContactModel> addContact(ContactModel contact) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newContact = contact.copyWith(id: _faker.guid.guid());
    _contacts.add(newContact);
    return newContact;
  }

  @override
  Future<ContactModel> updateContact(ContactModel contact) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _contacts.indexWhere((c) => c.id == contact.id);
    if (index != -1) {
      _contacts[index] = contact;
      return contact;
    }
    throw Exception('Contact not found');
  }

  @override
  Future<bool> deleteContact(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _contacts.indexWhere((c) => c.id == id);
    if (index != -1) {
      _contacts.removeAt(index);
      return true;
    }
    return false;
  }

  @override
  Future<List<DealModel>> getDeals() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_deals);
  }

  @override
  Future<DealModel> addDeal(DealModel deal) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newDeal = deal.copyWith(id: _faker.guid.guid());
    _deals.add(newDeal);
    return newDeal;
  }

  @override
  Future<DealModel> updateDeal(DealModel deal) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _deals.indexWhere((d) => d.id == deal.id);
    if (index != -1) {
      _deals[index] = deal;
      return deal;
    }
    throw Exception('Deal not found');
  }

  @override
  Future<bool> deleteDeal(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _deals.indexWhere((d) => d.id == id);
    if (index != -1) {
      _deals.removeAt(index);
      return true;
    }
    return false;
  }

  @override
  Future<DealModel> moveDeal(String id, String newStatus) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _deals.indexWhere((d) => d.id == id);
    if (index != -1) {
      final deal = _deals[index];
      final updatedDeal = deal.copyWith(status: newStatus);
      _deals[index] = updatedDeal;
      return updatedDeal;
    }
    throw Exception('Deal not found');
  }

  @override
  Future<List<TaskModel>> getTasks() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_tasks);
  }

  @override
  Future<TaskModel> addTask(TaskModel task) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final newTask = task.copyWith(id: _faker.guid.guid());
    _tasks.add(newTask);
    return newTask;
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
      return task;
    }
    throw Exception('Task not found');
  }

  @override
  Future<bool> deleteTask(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      _tasks.removeAt(index);
      return true;
    }
    return false;
  }

  @override
  Future<TaskModel> moveTask(String id, String newStatus) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final index = _tasks.indexWhere((t) => t.id == id);
    if (index != -1) {
      final task = _tasks[index];
      final updatedTask = task.copyWith(status: newStatus);
      _tasks[index] = updatedTask;
      return updatedTask;
    }
    throw Exception('Task not found');
  }
}
