package Acme::Cow::TuxStab;
use strict;
use Acme::Cow;
@Acme::Cow::TuxStab::ISA = qw(Acme::Cow);
my $tux_being_stabbed = <<'EOC';
{$balloon}
             {$tl}            ,        ,
               {$tl}         /(        )`
                 {$tl}       \ \___   / |
                        /- _  `-/  '
                       (/\/ \ \   /\
                       / /   | `    \
                       O O   ) /    |
                       `-^--'`<     '
     .--.             (_.)  _  )   /
    |o_o |             `.___/`    /
    |:_/ |              `-----' /
   //<- \ \----.     __ / __   \
  (|  <- | )---|====O)))==) \) /====
 /'\ <- _/`\---'    `--' `.__,' \
 \___)=(___/            |        |
                         \       /
                    ______( (_  / \______
                  ,'  ,-----'   |        \
                  `--\{__________)        \/
EOC

sub new 
{
    my $proto = shift;
    my $class = ref $proto || $proto;
    my $self = $class->SUPER::new();
    $self->over(8);
    return bless $self, $class;
}

sub as_string
{
    my $self = shift;
    return $self->SUPER::as_string($tux_being_stabbed);
}

1;
