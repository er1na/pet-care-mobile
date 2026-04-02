import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pet_care_mobile/features/hospital_history/application/hospital_history_controller.dart';
import 'package:pet_care_mobile/features/hospital_history/domain/hospital_history.dart';
import 'package:pet_care_mobile/features/vaccine_history/application/vaccine_history_controller.dart';
import 'package:pet_care_mobile/features/vaccine_history/domain/vaccine_history.dart';
import 'package:pet_care_mobile/features/medicine_history/application/medicine_history_controller.dart';
import 'package:pet_care_mobile/features/medicine_history/domain/medicine_history.dart';
import 'package:pet_care_mobile/features/pet_diary/application/pet_diary_controller.dart';
import 'package:pet_care_mobile/features/pet_diary/domain/pet_diary.dart';

/// 予定編集画面
class EditScheduleScreen extends ConsumerStatefulWidget {
  final String type;
  final dynamic data;

  const EditScheduleScreen({
    super.key,
    required this.type,
    required this.data,
  });

  @override
  ConsumerState<EditScheduleScreen> createState() => _EditScheduleScreenState();
}

class _EditScheduleScreenState extends ConsumerState<EditScheduleScreen> {
  late DateTime _selectedDate;
  late TextEditingController _titleController;
  late TextEditingController _memoController;
  late TextEditingController _symptomController;
  late TextEditingController _feeController;

  // TODO: 将来の機能拡張用
  // String? _selectedHospital;
  // String? _selectedVaccine;
  // String? _selectedMedicine;
  // TimeOfDay? _medicineTime;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    _titleController = TextEditingController();
    _memoController = TextEditingController();
    _symptomController = TextEditingController();
    _feeController = TextEditingController();

