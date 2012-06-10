package Message::Passing::STOMP::Role::HasAConnection;
use Moose::Role;
use Message::Passing::STOMP::ConnectionManager;
use namespace::autoclean;

with qw/
    Message::Passing::Role::HasAConnection
    Message::Passing::Role::HasHostnameAndPort
/;

sub _default_port { 6163 }

has ssl => (
    is => 'ro',
    isa => 'Bool',
    default => 0,
);

has [qw/ username password /] => (
    is => 'ro',
    isa => 'Str',
    default => 'guest',
);

sub _build_connection_manager {
    my $self = shift;
    Message::Passing::STOMP::ConnectionManager->new(map { $_ => $self->$_() }
        qw/ username password ssl hostname /
    );
}

1;

=head1 NAME

Message::Passing::STOMP::HasAConnection - Role for instances which have a connection to a STOMP server.

=head1 ATTRIBUTES


=head1 AUTHOR, COPYRIGHT AND LICENSE

See L<Message::Passing::STOMP>.

=cut

