Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D21E452E8D8
	for <lists+samba-technical@lfdr.de>; Fri, 20 May 2022 11:31:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:subject:To:Date:cc;
	bh=MlTLGd1SsFghdg6OT7uUQy6DOFnhWDM0UxnxdvxaMDs=; b=Ba9ekP5hBXgvWBoN3Be0ej4bnT
	FTJtCWb48lg9IuGtP6Bx/zmRXact51PpZlU9FIldJ56ihsciYPRhJ5a6trLv7Q92JONlS9s2yDxuz
	4g2MzBjSVnRpOHy0lNNQ6MuMVTPiqsULR0K0lXCLEsc4q/fvIbS+0x35NWKwPR3hSBLahCMurmEHP
	xnLpdOeMqpFZTXAFxJLPdHhdpVJJJVlynqZ1xtNskdc2X3V5AeDvDPgRcwvqZKI0dfhdoI8JQuie6
	1vcr/QO0Gref29eyTUY0o8NfWZeZ7d/dppGGI95tCauf5lqtKAv+lj3Y1vp1IYCKdyY91ibnn5j49
	VYNOa6KQ==;
Received: from ip6-localhost ([::1]:19306 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nryy2-002Ceo-4B; Fri, 20 May 2022 09:30:42 +0000
Received: from mail.itsd.de ([80.153.216.99]:7959) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nryxv-002Cef-Ch
 for samba-technical@lists.samba.org; Fri, 20 May 2022 09:30:38 +0000
Received: from mail.itsd.de (mail.itsd.de [192.168.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by securemail.itsd.de (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Fri, 20 May 2022 11:12:41 +0200 (CEST)
Received: from [192.168.0.220] (unknown [192.168.0.220])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.itsd.de (Postfix) with ESMTPSA id BFAE0800D9;
 Fri, 20 May 2022 11:12:40 +0200 (CEST)
Message-ID: <e7d2c0a2-ce6c-e5a4-c100-f429acb0cb58@itsd.de>
Date: Fri, 20 May 2022 11:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: "samba-technical@lists.samba.org (samba-technical@lists.samba.org)"
 <samba-technical@lists.samba.org>
Organization: itsystems Deutschland AG
subject: ldap simple bind problem after upgrade from 4.14 to 4.15
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SM-outgoing: yes
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=itsd.de; h=message-id
 :date:mime-version:to:from:subject:content-type
 :content-transfer-encoding; s=default; bh=PMb2wSRMPxt4ku10MVWtzV
 G6xEBTagQmGVQO7nN+Xu4=; b=lyx7nujIAwWlymHhGO/PRXvt0Rd91ATapw4PPg
 h3KwR2biWFv3w9ERk5qFoHUzr2UAMQ80RarLtVSbYewxiW9hpjxgLQLmnsQvgd0o
 7+RHxUoEUXJGuHlynj9m95erTZCviFXXcv97//GxOIF0h1v4oFH0DIm+j3ofyag5
 gzuj+ue0CFvDqGjbDA6pTxWQsgbcwZXhBNvapkH1SZTpwX2+v99XZs7gJncjTsPb
 6aKf/KVB6Oa7i2JTZmZgcx0wMqkdsshzV3aTBusKmYPX+vDdUxD3tRjbug4ZlikK
 mKgtV2gHKjcx+XZ3CUpQow00VdFVWxCDde43wBQauaiZKWJw==
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
From: =?utf-8?q?Dr=2E_Hansj=C3=B6rg_Maurer_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Dr=2e_Hansj=c3=b6rg_Maurer?= <hansjoerg.maurer@itsd.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi

we upgraded an 4.14.12  AD-DC to 4.15.7 and after the upgrade all LDAP 
searches with simple bind failed with

A commandline  ldap search (working before, User and domaininformation 
replaced) shows
ldapsearch -x -D "CN=user,CN=Users,DC=xxx,DC=yyy,DC=de" -W -H 
ldap://192.168.0.1:389 -b "CN=Users,DC=xxx,DC=yyy,DC=de" -s sub 'uid=ccc'
Enter LDAP Password:
ldap_bind: Invalid credentials (49)
         additional info: 80090308: LdapErr: DSID-0C0903A9, comment: 
AcceptSecurityContext error, data 531, v1db1



During the bind Samba  Logs  (User and domaininformation replaced as above)


   {"timestamp": "2022-05-20T08:38:09.967130+0200", "type": 
"Authentication", "Authentication": {"version": {"major": 1, "minor": 
2}, "eventId": 4625, "logonId": "0", "logonType": 8, "status": 
"NT_STATUS_INVALID_WORKSTATION", "localAddress": "ipv4:192.168.0.1:389", 
"remoteAddress": "ipv4:192.168.0.10:56620", "serviceDescription": 
"LDAP", "authDescription": "simple bind", "clientDomain": "DOM", 
"clientAccount": "CN=user,CN=Users,DC=xxx,DC=yyy,DC=de", "workstation": 
"DC01", "becameAccount": null, "becameDomain": null, "becameSid": null, 
"mappedAccount": "user", "mappedDomain": "DOM", "netlogonComputer": 
null, "netlogonTrustAccount": null, "netlogonNegotiateFlags": 
"0x00000000", "netlogonSecureChannelType": 0, "netlogonTrustAccountSid": 
null, "passwordType": "Plaintext", "duration": 2301}}
[2022/05/20 08:38:09.969011,  3] 
../../source4/samba/service_stream.c:67(stream_terminate_connection)
   stream_terminate_connection: Terminating connection - 
'ldapsrv_call_wait_done: call->wait_recv() - NT_STATUS_LOCAL_DISCONNECT'
   {"timestamp": "2022-05-20T08:38:09.969592+0200", "type": 
"Authentication", "Authentication": {"version": {"major": 1, "minor": 
2}, "eventId": 4625, "logonId": "0", "logonType": 8, "status": 
"NT_STATUS_INVALID_WORKSTATION", "localAddress": "ipv4:192.168.0.1:389", 
"remoteAddress": "ipv4:192.168.0.10:56618", "serviceDescription": 
"LDAP", "authDescription": "simple bind", "clientDomain": "DOM", 
"clientAccount": "CN=user,CN=Users,DC=xxx,DC=yyy,DC=de", "workstation": 
"DC01", "becameAccount": null, "becameDomain": null, "becameSid": null, 
"mappedAccount": "user", "mappedDomain": "DOM", "netlogonComputer": 
null, "netlogonTrustAccount": null, "netlogonNegotiateFlags": 
"0x00000000", "netlogonSecureChannelType": 0, "netlogonTrustAccountSid": 
null, "passwordType": "Plaintext", "duration": 2406}}
[2022/05/20 08:38:09.969921,  3] 
../../source4/samba/service_stream.c:67(stream_terminate_connection)
   stream_terminate_connection: Terminating connection - 
'ldapsrv_call_wait_done: call->wait_recv() - NT_STATUS_LOCAL_DISCONNECT'
[2022/05/20 08:38:10.970860,  3] 
../../lib/ldb-samba/ldb_wrap.c:332(ldb_wrap_connect)
   ldb_wrap open of secrets.ldb
[2022/05/20 08:38:10.974556,  3] 
../../lib/ldb-samba/ldb_wrap.c:332(ldb_wrap_connect)
   ldb_wrap open of secrets.ldb
[2022/05/20 08:38:10.976832,  3] 
../../source4/auth/ntlm/auth.c:207(auth_check_password_send)
   auth_check_password_send: Checking password for unmapped user 
[DOM]\[user]@[DC01]
   auth_check_password_send: user is: [DOM]\[user]@[DC01]
[2022/05/20 08:38:10.977700,  2] 
../../source4/auth/ntlm/auth.c:401(auth_check_password_recv)
   auth_check_password_recv: sam authentication for user [DOM\user] 
FAILED with error NT_STATUS_INVALID_WORKSTATION, authoritative=1
[2022/05/20 08:38:10.977778,  2] 
../../auth/auth_log.c:665(log_authentication_event_human_readable)
   Auth: [LDAP,simple bind] user 
[ITSYSTEMS]\[CN=user,CN=Users,DC=xxx,DC=yyy,DC=de] at [Fri, 20 May 2022 
08:38:10.977761 CEST] with [Plaintext] status 
[NT_STATUS_INVALID_WORKSTATION] workstation [DC01] remote host 
[ipv4:192.168.0.10:56622] mapped to [DOM]\[user]. local host 
[ipv4:192.168.0.1:389]


in smb.conf
         ldap server require strong auth = no

is set

I downgraded to 4.14 and it worked again

The domain above is a rather old one, migrated from samba NT DC with 
openldap backend many years ago

I tried to setup a fresh 4.14 AD-DC Testsysstem, migrated it to 4.15 and 
the problem does not occur.

What does the
NT_STATUS_INVALID_WORKSTATION mean and could the problem be DNS related?

Even if the problem is not general, I  hesitate to upgrade additional 
systems...


Regards

Hansjörg






-- 
Dr. Hansjörg Maurer
itsystems Deutschland AG
Erzgießereistr. 22
80335 München
Tel:   +49-89-52 04 68-41
Fax:   +49-89-52 04 68-59
E-Mail: hansjoerg.maurer@itsd.de
Web:    http://www.itsd.de


Amtsgericht München HRB 132146
USt-IdNr. DE 812991301
Steuer-Nr. 143/100/81575

Aufsichtsratsvorsitzender:
Stefan Adam
Vorstand:
Dr. Michael Krocka
Dr. Hansjörg Maurer



----------------------------
Unser System ist mit einem Mailverschluesselungs-Gateway ausgestattet. Wenn Sie moechten, dass an Sie gerichtete E-Mails verschluesselt werden, senden Sie einfach eine S/MIME-signierte E-Mail oder Ihren PGP Public Key an hansjoerg.maurer@itsd.de.

Our system is equipped with an email encryption gateway. If you want email sent to you to be encrypted please send a S/MIME signed email or your PGP public key to hansjoerg.maurer@itsd.de.


