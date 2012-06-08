package Message::Passing::Output::STOMP;
use Moose;
use namespace::autoclean;

with qw/
    Message::Passing::STOMP::Role::HasAConnection
    Message::Passing::Role::Output
/;

has destination => (
    isa => 'Str',
    is => 'ro',
    required => 1,
);

sub connected {
    my $self = shift;
}

sub consume {
    my $self = shift;
    my $data = shift;
    my $destination = $self->destination;
    my $headers = undef;
    $self->connection_manager->connection->send($data, $destination, $headers);
}

__PACKAGE__->meta->make_immutable;
1;

=head1 NAME

Message::Passing::Output::STOMP - output messages to STOMP.

=head1 SYNOPSIS

    message-pass --input STDIN --output STOMP
    {"data":{"some":"data"},"@metadata":"value"}

=head1 DESCRIPTION

A L<Message::Passing> L<AnyEvent::STOMP> output class.

Can be used as part of a chain of classes with the L<message-pass> utility, or directly as
a logger in normal perl applications.

=head1 METHODS

=head2 consume

Sends a message.

=head2 connected

=head1 SEE ALSO

=over

=item L<Message::Passing::STOMP>

=item L<Message::Passing::Input::STOMP>

=item L<Message::Passing>

=item L<STOMP>

=item L<http://www.zeromq.org/>

=back

=head1 SPONSORSHIP

This module exists due to the wonderful people at Suretec Systems Ltd.
<http://www.suretecsystems.com/> who sponsored its development for its
VoIP division called SureVoIP <http://www.surevoip.co.uk/> for use with
the SureVoIP API - 
<http://www.surevoip.co.uk/support/wiki/api_documentation>

=head1 AUTHOR, COPYRIGHT AND LICENSE

See L<Message::Passing>.

=cut

