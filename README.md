# memory_project
#1,增加json解析：json_parser
    
    (1), First of all add the following dependencies to your pubspec.yaml:
    
        dependencies:
          json_parser: ^0.1.8
          build_runner: ^0.10.1+1
      
    (2),
        void main() {
          initializeReflectable();
        }
        
    (3),First create a build.yaml file in your Flutter application project
      
        targets:
          $default:
            builders:
              reflectable:
                generate_for:
                  - lib/main.dart
                options:
                  formatted: true
                 
                 
    (4), open up your terminal in your project root and type the following:
        
        flutter packages pub run build_runner build
        
    (5),you will see a generated .reflectable.dart file. 
      Import the generated class in your main() entry class