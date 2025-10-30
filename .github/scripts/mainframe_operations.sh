# !/ bin / bash
# mainframe_operations.sh
# Set up environment
export PATH = $PATH :/ usr / lpp / java / J8 .0 _64 / bin
export JAVA_HOME =/ usr / lpp / java / J8 .0 _64
export PATH = $PATH :/ usr / lpp / zowe / cli / node / bin
# Check Java availability
java - version
# Set ZOWE_USERNAME
ZOWE_USERNAME = " Z99998 " # Replace with the actual username
# Change to the cobolcheck directory
cd cobolcheck
echo " Changed to $ ( pwd ) "
ls - al
# Make cobolcheck executable
chmod + x cobolcheck
echo " Made cobolcheck executable "
# Make script in scripts directory executable
cd scripts
chmod + x linux_gnucobol_run_tests
echo " Made linux_gnucobol_run_tests executable "
cd ..

# Function to run cobolcheck and copy files
run_cobolcheck () {
  program = $1
  echo " Running cobolcheck for $program "
  
  #Run cobolcheck , but don 't exit if it fails
  ./cobolcheck -p $program
  echo " Cobolcheck execution completed for $program ( exceptions may have
      occurred )"
  #Check if CC ##99. CBL was created , regardless of cobolcheck exit status

  # Function to run cobolcheck and copy files
run_cobolcheck () {
program = $1
echo " Running cobolcheck for $program "
# Run cobolcheck , but don 't exit if it fails
./ cobolcheck -p $program
echo " Cobolcheck execution completed for $program ( exceptions may have
occurred ) "
# Check if CC ##99. CBL was created , regardless of cobolcheck exit status
