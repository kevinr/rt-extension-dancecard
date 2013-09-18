use strict;
use warnings;

package RT::Ticket;

=head2 SetDateFieldAsUser ATTRIBUTE USER VALUE

Arguments:

  ATTRIBUTE is 'Due', 'Starts', etc.
  USER is passed to RT::User::Load
  VALUE is parsed by RT::Date::Set with Format => 'unknown'

=cut

sub SetDateFieldAsUser {
    # this function is inspired by code in RT::Extension::CommandByMail

    my $self = shift;
    my $attribute = shift;
    my $userid = shift;
    my $value = shift;

    my $setter = "Set$attribute";

    my $user = RT::User->new($RT::SystemUser);
    $user->Load($userid);

    my $ticket_as_user = RT::Ticket->new($user);
    $ticket_as_user->Load($self->id);

    my $date = RT::Date->new($user);
    $date->Set( Format => 'unknown', Value => $value );

    return $ticket_as_user->$setter($date->ISO);
}

1;
