CREATE EXTENSION daterange_inclusive;
SELECT daterange_inclusive('2024-01-01' , '2024-01-02', '()');
SELECT '[2015-02-01,2021-09-28]'::daterange_inclusive + '[2021-09-29,)'::daterange_inclusive;
SELECT daterange_inclusive('2024-01-01' , '2024-06-01', '[]');
SELECT daterange_inclusive('2024-01-01' , '2024-06-01', '[)');
SELECT '[2025-01-01,2025-02-02]'::daterange::daterange_inclusive;
SELECT '[2025-01-01,2025-02-02)'::daterange::daterange_inclusive;
SELECT '[2025-01-01,2025-02-02]'::daterange_inclusive::daterange;
SELECT '[2025-01-01,2025-02-02)'::daterange_inclusive::daterange;

CREATE TABLE x (y daterange_inclusive);
INSERT INTO x SELECT daterange_inclusive(d::date, (d + '1month'::interval)::date, '[]') FROM generate_series('2015-01-01'::date,'2025-02-02', '1day') d;
INSERT INTO x SELECT daterange_inclusive(d::date, NULL::date, '[)') FROM generate_series('2015-01-01'::date,'2025-02-02', '1day') d;
SELECT COUNT(*) FROM x;
CREATE INDEX ON x USING gist (y);
INSERT INTO x SELECT '[2024-01-01,)'::daterange::daterange_inclusive;

DROP EXTENSION daterange_inclusive CASCADE;

