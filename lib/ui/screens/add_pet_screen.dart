import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:pet_care_mobile/features/pets/application/pets_controller.dart';
import 'package:pet_care_mobile/features/pets/domain/pet.dart';

/// ペット追加画面
class AddPetScreen extends ConsumerStatefulWidget {
  const AddPetScreen({super.key});

  @override
  ConsumerState<AddPetScreen> createState() => _AddPetScreenState();
}

class _AddPetScreenState extends ConsumerState<AddPetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _kindController = TextEditingController();
  DateTime? _selectedBirthdate;
  int _selectedSex = 0; // 0: オス, 1: メス

  @override
  void dispose() {
    _nameController.dispose();
    _kindController.dispose();
    super.dispose();
  }

  Future<void> _selectBirthdate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedBirthdate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      locale: const Locale('ja', 'JP'),
    );
    if (picked != null && picked != _selectedBirthdate) {
      setState(() {
        _selectedBirthdate = picked;
      });
    }
  }

  Future<void> _savePet() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    try {
      final uuid = const Uuid();
      final now = DateTime.now();

      final pet = Pet(
        localId: uuid.v4(),
        name: _nameController.text.trim(),
        kind: _kindController.text.trim(),
        sex: _selectedSex,
        birthdate: _selectedBirthdate,
        chronicIllness: null,
        iconId: null,
        updatedAt: now,
        deletedAt: null,
        syncState: 0,
      );

      await ref.read(petsControllerProvider.notifier).upsert(pet);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('ペットを登録しました！'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('登録に失敗しました: $e'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const Text(
          'ペットを追加',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilledButton(
              onPressed: _savePet,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              child: const Text('保存'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFormCard(
                context,
                children: [
                  // 名前
                  _buildSectionTitle('名前', Icons.pets_rounded),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'ペットの名前を入力',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '名前を入力してください';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // 種類
                  _buildSectionTitle('種類', Icons.category_rounded),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _kindController,
                    decoration: InputDecoration(
                      hintText: '例: 柴犬、アメリカンショートヘア',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '種類を入力してください';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  // 性別
                  _buildSectionTitle('性別', Icons.wc_rounded),
                  const SizedBox(height: 12),
                  SegmentedButton<int>(
                    segments: const [
                      ButtonSegment<int>(
                        value: 0,
                        label: Text('オス ♂'),
                        icon: Icon(Icons.male_rounded),
                      ),
                      ButtonSegment<int>(
                        value: 1,
                        label: Text('メス ♀'),
                        icon: Icon(Icons.female_rounded),
                      ),
                    ],
                    selected: {_selectedSex},
                    onSelectionChanged: (Set<int> newSelection) {
                      setState(() {
                        _selectedSex = newSelection.first;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  // 誕生日
                  _buildSectionTitle('誕生日', Icons.cake_rounded),
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: _selectBirthdate,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _selectedBirthdate != null
                                ? DateFormat('yyyy年M月d日(E)', 'ja')
                                    .format(_selectedBirthdate!)
                                : '誕生日を選択（任意）',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: _selectedBirthdate != null
                                  ? Colors.black
                                  : Colors.grey.shade600,
                            ),
                          ),
                          Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard(BuildContext context, {required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}

