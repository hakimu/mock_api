class Organization

  attr_accessor :support_score
  attr_reader :name, :parent_id, :type, :accounts, :users

  def initialize(id, name, parent_id, type, accounts, users)
    @id = id
    @name = name
    @parent_id = parent_id
    @type = type
    @accounts = accounts
    @users = users
    # @admin_users = admin_users
  end

  def sole?
    @type == "sole" ? true : false
  end

  def subsidiary?
    @type == "subsidiary" ? true : false
  end

  def parent?
    @type == "parent" ? true : false
  end

  def flatten
    "#{name}: accounts#{accounts}"
  end

  def total_revenue
    # Use this method to get the revenue from the accounts
    total_revenue = []
    @accounts.map do |account|
      total_revenue << Account.new(account).revenue
    end
    total_revenue.inject(0){|sum,x| sum + x }
  end

  def calculate_support_score
    case total_revenue
    when 0..50000
      self.support_score = 1
    when 50001..100000
      self.support_score = 2
    else
      self.support_score = 3
    end
  end

end