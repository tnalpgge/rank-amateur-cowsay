package Acme::Cow::Stegosaurus;
use strict;
use Acme::Cow;
@Acme::Cow::Stegosaurus::ISA = qw(Acme::Cow);
my $stegosaurus = <<'EOC';
{$balloon}
                {$tr}                  .       .
              {$tr}                   / `.   .' " 
            {$tr}             .---.  <    > <    >  .---.
                         |    \  \ - ~ ~ - /  /    |
         _____          ..-~             ~-..-~
        |     |   \~~~\.'                    `./~~~/
       ---------   \__/                        \__/
      .'  O    \     /               /       \  " 
     (_____,    `._.'               |         \}  \/~~~/
      `----.          /       \}     |        /    \__/
            `-.      |       /      |       /      `. ,~~|
                ~-.__|      /_ - ~ ^|      /- _      `..-'   
                     |     /        |     /     ~-.     `-. _  _  _
                     |_____|        |_____|         ~ - . _ _ _ _ _>
EOC

sub new 
{
    my $proto = shift;
    my $class = ref $proto || $proto;
    my $self = $class->SUPER::new();
    $self->over(20);
    return bless $self, $class;
}

sub as_string
{
    my $self = shift;
    return $self->SUPER::as_string($stegosaurus);
}

1;
