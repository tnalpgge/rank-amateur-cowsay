package Acme::Cow::Frogs;

use strict;

use Acme::Cow;

@Acme::Cow::Frogs::ISA = qw(Acme::Cow);

my $frogs = <<'EOC'; 
{$balloon}
                                              {$tr}
                                            {$tr}
          oO)-.                       .-(Oo
         /__  _\                     /_  __\
         \  \(  |     ()~()         |  )/  /
          \__|\ |    (-___-)        | /|__/
          '  '--'    ==`-'==        '--'  '
EOC

sub new 
{
    my $proto = shift;
    my $class = ref $proto || $proto;
    my $self = $class->SUPER::new();
    $self->over(46);
    return bless $self, $class;
}

sub as_string
{
    my $self = shift;
    return $self->SUPER::as_string($frogs);
}

1;
