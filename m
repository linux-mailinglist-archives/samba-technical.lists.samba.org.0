Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E2423035B
	for <lists+samba-technical@lfdr.de>; Tue, 28 Jul 2020 08:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:Date:To:cc;
	bh=GMAhvt8EO2hzLPaOjUHJh3z1Bkkx6y+ID1jTR5WM51o=; b=wrsoLer+Hsl3Cjj6RzYMHOh5Dx
	m9x1foMK/FsdTbXZdTk8uPI4tSGCGxu8COyf3VStEz+QRxDAacDw8nslz3AJ9ChTbRSIuN8+csEaH
	QSpquIiSyc0f+c/lJURc4PKNUytOSB4UYUFiErq1cECjJK/t8QyLw4AWQcHUbqcQ2G/B7hjnV1J/0
	4fKlj6dql02P+8ohP8pwcH/vwzVeELbZGs+/TXStqg68wSI6JISrXcjXsydtoTIAlhvSdTq594NT9
	X1JwsdpNFppE2Pep6+lrq1j2vxEAELVI33w1/AUXChjQZaC9FKUEAh4RIPmHV1DJFY17zxl3FZCC+
	TTqrrNSg==;
Received: from localhost ([::1]:51086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k0JWy-00A6lc-D3; Tue, 28 Jul 2020 06:56:08 +0000
Received: from prawda.net.pl ([91.240.135.250]:62304) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k0JWh-00A6lV-2E
 for samba-technical@lists.samba.org; Tue, 28 Jul 2020 06:55:56 +0000
Received: from [91.240.135.247] (helo=KOMPUTER175)
 by prawda.net.pl (prawda.net.pl [91.240.135.250]:465)
 with esmtpsa id 1k0J1M-000Nov-IE (Exim 4.92.1) for
 samba-technical@lists.samba.org
 (return-path <admin@prawda.net.pl>); Tue, 28 Jul 2020 08:23:29 +0200
To: <samba-technical@lists.samba.org>
Date: Tue, 28 Jul 2020 08:23:27 +0200
Message-ID: <!&!AAAAAAAAAAAuAAAAAAAAANGsRTVhQVFCrPuEPBc7FtYBANlTnCJhprtFudq2LHCBs8EBACQA//8AABAAAAD+l0Co+DASSaajg/eQiKKrAQAAAAA=@prawda.net.pl>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdZkpls/6nNoNMGQTu29o9qGd/zyog==
Content-Language: pl
X-SA-Exim-Connect-IP: 91.240.135.247
X-SA-Exim-Mail-From: admin@prawda.net.pl
Subject: Samba migrate from ver 4.11.11 to 4.12.5
X-SA-Exim-Version: 4.2
X-SA-Exim-Scanned: Yes (on prawda.net.pl)
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
From: admin--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: admin@prawda.net.pl
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi

I have problem with migrate my samba AD.

My OS Debian10.

I want to connect win10.

 

In Samba ver 4.11.11 all is ok, when I update to 4.12.0 I have problem when
I try use  Active Directory Users and Computers.

In logs debian I see:

 

[2020/07/27 14:57:53.200458,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: ENC-TS Pre-authentication succeeded -- administrator@PRAWDA
using aes256-cts-hmac-sha1-96

[2020/07/27 14:57:53.200592,  3]
../../auth/auth_log.c:653(log_authentication_event_human_readable)

  Auth: [Kerberos KDC,ENC-TS Pre-authentication] user
[(null)]\[administrator@PRAWDA] at [Mon, 27 Jul 2020 14:57:53.200552 CEST]
with [aes256-cts-hmac-sha1-96] status [NT_STATUS_OK] workstation [(null)]
remote host [ipv4:192.168.0.123:60625] became [PRAWDA]\[Administrator]
[S-1-5-21-3478243395-2611530980-3289595817-500]. local host [NULL] 

  {"timestamp": "2020-07-27T14:57:53.200820+0200", "type": "Authentication",
"Authentication": {"version": {"major": 1, "minor": 2}, "eventId": 4624,
"logonId": "80a1f72710dff3cc", "logonType": 3, "status": "NT_STATUS_OK",
"localAddress": null, "remoteAddress": "ipv4:192.168.0.123:60625",
"serviceDescription": "Kerberos KDC", "authDescription": "ENC-TS
Pre-authentication", "clientDomain": null, "clientAccount":
"administrator@PRAWDA", "workstation": null, "becameAccount":
"Administrator", "becameDomain": "PRAWDA", "becameSid":
"S-1-5-21-3478243395-2611530980-3289595817-500", "mappedAccount":
"Administrator", "mappedDomain": "PRAWDA", "netlogonComputer": null,
"netlogonTrustAccount": null, "netlogonNegotiateFlags": "0x00000000",
"netlogonSecureChannelType": 0, "netlogonTrustAccountSid": null,
"passwordType": "aes256-cts-hmac-sha1-96", "duration": 10843}}

[2020/07/27 14:57:53.201082,  4]
../../source4/auth/sam.c:200(authsam_account_ok)

  authsam_account_ok: Checking SMB password for user administrator@PRAWDA

[2020/07/27 14:57:53.254054,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: AS-REQ authtime: 2020-07-27T14:57:53 starttime: unset endtime:
2020-07-28T00:57:53 renew till: 2020-08-03T14:57:53

[2020/07/27 14:57:53.254252,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: Client supported enctypes: aes256-cts-hmac-sha1-96,
aes128-cts-hmac-sha1-96, arcfour-hmac-md5, 24, -135, 3, using
aes256-cts-hmac-sha1-96/arcfour-hmac-md5

[2020/07/27 14:57:53.254296,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: Requested flags: renewable-ok, canonicalize, renewable,
forwardable

[2020/07/27 14:57:53.256871,  3]
../../source4/smbd/service_stream.c:67(stream_terminate_connection)

  stream_terminate_connection: Terminating connection - 'kdc_tcp_call_loop:
tstream_read_pdu_blob_recv() - NT_STATUS_CONNECTION_DISCONNECTED'

[2020/07/27 14:57:53.262343,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: TGS-REQ  <mailto:Administrator@PRAWDA.LOCAL>
Administrator@PRAWDA.LOCAL from ipv4:192.168.0.123:60626 for
<mailto:host/komp1.prawda.local@PRAWDA.LOCAL>
host/komp1.prawda.local@PRAWDA.LOCAL [canonicalize, renewable, forwardable]

[2020/07/27 14:57:53.287114,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: TGS-REQ authtime: 2020-07-27T14:57:53 starttime:
2020-07-27T14:57:53 endtime: 2020-07-28T00:57:53 renew till:
2020-08-03T14:57:53

[2020/07/27 14:57:53.290494,  3]
../../source4/smbd/service_stream.c:67(stream_terminate_connection)

  stream_terminate_connection: Terminating connection - 'kdc_tcp_call_loop:
tstream_read_pdu_blob_recv() - NT_STATUS_CONNECTION_DISCONNECTED'

[2020/07/27 14:58:04.084116,  3]
../../lib/ldb-samba/ldb_wrap.c:332(ldb_wrap_connect)

  ldb_wrap open of secrets.ldb

[2020/07/27 14:58:04.099849,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: AS-REQ  <mailto:administrator@PRAWDA.LOCAL>
administrator@PRAWDA.LOCAL from ipv4:192.168.0.123:60629 for
<mailto:krbtgt/PRAWDA.LOCAL@PRAWDA.LOCAL> krbtgt/PRAWDA.LOCAL@PRAWDA.LOCAL

[2020/07/27 14:58:04.107501,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: Client sent patypes: 128

[2020/07/27 14:58:04.107549,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: Looking for PKINIT pa-data --
<mailto:administrator@PRAWDA.LOCAL> administrator@PRAWDA.LOCAL

[2020/07/27 14:58:04.107579,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: Looking for ENC-TS pa-data --
<mailto:administrator@PRAWDA.LOCAL> administrator@PRAWDA.LOCAL

[2020/07/27 14:58:04.107631,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: No preauth found, returning PREAUTH-REQUIRED --
<mailto:administrator@PRAWDA.LOCAL> administrator@PRAWDA.LOCAL

[2020/07/27 14:58:04.109805,  3]
../../source4/smbd/service_stream.c:67(stream_terminate_connection)

  stream_terminate_connection: Terminating connection - 'kdc_tcp_call_loop:
tstream_read_pdu_blob_recv() - NT_STATUS_CONNECTION_DISCONNECTED'

[2020/07/27 14:58:04.112889,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: AS-REQ  <mailto:administrator@PRAWDA.LOCAL>
administrator@PRAWDA.LOCAL from ipv4:192.168.0.123:60630 for
<mailto:krbtgt/PRAWDA.LOCAL@PRAWDA.LOCAL> krbtgt/PRAWDA.LOCAL@PRAWDA.LOCAL

[2020/07/27 14:58:04.120327,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: Client sent patypes: encrypted-timestamp, 128

[2020/07/27 14:58:04.120374,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: Looking for PKINIT pa-data --
<mailto:administrator@PRAWDA.LOCAL> administrator@PRAWDA.LOCAL

[2020/07/27 14:58:04.120404,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: Looking for ENC-TS pa-data --
<mailto:administrator@PRAWDA.LOCAL> administrator@PRAWDA.LOCAL

[2020/07/27 14:58:04.120543,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: ENC-TS Pre-authentication succeeded --
<mailto:administrator@PRAWDA.LOCAL> administrator@PRAWDA.LOCAL using
aes256-cts-hmac-sha1-96

[2020/07/27 14:58:04.120636,  3]
../../auth/auth_log.c:653(log_authentication_event_human_readable)

  Auth: [Kerberos KDC,ENC-TS Pre-authentication] user
[(null)]\[administrator@PRAWDA.LOCAL] at [Mon, 27 Jul 2020 14:58:04.120609
CEST] with [aes256-cts-hmac-sha1-96] status [NT_STATUS_OK] workstation
[(null)] remote host [ipv4:192.168.0.123:60630] became
[PRAWDA]\[Administrator] [S-1-5-21-3478243395-2611530980-3289595817-500].
local host [NULL] 

  {"timestamp": "2020-07-27T14:58:04.120715+0200", "type": "Authentication",
"Authentication": {"version": {"major": 1, "minor": 2}, "eventId": 4624,
"logonId": "75676c4ac6b4678", "logonType": 3, "status": "NT_STATUS_OK",
"localAddress": null, "remoteAddress": "ipv4:192.168.0.123:60630",
"serviceDescription": "Kerberos KDC", "authDescription": "ENC-TS
Pre-authentication", "clientDomain": null, "clientAccount": "
<mailto:administrator@PRAWDA.LOCAL> administrator@PRAWDA.LOCAL",
"workstation": null, "becameAccount": "Administrator", "becameDomain":
"PRAWDA", "becameSid": "S-1-5-21-3478243395-2611530980-3289595817-500",
"mappedAccount": "Administrator", "mappedDomain": "PRAWDA",
"netlogonComputer": null, "netlogonTrustAccount": null,
"netlogonNegotiateFlags": "0x00000000", "netlogonSecureChannelType": 0,
"netlogonTrustAccountSid": null, "passwordType": "aes256-cts-hmac-sha1-96",
"duration": 7930}}

[2020/07/27 14:58:04.120854,  4]
../../source4/auth/sam.c:200(authsam_account_ok)

  authsam_account_ok: Checking SMB password for user
<mailto:administrator@PRAWDA.LOCAL> administrator@PRAWDA.LOCAL

[2020/07/27 14:58:04.138052,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: AS-REQ authtime: 2020-07-27T14:58:04 starttime: unset endtime:
2020-07-28T00:58:04 renew till: 2020-08-03T14:58:04

[2020/07/27 14:58:04.138193,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: Client supported enctypes: aes256-cts-hmac-sha1-96,
arcfour-hmac-md5, -133, -128, 24, -135, using
aes256-cts-hmac-sha1-96/arcfour-hmac-md5

[2020/07/27 14:58:04.138235,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: Requested flags: renewable-ok, canonicalize, renewable,
forwardable

[2020/07/27 14:58:04.142001,  3]
../../source4/smbd/service_stream.c:67(stream_terminate_connection)

  stream_terminate_connection: Terminating connection - 'kdc_tcp_call_loop:
tstream_read_pdu_blob_recv() - NT_STATUS_CONNECTION_DISCONNECTED'

[2020/07/27 14:58:04.148555,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: TGS-REQ  <mailto:Administrator@PRAWDA.LOCAL>
Administrator@PRAWDA.LOCAL from ipv4:192.168.0.123:60631 for
<mailto:ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL>
ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL [renewable, forwardable]

[2020/07/27 14:58:04.151843,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: samba_kdc_fetch: message2entry failed

[2020/07/27 14:58:04.152019,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: Server not found in database:
<mailto:ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL>
ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL: encryption type 3 not
supported

[2020/07/27 14:58:04.152069,  3]
../../source4/auth/kerberos/krb5_init_context.c:80(smb_krb5_debug_wrapper)

  Kerberos: Failed building TGS-REP to ipv4:192.168.0.123:60631

[2020/07/27 14:58:04.154093,  3]
../../source4/smbd/service_stream.c:67(stream_terminate_connection)

  stream_terminate_connection: Terminating connection - 'kdc_tcp_call_loop:
tstream_read_pdu_blob_recv() - NT_STATUS_CONNECTION_DISCONNECTED'

[2020/07/27 14:58:04.155266,  3]
../../source4/smbd/service_stream.c:67(stream_terminate_connection)

  stream_terminate_connection: Terminating connection -
'ldapsrv_call_wait_done: call->wait_recv() - NT_STATUS_LOCAL_DISCONNECT'

[2020/07/27 14:58:04.189794,  3]
../../source4/smbd/service_stream.c:67(stream_terminate_connection)

  stream_terminate_connection: Terminating connection - 'dcesrv:
NT_STATUS_CONNECTION_DISCONNECTED'

 

 

Win10 in event logs say: The security system has detected an authentication
error for the serve Insufficient system resources 0xc000009a

 

 

I thing I have problem with encryption, ver 4.12 not supported DES and I
see in log:

  Kerberos: Server not found in database:
<mailto:ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL>
ldap/debian.prawda.local/prawda.local@PRAWDA.LOCAL: encryption type 3 not
supported

 

How migrate old database encryption to supportet in samba 4.12?

Change user password not help.

 

JM

