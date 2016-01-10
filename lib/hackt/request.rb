module HackT

  class Request
    class << self

      def Login(email, password)
        HackTNet::Post '/player/login', email: email, password: password
      end

      def UserInfo(auth_token, id = 'my')
        HackTNet::Get  '/player/info',          auth_token: auth_token, id: id
      end

      def Scan(auth_token)
        HackTNet::Get  '/player/scan',          auth_token: auth_token
      end

      def SoftwareInfo(auth_token, id = 'my')
        HackTNet::Get  '/software/info',        auth_token: auth_token, id: id
      end

      def SoftwarePurchase(auth_token, software_id)
        HackTNet::Post '/software/purchase',    auth_token: auth_token, software_id: software_id
      end

      def DeviceInfo(auth_token, id = 'my')
        HackTNet::Get '/device/info',           auth_token: auth_token, id: id
      end

      def DevicePurchase(auth_token)
        HackTNet::Post '/device/purchase',      auth_token: auth_token
      end

      def NetworkInfo(auth_token, id = 'my')
        HackTNet::Get '/network/info',          auth_token: auth_token, id: id
      end

      def NetworkPurchase(auth_token)
        HackTNet::Post '/network/purchase',     auth_token: auth_token
      end

      def ContactInfo(auth_token, id = 'my')
        HackTNet::Get '/contact/info',          auth_token: auth_token, id: id
      end

      def ContactRequests(auth_token)
        HackTNet::Get '/contact/requests',      auth_token: auth_token
      end

      def SendContactRequest(auth_token, contact_id)
        HackTNet::Post '/contact/add',          auth_token: auth_token, contact_id: contact_id
      end

      def AcceptContactRequest(auth_token, request_id)
        HackTNet::Post '/contact/accept',       auth_token: auth_token, request_id: request_id
      end

      def DeclineContactRequest(auth_token, request_id)
        HackTNet::Post '/contact/decline',      auth_token: auth_token, request_id: request_id
      end

      def RemoveContact(auth_token, contact_id)
        HackTNet::Post '/contact/delete',       auth_token: auth_token, contact_id: contact_id
      end

      def BankInfo(auth_token, id = 'my')
        HackTNet::Get '/bank/info',             auth_token: auth_token, id: id
      end

      def CheckPin(auth_token, pin)
        HackTNet::Get '/bank/true',             auth_token: auth_token, pin: pin
      end

      def TransferBankFundsToSavings(auth_token, amount)
        HackTNet::Post '/bank/to_savings',      auth_token: auth_token, amount: amount
      end

      def TransferBankFundsToContact(auth_token, contact_id, amount)
        HackTNet::Post '/bank/transfer',        auth_token: auth_token, contact_id: contact_id, amount: amount
      end

      def TransferBankFundsFromVictim(auth_token, victim_id, amount, pin = nil)
        HackTNet::Post '/bank/transfer_from',   auth_token: auth_token, id: victim_id, amount: amount
      end

      def LogInfo(auth_token, id = 'my')
        HackTNet::Get  '/log/info',             auth_token: auth_token, id: id
      end

      def LogWrite(auth_token, text, id = 'my')
        HackTNet::Post '/log/write',            auth_token: auth_token, id: id, text: text
      end

      def VncInfo(auth_token)
        HackTNet::Get  '/vnc/info',             auth_token: auth_token
      end

      def VncPurchase(auth_token)
        HackTNet::Post '/vnc/buy',              auth_token: auth_token
      end

      def ClanInfo(auth_token, clan_id = 1)
        HackTNet::Get '/clan/info',             auth_token: auth_token, clan_id: clan_id
      end

      def Clans(auth_token)
        HackTNet::Get '/clan/clans',            auth_token: auth_token
      end

      def SendJoinClanRequest(auth_token, clan_id, message)
        HackTNet::Post '/clan/send_request',    auth_token: auth_token, text: message, clan_id: clan_id
      end

      def AcceptClanRequest(auth_token, clan_request_id)
        HackTNet::Post '/clan/accept_request',  auth_token: auth_token, id: clan_request_id
      end

      def UserViruses(auth_token)
        HackTNet::Get  '/virus/info',           auth_token: auth_token
      end

      def CollectVirus(auth_token, virus_id, amount = nil) #if amount is nil, it will collect all available
        HackTNet::Post '/virus/collect',        auth_token: auth_token, virus_id: virus_id, amount: amount
      end

      def Antivirus(auth_token)
        HackTNet::Get  '/antivirus/info',       auth_token: auth_token
      end

      def AntivirusDelete(auth_token, virus_id)
        HackTNet::Post '/antivirus/delete',     auth_token: auth_token, virus_id: virus_id
      end

      def AntivirusDeleteAll(auth_token)
        HackTNet::Post '/antivirus/delete_all', auth_token: auth_token
      end

      def AddProcess(auth_token, victim_user_id, process_type, software_type_id = nil, level = nil)
        #process_type can be 'download', 'crack', 'upload', 'download'
        #level arg is available only for upload process type
        #software_type_id is specified only for download or upload processes
        #software type id for upload can be 4 (reaper) or 5 (spam)

        HackTNet::Post '/process/add',          auth_token: auth_token, victim_id: victim_user_id, type: process_type, software_type: software_type_id, level: level
      end

      def DeleteProcess(auth_token, process_id)
        HackTNet::Post '/process/delete',       auth_token: auth_token, process_id: process_id
      end

      def UserProcesses(auth_token)
        HackTNet::Get  '/process/info',         auth_token: auth_token
      end

      def ProcessOverclock(auth_token, process_id)
        HackTNet::Post '/process/overclock',    auth_token: auth_token, process_id: process_id
      end

      def ProcessRetry(auth_token, process_id)
        HackTNet::Post '/process/retry',        auth_token: auth_token, process_id: process_id
      end

      def EndProcess(auth_token, process_id)
        HackTNet::Post '/process/end',          auth_token: auth_token, process_id: process_id
      end

    end
  end
end