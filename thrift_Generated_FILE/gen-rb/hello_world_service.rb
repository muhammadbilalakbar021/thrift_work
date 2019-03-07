#
# Autogenerated by Thrift Compiler (0.12.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'helloworld_types'

module HelloWorldService
  class Client
    include ::Thrift::Client

    def geHello()
      send_geHello()
      return recv_geHello()
    end

    def send_geHello()
      send_message('geHello', GeHello_args)
    end

    def recv_geHello()
      result = receive_message(GeHello_result)
      return result.success unless result.success.nil?
      raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'geHello failed: unknown result')
    end

  end

  class Processor
    include ::Thrift::Processor

    def process_geHello(seqid, iprot, oprot)
      args = read_args(iprot, GeHello_args)
      result = GeHello_result.new()
      result.success = @handler.geHello()
      write_result(result, oprot, 'geHello', seqid)
    end

  end

  # HELPER FUNCTIONS AND STRUCTURES

  class GeHello_args
    include ::Thrift::Struct, ::Thrift::Struct_Union

    FIELDS = {

    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

  class GeHello_result
    include ::Thrift::Struct, ::Thrift::Struct_Union
    SUCCESS = 0

    FIELDS = {
      SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::Hello}
    }

    def struct_fields; FIELDS; end

    def validate
    end

    ::Thrift::Struct.generate_accessors self
  end

end

