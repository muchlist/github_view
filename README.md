# github_view

# Generate Code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch --delete-conflicting-outputs
```

Catatan  
DTO merupakan representasi dari balikan api  
Domain/entity merupakan data yang benar benar akan dikonsumsi aplikasi. sehingga DTO harus dijadikan domain terlebih dahulu
Service adalah cara bagaimana mendapatkan dto, entah local atau remote service

contoh domain lib\github\detail\domain\github_repo_detail.dart
contoh dto lib\github\core\infrastructure\github_repo_dto.dart