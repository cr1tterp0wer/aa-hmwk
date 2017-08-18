class SnackBox
  SNACK_BOX_DATA = {
    1 => {
      "bone" => {
        "info" => "Phoenician rawhide",
        "tastiness" => 20
      },
      "kibble" => {
        "info" => "Delicately braised hamhocks",
        "tastiness" => 33
      },
      "treat" => {
        "info" => "Chewy dental sticks",
        "tastiness" => 40
      }
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "tastiness" => 2
      },
      "kibble" => {
        "info" => "Kale clusters",
        "tastiness" => 1
      },
      "treat" => {
        "info" => "Bacon",
        "tastiness" => 80
      }
    },
    3 => {
      "bone" => {
        "info" => "A steak bone",
        "tastiness" => 64
      },
      "kibble" => {
        "info" => "Sweet Potato nibbles",
        "tastiness" => 45
      },
      "treat" => {
        "info" => "Chicken bits",
        "tastiness" => 75
      }
    }
  }
  def initialize(data = SNACK_BOX_DATA)
    @data = data
  end

  def get_bone_info(box_id)
    @data[box_id]["bone"]["info"]
  end

  def get_bone_tastiness(box_id)
    @data[box_id]["bone"]["tastiness"]
  end

  def get_kibble_info(box_id)
    @data[box_id]["kibble"]["info"]
  end

  def get_kibble_tastiness(box_id)
    @data[box_id]["kibble"]["tastiness"]
  end

  def get_treat_info(box_id)
    @data[box_id]["treat"]["info"]
  end

  def get_treat_tastiness(box_id)
    @data[box_id]["treat"]["tastiness"]
  end
end

class CorgiSnacks

  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def bone
    info = @snack_box.get_bone_info(@box_id)
    tastiness = @snack_box.get_bone_tastiness(@box_id)
    result = "Bone: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @snack_box.get_kibble_info(@box_id)
    tastiness = @snack_box.get_kibble_tastiness(@box_id)
    result = "Kibble: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def treat
    info = @snack_box.get_treat_info(@box_id)
    tastiness = @snack_box.get_treat_tastiness(@box_id)
    result = "Treat: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

end


class MetaCorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
    snack_box.methods.grep(/^get_(.*)_info$/) { MetaCorgiSnacks.define_snack $1 }
  end
  #def treat
  #  info = @snack_box.get_treat_tastiness(@box_id)
  #  tastiness = @snack_box.get_treat_tastiness(@box_id)
  #  result = "Treat: #{info}: #{tastiness} "
  #  tastiness> 30 ? "* #{result}" : result
  #end
  #def kibble
  #  info=@snack_box.get_kibble_info(@box_id)
  #  tastiness = @snack_box.get_kibble_tastiness(@box_id)
  #  result = "Kibble: #{info}: #{tastiness} "
  #  tastiness > 30 ? "* #{result}" : result
  #end
  #def bone
  #  info=@snack_box.get_bone_info(@box_id)
  #  tastiness = @snack_box.get_bone_tastiness(@box_id)
  #  result = "Bone: #{info}: #{tastiness} "
  #  tastiness > 30 ? "* #{result}" : result
  #end

  #def method_missing(name, *args)
    # Your code goes here...
 #   case name
 #   when "treat"
 #     snackbox
 #   when "kibble"
 #   when "bone"
 #   else
 #   end
 # end
  
  def self.define_a_snack(snack)
    define_method(snack){}

  end
  
  def define_snack(name)
    info="" 
    type = name.to_s
    tastiness = ""

      case name
      when "bone"
        info=@snack_box.get_bone_info(@box_id)
        tastiness=@snack_box.get_bone_tastiness(@box_id)
      when "kibble"
        info=@snack_box.get_kibble_info(@box_id)
      when "treat"
        info=@snack_box.get_treat_info(@box_id)
      end

    result = "#{type}: #{info}: #{tastiness} "
    define_method(type){ tastiness > 30 ? "* #{result}" : result }
  end


  #def self.define_snack(name)
    # Your code goes here...
  #  self.send(name)
  #end

end
