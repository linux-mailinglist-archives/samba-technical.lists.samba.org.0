Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 73285626B8E
	for <lists+samba-technical@lfdr.de>; Sat, 12 Nov 2022 21:25:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=iL6+wWhbTe7/c2xlgmAPVXGblK7E0GMc8Y7FVzhAAJo=; b=5nOmeOTdpgDDpeY3fbHYHKIc2W
	6V96Yjwm68x7btj2+zHucff4Dk/uPcxDCHMF0MORXZBLh+xy/RxNgwuuRJlfuTJYBYqANjKQw7tcX
	OIzuQwfaChc9E3HxMbtU2lTqnH19o6SjoIPdmGrz3L+cKWbqzvpsxffqHyeSa56TV3a1+bd861RhY
	jEMuKCMYt1ZeOD48rZ8QZZLLjiYFhZZelLwp8ZF+Q4nl3qM0p9S2LFrtdugfcP//gOP5NtRu/JUlU
	pKfQccDwi9Oz2QfJtQJhfI1MD+GhHSqgSpKoF/RIqlWNFCD2ufWajaJvpYuaDlEdag+0qY5nFD3/v
	HCn1Z0Qg==;
Received: from ip6-localhost ([::1]:60080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1otx3Q-00CaDY-Ue; Sat, 12 Nov 2022 20:24:41 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:33225) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1otx3K-00CaDP-AE
 for samba-technical@lists.samba.org; Sat, 12 Nov 2022 20:24:38 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 537CB40191
 for <samba-technical@lists.samba.org>; Sat, 12 Nov 2022 23:24:23 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 218AA6B
 for <samba-technical@lists.samba.org>; Sat, 12 Nov 2022 23:24:28 +0300 (MSK)
Message-ID: <06c4ce9f-0dfb-8deb-7ef0-78ffd78e630c@msgid.tls.msk.ru>
Date: Sat, 12 Nov 2022 23:24:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: failing tests in the testsuite on debian
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
In-Reply-To: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

ok. After quite some digging I found out that the selftest was missing
two pieces - namely, tdb-tools (for tdbbackup) and lmdb-utils - spotted
this in the test log, by a very good chance.  After installing the two,
the --quick test looks quite a bit more promising now.  But there are
failures still.


1.
xfail: samba3.smb2.session enc.reconnect1(nt4_dc) [
Exception: Exception: ../../source4/torture/smb2/session.c:91: (&io1)->out.file_attr was 128 (0x80), expected 32 (0x20): out.file_attr incorrect
]
there are 30+ failures like this.

This is FILE_ATTRIBUTE_ARCHIVE (0x20) vs FILE_ATTRIBUTE_NORMAL (0x80).
Apparently the testsuite expects a file to have ARCHIVE attribute,
but in reality it is NORMAL instead.  This happens in
samba3.smb2.session enc.* tests only, so far.


2.
failure: samba3.rpc.schannel_anon_setpw anonymous password set (schannel enforced server-side).schannel_anon_setpw(nt4_dc_schannel) [
Exception: Exception: ../../source4/torture/rpc/schannel.c:796: status was NT_STATUS_CONNECTION_DISCONNECTED, expected NT_STATUS_OK: Failed to connect 
without schannel
]


3.
Repacking database from v1 to v2 format (first record CN=CA-Certificate-DN,CN=Schema,CN=Configuration,DC=LOCALRPCPROXY)
Repack: re-packed 10000 records so far
Repacking database from v1 to v2 format (first record CN=organizationalUnit-Display,CN=40C,CN=DisplaySpecifiers,CN=Configuration,DC=LOCALRPCPROXY)
Repacking database from v1 to v2 format (first record CN=Backup Operators,CN=Builtin,DC=LOCALRPCPROXY)
Could not find machine account in secrets database: Failed to fetch machine account password for SAMBADOMAIN from both secrets.ldb (Could not find 
entry to match filter: '>
Could not find machine account in secrets database: Failed to fetch machine account password for SAMBADOMAIN from both secrets.ldb (Could not find 
entry to match filter: '>
Could not find machine account in secrets database: Failed to fetch machine account password for SAMBADOMAIN from both secrets.ldb (Could not find 
entry to match filter: '>
Joined domain SAMBADOMAIN (S-1-5-21-3017863810-1230438808-2260356029)
ERROR: Unable to find account where 'sAMAccountName=localrpcproxy$'
Delegation failed
NSS_WRAPPER_HOSTS='/build/pkg/samba-4.17.2+dfsg/testbuild/st/hosts' SOCKET_WRAPPER_DEFAULT_IFACE="21" 
RESOLV_WRAPPER_HOSTS="/build/pkg/samba-4.17.2+dfsg/testbuild/st/dns_h>
failed to start up environment 'rpc_proxy' at /build/pkg/samba-4.17.2+dfsg/testbuild/selftest/target/Samba.pm line 126.
samba can't start up known environment 'rpc_proxy' at /build/pkg/samba-4.17.2+dfsg/testbuild/selftest/selftest.pl line 824.
no output for name[samba4.rpc.echo against rpc proxy with domain creds(rpc_proxy)]

It is still failing in setting environment for rpc_proxy, but now due to a different error,
it seems, - missing sAMAccountName=localrpcproxy$.  This is seen in the output only not
in st/subunit. In the subunit file, here's the info about this:

PROVISIONING RPC PROXY...
User 'testallowed' added successfully
User 'srv_account' added successfully
Modified 1 records successfully
Modified 1 records successfully
User 'testdenied' added successfully
Modified 1 records successfully
User 'testupnspn' added successfully
Modified 1 records successfully
Added members to group Allowed RODC Password Replication Group
User 'alice' added successfully
User 'bob' added successfully
User 'jane' added successfully
User 'joe' added successfully
Added group Samba Users
Added members to group Samba Users
Changed primary group to 'Samba Users'
Modified 1 records successfully
NSS_WRAPPER_HOSTS='/build/pkg/samba-4.17.2+dfsg/testbuild/st/hosts' SOCKET_WRAPPER_DEFAULT_IFACE="21" 
RESOLV_WRAPPER_HOSTS="/build/pkg/samba-4.17.2+dfsg/testbuild/st/dns_host_file" 
KRB5_CONFIG="/build/pkg/samba-4.17.2+dfsg/testbuild/st/ad_dc_ntvfs/etc/krb5.conf" 
KRB5CCNAME="/build/pkg/samba-4.17.2+dfsg/testbuild/st/rpc_proxy/krb5_ccache" 
RESOLV_CONF="/build/pkg/samba-4.17.2+dfsg/testbuild/st/dns_hub/rootdnsforwarder/resolv.conf" 
GNUPGHOME="/build/pkg/samba-4.17.2+dfsg/testbuild/st/ad_dc_ntvfs/gnupg" python3 ./bin/samba-tool delegation for-any-protocol 'LOCALRPCPROXY$' on 
--configfile=/build/pkg/samba-4.17.2+dfsg/testbuild/st/ad_dc_ntvfs/etc/smb.conftestsuite: samba4.rpc.echo against rpc proxy with domain creds(rpc_proxy)
testsuite-error: samba4.rpc.echo against rpc proxy with domain creds(rpc_proxy) [
unable to set up environment rpc_proxy - exiting
]


And the summary is:
FAILED (39 failures, 0 errors and 0 unexpected successes in 3 testsuites)


Should we be concerned?

Thanks,

/mjt

