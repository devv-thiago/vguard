# VGuard

**VGuard** is a lightweight and fluent validation library for Dart and Flutter, designed to simplify input validations through a chainable API.



## 🚀 Getting Started

### a) Adding the package to your `pubspec.yaml`

```yaml
dependencies:
  vguard: ^1.0.0
```

### b) Or add via Dart CLI:

```bash
dart pub add vguard
```

Once added, import the package in your Dart or Flutter file:

```dart
import 'package:vguard/src/utils/extensions.dart';
```



## 🧪 How To Use

### Basic Example

```dart
final result = ValidationChain("email@example.com")
  .isRequired()
  .isEmail()
  .run();

if (!result.isValid) {
  print(result.errors);
}
```

### Password Validation

```dart
final result = ValidationChain("MyStrong@Pass123")
  .isSecurePassword(highSecurityValidation: true)
  .run();

if (!result.isValid) {
  print(result.errors);
}
```



## 🔧 Available Validators

You can build custom validation chains with any of the following validators:

| Validator              | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `isRequired()`         | Ensures the value is not null or empty                                      |
| `isEmail()`            | Validates if the value is a properly formatted email                        |
| `isMinimumLength(n)`   | Validates that the value has at least `n` characters                        |
| `isMaximumLength(n)`   | Validates that the value has at most `n` characters                         |
| `isSecurePassword()`   | Validates password strength (standard or strict mode based on your needs)   |


## 💡 Validation Result

The result of the validation is an instance of `ValidationResult`, which includes:

```dart
bool isValid;
List<String> errors;
```

Use `isValid` to check the result and `errors` to get the list of failed messages.



## 📂 Example

You can find more examples in the [`example`](example) folder.




## 🧩 Contributing

Contributions are welcome and appreciated!

If you have ideas, bugs to report, or features to suggest:

- Open an issue with an appropriate label.
- Follow Conventional Commits and Semantic Versioning for PRs.
- Don't forget to star the project!

---

## 📬 Contact

**Maintainer:** devv-thiago

- GitHub: [https://github.com/devv-thiago](https://github.com/your-profile)



## 🙌 Acknowledgements

Inspired by clean, expressive, and maintainable validation APIs.

