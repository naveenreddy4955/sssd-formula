attributes = yaml(content: inspec.profile.file('attributes.yml')).params

control 'sssd-1.0' do
  impact 1.0
  title 'SSSD package'
  desc 'SSSD package should be installed'
  describe package(attributes[os.family]['package']) do
    it { should be_installed }
  end
end

control 'sssd-2.0' do
  impact 0.5
  title 'SSSD config file'
  desc 'SSSD config file should be created'
  describe file(attributes[os.family]['config']) do
    it { should exist }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('mode') { should cmp '0600' }
  end
end
