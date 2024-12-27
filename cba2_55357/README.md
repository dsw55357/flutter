# Sprawozdanie z projektu: 

## **Informacje ogólne**
**Nazwa projektu**: Programowanie aplikacji mobilnych   
**Repozytorium**: [GitHub Repository](https://github.com/dsw55357/flutter/tree/main/cba2_55357)  
**Autor**: dsw55357  
**Technologia**: Flutter - Framework do tworzenia aplikacji mobilnych, webowych i desktopowych.  

## **Cel projektu**
Celem projektu było opracowanie aplikacji mobilnej w Flutterze, która demonstruje określone funkcjonalności. Możliwe aspekty do zaimplementowania obejmują obsługę interfejsu użytkownika, logikę biznesową oraz integrację z usługami backendowymi.

## **Funkcjonalności**
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


## **Główne komponenty projektu**
### 1. **Formularz logowania**
   - Pole e-mail z walidacją
   - Pole hasła z możliwością ukrycia/odsłonięcia
   
   ```dart
   TextFormField(
     decoration: InputDecoration(
       labelText: 'Email',
       prefixIcon: Icon(Icons.email),
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(12),
       ),
     ),
     keyboardType: TextInputType.emailAddress,
   );
   ```
### 2. **Formularz rejestracji**
   - Dynamicznie generowane pola na podstawie listy FormFieldData:
   ```dart
      final List<FormFieldData> _formFields = [
      FormFieldData(name: 'name', controller: TextEditingController(), ...),
      FormFieldData(name: 'email', controller: TextEditingController(), ...),
      FormFieldData(name: 'password', controller: TextEditingController(), ...),
      FormFieldData(name: 'passwordCon', controller: TextEditingController(), ...),
      ];
   ```
### 3. **Nawigacja między ekranami**
   - Obsługa nawigacji za pomocą **Navigator.push()** i **Navigator.pop()**.
   - Tworzenie zorganizowanej struktury aplikacji z oddzielnymi ekranami.

### 4. **Wylogowanie użytkownika**
   ```dart
   Future<void> _logout(BuildContext context) async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.remove('isLoggedIn');
   Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginView()),
   );
   }
   ```


### 5. **Zarządzanie stanem**
   - Proste zarządzanie stanem dla kontroli interakcji użytkownika.
   - Wykorzystanie **TextEditingController** do obsługi danych wprowadzanych w formularzu.

## **Struktura kodu**
- **Główne pliki i katalogi**:
  - `lib/`: Zawiera główną logikę aplikacji Flutter.
  - `main.dart`: Punkt wejścia aplikacji.
  - `view/`: Widoki aplikacji (logowanie, rejestracja, ekran główny).
  - `utils/`: Narzędzia pomocnicze, takie jak kolory (MyColors) i obrazy (MyImages).
  - `widgets/`: Niestandardowe widżety, takie jak LoginButton i CustomBackButton.
  - `utils/database_helper.dart`: Klasa zarządzająca bazą danych SQLite.

## **Użyte technologie**
- **Flutter SDK**: Framework do budowy aplikacji wieloplatformowych.
- **Dart**: Język programowania używany w Flutterze.
- **Pub.dev**: Użycie zależności (np. `flutter_form_builder` lub `provider`, jeśli są używane).
- **SQLite**: Lokalne zarządzanie bazą danych.
- **crypto**: Zabezpieczenie haseł użytkowników poprzez hashowanie.
- **SharedPreferences**: Przechowywanie flagi isLoggedIn.


## **Możliwe ulepszenia**
1. **Rozszerzenie funkcjonalności UI**:
   - Dodanie efektów animacji, np. przy przejściu między ekranami.

2. **Poprawa walidacji danych**:
   - Dodanie bardziej zaawansowanych reguł walidacji (np. sprawdzanie siły hasła).

3. **Integracja z backendem:**:
   - Synchronizacja danych z serwerem.

4. **Testy jednostkowe**:
   - Dodanie testów dla kluczowych funkcji aplikacji, np. walidacji danych w formularzu.
5. **Rozszerzenie bazy danych**:
   - Dodanie dodatkowych kolumn, takich jak created_at i updated_at.

## **Podsumowanie**
Projekt wprowadza w podstawową aplikację mobilną z wykorzystaniem Fluttera. Kluczowym aspektem projektu jest dobre zrozumienie podstaw Fluttera i jego możliwości w zakresie budowy interfejsu użytkownika oraz logiki aplikacji. Repozytorium jest dobrym punktem wyjścia do rozwijania bardziej złożonych aplikacji.

