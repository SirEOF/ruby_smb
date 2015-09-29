require 'bit-struct'
require 'net/ntlm'
require 'net/ntlm/client'
require 'windows_error'
require 'windows_error/nt_status'
# A packet parsing and manipulation library for the SMB1 and SMB2 protocols
#
# [[MS-SMB] Server Mesage Block (SMB) Protocol Version 1](https://msdn.microsoft.com/en-us/library/cc246482.aspx)
# [[MS-SMB2] Server Mesage Block (SMB) Protocol Versions 2 and 3](https://msdn.microsoft.com/en-us/library/cc246482.aspx)
module RubySMB
  autoload :Dispatcher, 'ruby_smb/dispatcher'
  autoload :Error, 'ruby_smb/error'
  autoload :VERSION, 'ruby_smb/version'
  autoload :Version, 'ruby_smb/version'
  autoload :SMB1, 'ruby_smb/smb1'
  autoload :Field, 'ruby_smb/field'
end
