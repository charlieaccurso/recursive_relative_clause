# Get the input pattern from the command line using qq
my $input = qq(@ARGV);

# Define a regular expression pattern to match the first verb-subject-object relationship and remove it
if ($input =~ s/[Tt]he (\w+) (\w+) (?=the (\w+))//) {
    my $noun1 = $1;
    my $verb1 = $2;
    my $noun2 = $3;

    # Output the desired structure for the first match
    print "$verb1($noun1, $noun2)\n";
}

# Process the remaining input
while ($input =~ /[Tt]he (\w+) the (\w+) (?:\w+ )*(\w+)$/g) {
    my $noun2 = $1;
    my $noun1 = $2;
    my $verb1 = $3;

    $input =~ s/[Tt]he \Q$noun2\E//;
    $input =~ s/\Q $verb1\E//;

    # Output the desired structure for each match in the remaining input
    print "$verb1($noun1, $noun2)\n";
}