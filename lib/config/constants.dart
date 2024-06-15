interface class Constants {
  static const apiKey = String.fromEnvironment(
    'apiKey',
    defaultValue: '89234d7971a2aac87c5da4cc3c56a06c989fb49c',
  );
  static const baseUrl = 'https://api.todoist.com';
  static const apiV2Path = '/rest/v2';
  static const apiSyncPath = '/sync/v9';
}
