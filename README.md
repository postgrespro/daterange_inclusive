# daterange_inclusive
A PostgreSQL datarange type with inclusive upper bound

The daterange type, as well as other range types, is by default output with non-exclusive upper range. 
This extension defines a type which is the same but with inclusive upper range.
Such behaviour is more convenient in some practical use cases.

See example: 

```
CREATE EXTENSION daterange_inclusive;
SELECT daterange('[2024-01-01,2024-06-01]');
        daterange        
-------------------------
 [2024-01-01,2024-06-02)

SELECT daterange_inclusive('[2024-01-01,2024-06-01]');
   daterange_inclusive   
-------------------------
 [2024-01-01,2024-06-01]
```

## Building

```
USE_PGXS=1 PG_CONFIG=/path_to_pgconfig make install
```


