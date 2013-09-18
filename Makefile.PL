use inc::Module::Install;

RTx('RT-Extension-Dancecard');
all_from 'lib/RT/Extension/Dancecard.pm';
author   'Kevin Riggle <kevinr@free-dissociation.com>';

build_requires 'Test::More';

auto_install;

WriteAll;

