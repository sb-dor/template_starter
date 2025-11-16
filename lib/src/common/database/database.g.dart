// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LogTblTable extends LogTbl with TableInfo<$LogTblTable, Log> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stackMeta = const VerificationMeta('stack');
  @override
  late final GeneratedColumn<String> stack = GeneratedColumn<String>(
    'stack',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, time, level, message, stack];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'log_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<Log> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    } else if (isInserting) {
      context.missing(_levelMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('stack')) {
      context.handle(
        _stackMeta,
        stack.isAcceptableOrUnknown(data['stack']!, _stackMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Log map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Log(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}time'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      stack: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stack'],
      ),
    );
  }

  @override
  $LogTblTable createAlias(String alias) {
    return $LogTblTable(attachedDatabase, alias);
  }
}

class Log extends DataClass implements Insertable<Log> {
  final int id;
  final int time;
  final int level;
  final String message;
  final String? stack;
  const Log({
    required this.id,
    required this.time,
    required this.level,
    required this.message,
    this.stack,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['time'] = Variable<int>(time);
    map['level'] = Variable<int>(level);
    map['message'] = Variable<String>(message);
    if (!nullToAbsent || stack != null) {
      map['stack'] = Variable<String>(stack);
    }
    return map;
  }

  LogTblCompanion toCompanion(bool nullToAbsent) {
    return LogTblCompanion(
      id: Value(id),
      time: Value(time),
      level: Value(level),
      message: Value(message),
      stack: stack == null && nullToAbsent
          ? const Value.absent()
          : Value(stack),
    );
  }

  factory Log.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Log(
      id: serializer.fromJson<int>(json['id']),
      time: serializer.fromJson<int>(json['time']),
      level: serializer.fromJson<int>(json['level']),
      message: serializer.fromJson<String>(json['message']),
      stack: serializer.fromJson<String?>(json['stack']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'time': serializer.toJson<int>(time),
      'level': serializer.toJson<int>(level),
      'message': serializer.toJson<String>(message),
      'stack': serializer.toJson<String?>(stack),
    };
  }

  Log copyWith({
    int? id,
    int? time,
    int? level,
    String? message,
    Value<String?> stack = const Value.absent(),
  }) => Log(
    id: id ?? this.id,
    time: time ?? this.time,
    level: level ?? this.level,
    message: message ?? this.message,
    stack: stack.present ? stack.value : this.stack,
  );
  Log copyWithCompanion(LogTblCompanion data) {
    return Log(
      id: data.id.present ? data.id.value : this.id,
      time: data.time.present ? data.time.value : this.time,
      level: data.level.present ? data.level.value : this.level,
      message: data.message.present ? data.message.value : this.message,
      stack: data.stack.present ? data.stack.value : this.stack,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Log(')
          ..write('id: $id, ')
          ..write('time: $time, ')
          ..write('level: $level, ')
          ..write('message: $message, ')
          ..write('stack: $stack')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, time, level, message, stack);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Log &&
          other.id == this.id &&
          other.time == this.time &&
          other.level == this.level &&
          other.message == this.message &&
          other.stack == this.stack);
}

class LogTblCompanion extends UpdateCompanion<Log> {
  final Value<int> id;
  final Value<int> time;
  final Value<int> level;
  final Value<String> message;
  final Value<String?> stack;
  const LogTblCompanion({
    this.id = const Value.absent(),
    this.time = const Value.absent(),
    this.level = const Value.absent(),
    this.message = const Value.absent(),
    this.stack = const Value.absent(),
  });
  LogTblCompanion.insert({
    this.id = const Value.absent(),
    this.time = const Value.absent(),
    required int level,
    required String message,
    this.stack = const Value.absent(),
  }) : level = Value(level),
       message = Value(message);
  static Insertable<Log> custom({
    Expression<int>? id,
    Expression<int>? time,
    Expression<int>? level,
    Expression<String>? message,
    Expression<String>? stack,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (time != null) 'time': time,
      if (level != null) 'level': level,
      if (message != null) 'message': message,
      if (stack != null) 'stack': stack,
    });
  }

  LogTblCompanion copyWith({
    Value<int>? id,
    Value<int>? time,
    Value<int>? level,
    Value<String>? message,
    Value<String?>? stack,
  }) {
    return LogTblCompanion(
      id: id ?? this.id,
      time: time ?? this.time,
      level: level ?? this.level,
      message: message ?? this.message,
      stack: stack ?? this.stack,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (stack.present) {
      map['stack'] = Variable<String>(stack.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogTblCompanion(')
          ..write('id: $id, ')
          ..write('time: $time, ')
          ..write('level: $level, ')
          ..write('message: $message, ')
          ..write('stack: $stack')
          ..write(')'))
        .toString();
  }
}

class $LogPrefixTblTable extends LogPrefixTbl
    with TableInfo<$LogPrefixTblTable, LogPrefixTblData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogPrefixTblTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _prefixMeta = const VerificationMeta('prefix');
  @override
  late final GeneratedColumn<String> prefix = GeneratedColumn<String>(
    'prefix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _logIdMeta = const VerificationMeta('logId');
  @override
  late final GeneratedColumn<int> logId = GeneratedColumn<int>(
    'log_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES log_tbl (id)',
    ),
  );
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lenMeta = const VerificationMeta('len');
  @override
  late final GeneratedColumn<int> len = GeneratedColumn<int>(
    'len',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [prefix, logId, word, len];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'log_prefix_tbl';
  @override
  VerificationContext validateIntegrity(
    Insertable<LogPrefixTblData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('prefix')) {
      context.handle(
        _prefixMeta,
        prefix.isAcceptableOrUnknown(data['prefix']!, _prefixMeta),
      );
    } else if (isInserting) {
      context.missing(_prefixMeta);
    }
    if (data.containsKey('log_id')) {
      context.handle(
        _logIdMeta,
        logId.isAcceptableOrUnknown(data['log_id']!, _logIdMeta),
      );
    } else if (isInserting) {
      context.missing(_logIdMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
        _wordMeta,
        word.isAcceptableOrUnknown(data['word']!, _wordMeta),
      );
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('len')) {
      context.handle(
        _lenMeta,
        len.isAcceptableOrUnknown(data['len']!, _lenMeta),
      );
    } else if (isInserting) {
      context.missing(_lenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {prefix, logId, word};
  @override
  LogPrefixTblData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LogPrefixTblData(
      prefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prefix'],
      )!,
      logId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}log_id'],
      )!,
      word: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word'],
      )!,
      len: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}len'],
      )!,
    );
  }

  @override
  $LogPrefixTblTable createAlias(String alias) {
    return $LogPrefixTblTable(attachedDatabase, alias);
  }
}

