select
    instrument_token,
    exchange_token,
    tradingsymbol,
    name,
    exchange,
    segment,
    instrument_type,
    expiry,
    strike
from {{ source('data_platform_catalog', 'instruments') }}
