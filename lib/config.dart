enum Environment { dev, stage, prod }

final env = String.fromEnvironment('FLAVOR', defaultValue: Environment.dev.name);

bool isProduction() => env == Environment.prod.name;
bool isDevelopment() => env == Environment.dev.name;
bool isStage() => env == Environment.stage.name;
