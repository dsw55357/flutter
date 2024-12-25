# Sprawozdanie z projektu Flutter: CBA2_55357

## **Informacje ogólne**
**Nazwa projektu**: Flutter - CBA2_55357  
**Repozytorium**: [GitHub Repository](https://github.com/dsw55357/flutter/tree/main/cba2_55357)  
**Autor**: dsw55357  
**Technologia**: Flutter - Framework do tworzenia aplikacji mobilnych, webowych i desktopowych.  

## **Cel projektu**
Celem projektu było opracowanie aplikacji mobilnej w Flutterze, która demonstruje określone funkcjonalności. Możliwe aspekty do zaimplementowania obejmują obsługę interfejsu użytkownika, logikę biznesową oraz integrację z usługami backendowymi.

## **Funkcjonalności**
Z analizowanego repozytorium wynika, że projekt koncentruje się na:
1. **Tworzeniu interfejsu użytkownika**:
   - Wykorzystanie komponentów Flutter takich jak **TextFormField**, **Buttons**, czy **Icons**.
   - Projektowanie responsywnych ekranów.

2. **Formularze**:
   - Obsługa pól wejściowych dla danych takich jak e-mail i hasło.
   - Walidacja danych wejściowych.

3. **Logika aplikacji**:
   - Implementacja podstawowej logiki nawigacji między ekranami.
   - Zarządzanie stanem aplikacji.

4. **Integracja wizualna**:
   - Użycie widgetów dekoracyjnych takich jak **OutlineInputBorder** i **Icons**.
   - Personalizacja elementów UI, w tym obsługa stylów, kolorów i zaokrągleń.

## **Główne komponenty projektu**
### 1. **Formularz logowania**
   - Wykorzystanie **TextFormField** z dekoracją oraz walidacją:
     - **HintText** i **LabelText** dla wskazówek dla użytkownika.
     - **PrefixIcon** dla wizualnego wsparcia wprowadzania danych (np. ikona e-mail).
   
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

### 2. **Nawigacja między ekranami**
   - Obsługa nawigacji za pomocą **Navigator.push()** i **Navigator.pop()**.
   - Tworzenie zorganizowanej struktury aplikacji z oddzielnymi ekranami.

### 3. **Zarządzanie stanem**
   - Proste zarządzanie stanem dla kontroli interakcji użytkownika.
   - Wykorzystanie **TextEditingController** do obsługi danych wprowadzanych w formularzu.

## **Struktura kodu**
- **Główne pliki i katalogi**:
  - `lib/`: Zawiera główną logikę aplikacji Flutter.
  - `main.dart`: Punkt wejścia aplikacji.
  - Dodatkowe pliki zawierające widoki, komponenty UI i logikę biznesową.

## **Wykorzystane narzędzia i technologie**
- **Flutter SDK**: Framework do budowy aplikacji wieloplatformowych.
- **Dart**: Język programowania używany w Flutterze.
- **Pub.dev**: Użycie zależności (np. `flutter_form_builder` lub `provider`, jeśli są używane).

## **Możliwe ulepszenia**
1. **Rozszerzenie funkcjonalności UI**:
   - Dodanie efektów animacji, np. przy przejściu między ekranami.
   - Lepsze dostosowanie aplikacji do urządzeń o różnych rozdzielczościach.

2. **Poprawa walidacji danych**:
   - Dodanie bardziej zaawansowanych reguł walidacji (np. sprawdzanie siły hasła).

3. **Integracja z backendem**:
   - Podłączenie aplikacji do API, np. dla autoryzacji użytkownika.

4. **Testy jednostkowe**:
   - Dodanie testów dla kluczowych funkcji aplikacji, np. walidacji danych w formularzu.

## **Podsumowanie**
Projekt **CBA2_55357** wprowadza podstawową aplikację mobilną z wykorzystaniem Fluttera. Kluczowym aspektem projektu jest dobre zrozumienie podstaw Fluttera i jego możliwości w zakresie budowy interfejsu użytkownika oraz logiki aplikacji. Repozytorium jest dobrym punktem wyjścia do rozwijania bardziej złożonych aplikacji.

