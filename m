Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 894D062A236
	for <lists+samba-technical@lfdr.de>; Tue, 15 Nov 2022 20:52:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=C/nxonyOG5X9650VGTRDewA6LbRjXN1B+XcddRyjIug=; b=P+/ZS293j4bnHfaSDqUTi2w3Yr
	PscMISABqBrdP5OZDtabDX/SVaEwMi3BFuLRTEpU325jFr3r/WBLui4QDHESXjK6RG3iWrlw5Qowi
	v7qroeSN3vdCVLz19CbizMdSRoqGV0SlxrNlNVmD8WGHU4S+tF4oyQykKV8+HRHCkPKYeV97b6J19
	rjuPZrKaifuYF7hSk+/mrAYL1zYmbF+Plk+8RthI/sFWRFkC/p1qDs1XjkDdj7NmXP8zPnNMQtxn8
	MHkWz69E1LFEQ1Y9lCQv2pgRdrTcVKj8C6HZDpm8XIFWiSzMo1iuKvQpmKlG4nofK3SAAv+zvmGcD
	Bbt4AxeA==;
Received: from ip6-localhost ([::1]:63934 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ov1yl-00Dzvc-0r; Tue, 15 Nov 2022 19:52:19 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:58733) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ov1yf-00DzvT-0t
 for samba-technical@lists.samba.org; Tue, 15 Nov 2022 19:52:16 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4F4AD402B5;
 Tue, 15 Nov 2022 22:52:11 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 100663D3;
 Tue, 15 Nov 2022 22:52:09 +0300 (MSK)
Message-ID: <1f00b2cd-2368-b6a5-ef70-b917dd42794c@msgid.tls.msk.ru>
Date: Tue, 15 Nov 2022 22:52:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: failing tests in the testsuite on debian
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <de87d255-95d0-ac34-1544-fa0aac441f4b@msgid.tls.msk.ru>
 <66781199-ab84-1c05-3224-ed65cb9b12bc@msgid.tls.msk.ru>
 <Y3PPjghJzwYBPlAN@jeremy-acer>
In-Reply-To: <Y3PPjghJzwYBPlAN@jeremy-acer>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thank you very much Jeremy for stepping in!

15.11.2022 20:42, Jeremy Allison via samba-technical wrote:
> On Tue, Nov 15, 2022 at 06:12:44PM +0300, Michael Tokarev via samba-technical wrote:

>> Certain tests do continue to fail though, and I still don't see how
>> to address this.
> 
> Which tests. Specific tests sometimes are expected
> to fail.

Here's my current knownfail.d list for the --quick test run:

^samba3.smb2.session\ enc.(reauth.|bind.|bind_negative.*|bind_invalid_auth|encryption-aes-.*)\(nt4_dc\)
^samba4.ntvfs.cifs.ntlm.base.unlink.unlink\(rpc_proxy\)
^samba4.rpc.echo\ against\ rpc\ proxy\ with\ domain\ creds\(rpc_proxy\)

I found no way to exclude certain tests (but the previous email from Ralph
gives some clues).  None of the above tests seems to have reasons for failure.

I'm pasting the output from the failing tests below.


[35(230)/370 at 58s] samba3.smb2.session enc(nt4_dc)
UNEXPECTED(failure): samba3.smb2.session enc.reauth1(nt4_dc)
REASON: Exception: Exception: ../../source4/torture/smb2/session.c:247: (&io1)->out.file_attr was 128 (0x80), expected 32 (0x20): out.file_attr incorrect
UNEXPECTED(failure): samba3.smb2.session enc.reauth2(nt4_dc)
REASON: Exception: Exception: ../../source4/torture/smb2/session.c:323: (&io1)->out.file_attr was 128 (0x80), expected 32 (0x20): out.file_attr incorrect
...(many of them)...

this is ATTRIBUTE_ARCHIVE vs ATTRIBUTE_NORMAL. The test is
expecting the newly created files to have "a" attribute but
apparently there's none. Just a thought here - maybe it has
something to do with this user being unable to create extended
attributes, or maybe tmpfs (where I run the whole thing) does
not support it.



