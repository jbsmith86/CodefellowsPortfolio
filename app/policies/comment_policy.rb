class CommentPolicy < ApplicationPolicy
  attr_accessor :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def approver?
    if @user
      @user.editor?
    end
  end

end
