package Acme::Cow::MechAndCow;
use strict;
use Acme::Cow;
@Acme::Cow::MechAndCow::ISA = qw(Acme::Cow);
my $mech_and_cow = <<'EOC';
{$balloon}
                {$tl}                   ,-----.
                  {$tl}                 |     |
                    {$tl}            ,--|     |-.
                         __,----|  |     | |
                       ,;::     |  `_____' |
                       `._______|    i^i   |
                                `----| |---'| .
                           ,-------._| |== ||//
                           |       |_|P`.  /'/
                           `-------' 'Y Y/'/'
                                     .==\ /_\
   ^__^                             /   /'|  `i
   ({$el}{$er})\_______                   /'   /  |   |
   (__)\       )\/\             /'    /   |   `i
    {$U} ||----w |           ___,;`----'.___L_,-'`\__
       ||     ||          i_____;----\.____i""\____\
EOC

sub new 
{
    my $proto = shift;
    my $class = ref $proto || $proto;
    my $self = $class->SUPER::new();
    $self->over(10);
    return bless $self, $class;
}

sub as_string
{
    my $self = shift;
    return $self->SUPER::as_string($mech_and_cow);
}

1;