tdbsam_open: Converting version 0.0 database to version 4.0.
tdbsam_convert_backup: updated /build/pkg/samba-4.17.3+dfsg/testbuild/st/nt4_dc_schannel/private/passdb.tdb file.
Unable to resolve group domusers to a SID
Unable to resolve group domadmins to a SID
Unable to resolve group everyone to a SID
[50(509)/370 at 5m38s, 1 errors] samba3.rpc.schannel_anon_setpw anonymous password set (schannel enforced server-side)(nt4_dc_schannel)
smbtorture 4.17.3
Using seed 1668541127
Failed with dcerpc_flags=0x800220
WARNING!: ../../source4/torture/rpc/schannel.c:796: status was NT_STATUS_CONNECTION_DISCONNECTED, expected NT_STATUS_OK: Failed to connect without 
schannel
Failed with dcerpc_flags=0x800220
UNEXPECTED(failure): samba3.rpc.schannel_anon_setpw anonymous password set (schannel enforced server-side).schannel_anon_setpw(nt4_dc_schannel)
REASON: Exception: Exception: ../../source4/torture/rpc/schannel.c:796: status was NT_STATUS_CONNECTION_DISCONNECTED, expected NT_STATUS_OK: Failed to 
connect without schannel
command:  /build/pkg/samba-4.17.3+dfsg/testbuild/bin/smbtorture  $LOADLIST --configfile=$SMB_CONF_PATH --option='fss:sequence timeout=1' 
--maximum-runtime=$SELFTEST_MAXTIME --basedir=$SELFTES
T_TMPDIR --format=subunit --option=torture:progress=no --option=torture:quick=yes --option=torture:sharedelay=100000 
--option=torture:writetimeupdatedelay=500000 --target=samba3 //$SERVER_IP/
tmp -U$% rpc.schannel_anon_setpw 2>&1  | python3 /build/pkg/samba-4.17.3+dfsg/testbuild/selftest/filter-subunit --fail-on-empty 
--prefix="samba3.rpc.schannel_anon_setpw anonymous password set
  (schannel enforced server-side)." --suffix="(nt4_dc_schannel)"
expanded command:  /build/pkg/samba-4.17.3+dfsg/testbuild/bin/smbtorture  $LOADLIST 
--configfile=/build/pkg/samba-4.17.3+dfsg/testbuild/st/client/client.conf --option='fss:sequence timeout=1'
  --maximum-runtime=1200 --basedir=/build/pkg/samba-4.17.3+dfsg/testbuild/st/tmp --format=subunit --option=torture:progress=no 
--option=torture:quick=yes --option=torture:sharedelay=100000 --o
ption=torture:writetimeupdatedelay=500000 --target=samba3 //10.53.57.9/tmp -U$% rpc.schannel_anon_setpw 2>&1  | python3 
/build/pkg/samba-4.17.3+dfsg/testbuild/selftest/filter-subunit --fail-o
n-empty --prefix="samba3.rpc.schannel_anon_setpw anonymous password set (schannel enforced server-side)." --suffix="(nt4_dc_schannel)"
ERROR: Testsuite[samba3.rpc.schannel_anon_setpw anonymous password set (schannel enforced server-side)(nt4_dc_schannel)]
REASON: Exit code was 1




Unable to determine the DomainSID, can not enforce uniqueness constraint on local domainSIDs

