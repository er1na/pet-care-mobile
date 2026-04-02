import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:pet_care_mobile/features/hospital_history/application/hospital_history_controller.dart';
import 'package:pet_care_mobile/features/hospital_history/domain/hospital_history.dart';
import 'package:pet_care_mobile/features/vaccine_history/application/vaccine_history_controller.dart';
import 'package:pet_care_mobile/features/vaccine_history/domain/vaccine_history.dart';
import 'package:pet_care_mobile/features/medicine_history/application/medicine_history_controller.dart';
import 'package:pet_care_mobile/features/medicine_history/domain/medicine_history.dart';
import 'package:pet_care_mobile/features/pet_diary/application/pet_diary_controller.dart';
import 'package:pet_care_mobile/features/pet_diary/domain/pet_diary.dart';
import 'package:pet_care_mobile/features/hospitals/application/hospital_controller.dart';
import 'package:pet_care_mobile/features/vaccines/application/vaccine_controller.dart';
import 'package:pet_care_mobile/features/medicine/application/medicine_controller.dart';
import 'package:pet_care_mobile/features/pets/application/selected_pets_provider.dart';
import 'package:pet_care_mobile/features/pets/application/pets_controller.dart';
import 'package:pet_care_mobile/ui/screens/add_hospital_screen.dart';
import 'package:pet_care_mobile/ui/screens/add_vaccine_screen.dart';
import 'package:pet_care_mobile/ui/screens/add_medicine_screen.dart';

/// 予定追加画面
class AddScheduleScreen extends ConsumerStatefulWidget {
  const AddScheduleScreen({super.key});

