# Get the input pattern from the command line using qq
my $input = qq(@ARGV);

# Define a regular expression to match the two formats
while ($input =~ /[Tt]he (\w+)(?: who)? (\w+)(?= the (\w+))/g) {
    my $noun1 = $1;
    my $verb1 = $2;
    my $noun2 = $3;

    # Output the structure for each match
    print "$verb1($noun1, $noun2)\n";
}