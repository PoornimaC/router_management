require 'rest-client'
require "benchmark"
require 'open-uri'
require 'memory_profiler'
require 'allocation_tracer'
require 'pp'

class RouterBenchMark

  DOMAIN = "http://localhost:3000"

  PARAMETERS =  {"send_data"=>"true",  "all"=>"true", "schema"=>{"only"=>["id", "name", "location"], "include"=>{"strength"=>{"only"=>["strength"]}}}, "csv_options"=>{"encoding_to"=>"", "generator"=>{"col_sep"=>","}}, "return_to"=>"#{RouterBenchMark::DOMAIN}/router", "csv"=>"", "_pjax"=>"[data-pjax-container]", "model_name"=>"router"}

  ObjectSpace::AllocationTracer.setup(%i{path line type})

  def self.bench_mark(domain = RouterBenchMark::DOMAIN)

    report = Benchmark.measure do
      RestClient.post "#{domain}/router/export", RouterBenchMark::PARAMETERS
    end

    pp report
  end

  def self.memory_profiler(domain = RouterBenchMark::DOMAIN)
    report = MemoryProfiler.report do
      RestClient.post "#{domain}/router/export", RouterBenchMark::PARAMETERS
    end
    pp report
  end

  def self.allocation_tracer(domain = RouterBenchMark::DOMAIN)
    pp ObjectSpace::AllocationTracer.trace{
      20.times{|i|
        RestClient.post "#{domain}/router/export", RouterBenchMark::PARAMETERS
      }
    }
  end

end
