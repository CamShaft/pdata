-record(state, {
  ref :: reference(),
  cache = #{} :: map(),
  cache_hits = 0 :: integer(),
  values = #{} :: map(),
  vars = #{} :: map(),
  pending = [] :: list(),
  counter = 0 :: integer(),
  waiting = 0 :: integer(),
  completed = 0 :: integer(),
  errors = [] :: list(),
  map :: fun(),
  context :: any(),
  iterations = 0 :: integer(),
  stalled = 0 :: integer(),
  pids = #{} :: list(),
  calls = [] :: list()
}).

-record(expr, {
  id :: integer(),
  type = literal :: literal | list | tuple | map | call | 'cond' | comprehension | variable,
  line :: integer(),
  value :: term(),
  deps = -1 :: integer(),
  is_root = false :: boolean(),
  children = [] :: list(),
  status = added :: added | waiting | branching | iterating,
  tmp :: any(),
  attrs :: map(),
  silent = false :: boolean(),
  timeout = 0 :: integer(),
  spawn = false :: boolean(),
  native = false :: boolean()
}).

-ifdef(EXPR_DEBUG).
-define(DEBUG(Str), io:format(Str, [])).
-define(DEBUG(Str, Arr), io:format(Str, Arr)).
-else.
-define(DEBUG(Str), noop).
-define(DEBUG(Str, Arr), noop).
-endif.
