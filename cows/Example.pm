package Acme::Cow::Example;

use strict;

use Acme::Cow;

@Acme::Cow::Example::ISA = qw(Acme::Cow);

my $generic_ascii_art = <<'EOC'; 
{$balloon}
                       {$tr} 
     {$el}{$er}               {$tr}
 ___________________
/ Insert cute ASCII \
\ artwork here.     /
 -------------------
      {$U}
EOC

sub new 
{
    my $proto = shift;
    my $class = ref $proto || $proto;
    my $self = $class->SUPER::new();
    $self->over(24);
    return $self;
}

sub as_string
{
    my $self = shift;
    return $self->SUPER::as_string($generic_ascii_art);
}

1;
__END__
=pod

=head1 NAME

Acme::Cow::Example - How to write a "derived cow"

=head1 SYNOPSIS

    package Acme::Cow::MyCow;
    use Acme::Cow;
    @Acme::Cow::MyCow::ISA = qw(Acme::Cow);
    
    my $my_cow = <<'EOC';
    ... template goes here ...
    EOC

    sub new { ... }

    sub as_string { ... }

=head1 DESCRIPTION

First, put together your template as described in L<Acme::Cow>,
using L<Text::Template> as a reference.  It is recommended that
you store this template in a variable in your package's namespace.
B<Your template should not have tab characters in it.>  This will
cause ugly things to happen.

Your C<new> method will likely want to look a lot like this:

    sub new 
    {
	my $proto = shift;
	my $class = ref $proto || $proto;
	my $self = $class->SUPER::new();
	return $self;
    }

Assuming you stored the template as C<$my_cow> then
your C<as_string> method will likely want to be like this:

    sub as_string
    {
	my $self = shift;
	return $self->SUPER::as_string($my_cow);
    }

Below, we present the actual code in this module, so you can see
it in action.  Yes, you can use this module to produce ASCII art.
No, it won't be very exciting.

=head1 Acme::Cow::Example code

    package Acme::Cow::Example;

    use strict;

    use Acme::Cow;

    @Acme::Cow::Example::ISA = qw(Acme::Cow);

    my $generic_ascii_art = <<'EOC'; 
    {$balloon}
			   {$tr} 
	 {$el}{$er}               {$tr}
     ___________________
    / Insert cute ASCII \
    \ artwork here.     /
     -------------------
	  {$U}
    EOC

    sub new 
    {
	my $proto = shift;
	my $class = ref $proto || $proto;
	my $self = $class->SUPER::new();
	$self->over(24);
	return $self;
    }

    sub as_string
    {
	my $self = shift;
	return $self->SUPER::as_string($generic_ascii_art);
    }

=head1 HIGHLIGHTS

The C<{$balloon}> directive is flush left, but due to the call to
C<over()> in the C<new()> method, it will be shoved over 24 spaces
to the right, to line up with the thought/speech lines (represented
by C<{$tr}>).

=head1 SAVING WORK

Included with the C<Acme::Cow> distribution is a short program
called C<cowpm> which takes care of most of the boilerplate stuff
for you.  It's almost as simple as I<just add ASCII art> but there's
still a bit that you have to fill in.  It has its own documentation;
you should peruse L<cowpm>.

=head1 SEE ALSO

L<Acme::Cow>, L<cowpm>

=head1 AUTHOR

Tony Monroe <tmonroe plus perl at nog dot net>

=head1 BUGS

Very few.
