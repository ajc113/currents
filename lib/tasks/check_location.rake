class String
  def black;          "\e[30m#{self}\e[0m" end
  def red;            "\e[31m#{self.bold}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
  def brown;          "\e[33m#{self}\e[0m" end
  def blue;           "\e[34m#{self}\e[0m" end
  def magenta;        "\e[35m#{self}\e[0m" end
  def cyan;           "\e[36m#{self}\e[0m" end
  def gray;           "\e[37m#{self}\e[0m" end

  def bg_black;       "\e[40m#{self}\e[0m" end
  def bg_red;         "\e[41m#{self}\e[0m" end
  def bg_green;       "\e[42m#{self}\e[0m" end
  def bg_brown;       "\e[43m#{self}\e[0m" end
  def bg_blue;        "\e[44m#{self}\e[0m" end
  def bg_magenta;     "\e[45m#{self}\e[0m" end
  def bg_cyan;        "\e[46m#{self}\e[0m" end
  def bg_gray;        "\e[47m#{self}\e[0m" end

  def bold;           "\e[1m#{self}\e[22m" end
  def italic;         "\e[3m#{self}\e[23m" end
  def underline;      "\e[4m#{self}\e[24m" end
  def blink;          "\e[5m#{self}\e[25m" end
  def reverse_color;  "\e[7m#{self}\e[27m" end
end
namespace :check_location do
  desc "checks if the location files are perfect or not"

  #Create the function to conut a file in a folder
  def file_count(dir_path)
    Dir.entries(dir_path).count - 2
  end

  task :files => :environment  do
    desc "This task will go through all the files under /public/uploads/location/coordinate_file/:location_id/:location_file"
    print "This task will go through all the files under /public/uploads/location/coordinate_file/:location_id/:location_file\n\n".blue


    @coordinate_files_dir = 'public/uploads/location/coordinate_file/'
    no_of_folders = file_count(@coordinate_files_dir)
    locations = Location.all

    def location_dir(location_id)
      return @coordinate_files_dir + location_id.to_s
    end

    #Check if the count of locations match with the count of files in a folder
    print "Number of locations :", locations.count, "\n"
    print "Number of folders :", no_of_folders, "\n"

    if locations.count == no_of_folders
      print "Count of locations and files matches\n\n".green
    else
      print "Count of locations and files does not match.\n".red
      print "Seems like some files are missing. Please find the details below.\n\n".red
    end

    locations.each do |location|
      print "Checking for location: ", location.short_name, "\n"

      #Check if the folder exists for the location
      if Dir.exist?(location_dir(location.id))
        print "Folder exsists\n".green

        if file_count(location_dir(location.id)) == 0
          print "Folder exists but empty\n".red

          #Check if the folder has only file or more files
        elsif file_count(location_dir(location.id)) > 1
          print "Folder has more than one file. Please keep only the correct one.\n"

          #Check if the location file extension is json
        elsif
          location_data_file = Dir.entries(location_dir(location.id))[2]
          File.extname(location_data_file) == ".json"
          print ("Data file found: " + location_data_file + "\n").green

          #Check if the file name starts with the model id or not
          if /^#{location.id}_/.match(File.basename(location_data_file))
            print "Filename is given proper\n".green
            print "ALL TESTS PASSED\n\n".green
          else
            print "File found but filename should start with '#{location.id}_'\n\n".red
          end
        else
          puts "There are more than one file exsists for #{location.short_name}\n".red
        end
      else
        puts "Folder does not exist!\n".red
      end
    end
  end
end