class LogPrefixTblData extends DataClass
    implements Insertable<LogPrefixTblData> {
  final String prefix;
  final int logId;
  final String word;
  final int len;
  const LogPrefixTblData({
    required this.prefix,
    required this.logId,
    required this.word,
    required this.len,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['prefix'] = Variable<String>(prefix);
    map['log_id'] = Variable<int>(logId);
    map['word'] = Variable<String>(word);
    map['len'] = Variable<int>(len);
    return map;
  }

  LogPrefixTblCompanion toCompanion(bool nullToAbsent) {
    return LogPrefixTblCompanion(
      prefix: Value(prefix),
      logId: Value(logId),
      word: Value(word),
      len: Value(len),
    );
  }

  factory LogPrefixTblData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LogPrefixTblData(
      prefix: serializer.fromJson<String>(json['prefix']),
      logId: serializer.fromJson<int>(json['logId']),
      word: serializer.fromJson<String>(json['word']),
      len: serializer.fromJson<int>(json['len']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'prefix': serializer.toJson<String>(prefix),
      'logId': serializer.toJson<int>(logId),
      'word': serializer.toJson<String>(word),
      'len': serializer.toJson<int>(len),
    };
  }

  LogPrefixTblData copyWith({
    String? prefix,
    int? logId,
    String? word,
    int? len,
  }) => LogPrefixTblData(
    prefix: prefix ?? this.prefix,
    logId: logId ?? this.logId,
    word: word ?? this.word,
    len: len ?? this.len,
  );
  LogPrefixTblData copyWithCompanion(LogPrefixTblCompanion data) {
    return LogPrefixTblData(
      prefix: data.prefix.present ? data.prefix.value : this.prefix,
      logId: data.logId.present ? data.logId.value : this.logId,
      word: data.word.present ? data.word.value : this.word,
      len: data.len.present ? data.len.value : this.len,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LogPrefixTblData(')
          ..write('prefix: $prefix, ')
          ..write('logId: $logId, ')
          ..write('word: $word, ')
          ..write('len: $len')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(prefix, logId, word, len);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogPrefixTblData &&
          other.prefix == this.prefix &&
          other.logId == this.logId &&
          other.word == this.word &&
          other.len == this.len);
}

class LogPrefixTblCompanion extends UpdateCompanion<LogPrefixTblData> {
  final Value<String> prefix;
  final Value<int> logId;
  final Value<String> word;
  final Value<int> len;
  final Value<int> rowid;
  const LogPrefixTblCompanion({
    this.prefix = const Value.absent(),
    this.logId = const Value.absent(),
    this.word = const Value.absent(),
    this.len = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LogPrefixTblCompanion.insert({
    required String prefix,
    required int logId,
    required String word,
    required int len,
    this.rowid = const Value.absent(),
  }) : prefix = Value(prefix),
       logId = Value(logId),
       word = Value(word),
       len = Value(len);
  static Insertable<LogPrefixTblData> custom({
    Expression<String>? prefix,
    Expression<int>? logId,
    Expression<String>? word,
    Expression<int>? len,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (prefix != null) 'prefix': prefix,
      if (logId != null) 'log_id': logId,
      if (word != null) 'word': word,
      if (len != null) 'len': len,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LogPrefixTblCompanion copyWith({
    Value<String>? prefix,
    Value<int>? logId,
    Value<String>? word,
    Value<int>? len,
    Value<int>? rowid,
  }) {
    return LogPrefixTblCompanion(
      prefix: prefix ?? this.prefix,
      logId: logId ?? this.logId,
      word: word ?? this.word,
      len: len ?? this.len,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (prefix.present) {
      map['prefix'] = Variable<String>(prefix.value);
    }
    if (logId.present) {
      map['log_id'] = Variable<int>(logId.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (len.present) {
      map['len'] = Variable<int>(len.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogPrefixTblCompanion(')
          ..write('prefix: $prefix, ')
          ..write('logId: $logId, ')
          ..write('word: $word, ')
          ..write('len: $len, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LogTblTable logTbl = $LogTblTable(this);
  late final $LogPrefixTblTable logPrefixTbl = $LogPrefixTblTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [logTbl, logPrefixTbl];
}

typedef $$LogTblTableCreateCompanionBuilder =
    LogTblCompanion Function({
      Value<int> id,
      Value<int> time,
      required int level,
      required String message,
      Value<String?> stack,
    });
typedef $$LogTblTableUpdateCompanionBuilder =
    LogTblCompanion Function({
      Value<int> id,
      Value<int> time,
      Value<int> level,
      Value<String> message,
      Value<String?> stack,
    });

final class $$LogTblTableReferences
    extends BaseReferences<_$AppDatabase, $LogTblTable, Log> {
  $$LogTblTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LogPrefixTblTable, List<LogPrefixTblData>>
  _logPrefixTblRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.logPrefixTbl,
    aliasName: $_aliasNameGenerator(db.logTbl.id, db.logPrefixTbl.logId),
  );

  $$LogPrefixTblTableProcessedTableManager get logPrefixTblRefs {
    final manager = $$LogPrefixTblTableTableManager(
      $_db,
      $_db.logPrefixTbl,
    ).filter((f) => f.logId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_logPrefixTblRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LogTblTableFilterComposer
    extends Composer<_$AppDatabase, $LogTblTable> {
  $$LogTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stack => $composableBuilder(
    column: $table.stack,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> logPrefixTblRefs(
    Expression<bool> Function($$LogPrefixTblTableFilterComposer f) f,
  ) {
    final $$LogPrefixTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.logPrefixTbl,
      getReferencedColumn: (t) => t.logId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogPrefixTblTableFilterComposer(
            $db: $db,
            $table: $db.logPrefixTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LogTblTableOrderingComposer
    extends Composer<_$AppDatabase, $LogTblTable> {
  $$LogTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stack => $composableBuilder(
    column: $table.stack,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LogTblTableAnnotationComposer
    extends Composer<_$AppDatabase, $LogTblTable> {
  $$LogTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<String> get stack =>
      $composableBuilder(column: $table.stack, builder: (column) => column);

  Expression<T> logPrefixTblRefs<T extends Object>(
    Expression<T> Function($$LogPrefixTblTableAnnotationComposer a) f,
  ) {
    final $$LogPrefixTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.logPrefixTbl,
      getReferencedColumn: (t) => t.logId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogPrefixTblTableAnnotationComposer(
            $db: $db,
            $table: $db.logPrefixTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LogTblTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LogTblTable,
          Log,
          $$LogTblTableFilterComposer,
          $$LogTblTableOrderingComposer,
          $$LogTblTableAnnotationComposer,
          $$LogTblTableCreateCompanionBuilder,
          $$LogTblTableUpdateCompanionBuilder,
          (Log, $$LogTblTableReferences),
          Log,
          PrefetchHooks Function({bool logPrefixTblRefs})
        > {
  $$LogTblTableTableManager(_$AppDatabase db, $LogTblTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LogTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LogTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LogTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> time = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<String?> stack = const Value.absent(),
              }) => LogTblCompanion(
                id: id,
                time: time,
                level: level,
                message: message,
                stack: stack,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> time = const Value.absent(),
                required int level,
                required String message,
                Value<String?> stack = const Value.absent(),
              }) => LogTblCompanion.insert(
                id: id,
                time: time,
                level: level,
                message: message,
                stack: stack,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LogTblTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({logPrefixTblRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (logPrefixTblRefs) db.logPrefixTbl],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (logPrefixTblRefs)
                    await $_getPrefetchedData<
                      Log,
                      $LogTblTable,
                      LogPrefixTblData
                    >(
                      currentTable: table,
                      referencedTable: $$LogTblTableReferences
                          ._logPrefixTblRefsTable(db),
                      managerFromTypedResult: (p0) => $$LogTblTableReferences(
                        db,
                        table,
                        p0,
                      ).logPrefixTblRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.logId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LogTblTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LogTblTable,
      Log,
      $$LogTblTableFilterComposer,
      $$LogTblTableOrderingComposer,
      $$LogTblTableAnnotationComposer,
      $$LogTblTableCreateCompanionBuilder,
      $$LogTblTableUpdateCompanionBuilder,
      (Log, $$LogTblTableReferences),
      Log,
      PrefetchHooks Function({bool logPrefixTblRefs})
    >;
typedef $$LogPrefixTblTableCreateCompanionBuilder =
    LogPrefixTblCompanion Function({
      required String prefix,
      required int logId,
      required String word,
      required int len,
      Value<int> rowid,
    });
typedef $$LogPrefixTblTableUpdateCompanionBuilder =
    LogPrefixTblCompanion Function({
      Value<String> prefix,
      Value<int> logId,
      Value<String> word,
      Value<int> len,
      Value<int> rowid,
    });

final class $$LogPrefixTblTableReferences
    extends
        BaseReferences<_$AppDatabase, $LogPrefixTblTable, LogPrefixTblData> {
  $$LogPrefixTblTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LogTblTable _logIdTable(_$AppDatabase db) => db.logTbl.createAlias(
    $_aliasNameGenerator(db.logPrefixTbl.logId, db.logTbl.id),
  );

  $$LogTblTableProcessedTableManager get logId {
    final $_column = $_itemColumn<int>('log_id')!;

    final manager = $$LogTblTableTableManager(
      $_db,
      $_db.logTbl,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_logIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LogPrefixTblTableFilterComposer
    extends Composer<_$AppDatabase, $LogPrefixTblTable> {
  $$LogPrefixTblTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get prefix => $composableBuilder(
    column: $table.prefix,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get len => $composableBuilder(
    column: $table.len,
    builder: (column) => ColumnFilters(column),
  );

  $$LogTblTableFilterComposer get logId {
    final $$LogTblTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.logId,
      referencedTable: $db.logTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogTblTableFilterComposer(
            $db: $db,
            $table: $db.logTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LogPrefixTblTableOrderingComposer
    extends Composer<_$AppDatabase, $LogPrefixTblTable> {
  $$LogPrefixTblTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get prefix => $composableBuilder(
    column: $table.prefix,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get len => $composableBuilder(
    column: $table.len,
    builder: (column) => ColumnOrderings(column),
  );

  $$LogTblTableOrderingComposer get logId {
    final $$LogTblTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.logId,
      referencedTable: $db.logTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogTblTableOrderingComposer(
            $db: $db,
            $table: $db.logTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LogPrefixTblTableAnnotationComposer
    extends Composer<_$AppDatabase, $LogPrefixTblTable> {
  $$LogPrefixTblTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get prefix =>
      $composableBuilder(column: $table.prefix, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<int> get len =>
      $composableBuilder(column: $table.len, builder: (column) => column);

  $$LogTblTableAnnotationComposer get logId {
    final $$LogTblTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.logId,
      referencedTable: $db.logTbl,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogTblTableAnnotationComposer(
            $db: $db,
            $table: $db.logTbl,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LogPrefixTblTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LogPrefixTblTable,
          LogPrefixTblData,
          $$LogPrefixTblTableFilterComposer,
          $$LogPrefixTblTableOrderingComposer,
          $$LogPrefixTblTableAnnotationComposer,
          $$LogPrefixTblTableCreateCompanionBuilder,
          $$LogPrefixTblTableUpdateCompanionBuilder,
          (LogPrefixTblData, $$LogPrefixTblTableReferences),
          LogPrefixTblData,
          PrefetchHooks Function({bool logId})
        > {
  $$LogPrefixTblTableTableManager(_$AppDatabase db, $LogPrefixTblTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LogPrefixTblTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LogPrefixTblTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LogPrefixTblTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> prefix = const Value.absent(),
                Value<int> logId = const Value.absent(),
                Value<String> word = const Value.absent(),
                Value<int> len = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LogPrefixTblCompanion(
                prefix: prefix,
                logId: logId,
                word: word,
                len: len,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String prefix,
                required int logId,
                required String word,
                required int len,
                Value<int> rowid = const Value.absent(),
              }) => LogPrefixTblCompanion.insert(
                prefix: prefix,
                logId: logId,
                word: word,
                len: len,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LogPrefixTblTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({logId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (logId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.logId,
                                referencedTable: $$LogPrefixTblTableReferences
                                    ._logIdTable(db),
                                referencedColumn: $$LogPrefixTblTableReferences
                                    ._logIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LogPrefixTblTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LogPrefixTblTable,
      LogPrefixTblData,
      $$LogPrefixTblTableFilterComposer,
      $$LogPrefixTblTableOrderingComposer,
      $$LogPrefixTblTableAnnotationComposer,
      $$LogPrefixTblTableCreateCompanionBuilder,
      $$LogPrefixTblTableUpdateCompanionBuilder,
      (LogPrefixTblData, $$LogPrefixTblTableReferences),
      LogPrefixTblData,
      PrefetchHooks Function({bool logId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LogTblTableTableManager get logTbl =>
      $$LogTblTableTableManager(_db, _db.logTbl);
  $$LogPrefixTblTableTableManager get logPrefixTbl =>
      $$LogPrefixTblTableTableManager(_db, _db.logPrefixTbl);
}
