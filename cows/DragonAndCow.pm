package Acme::Cow::DragonAndCow;
use strict;
use Acme::Cow;
@Acme::Cow::DragonAndCow::ISA = qw(Acme::Cow);
my $dragon_and_cow = <<'EOC';
{$balloon}
                 {$tl}                          ^    /^
                    {$tl}                      / \  // \
                       {$tl}     |\___/|      /   \//  .\
                          {$tl}  /O  O  \__  /    //  | \ \           *----*
                            /     /  \/_/    //   |  \  \          \   |
                            @___@`    \/_   //    |   \   \         \/\ \
                           0/0/|       \/_ //     |    \    \         \  \
                       0/0/0/0/|        \///      |     \     \       |  |
                    0/0/0/0/0/_|_ /   (  //       |      \     _\     |  /
                 0/0/0/0/0/0/`/,_ _ _/  ) ; -.    |    _ _\.-~       /   /
                             ,-\}        _      *-.|.-~-.           .~    ~
            \     \__/        `/\      /                 ~-. _ .-~      /
             \____({$el}{$er})           *.   \}            \{                   /
             (    (--)          .----~-.\        \-`                 .~
             //__\\  \__ Ack!   ///.----..<        \             _ -~
            //    \\               ///-._ _ _ _ _ _ _\{^ - - - - ~
EOC
sub new 
{
    my $proto = shift;
    my $class = ref $proto || $proto;
    my $self = $class->SUPER::new();
    return bless $self, $class;
}

sub as_string 
{
    my $self = shift;
    return $self->SUPER::as_string($dragon_and_cow);
}
