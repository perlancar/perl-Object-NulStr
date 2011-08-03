package Object::NulStr;

# VERSION

use overload q{""} => sub { "\0" };

sub new { bless(\"$_[0]", $_[0]) }

1;
# ABSTRACT: Object which stringifies to NUL character ("\0")

=head1 SYNOPSIS

 use Object::NulStr;

 die Object::NulStr->new; # dies without seemingly printing anything


=head1 DESCRIPTION

Object::NulStr is like L<Object::BlankStr>, but instead of stringifying to ""
(empty string), it stringifies to "\0" (NUL character). This has the benefit of
having a boolean true value so checking exception is simpler (a simple if on $@
will do). But Object::BlankStr might suit you better if printing "\0" has some
undesired side effects. Too bad we can't have it both ways for now.

So far the only case I've found this to be useful is for die()-ing without
printing anything. If you just use 'die;' or 'die "";' Perl will print the
default "Died at ..." message. But if you say 'die Object::NulStr->new;' Perl
will die without seemingly printing anything.


=head1 SEE ALSO

L<Object::BlankStr>

=cut