Repacking database from v1 to v2 format (first record CN=Schema-ID-GUID,CN=Schema,CN=Configuration,DC=LOCALRPCPROXY)
Repack: re-packed 10000 records so far
Repacking database from v1 to v2 format (first record CN=nTDSConnection-Display,CN=415,CN=DisplaySpecifiers,CN=Configuration,DC=LOCALRPCPROXY)
Repacking database from v1 to v2 format (first record CN=9738c400-7795-4d6e-b19d-c16cd6486166,CN=Operations,CN=DomainUpdates,CN=System,DC=LOCALRPCPROXY)
Could not find machine account in secrets database: Failed to fetch machine account password for SAMBADOMAIN from both secrets.ldb (Could not find 
entry to match filter: '(&(flatname=SAMBADOM
AIN)(objectclass=primaryDomain))' base: 'cn=Primary Domains': No such object: dsdb_search at ../../source4/dsdb/common/util.c:4836) and from 
/build/pkg/samba-4.17.3+dfsg/testbuild/st/rpc_prox
y/private/secrets.tdb: NT_STATUS_CANT_ACCESS_DOMAIN_INFO
Could not find machine account in secrets database: Failed to fetch machine account password for SAMBADOMAIN from both secrets.ldb (Could not find 
entry to match filter: '(&(flatname=SAMBADOM
AIN)(objectclass=primaryDomain))' base: 'cn=Primary Domains': No such object: dsdb_search at ../../source4/dsdb/common/util.c:4836) and from 
/build/pkg/samba-4.17.3+dfsg/testbuild/st/rpc_prox
y/private/secrets.tdb: NT_STATUS_CANT_ACCESS_DOMAIN_INFO
Could not find machine account in secrets database: Failed to fetch machine account password for SAMBADOMAIN from both secrets.ldb (Could not find 
entry to match filter: '(&(flatname=SAMBADOM
AIN)(objectclass=primaryDomain))' base: 'cn=Primary Domains': No such object: dsdb_search at ../../source4/dsdb/common/util.c:4836) and from 
/build/pkg/samba-4.17.3+dfsg/testbuild/st/rpc_prox
y/private/secrets.tdb: NT_STATUS_CANT_ACCESS_DOMAIN_INFO
Joined domain SAMBADOMAIN (S-1-5-21-772749774-2788998791-3936253823)
ERROR: Unable to find account where 'sAMAccountName=localrpcproxy$'
Delegation failed
NSS_WRAPPER_HOSTS='/build/pkg/samba-4.17.3+dfsg/testbuild/st/hosts' SOCKET_WRAPPER_DEFAULT_IFACE="21" 
RESOLV_WRAPPER_HOSTS="/build/pkg/samba-4.17.3+dfsg/testbuild/st/dns_host_file" KRB5_CONFI
G="/build/pkg/samba-4.17.3+dfsg/testbuild/st/ad_dc_ntvfs/etc/krb5.conf" KRB5CCNAME="/build/pkg/samba-4.17.3+dfsg/testbuild/st/rpc_proxy/krb5_ccache" 
RESOLV_CONF="/build/pkg/samba-4.17.3+dfsg/
testbuild/st/dns_hub/rootdnsforwarder/resolv.conf" GNUPGHOME="/build/pkg/samba-4.17.3+dfsg/testbuild/st/ad_dc_ntvfs/gnupg" python3 ./bin/samba-tool 
delegation for-any-protocol 'LOCALRPCPROXY$
' on --configfile=/build/pkg/samba-4.17.3+dfsg/testbuild/st/ad_dc_ntvfs/etc/smb.conf at 
/build/pkg/samba-4.17.3+dfsg/testbuild/selftest/target/Samba4.pm line 1451.
failed to start up environment 'rpc_proxy' at /build/pkg/samba-4.17.3+dfsg/testbuild/selftest/target/Samba.pm line 126.
samba can't start up known environment 'rpc_proxy' at /build/pkg/samba-4.17.3+dfsg/testbuild/selftest/selftest.pl line 824.
no output for name[samba4.ntvfs.cifs.krb5.base.unlink(rpc_proxy)]



[314(2653)/370 at 12m11s, 3 errors] samba4.ntvfs.cifs.ntlm.base.unlink(rpc_proxy)
Can't call method "getlog_env" on an undefined value at /build/pkg/samba-4.17.3+dfsg/testbuild/selftest/selftest.pl line 864.
server_stdin_handler: samba: EOF on stdin - PID 1050484 terminating
server_stdin_handler: samba: EOF on stdin - PID 1054363 terminating
server_stdin_handler: samba: EOF on stdin - PID 1054575 terminating
server_stdin_handler: samba: EOF on stdin - PID 1054118 terminating
dns_hub: after poll()
dns_hub[UDP[10.53.57.64]]: before shutdown()
server_stdin_handler: samba: EOF on stdin - PID 1053883 terminating
server_stdin_handler: samba: EOF on stdin - PID 1048388 terminating
server_stdin_handler: samba: EOF on stdin - PID 1047332 terminating
dns_hub[UDP[10.53.57.64]]: after serve_forever()
dns_hub[UDP[10.53.57.64]]: after shutdown()
dns_hub[UDP[fd00:0000:0000:0000:0000:0000:5357:5f40]]: before shutdown()
smbtorture 4.17.3
WARNING: The option -k|--kerberos is deprecated!
Can't load  - run testparm to debug it
Using seed 1668541525
Failed to open connection - NT_STATUS_NETWORK_UNREACHABLE
UNEXPECTED(failure): samba4.ntvfs.cifs.ntlm.base.unlink.unlink(rpc_proxy)
REASON: Exception: Exception: ../../source4/torture/util_smb.c:856: Expression `torture_open_connection(&cli1, torture_ctx, 0)' failed: Failed to open 
connection

(this is actually 2 failures at once).



That's it.  I have complete log and subunit files there:
  http://www.corpit.ru/mjt/tmp/samba-test-logs/
(The above are cut-n-pastes from "log").


Now, thinking about this more, maybe I really should not try to
run these tests at all, as has been suggested by others in this
thread - a more productive test for packaging is to run smbtorture
against just built production samba.  It's interesting to find out
why they're failing anyway.

Thank you!

/mjt