  @override
  ConsumerState<AddScheduleScreen> createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends ConsumerState<AddScheduleScreen> {
  final _uuid = const Uuid();
  // 予定の種類
  String _scheduleType = '通院';
  final List<String> _scheduleTypes = ['通院', 'ワクチン', '服薬', '日記'];

  // 日付
  DateTime _selectedDate = DateTime.now();

  // ペット選択
  String? _selectedPet;

  // 共通フィールド
  final _titleController = TextEditingController();
  final _memoController = TextEditingController();

  // 通院用フィールド
  final _symptomController = TextEditingController();
  final _feeController = TextEditingController();
  String? _selectedHospital;

  // ワクチン用フィールド
  String? _selectedVaccine;

  // 服薬用フィールド
  String? _selectedMedicine;
  TimeOfDay? _medicineTime;

  @override
  void initState() {
    super.initState();
    // 選択中のペットを初期値として設定
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedPetId = ref.read(selectedPetsProvider);
      if (selectedPetId != null) {
        setState(() {
          _selectedPet = selectedPetId;
        });
      }
    });
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
        title: const Text(
          '予定を追加',
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
            // 予定の種類選択
            _buildScheduleTypeSelector(),
            const SizedBox(height: 16),
            // ペット選択
            _buildPetSelector(),
            const SizedBox(height: 16),
            // 日付選択
            _buildDateSelector(),
            const SizedBox(height: 16),
            // 動的フォーム（予定の種類に応じて変わる）
            _buildDynamicForm(),
          ],
        ),
      ),
    );
  }

  // 予定の種類選択
  Widget _buildScheduleTypeSelector() {
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
                Icons.category_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                '予定の種類',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: _scheduleType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
            ),
            items:
                _scheduleTypes.map((type) {
                  IconData icon;
                  switch (type) {
                    case '通院':
                      icon = Icons.local_hospital_rounded;
                      break;
                    case 'ワクチン':
                      icon = Icons.vaccines_rounded;
                      break;
                    case '服薬':
                      icon = Icons.medication_rounded;
                      break;
                    case '日記':
                      icon = Icons.edit_note_rounded;
                      break;
                    default:
                      icon = Icons.event;
                  }
                  return DropdownMenuItem(
                    value: type,
                    child: Row(
                      children: [
                        Icon(icon, size: 20, color: Colors.grey.shade700),
                        const SizedBox(width: 12),
                        Text(type),
                      ],
                    ),
                  );
                }).toList(),
            onChanged: (value) {
              setState(() {
                _scheduleType = value!;
              });
            },
          ),
        ],
      ),
    );
  }

  // ペット選択
  Widget _buildPetSelector() {
    final petsAsync = ref.watch(petsControllerProvider);

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
                Icons.pets_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'ペット',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '*',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          petsAsync.when(
            data: (pets) {
              if (pets.isEmpty) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.orange.shade700),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'ペットを登録してください',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return DropdownButtonFormField<String>(
                value: _selectedPet,
                decoration: InputDecoration(
                  hintText: 'ペットを選択',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                items:
                    pets.map((pet) {
                      final sexIcon = pet.sex == 0 ? '♂' : '♀';
                      return DropdownMenuItem<String>(
                        value: pet.localId,
                        child: Row(
                          children: [
                            Icon(
                              Icons.pets,
                              size: 20,
                              color: Colors.grey.shade700,
                            ),
                            const SizedBox(width: 12),
                            Text('${pet.name} (${pet.kind} $sexIcon)'),
                          ],
                        ),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPet = value;
                  });
                },
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, st) => Text('エラー: $e'),
          ),
        ],
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

  // 動的フォーム（予定の種類に応じて変わる）
  Widget _buildDynamicForm() {
    switch (_scheduleType) {
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
    final hospitalsAsync = ref.watch(hospitalControllerProvider);

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
          // 病院選択
          _buildSectionTitle('病院', Icons.local_hospital_rounded),
          const SizedBox(height: 12),
          hospitalsAsync.when(
            data: (hospitals) {
              return DropdownButtonFormField<String>(
                value: _selectedHospital,
                decoration: InputDecoration(
                  hintText: hospitals.isEmpty ? '病院データを登録してください' : '病院を選択',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                items:
                    hospitals.map((hospital) {
                      return DropdownMenuItem<String>(
                        value: hospital.localId,
                        child: Text(hospital.name),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedHospital = value;
                  });
                },
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, st) => Text('エラー: $e'),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddHospitalScreen(),
                  ),
                );
                // 画面から戻った後、病院リストを更新
                setState(() {});
              },
              icon: const Icon(Icons.add_circle_outline, size: 18),
              label: const Text('新しい病院を登録'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // 症状
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
          // 金額
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
          // メモ
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
    final vaccinesAsync = ref.watch(vaccineControllerProvider);
    final hospitalsAsync = ref.watch(hospitalControllerProvider);

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
          // ワクチン種類
          _buildSectionTitle('ワクチン種類', Icons.vaccines_rounded),
          const SizedBox(height: 12),
          vaccinesAsync.when(
            data: (vaccines) {
              return DropdownButtonFormField<String>(
                value: _selectedVaccine,
                decoration: InputDecoration(
                  hintText: vaccines.isEmpty ? 'ワクチンデータを登録してください' : 'ワクチンを選択',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                items:
                    vaccines.map((vaccine) {
                      return DropdownMenuItem<String>(
                        value: vaccine.localId,
                        child: Text(vaccine.name),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedVaccine = value;
                  });
                },
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, st) => Text('エラー: $e'),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddVaccineScreen(),
                  ),
                );
                // 画面から戻った後、ワクチンリストを更新
                setState(() {});
              },
              icon: const Icon(Icons.add_circle_outline, size: 18),
              label: const Text('新しいワクチンを登録'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // 病院選択
          _buildSectionTitle('病院', Icons.local_hospital_rounded),
          const SizedBox(height: 12),
          hospitalsAsync.when(
            data: (hospitals) {
              return DropdownButtonFormField<String>(
                value: _selectedHospital,
                decoration: InputDecoration(
                  hintText: hospitals.isEmpty ? '病院データを登録してください' : '病院を選択',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                items:
                    hospitals.map((hospital) {
                      return DropdownMenuItem<String>(
                        value: hospital.localId,
                        child: Text(hospital.name),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedHospital = value;
                  });
                },
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, st) => Text('エラー: $e'),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddHospitalScreen(),
                  ),
                );
                // 画面から戻った後、病院リストを更新
                setState(() {});
              },
              icon: const Icon(Icons.add_circle_outline, size: 18),
              label: const Text('新しい病院を登録'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // メモ
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
    final medicinesAsync = ref.watch(medicineControllerProvider);
    final hospitalsAsync = ref.watch(hospitalControllerProvider);

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
          // 薬選択
          _buildSectionTitle('薬', Icons.medication_rounded),
          const SizedBox(height: 12),
          medicinesAsync.when(
            data: (medicines) {
              return DropdownButtonFormField<String>(
                value: _selectedMedicine,
                decoration: InputDecoration(
                  hintText: medicines.isEmpty ? '薬データを登録してください' : '薬を選択',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                items:
                    medicines.map((medicine) {
                      return DropdownMenuItem<String>(
                        value: medicine.localId,
                        child: Text(medicine.name),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedMedicine = value;
                  });
                },
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, st) => Text('エラー: $e'),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddMedicineScreen(),
                  ),
                );
                // 画面から戻った後、薬リストを更新
                setState(() {});
              },
              icon: const Icon(Icons.add_circle_outline, size: 18),
              label: const Text('新しい薬を登録'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // 服薬時間
          _buildSectionTitle('服薬時間', Icons.access_time_rounded),
          const SizedBox(height: 12),
          InkWell(
            onTap: _selectTime,
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
                    _medicineTime != null
                        ? _medicineTime!.format(context)
                        : '時間を選択',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color:
                          _medicineTime != null
                              ? Colors.black
                              : Colors.grey.shade600,
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
          const SizedBox(height: 16),
          // 病院選択
          _buildSectionTitle('病院', Icons.local_hospital_rounded),
          const SizedBox(height: 12),
          hospitalsAsync.when(
            data: (hospitals) {
              return DropdownButtonFormField<String>(
                value: _selectedHospital,
                decoration: InputDecoration(
                  hintText: hospitals.isEmpty ? '病院データを登録してください' : '病院を選択',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                items:
                    hospitals.map((hospital) {
                      return DropdownMenuItem<String>(
                        value: hospital.localId,
                        child: Text(hospital.name),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedHospital = value;
                  });
                },
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (e, st) => Text('エラー: $e'),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () async {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddHospitalScreen(),
                  ),
                );
                // 画面から戻った後、病院リストを更新
                setState(() {});
              },
              icon: const Icon(Icons.add_circle_outline, size: 18),
              label: const Text('新しい病院を登録'),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // メモ
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
          // タイトル
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
          // 内容
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

  // セクションタイトル
  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary, size: 20),
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

  // 日付選択
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

  // 時間選択
  Future<void> _selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: _medicineTime ?? TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        _medicineTime = time;
      });
    }
  }

  // 保存
  Future<void> _saveSchedule() async {
    try {
      final now = DateTime.now();

      // 選択したペットIDを確認
      if (_selectedPet == null) {
        _showErrorMessage('ペットを選択してください');
        return;
      }
      final petId = _selectedPet!;

      switch (_scheduleType) {
        case '通院':
          if (_selectedHospital == null) {
            _showErrorMessage('病院を選択してください');
            return;
          }

          final history = HospitalHistory(
            localId: _uuid.v4(),
            petId: petId,
            hospitalId: _selectedHospital!,
            date: _selectedDate,
            symptom:
                _symptomController.text.isEmpty
                    ? null
                    : _symptomController.text,
            fee:
                _feeController.text.isEmpty
                    ? null
                    : int.tryParse(_feeController.text),
            memo: _memoController.text.isEmpty ? null : _memoController.text,
            updatedAt: now,
            deletedAt: null,
            syncState: 0,
          );

          await ref
              .read(hospitalHistoryControllerProvider.notifier)
              .upsert(history);
          break;

        case 'ワクチン':
          if (_selectedVaccine == null) {
            _showErrorMessage('ワクチン種類を選択してください');
            return;
          }
          if (_selectedHospital == null) {
            _showErrorMessage('病院を選択してください');
            return;
          }

          final history = VaccineHistory(
            localId: _uuid.v4(),
            petId: petId,
            hospitalId: _selectedHospital!,
            vaccineId: _selectedVaccine!,
            date: _selectedDate,
            memo: _memoController.text.isEmpty ? null : _memoController.text,
            updatedAt: now,
            deletedAt: null,
            syncState: 0,
          );

          await ref
              .read(vaccineHistoryControllerProvider.notifier)
              .upsert(history);
          break;

        case '服薬':
          if (_selectedMedicine == null) {
            _showErrorMessage('薬を選択してください');
            return;
          }
          if (_selectedHospital == null) {
            _showErrorMessage('病院を選択してください');
            return;
          }

          final history = MedicineHistory(
            localId: _uuid.v4(),
            petId: petId,
            hospitalId: _selectedHospital!,
            medicineId: _selectedMedicine!,
            date: _selectedDate,
            memo: _memoController.text.isEmpty ? null : _memoController.text,
            updatedAt: now,
            deletedAt: null,
            syncState: 0,
          );

          await ref
              .read(medicineHistoryControllerProvider.notifier)
              .upsert(history);
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

          final diary = PetDiary(
            localId: _uuid.v4(),
            petId: petId,
            date: _selectedDate,
            title: _titleController.text,
            content: _memoController.text,
            updatedAt: now,
            deletedAt: null,
            syncState: 0,
          );

          await ref.read(petDiaryControllerProvider.notifier).upsert(diary);
          break;
      }

      // 保存成功メッセージ
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$_scheduleTypeを保存しました'),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.green,
          ),
        );

        // 画面を閉じる
        Navigator.of(context).pop();
      }
    } catch (e) {
      if (mounted) {
        _showErrorMessage('保存に失敗しました: $e');
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
