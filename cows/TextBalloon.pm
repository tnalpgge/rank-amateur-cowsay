package Acme::Cow::TextBalloon;

use strict;

my $rcs_id = q$Id$;

=pod

=head1 NAME

Acme::Cow::TextBalloon - A balloon of text

=head1 SYNOPSIS

  use Acme::Cow::TextBalloon;

  $x = new Acme::Cow::TextBalloon;
  $x->add("bunch of text");
  $x->wrapcolumn(29);

  $y = new Acme::Cow::TextBalloon;
  $y->adjust(0);
  $y->add("more text");

=head1 DESCRIPTION

C<Acme::Cow::TextBalloon> Creates and manipulates balloons of text,
optionally printing them.  One may notice that the methods in this
module are named very similarly to those in C<Acme::Cow>; that's
because most of them have to do with the balloon rather than the
cow.

=cut

use Text::Tabs;
use Text::Wrap;


sub new 
{
    my $proto = shift;
    my $class = ref $proto || $proto;
    my $self = {
	fill => 1,
	mode => 'say',
	over => 0,
	text => [ ],
	wrap => 40,
    };
    return bless $self, $class;
}

sub wrapcolumn
{
    my $self = shift;
    if (@_) {
	$self->{'wrap'} = $_[0];
    } 
    return $self->{'wrap'};
}

sub mode
{
    my $self = shift;
    return $self->{'mode'};
}

sub think 
{
    my $self = shift;
    $self->{'mode'} = "think";
}

sub say 
{
    my $self = shift;
    $self->{'mode'} = "say";
}

sub print 
{
    my $self = shift;
    $self->{'mode'} = "think";
}

sub adjust
{
    my $self = shift;
    if (@_) {
	$self->{'fill'} = $_[0];
    } 
    return $self->{'fill'};
}

sub over
{
    my $self = shift;
    if (@_) {
	$self->{'over'} = $_[0];
    } 
    return $self->{'over'};
}

sub as_list
{
    my $self = shift;
    return $self->_construct();
}

sub as_string 
{
    my $self = shift;
    return join('', $self->_construct());
}

sub add
{
    my $self = shift;
    push @{$self->{'text'}}, @_;
    return $self->{'text'};
}

sub text
{
    my $self = shift;
    if (@_) {
	my @l = @_;
	$self->{'text'} = \@l;
    }
    return $self->{'text'};
}

sub _maxlength 
{
    my ($len, $max);
    $max = -1;
    for my $i (@_) {
        $len = length $i;
        $max = $len if ($len > $max);
    }
    return $max;
}

sub _fill_text
{
    my $self = shift;
    for my $i (@{$self->{'text'}}) {
	$i =~ s/\s+$//;
    }
    $Text::Tabs::tabstop = 8;
    my @expanded = Text::Tabs::expand(@{$self->{'text'}});
    unless ($self->{'fill'}) {
	return @expanded;
    } 
    $Text::Wrap::columns = $self->{'wrap'};
    my @filled = split("\n", Text::Wrap::wrap("", "", @expanded));
    $Text::Tabs::tabstop = 2;	# Defeat a dumb heuristic.
    my @final = expand(@filled);
    return @final;
}

sub _construct
{
    my $self = shift;
    my $mode = $self->{'mode'};
    my @message = $self->_fill_text();
    my $max = _maxlength(@message);
    my $max2 = $max + 2;        ## border space fudge.
    my @border; ## up-left, up-right, down-left, down-right, left, right
    my @balloon_lines = ();
    my $shove = " " x $self->{'over'};
    my $format = "$shove%s %-${max}s %s\n";
    if ($mode eq think) {
        @border = qw[ ( ) ( ) ( ) ];
    } elsif (@message < 2) {
        @border = qw[ < > ];
    } else {
	@border = ( "/", "\\", "\\", "/", "|", "|" );
    }
    push(@balloon_lines,
        "$shove " . ("_" x $max2) . "\n" ,
        sprintf($format, $border[0], $message[0], $border[1]),
        (@message < 2 ? "" :
            map { sprintf($format, $border[4], $_, $border[5]) }
                @message[1 .. $#message - 1]),
        (@message < 2 ? "" :
            sprintf($format, $border[2], $message[$#message], $border[3])),
        "$shove " . ("-" x $max2) . "\n"
    );
    return @balloon_lines;
}


=pod

=head1 AUTHOR

Tony Monroe E<lt>tmonroe+perl@nog.netE<gt>

=head1 SEE ALSO

L<Acme::Cow>

=cut

1;
__END__
