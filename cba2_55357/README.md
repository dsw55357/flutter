# Aplikacja Flutter: Logowanie i Rejestracja z SQLite

## Cel projektu
Celem projektu było stworzenie aplikacji mobilnej w Flutterze, która integruje interfejs użytkownika z lokalną bazą danych SQLite. Projekt demonstruje kluczowe funkcjonalności, takie jak logowanie, rejestracja oraz zarządzanie stanem użytkownika z wykorzystaniem `SharedPreferences`.

---

## Funkcjonalności

### Tworzenie interfejsu użytkownika
- Dynamiczne formularze z obsługą pól tekstowych:
  - Wykorzystanie `TextFormField` dla pól wejściowych.
  - Dodanie dekoracji (ikony, zaokrąglenia) i walidacji danych.
- Responsywne widżety, takie jak `CustomBackButton` i `SignInHeader`.
- Obsługa wizualna przycisków (`LoginButton` i `ActionPrompt`) z kolorami definiowanymi w `MyColors`.

### Formularze
- **Rejestracja**:
  - Pola dla imienia, adresu e-mail, hasła i potwierdzenia hasła.
  - Walidacja:
    - Sprawdzenie pustych pól.
    - Minimalna długość hasła (8 znaków).
    - Sprawdzenie zgodności hasła z potwierdzeniem.
- **Logowanie**:
  - Walidacja adresu e-mail i hasła.
  - Obsługa komunikatów o błędach dla niepoprawnych danych.

### Logika aplikacji
- **Nawigacja**:
  - Przechodzenie między ekranami rejestracji, logowania i ekranu głównego.
  - Obsługa powrotu do poprzedniego ekranu za pomocą `Navigator.canPop`.
  - Automatyczne przekierowanie na ekran główny po zalogowaniu.
- **Zarządzanie stanem**:
  - Ustawienie flagi `isLoggedIn` w `SharedPreferences` po zalogowaniu użytkownika.
  - Wylogowanie użytkownika i usunięcie flagi.

### Integracja z SQLite
- **Baza danych**:
  - Tabela `users` przechowująca informacje o użytkownikach: `name`, `email`, `password`.
  - Zabezpieczenie hasła poprzez hashowanie z użyciem biblioteki `crypto`.
- **Funkcjonalności**:
  - Rejestracja użytkownika:
    - Dodanie nowego rekordu do tabeli `users`.
    - Obsługa duplikatów adresów e-mail.
  - Logowanie użytkownika:
    - Weryfikacja poświadczeń w bazie danych.
    - Obsługa błędów przy niepoprawnych danych.

---

## Zestawienie klas i ich funkcji

### **1. `DatabaseHelper`**
Klasa zarządzająca operacjami na lokalnej bazie danych SQLite.

**Funkcje:**
- `get database`: Inicjalizuje lub zwraca istniejącą instancję bazy danych.
- `_initDB(String fileName)`: Tworzy nową bazę danych.
- `_createDB(Database db, int version)`: Tworzy tabelę `users`.
- `hashPassword(String password)`: Haszowanie haseł za pomocą SHA-256.
- `registerUser(String name, String email, String password)`: Dodaje użytkownika do bazy.
- `loginUser(String email, String password)`: Weryfikacja poświadczeń użytkownika.
- `close()`: Zamyka połączenie z bazą danych.

---

### **2. `LoginView`**
Widget obsługujący logowanie użytkownika.

**Funkcje:**
- `_validateEmail()`: Waliduje adres e-mail.
- `_validatePassword()`: Waliduje hasło pod kątem pustych wartości i minimalnej długości.
- `_validateOnSubmit()`: Sprawdza dane logowania i przekierowuje do ekranu głównego (`HomeView`).

---

### **3. `RegisterView`**
Widget do rejestracji nowego użytkownika.

**Funkcje:**
- `_validateField(FormFieldData field)`: Waliduje pola formularza.
- `_validateOnSubmit()`: Wywołuje `_registerUser` po poprawnej walidacji.
- `_registerUser(String name, String email, String password)`: Rejestruje nowego użytkownika w bazie danych.

---

### **4. `HomeView`**
Ekran główny aplikacji.

**Funkcje:**
- `_logout(BuildContext context)`: Wylogowuje użytkownika i przekierowuje do ekranu logowania.

---

### **5. Widżety i pomocnicze klasy**
- **`EmailInputField`**: Pole tekstowe dla adresu e-mail.
- **`PasswordInputField`**: Pole tekstowe dla hasła z możliwością zmiany widoczności.
- **`ForgetPasswordText`**: Obsługuje akcję "Zapomniałem hasła".
- **`LoginButton`**: Przycisk akcji (logowanie/rejestracja).
- **`ActionPrompt`**: Wyświetla pytanie i akcję, np. "Sign Up".
- **`CustomBackButton`**: Przycisk powrotu z obsługą powrotu do poprzedniego ekranu.

---

## Struktura projektu

### Główne pliki i katalogi:
- **`lib/`**: Główna logika aplikacji.
  - **`main.dart`**: Punkt wejścia aplikacji.
  - **`view/`**: Widoki aplikacji (logowanie, rejestracja, ekran główny).
  - **`utils/`**: Narzędzia pomocnicze, np. `MyColors`, `MyImages`, `DatabaseHelper`.
  - **`widgets/`**: Niestandardowe widżety, np. `EmailInputField`, `LoginButton`.

---

## Użyte technologie
- **Flutter SDK**: Framework do tworzenia aplikacji mobilnych.
- **Dart**: Język programowania używany w Flutterze.
- **SQLite**: Lokalne zarządzanie bazą danych.
- **crypto**: Zabezpieczenie haseł użytkowników poprzez hashowanie.
- **SharedPreferences**: Przechowywanie flagi `isLoggedIn`.

---

## Możliwe ulepszenia
1. **Obsługa błędów**:
   - Dodanie bardziej szczegółowych komunikatów o błędach.
2. **Rozszerzenie bazy danych**:
   - Dodanie dodatkowych kolumn, np. `created_at` i `updated_at`.
3. **Testy jednostkowe**:
   - Testowanie walidacji formularzy i funkcji logowania/rejestracji.
4. **Integracja z backendem**:
   - Synchronizacja danych z serwerem.
5. **Personalizacja UI**:
   - Dodanie animacji przy przejściach między ekranami.

---

## Podsumowanie
Projekt jest solidną podstawą aplikacji mobilnej w Flutterze, integrującą lokalną bazę danych i funkcjonalności logowania oraz rejestracji. Dzięki modularnej strukturze kodu, aplikacja jest łatwa w rozwoju i dostosowaniu do nowych wymagań.
