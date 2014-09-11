require "json"
require "fileutils"

class Firebasic

  def main(args)
    abort("Usage: ruby firebasic.rb input_file.json output_directory") if(args.length < 2)
    input_file_path = args[0]
    output_directory = args[1]

    blob = JSON.parse(File.read(input_file_path))

    traverse(blob, output_directory)
  end


  def traverse(subblob, parent_directory)
    subblob.keys.each do |key|
      
      File.write(parent_directory + "/" + key +".json", JSON.dump(subblob[key]))

      if defined? subblob[key].keys
        #there are more children; make a directory
        FileUtils.mkdir_p parent_directory + "/" + key
        traverse(subblob[key], parent_directory + "/" + key)
      end

    end

  end

end

fb = Firebasic.new
fb.main(ARGV)