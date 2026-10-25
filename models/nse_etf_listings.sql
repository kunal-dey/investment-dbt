with etf_listings as (
    select *
    from {{ source('data_platform_catalog', 'nse_etfs') }}
    qualify row_number() over (partition by symbol order by as_of desc) = 1
),
nse_instruments as (
    select *
    from {{ source('data_platform_catalog', 'instruments') }}
    where exchange = 'NSE'
)
select
    nse_instruments.name as etf_name,
    etf_listings.symbol as etf_symbol,
    etf_listings.underlying as benchmark,
    nse_instruments.instrument_type,
    nse_instruments.segment
from etf_listings
inner join nse_instruments
    on etf_listings.symbol = nse_instruments.tradingsymbol