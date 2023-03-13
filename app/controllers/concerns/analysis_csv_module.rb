module AnalysisCsvModule
  extend ActiveSupport::Concern
  require 'csv'
  def generate_csv(analysis, is_whies)
    filename = "分析結果_#{Date.today}.csv"
    set_csv_request_headers(filename)

    bom = "\uFEFF"
    self.response_body = Enumerator.new do |csv_data|
      csv_data << bom

      header = ["分析対象",analysis.target]
      csv_data << header.to_csv

      is_whies.each_with_index do |is_why, index|
        body = [
          index + 1,
          is_why.result
        ]
        csv_data << body.to_csv
      end
    end
  end

  def set_csv_request_headers(filename, charset: 'UTF-8')
    self.response.headers['Content-Type'] ||= "text/csv; charset=#{charset}"
    self.response.headers['Content-Disposition'] = "attachment;filename=#{ERB::Util.url_encode(filename)}"
    self.response.headers['Content-Transfer-Encoding'] = 'binary'
  end
end