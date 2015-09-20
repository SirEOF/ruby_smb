require 'spec_helper'

module RubySMB
module SMB1
module Command
RSpec.describe SMB_COM_NEGOTIATE do
  describe '#smb_header' do
    it 'is 32 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header

      expect(smb_com_negotiate.n_bytes(smb_header)).to eql 32
    end
  end

  describe 'protocol field' do
    it 'is 4 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header
      protocol          = smb_header[:protocol]

      expect(protocol[:n_bytes]).to eql 4
    end
  end

  describe 'command field' do
    it 'is 1 byte in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header
      command           = smb_header[:command]

      expect(command[:n_bytes]).to eql 1
    end
  end

  describe 'status field' do
    it 'is 4 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header
      status            = smb_header[:status]

      expect(status[:n_bytes]).to eql 4
    end
  end

  describe 'flags field' do
    it 'is 1 byte in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header
      flags             = smb_header[:flags]

      expect(flags[:n_bytes]).to eql 1
    end
  end

  describe 'flags2 field' do
    it 'is 2 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header
      flags2            = smb_header[:flags2]

      expect(flags2[:n_bytes]).to eql 2
    end
  end

  describe 'pid_high field' do
    it 'is 2 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header
      pid_high          = smb_header[:pid_high]

      expect(pid_high[:n_bytes]).to eql 2
    end
  end

  describe 'security_features field' do
    it 'is 8 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header
      security_features = smb_header[:security_features]

      expect(security_features[:n_bytes]).to eql 8
    end
  end

  describe 'reserved field' do
    it 'is 2 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header
      reserved          = smb_header[:reserved]

      expect(reserved[:n_bytes]).to eql 2
    end
  end

  describe 'tid field' do
    it 'is 2 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header
      tid               = smb_header[:tid]

      expect(tid[:n_bytes]).to eql 2
    end
  end

  describe 'pid_low field' do
    it 'is 2 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header
      pid_low           = smb_header[:pid_low]

      expect(pid_low[:n_bytes]).to eql 2
    end
  end

  describe 'uid field' do
    it 'is 2 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header
      uid               = smb_header[:uid]

      expect(uid[:n_bytes]).to eql 2
    end
  end

  describe 'mid field' do
    it 'is 2 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_header        = smb_com_negotiate.smb_header
      mid               = smb_header[:mid]

      expect(mid[:n_bytes]).to eql 2
    end
  end

  describe '#smb_parameters' do
    it 'is 1 byte in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_parameters    = smb_com_negotiate.smb_parameters

      expect(smb_com_negotiate.n_bytes(smb_parameters)).to eql 1
    end
  end

  describe 'wordcount' do
    it 'is 1 byte in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_parameters    = smb_com_negotiate.smb_parameters
      wordcount         = smb_parameters[:wordcount]

      expect(wordcount[:n_bytes]).to eql 1
    end
  end

  describe 'words' do
    it 'is 0 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_parameters    = smb_com_negotiate.smb_parameters
      words             = smb_parameters[:words]

      expect(words[:n_bytes]).to eql 0
    end
  end

  describe 'smb_parameters' do
    it 'has a binary string representation'
  end

  describe '#smb_data' do
    it 'is 13 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_data          = smb_com_negotiate.smb_data

      expect(smb_com_negotiate.n_bytes(smb_data)).to eql 13
    end
  end

  describe 'bytecount' do
    it 'is 2 bytes in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_data          = smb_com_negotiate.smb_data
      bytecount         = smb_data[:bytecount]

      expect(bytecount[:n_bytes]).to eql 2
    end
  end

  describe 'buffer_format' do
    it 'is 1 byte in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_data          = smb_com_negotiate.smb_data
      buffer_format     = smb_data[:buffer_format]

      expect(buffer_format[:n_bytes]).to eql 1
    end
  end

  describe 'dialect_string' do
    it 'is 1 byte in length' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      smb_data          = smb_com_negotiate.smb_data
      dialect_string    = smb_data[:dialect_string]

      expect(dialect_string[:n_bytes]).to eql 10
    end
  end

  describe '#to_binary_s' do
    it 'generates a binary string' do
      smb_com_negotiate = SMB_COM_NEGOTIATE.new
      binary_string     = smb_com_negotiate.to_binary_s

      # ap binary_string

      packed_fixture = {
                 protocol: "\xFFSMB",
                  command: "r",
                   status: "\x00\x00\x00\x00",
                    flags: "\x00",
                   flags2: "\x00\x00",
                 pid_high: "\x00\x00",
        security_features: "\x00\x00\x00\x00\x00\x00\x00\x00",
                 reserved: "\x00\x00",
                      tid: "\x00\x00",
                  pid_low: "\x00\x00",
                      uid: "\x00\x00",
                      mid: "\x00\x00",

               word_count: "\x00",
                    words: "",

               byte_count: "\xA0\x00",
            buffer_format: "\x02",
           dialect_string: "NT LM 0.12",
      }.values.reduce(:+).bytes.pack('C*')

      smb_com_negotiate.params = { dialect_string: "FOO" }

      # expect(binary_string).to eql packed_fixture

      ap smb_com_negotiate.params
    end
  end

end
end
end
end