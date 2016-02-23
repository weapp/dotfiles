require "spec_helper"

describe App do
  subject { described_class }

  its(:logger) { is_expected.to be_a Logger }

  it { expect(subject.run) }
end
