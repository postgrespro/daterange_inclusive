CREATE TYPE daterange_inclusive;

CREATE FUNCTION date_minus(date1 date, date2 date) RETURNS float AS $$
    SELECT cast(date1 - date2 AS float);
$$ LANGUAGE sql IMMUTABLE;

CREATE FUNCTION daterange_inclusive_canonical(dr daterange_inclusive) RETURNS daterange_inclusive AS 'MODULE_PATHNAME'
LANGUAGE C STRICT IMMUTABLE;

CREATE TYPE daterange_inclusive AS RANGE (
    SUBTYPE = date,
    SUBTYPE_DIFF = date_minus,
    CANONICAL = daterange_inclusive_canonical    
);

CREATE CAST (daterange AS daterange_inclusive) WITH INOUT AS IMPLICIT;
CREATE CAST (daterange_inclusive AS daterange) WITH INOUT AS IMPLICIT;

