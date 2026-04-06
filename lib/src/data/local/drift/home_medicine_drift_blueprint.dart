class HomeMedicineDriftBlueprint {
  const HomeMedicineDriftBlueprint._();

  static const currentSchemaVersion = 1;

  static const notes = [
    'This repository currently ships a compile-friendly architecture scaffold.',
    'Once Flutter SDK is installed, add generated Drift tables with build_runner.',
    'The SQL below mirrors the current domain model and repository boundaries.',
  ];

  static const createStatements = <String>[
    '''
    CREATE TABLE family_members (
      id TEXT PRIMARY KEY,
      name TEXT NOT NULL,
      relation TEXT NOT NULL,
      avatar_color_hex TEXT NOT NULL,
      is_system_default INTEGER NOT NULL,
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL
    );
    ''',
    '''
    CREATE TABLE medicine_items (
      id TEXT PRIMARY KEY,
      member_id TEXT NOT NULL,
      name TEXT NOT NULL,
      generic_name TEXT,
      specification TEXT NOT NULL,
      dosage_form TEXT NOT NULL,
      category TEXT,
      indication TEXT,
      storage_notes TEXT,
      cover_image_asset_id TEXT,
      source TEXT NOT NULL,
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL,
      FOREIGN KEY(member_id) REFERENCES family_members(id)
    );
    ''',
    '''
    CREATE TABLE medicine_batches (
      id TEXT PRIMARY KEY,
      medicine_item_id TEXT NOT NULL,
      quantity REAL NOT NULL,
      unit TEXT NOT NULL,
      expiry_date TEXT NOT NULL,
      low_stock_threshold REAL NOT NULL,
      status TEXT NOT NULL,
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL,
      FOREIGN KEY(medicine_item_id) REFERENCES medicine_items(id)
    );
    ''',
    '''
    CREATE TABLE visit_records (
      id TEXT PRIMARY KEY,
      member_id TEXT NOT NULL,
      visit_date TEXT NOT NULL,
      hospital_name TEXT,
      department TEXT,
      diagnosis_summary TEXT NOT NULL,
      doctor_name TEXT,
      status TEXT NOT NULL,
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL,
      FOREIGN KEY(member_id) REFERENCES family_members(id)
    );
    ''',
    '''
    CREATE TABLE medical_document_records (
      id TEXT PRIMARY KEY,
      visit_record_id TEXT NOT NULL,
      document_type TEXT NOT NULL,
      summary TEXT NOT NULL,
      extracted_text TEXT NOT NULL,
      key_indicators TEXT,
      image_asset_ids TEXT NOT NULL,
      source TEXT NOT NULL,
      prescription_medicines TEXT NOT NULL,
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL,
      FOREIGN KEY(visit_record_id) REFERENCES visit_records(id)
    );
    ''',
    '''
    CREATE TABLE recognition_drafts (
      id TEXT PRIMARY KEY,
      draft_type TEXT NOT NULL,
      member_id TEXT NOT NULL,
      status TEXT NOT NULL,
      recognized_payload TEXT NOT NULL,
      missing_fields TEXT NOT NULL,
      confidence_hints TEXT NOT NULL,
      image_asset_ids TEXT NOT NULL,
      error_message TEXT,
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL
    );
    ''',
    '''
    CREATE TABLE local_image_assets (
      id TEXT PRIMARY KEY,
      local_path TEXT NOT NULL,
      file_name TEXT NOT NULL,
      mime_type TEXT NOT NULL,
      file_size INTEGER NOT NULL,
      width INTEGER NOT NULL,
      height INTEGER NOT NULL,
      created_at TEXT NOT NULL
    );
    ''',
  ];
}
