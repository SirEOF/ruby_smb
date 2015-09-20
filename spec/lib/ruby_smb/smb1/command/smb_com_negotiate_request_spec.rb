require 'spec_helper'

module RubySMB
module SMB1
module Command
RSpec.describe SMB_COM_NEGOTIATE_REQUEST do
  def normalize(string)
    string.bytes.pack('C*')
  end

  let(:packet_default_spec) do
    {
             protocol: "\xFFSMB",
              command: "r",
               status: "\x00\x00\x00\x00",
                flags: "\x18",
               flags2: "\x48\x01",
             pid_high: "\x00\x00",
    security_features: "\x00\x00\x00\x00\x00\x00\x00\x00",
             reserved: "\x00\x00",
                  tid: "\xFF\xFF",
              pid_low: "\x00\x00",
                  uid: "\x00\x00",
                  mid: "\x00\x00",

           word_count: "\x00",
                words: "",

           byte_count: "\xA0\x00",
             dialects: "\x02NT LM 0.12\x00\x02SMB 2.002\x00\x02SMB 2.???\x00",
     }.values.reduce(:+).bytes.pack('C*')
  end

  # TODO: use dialects
  context 'actual packet size is larger than the allocated size' do
    let(:smb_com_negotiate) { SMB_COM_NEGOTIATE_REQUEST.new(params: {dialects: {n_bytes:34, value: "\x02NT LM 0.12\x00\x02SMB 2.002\x00\x02SMB 2.??? 123\x00" }}) }

    describe '#validate' do
      it 'returns false' do
        expect{smb_com_negotiate.validate_actual_gt_allocated}.to \
          raise_error('Actual packet size is larger than the allocated size')      end
    end

    describe '#validate_actual_gt_allocated' do
      it('tested in #validate') { }
    end
  end

  #defaults
  context 'params NOT specified during SMB_COM_NEGOTIATE creation' do
    let(:smb_com_negotiate) { SMB_COM_NEGOTIATE_REQUEST.new }

    # WHAT IT DOES (use actual objects as fixtures
    #               to guarantee self-consistency)
      #build
    describe '#build' do
      it 'sets attr:packet to its binary_string representation' do
        smb_com_negotiate.build
        expect(smb_com_negotiate.packet).to eql packet_default_spec
                                                # top let(:packet_default_spec)
      end

      it 'returns the packet' do
        expect(smb_com_negotiate.build).to eql packet_default_spec
                                               # top let(:packet_default_spec)
      end
    end

    #default_params (what is the impact of exposing default_params?)

    #field
    #  BEHAVIOR & STRUCTURE

    # SMB_Header
    describe '#field returns a field by name' do
      it 'includes the :protocol field' do
        field  = smb_com_negotiate.field(:protocol)
        expect(field[:name]).to eql :protocol
      end

      it 'includes the :command field' do
        field  = smb_com_negotiate.field(:command)
        expect(field[:name]).to eql :command
      end

      it 'includes the :status field' do
        field  = smb_com_negotiate.field(:status)
        expect(field[:name]).to eql :status
      end

      it 'includes the :flags field' do
        field  = smb_com_negotiate.field(:flags)
        expect(field[:name]).to eql :flags
      end

      it 'includes the :flags2 field' do
        field  = smb_com_negotiate.field(:flags2)
        expect(field[:name]).to eql :flags2
      end

      it 'includes the :pid_high field' do
        field  = smb_com_negotiate.field(:pid_high)
        expect(field[:name]).to eql :pid_high
      end

      it 'includes the :security_features field' do
        field  = smb_com_negotiate.field(:security_features)
        expect(field[:name]).to eql :security_features
      end

      it 'includes the :reserved field' do
        field  = smb_com_negotiate.field(:reserved)
        expect(field[:name]).to eql :reserved
      end

      it 'includes the :tid field' do
        field  = smb_com_negotiate.field(:tid)
        expect(field[:name]).to eql :tid
      end

      it 'includes the :pid_low field' do
        field  = smb_com_negotiate.field(:pid_low)
        expect(field[:name]).to eql :pid_low
      end

      it 'includes the :uid field' do
        field  = smb_com_negotiate.field(:uid)
        expect(field[:name]).to eql :uid
      end

      it 'includes the :mid field' do
        field  = smb_com_negotiate.field(:mid)
        expect(field[:name]).to eql :mid
      end

      # SMB_Parameters
      it 'includes the :word_count field' do
        field  = smb_com_negotiate.field(:word_count)
        expect(field[:name]).to eql :word_count
      end

      it 'includes the :words field' do
        field  = smb_com_negotiate.field(:words)
        expect(field[:name]).to eql :words
      end

      # SMB_Data
      it 'includes the :byte_count field' do
        field  = smb_com_negotiate.field(:byte_count)
        expect(field[:name]).to eql :byte_count
      end
    end

    #fields
    describe '#fields' do
      it('is tested in #field') { }
    end

    #n_bytes_actual
    describe '#n_bytes_actual' do
      it 'sums the number of bytes of all the fields\' :value' do
        expect(smb_com_negotiate.n_bytes_actual).to \
          eql packet_default_spec.bytes.count # based on the packet_default_spec above
      end
    end

    #n_bytes_allocated
    describe '#n_bytes_allocated' do
      it 'sums the number of bytes of all the fields\' :n_byte' do
        expect(smb_com_negotiate.n_bytes_allocated).to \
          eql packet_default_spec.bytes.count # based on the packet_default_spec above
      end
    end

    #normalize - not tested for now.  may belong in a mixin

    #packet
    describe '#packet' do
      it 'returns a built packet' do
        expect(smb_com_negotiate.packet).to eql packet_default_spec
                                                # top let(:packet_default_spec)
      end
    end

    #params
    describe '#params' do
      let(:params) { smb_com_negotiate.params }

      #smb_header
      it 'includes the protocol n_bytes default' do
        n_bytes = params[:protocol][:n_bytes]
        default = 4

        expect(n_bytes).to eql default
       end

      it 'includes the protocol value default' do
        value   = normalize(params[:protocol][:value])
        default = normalize("\xFFSMB")

        expect(value).to eql default
      end

      it 'includes the command n_bytes default' do
        n_bytes = params[:command][:n_bytes]
        default = 1

        expect(n_bytes).to eql default
      end

      it 'includes the command value default' do
        value   = normalize(params[:command][:value])
        default = normalize("\x72")

        expect(value).to eql default
      end

      it 'includes the status n_bytes default' do
        n_bytes = params[:status][:n_bytes]
        default = 4

        expect(n_bytes).to eql default
      end

      it 'includes the status value default' do
        value   = normalize(params[:status][:value])
        default = normalize("\x00")

        expect(value).to eql default
      end

      it 'includes the flags n_bytes default' do
        n_bytes = params[:flags][:n_bytes]
        default = 1

        expect(n_bytes).to eql default
      end

      it 'includes the flags value default' do
        value   = normalize(params[:flags][:value])
        default = normalize("\x18")

        expect(value).to eql default
      end

      it 'includes the flags2 n_bytes default' do
        n_bytes = params[:flags2][:n_bytes]
        default = 2

        expect(n_bytes).to eql default
      end

      it 'includes the flags2 value default' do
        value   = normalize(params[:flags2][:value])
        default = normalize("\x48\x01")

        expect(value).to eql default
      end

      it 'includes the pid_high n_bytes default' do
        n_bytes = params[:pid_high][:n_bytes]
        default = 2

        expect(n_bytes).to eql default
      end

      it 'includes the pid_high value default' do
        value   = normalize(params[:pid_high][:value])
        default = normalize("\x00")

        expect(value).to eql default
      end

      it 'includes the security_features n_bytes default' do
        n_bytes = params[:security_features][:n_bytes]
        default = 8

        expect(n_bytes).to eql default
      end

      it 'includes the security_features value default' do
        value   = normalize(params[:security_features][:value])
        default = normalize("\x00")

        expect(value).to eql default
      end

      it 'includes the reserved n_bytes default' do
        n_bytes = params[:reserved][:n_bytes]
        default = 2

        expect(n_bytes).to eql default
      end

      it 'includes the reserved value default' do
        value   = normalize(params[:reserved][:value])
        default = normalize("\x00")

        expect(value).to eql default
      end

      it 'includes the tid n_bytes default' do
        n_bytes = params[:tid][:n_bytes]
        default = 2

        expect(n_bytes).to eql default
      end

      it 'includes the tid value default' do
        value   = normalize(params[:tid][:value])
        default = normalize("\xFF\xFF")

        expect(value).to eql default
      end

      it 'includes the pid_low n_bytes default' do
        n_bytes = params[:pid_low][:n_bytes]
        default = 2

        expect(n_bytes).to eql default
      end

      it 'includes the pid_low value default' do
        value   = normalize(params[:pid_low][:value])
        default = normalize("\x00")

        expect(value).to eql default
      end

      it 'includes the uid n_bytes default' do
        n_bytes = params[:uid][:n_bytes]
        default = 2

        expect(n_bytes).to eql default
      end

      it 'includes the uid value default' do
        value   = normalize(params[:uid][:value])
        default = normalize("\x00")

        expect(value).to eql default
      end

      it 'includes the mid n_bytes default' do
        n_bytes = params[:mid][:n_bytes]
        default = 2

        expect(n_bytes).to eql default
      end

      it 'includes the mid value default' do
        value   = normalize(params[:mid][:value])
        default = normalize("\x00")

        expect(value).to eql default
      end

      #smb_paratemers
      it 'includes the word_count n_bytes default' do
        n_bytes = params[:word_count][:n_bytes]
        default = 1

        expect(n_bytes).to eql default
      end

      it 'includes the word_count value default' do
        value   = normalize(params[:word_count][:value])
        default = normalize("\x00")

        expect(value).to eql default
      end

      it 'includes the words n_bytes default' do
        n_bytes = params[:words][:n_bytes]
        default = 0

        expect(n_bytes).to eql default
      end

      it 'includes the words value default' do
        value   = normalize(params[:words][:value])
        default = normalize("")

        expect(value).to eql default
      end

      #smb_data
      it 'includes the byte_count n_bytes default' do
        n_bytes = params[:byte_count][:n_bytes]
        default = 2

        expect(n_bytes).to eql default
      end

      it 'includes the byte_count value default' do
        value   = normalize(params[:byte_count][:value])
        default = normalize("\xA0\x00")

        expect(value).to eql default
      end

      it 'includes the dialects n_bytes default' do
        n_bytes = params[:dialects][:n_bytes]
        default = 34

        expect(n_bytes).to eql default
      end

      it 'includes the dialects value default' do
        value   = normalize(params[:dialects][:value])
        default = normalize("\x02NT LM 0.12\x00\x02SMB 2.002\x00\x02SMB 2.???\x00")

        expect(value).to eql default
      end

    end

    #parse
    describe 'parse' do
      it 'parses a packet:binary_string' do
        string_io = StringIO.new packet_default_spec
        packet    = smb_com_negotiate.parse(string_io)
      end
    end

    #structure
    describe '#structure' do
      it('is tested in #fields') { }
    end

    #to_binary_s
    describe '#to_binary_s' do
      it('is tested in #build') { }
    end
  end
end
end
end
end