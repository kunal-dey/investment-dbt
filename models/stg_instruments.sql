select
    instrument_token,
    exchange_token,
    tradingsymbol,
    name,
    exchange,
    segment,
    instrument_type
from {{ source('data_platform_catalog', 'instruments') }}
