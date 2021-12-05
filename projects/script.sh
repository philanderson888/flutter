echo "this script prints out all the folders in a directory"
for file in */ ; do
 echo "$file"
done


echo "this script prints all folders in a directory"
echo "this script prints all folders in a directory" > flutter_test_output.md
echo "and also runs unit tests in each folder"
echo "and also runs unit tests in each folder" >> flutter_test_output.md
for file in */ ; do
 echo " " >> flutter_test_output.md 
 echo " " >> flutter_test_output.md
 echo "$file" >> flutter_test_output.md
 echo "$file" 
 cd $file 
 pwd >> ../flutter_test_output.md
 flutter test >> ../flutter_test_output.md
 cd ..
done