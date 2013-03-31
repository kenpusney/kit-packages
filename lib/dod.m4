# FIXME: Hide output from this file.

define(`qoute',``$@'')
define(`cons',``($1,$2)'')

define(`__inner_car',``$1'')
define(`car',`__inner_car$1')

define(`__inner_cdr',``$2'')
define(`cdr',`__inner_cdr$1')

