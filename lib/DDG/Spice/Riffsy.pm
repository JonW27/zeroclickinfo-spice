package DDG::Spice::Riffsy;

# ABSTRACT: Search Riffsy (http://www.riffsy.com) for animated GIFs.
use DDG::Spice;
use utf8;

spice is_cached => 1;
spice proxy_cache_valid => "200 1d";

spice to => 'http://api1.riffsy.com/v1/search?tag=$1&key={{ENV{DDG_SPICE_RIFFSY_APIKEY}}}&safesearch=strict&searchtype=ddg&limit=50';
spice wrap_jsonp_callback => 1;

triggers query_lc => qr/^\X$|^(\X+|[\w\s]+?) gifs?$/;

handle query_lc => sub {
    return if !$_ || $_ =~ /^[a-zA-Z0-9]$/;
    return $_;
};

1;
