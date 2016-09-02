require 'rails_helper'

RSpec.describe Lesson, type: :model do
	it { should validate_presence_of(:name) }
end
