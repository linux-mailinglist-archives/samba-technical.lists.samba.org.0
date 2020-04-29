Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 950A81BD95C
	for <lists+samba-technical@lfdr.de>; Wed, 29 Apr 2020 12:18:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Ev0dprr6nL23b1Sm2b10/0gsqE+snATFpmF15a2BYk8=; b=b+C5RmayurUyWigVpCIUf+Plfz
	QmnYlJshmLKPvXTeTNRiRO/f/fZ1e7IbMjb1m0GS0InKzEZDPQ/uUm+YL9mJ1KVyPNlxewvIJ2SOx
	B2GyZdNPTq5pX72qaV5+C968J+J/zBw34MW29qr1XXz5JrthLbpK1tAkvQf1Roj6Laeg03CSp8tS6
	G+E9y61NGZLbHyfSX7zcN+dSitRRje0tFCrD7WfJXhtu2J7sAdtCttE8Obz8ZkEnhpjYTngjWfy4S
	/Lp/2dZhp0QuKCMtREUwr5VAT8n09WHXFqXYiCv+WvOkLgUpTFqJxtGuQmxL5znsvY81stpeqBq/G
	ivt6Aj1A==;
Received: from localhost ([::1]:20824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jTjn3-002Uxk-5X; Wed, 29 Apr 2020 10:18:05 +0000
Received: from mx1.od-net.eu ([194.59.207.220]:58502) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jTjmp-002Uxb-M9
 for samba-technical@lists.samba.org; Wed, 29 Apr 2020 10:18:01 +0000
Received: from mail.omtn.de (ip1f105b0c.dynamic.kabel-deutschland.de
 [31.16.91.12])
 (using TLSv1 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: mail.omtn.de)
 by mx1.od-net.eu (Postfix) with ESMTPSA id 9B76E61031
 for <samba-technical@lists.samba.org>; Wed, 29 Apr 2020 11:58:32 +0200 (CEST)
Received: from [192.168.193.28] (unknown [192.168.193.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.omtn.de (Postfix) with ESMTPSA id EADC2180070
 for <samba-technical@lists.samba.org>; Wed, 29 Apr 2020 11:58:32 +0200 (CEST)
To: samba-technical@lists.samba.org
Subject: samba 4.12.2: WERR_DNS_ERROR_DS_UNAVAILABLE, unable to manage samba
 DNS
Message-ID: <6138360f-64b7-c602-7c5d-72cb0c764014@o-dreyer.de>
Date: Wed, 29 Apr 2020 11:58:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=mail.omtn.de smtp.mailfrom=dreyer@o-dreyer.de
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Olaf Dreyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Olaf Dreyer <dreyer@o-dreyer.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I run a setup with two Samba DC (currently samba 4.12.2 on debian 10 
VMs). I started with a Windows 2003 DC but the last Windows DC has been 
removed a few years ago from this setup.

Yesterday I recognized (might be older though) a problem with DNS 
administration. I am using the Samba Built-In DNS.

I added two new Windows 10 clients to the domain and they did not manage 
to register in the DNS domain.

Cross check on DC:

root@OMTNDC3:/usr/local/samba# samba-tool dns query omtndc3 omtn.de 
master A -k 1
ERROR(runtime): uncaught exception - (9717, 
'WERR_DNS_ERROR_DS_UNAVAILABLE')
   File 
"/usr/local/samba/lib/python3.7/site-packages/samba/netcmd/__init__.py", 
line 186, in _run
     return self.run(*args, **kwargs)
   File 
"/usr/local/samba/lib/python3.7/site-packages/samba/netcmd/dns.py", line 
865, in run
     raise e
   File 
"/usr/local/samba/lib/python3.7/site-packages/samba/netcmd/dns.py", line 
861, in run
     None, record_type, select_flags, None, None)

On the other hand, nslookup is working fine.

root@OMTNDC3:/usr/local/samba# nslookup master
Server:         192.168.193.223
Address:        192.168.193.223#53

Name:   master.omtn.de
Address: 192.168.193.230

Another check: The Windows RSAT DNS app says that there is no AD.

So, it looks like DNS is working, but I cannot any longer use any admin 
tool.

smb.conf:

# Global parameters
[global]
         netbios name = OMTNDC3
         realm = OMTN.DE
         dns forwarder = 192.168.193.230
         workgroup = OMTN
         server role = active directory domain controller
         # idmap_ldb:use rfc2307 = yes
         #debuglevel = dns:1

[netlogon]
         path = /usr/local/samba/var/locks/sysvol/omtn.de/scripts
         read only = No

[sysvol]
         path = /usr/local/samba/var/locks/sysvol
         read only = No

The output of samba-tool drs showrepl looks strange, what does NTTIME(0) 
mean?

root@OMTNDC3:/usr/local/samba# samba-tool drs showrepl
CorporateDataCenter\OMTNDC3
DSA Options: 0x00000001
DSA object GUID: 7abd666f-d3bc-4e8f-9ff3-cf3abd802ee5
DSA invocationId: de8ee55e-2383-4f4e-aa8d-03a86c0bba2d

==== INBOUND NEIGHBORS ====

DC=ForestDnsZones,DC=omtn,DC=de
         CorporateDataCenter\OMTNDC8 via RPC
                 DSA object GUID: 2d035437-cec0-4a24-bdd0-0b599915e3b6
                 Last attempt @ Wed Apr 29 11:25:28 2020 CEST was 
successful
                 0 consecutive failure(s).
                 Last success @ Wed Apr 29 11:25:28 2020 CEST

DC=omtn,DC=de
         CorporateDataCenter\OMTNDC8 via RPC
                 DSA object GUID: 2d035437-cec0-4a24-bdd0-0b599915e3b6
                 Last attempt @ Wed Apr 29 11:25:28 2020 CEST was 
successful
                 0 consecutive failure(s).
                 Last success @ Wed Apr 29 11:25:28 2020 CEST

CN=Schema,CN=Configuration,DC=omtn,DC=de
         CorporateDataCenter\OMTNDC8 via RPC
                 DSA object GUID: 2d035437-cec0-4a24-bdd0-0b599915e3b6
                 Last attempt @ Wed Apr 29 11:25:28 2020 CEST was 
successful
                 0 consecutive failure(s).
                 Last success @ Wed Apr 29 11:25:28 2020 CEST

CN=Configuration,DC=omtn,DC=de
         CorporateDataCenter\OMTNDC8 via RPC
                 DSA object GUID: 2d035437-cec0-4a24-bdd0-0b599915e3b6
                 Last attempt @ Wed Apr 29 11:25:29 2020 CEST was 
successful
                 0 consecutive failure(s).
                 Last success @ Wed Apr 29 11:25:29 2020 CEST

DC=DomainDnsZones,DC=omtn,DC=de
         CorporateDataCenter\OMTNDC8 via RPC
                 DSA object GUID: 2d035437-cec0-4a24-bdd0-0b599915e3b6
                 Last attempt @ Wed Apr 29 11:25:28 2020 CEST was 
successful
                 0 consecutive failure(s).
                 Last success @ Wed Apr 29 11:25:28 2020 CEST

==== OUTBOUND NEIGHBORS ====

DC=ForestDnsZones,DC=omtn,DC=de
         CorporateDataCenter\OMTNDC8 via RPC
                 DSA object GUID: 2d035437-cec0-4a24-bdd0-0b599915e3b6
                 Last attempt @ NTTIME(0) was successful
                 0 consecutive failure(s).
                 Last success @ NTTIME(0)

DC=omtn,DC=de
         CorporateDataCenter\OMTNDC8 via RPC
                 DSA object GUID: 2d035437-cec0-4a24-bdd0-0b599915e3b6
                 Last attempt @ NTTIME(0) was successful
                 0 consecutive failure(s).
                 Last success @ NTTIME(0)

CN=Schema,CN=Configuration,DC=omtn,DC=de
         CorporateDataCenter\OMTNDC8 via RPC
                 DSA object GUID: 2d035437-cec0-4a24-bdd0-0b599915e3b6
                 Last attempt @ NTTIME(0) was successful
                 0 consecutive failure(s).
                 Last success @ NTTIME(0)

CN=Configuration,DC=omtn,DC=de
         CorporateDataCenter\OMTNDC8 via RPC
                 DSA object GUID: 2d035437-cec0-4a24-bdd0-0b599915e3b6
                 Last attempt @ NTTIME(0) was successful
                 0 consecutive failure(s).
                 Last success @ NTTIME(0)

DC=DomainDnsZones,DC=omtn,DC=de
         CorporateDataCenter\OMTNDC8 via RPC
                 DSA object GUID: 2d035437-cec0-4a24-bdd0-0b599915e3b6
                 Last attempt @ NTTIME(0) was successful
                 0 consecutive failure(s).
                 Last success @ NTTIME(0)

==== KCC CONNECTION OBJECTS ====

Connection --
         Connection name: 340530b4-a0d6-4f58-a9e3-5a524d2aac42
         Enabled        : TRUE
         Server DNS name : omtndc8.omtn.de
         Server DN name  : CN=NTDS 
Settings,CN=OMTNDC8,CN=Servers,CN=CorporateDataCenter,CN=Sites,CN=Configuration,DC=omtn,DC=de
                 TransportType: RPC
                 options: 0x00000001
Warning: No NC replicated for Connection!


samba_dnsupdate --verbose
No DNS updates needed

Any help is welcome.

Best regards,
Olaf Dreyer


