class FireReportFormatter
  def self.call(totals, collection)
    new(totals, collection).call
  end

  attr_reader :totals, :collection

  def initialize(totals, collection)
    @totals = totals
    @collection = collection
  end

  def call
    {
      small: totals.fetch("pequeno", 0),
      medium: totals.fetch("medio", 0),
      big: totals.fetch("grande", 0),
      totals: totals.values.sum,
      reports: collection
    }
  end
end