    switch (widget.type) {
      case '通院':
        final history = widget.data as HospitalHistory;
        _selectedDate = history.date;
        _symptomController.text = history.symptom ?? '';
        _feeController.text = history.fee?.toString() ?? '';
        _memoController.text = history.memo ?? '';
        // _selectedHospital = history.hospitalId;
        break;
      case 'ワクチン':
        final history = widget.data as VaccineHistory;
        _selectedDate = history.date;
        _memoController.text = history.memo ?? '';
        // _selectedHospital = history.hospitalId;
        // _selectedVaccine = history.vaccineId;
        break;
      case '服薬':
        final history = widget.data as MedicineHistory;
        _selectedDate = history.date;
        _memoController.text = history.memo ?? '';
        // _selectedHospital = history.hospitalId;
        // _selectedMedicine = history.medicineId;
        break;
      case '日記':
        final diary = widget.data as PetDiary;
        _selectedDate = diary.date;
        _titleController.text = diary.title;
        _memoController.text = diary.content;
        break;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _memoController.dispose();
    _symptomController.dispose();
    _feeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(
          '${widget.type}を編集',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilledButton(
              onPressed: _saveSchedule,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateSelector(),
            const SizedBox(height: 16),
            _buildDynamicForm(),
          ],
        ),
      ),
    );
  }

  // 日付選択
  Widget _buildDateSelector() {
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
        children: [
          Row(
            children: [
              Icon(
                Icons.calendar_today_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                '日付',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: _selectDate,
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
                    DateFormat('yyyy年M月d日(E)', 'ja').format(_selectedDate),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 動的フォーム
  Widget _buildDynamicForm() {
    switch (widget.type) {
      case '通院':
        return _buildHospitalForm();
      case 'ワクチン':
        return _buildVaccineForm();
      case '服薬':
        return _buildMedicineForm();
      case '日記':
        return _buildDiaryForm();
      default:
        return const SizedBox.shrink();
    }
  }

  // 通院フォーム
  Widget _buildHospitalForm() {
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
        children: [
          _buildSectionTitle('症状', Icons.sick_rounded),
          const SizedBox(height: 12),
          TextField(
            controller: _symptomController,
            decoration: InputDecoration(
              hintText: '症状を入力',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          _buildSectionTitle('金額', Icons.payments_rounded),
          const SizedBox(height: 12),
          TextField(
            controller: _feeController,
            decoration: InputDecoration(
              hintText: '金額を入力',
              suffixText: '円',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          _buildSectionTitle('メモ', Icons.note_rounded),
          const SizedBox(height: 12),
          TextField(
            controller: _memoController,
            decoration: InputDecoration(
              hintText: 'メモを入力',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  // ワクチンフォーム
  Widget _buildVaccineForm() {
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
        children: [
          _buildSectionTitle('メモ', Icons.note_rounded),
          const SizedBox(height: 12),
          TextField(
            controller: _memoController,
            decoration: InputDecoration(
              hintText: 'メモを入力',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  // 服薬フォーム
  Widget _buildMedicineForm() {
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
        children: [
          _buildSectionTitle('メモ', Icons.note_rounded),
          const SizedBox(height: 12),
          TextField(
            controller: _memoController,
            decoration: InputDecoration(
              hintText: 'メモを入力',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }

  // 日記フォーム
  Widget _buildDiaryForm() {
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
        children: [
          _buildSectionTitle('タイトル', Icons.title_rounded),
          const SizedBox(height: 12),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'タイトルを入力',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildSectionTitle('内容', Icons.edit_note_rounded),
          const SizedBox(height: 12),
          TextField(
            controller: _memoController,
            decoration: InputDecoration(
              hintText: '今日の出来事を記録しましょう',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            maxLines: 6,
          ),
        ],
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

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      locale: const Locale('ja', 'JP'),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  Future<void> _saveSchedule() async {
    try {
      final now = DateTime.now();

      switch (widget.type) {
        case '通院':
          final oldHistory = widget.data as HospitalHistory;
          final updatedHistory = HospitalHistory(
            localId: oldHistory.localId,
            petId: oldHistory.petId,
            hospitalId: oldHistory.hospitalId,
            date: _selectedDate,
            symptom: _symptomController.text.isEmpty
                ? null
                : _symptomController.text,
            fee: _feeController.text.isEmpty
                ? null
                : int.tryParse(_feeController.text),
            memo: _memoController.text.isEmpty ? null : _memoController.text,
            updatedAt: now,
            deletedAt: null,
            syncState: 0,
          );

          await ref
              .read(hospitalHistoryControllerProvider.notifier)
              .upsert(updatedHistory);
          break;

        case 'ワクチン':
          final oldHistory = widget.data as VaccineHistory;
          final updatedHistory = VaccineHistory(
            localId: oldHistory.localId,
            petId: oldHistory.petId,
            hospitalId: oldHistory.hospitalId,
            vaccineId: oldHistory.vaccineId,
            date: _selectedDate,
            memo: _memoController.text.isEmpty ? null : _memoController.text,
            updatedAt: now,
            deletedAt: null,
            syncState: 0,
          );

          await ref
              .read(vaccineHistoryControllerProvider.notifier)
              .upsert(updatedHistory);
          break;

        case '服薬':
          final oldHistory = widget.data as MedicineHistory;
          final updatedHistory = MedicineHistory(
            localId: oldHistory.localId,
            petId: oldHistory.petId,
            hospitalId: oldHistory.hospitalId,
            medicineId: oldHistory.medicineId,
            date: _selectedDate,
            memo: _memoController.text.isEmpty ? null : _memoController.text,
            updatedAt: now,
            deletedAt: null,
            syncState: 0,
          );

          await ref
              .read(medicineHistoryControllerProvider.notifier)
              .upsert(updatedHistory);
          break;

        case '日記':
          if (_titleController.text.isEmpty) {
            _showErrorMessage('タイトルを入力してください');
            return;
          }
          if (_memoController.text.isEmpty) {
            _showErrorMessage('内容を入力してください');
            return;
          }

          final oldDiary = widget.data as PetDiary;
          final updatedDiary = PetDiary(
            localId: oldDiary.localId,
            petId: oldDiary.petId,
            date: _selectedDate,
            title: _titleController.text,
            content: _memoController.text,
            updatedAt: now,
            deletedAt: null,
            syncState: 0,
          );

          await ref
              .read(petDiaryControllerProvider.notifier)
              .upsert(updatedDiary);
          break;
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.type}を更新しました'),
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Colors.green,
          ),
        );

        // 詳細画面と編集画面の両方を閉じる
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        _showErrorMessage('更新に失敗しました: $e');
      }
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.red,
      ),
    );
  }
}

