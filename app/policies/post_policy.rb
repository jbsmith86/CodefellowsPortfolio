class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    @user.editor? || @user.author?
  end

  def publish?
    @user.editor?
  end

  def destroy?
    if @user
      @user.editor? || @post.author.email == @user.email
    else
      false
    end
  end

  def update?
    if @user
      @user.editor? || @post.author.email == @user.email
    else
      false
    end
  end
end
