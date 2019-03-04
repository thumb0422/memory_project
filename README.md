# memory_project
#1,增加json解析：json_serializable
    
    (1), First of all add the following dependencies to your pubspec.yaml:
    
        dependencies:
          # Your other regular dependencies here
          json_annotation: ^2.0.0

        dev_dependencies:
          # Your other dev_dependencies here
          build_runner: ^1.0.0
          json_serializable: ^2.0.0
      
    (2),Add code
         factory AClass.fromJson(Map<String, dynamic> json) => _$AClassFromJson(json);
         Map<String, dynamic> toJson() => _$AClassToJson(this);
        
    (3),First create a build.yaml file in your Flutter application project
      
        targets:
          $default:
            builders:
              json_serializable:
                options:
                  # Options configure how source code is generated for every
                  # `@JsonSerializable`-annotated class in the package.
                  #
                  # The default value for each is listed.
                  #
                  # For usage information, reference the corresponding field in
                  # `JsonSerializableGenerator`.
                  any_map: false
                  checked: false
                  create_factory: true
                  create_to_json: true
                  disallow_unrecognized_keys: false
                  explicit_to_json: false
                  field_rename: none
                  generate_to_json_function: true
                  include_if_null: true
                  nullable: true
                  use_wrappers: false
                 
                 
    (4), open up your terminal in your project root and type the following:
        
         1,flutter packages pub run build_runner build
         1,flutter packages pub run build_runner watch
        
