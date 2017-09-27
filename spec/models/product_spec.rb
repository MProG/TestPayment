require "rails_helper"

describe Product do
  it { should enumerize(:state) }
  it { is_expected.to enumerize(:state) }
end
