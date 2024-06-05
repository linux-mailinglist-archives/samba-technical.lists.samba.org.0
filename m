Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 137038FCF87
	for <lists+samba-technical@lfdr.de>; Wed,  5 Jun 2024 15:38:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=mh6ahr8CffhzDzeXAq3VvCdqW5hpYNOFEAYPQ+P/vVk=; b=ToJPlGMlCicPulVCt/pR18rh5/
	b7rgs01+fNV87JfYDI9t+N8KBnJ1v26Rj1JwyKXYQD3j5+VxYT0Smuen1XRhd2UCu5jX9IVTOXdxC
	wN3wUYb1rFfKb4nrP51+5Ac4l9WndoJVCCOYPdu1hMxSP8jnEoSa/R2FFpRaIg/a5PsvGkvZKCt5L
	vG4T9SLz0eiV46u0URUksUqZW8sWJ8z0DxwLuYu6pAx5ugblPbRzzLeodfS/GIwB6LRb51fOoMamc
	MRH9lyy/PNTqKIk8qdeFOJop/DG0sslIO9Yl9siYKDZdXb52CtcJFojK5ZAc9jSJni6Mzlatqu7v4
	NqvQ9/6Q==;
Received: from ip6-localhost ([::1]:22338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sEqpg-00CfDv-Sg; Wed, 05 Jun 2024 13:37:40 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:53305) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sEqpb-00CfDn-O7
 for samba-technical@lists.samba.org; Wed, 05 Jun 2024 13:37:38 +0000
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57a6985ab58so1919360a12.2
 for <samba-technical@lists.samba.org>; Wed, 05 Jun 2024 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717594654; x=1718199454; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Z3MWaiUZTj7mMaJc6tdcS35LxIKvs0+dVLOFxN5Q24s=;
 b=JwjvyZxYXeDOde8AyGxrKySGmwMtKNLQy/sVEj8gPuaiY6fsf9H6nmFBGfwlBE1wUd
 lVaUUvvTb6/Mt+GEUQo9lnfMpzmTjMAcPDiLrhEx4Yasah4pircvhdGNd+7Uu/0r1W1/
 v+YGE2Bf8OlZMY9wKVtufr9zztWpx15FTbAZLf7w2GXmDY7B7IULt1jSTri43pshlqsX
 BDt/e+NBMBqr4iM7DZdYJrHwGT5ZSiheQedLSTO1jHtVQQ0XgLnKzSh4+XXj4MCu/VMh
 CV0MbXjWAVAzAZL9KzEyianYZX8TaTvALepZtnMnCjq+ZsUQbNcvbw9P4J6ZOIA6xS02
 62Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717594654; x=1718199454;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z3MWaiUZTj7mMaJc6tdcS35LxIKvs0+dVLOFxN5Q24s=;
 b=v3flHqGVMOngn07LFPJHLZS4hB40NGYZIa49DXCAhvLfsDg55vj/4llsiiol4LpsOP
 aqpi3Jv/Tatde3UkByZOFTIkaBCyOfQSMcBwbjHB0NmjlcBuKF8HiY4GJhvzsuoVLQPf
 X9H5ntFfF9KL1fbVeTDAQ7+PL5qO8Xm9WfQ8q4CFV8t6sre03oruFJMI0vxNs+3LfwsF
 2U39ZhEYB6K+1BffHuxDA1YZexmbCzfYpLF/FDISrOceOog3gcZ03lm1jBfLBZSGL52n
 IPEPoOhuwHeLqh51oy8sdms9/ML2KsbMR1L6EWpnXvFspn77lGSDMaZA3B8UXM/BvQec
 QRKw==
X-Gm-Message-State: AOJu0YzlCtrE9Vb7YLk+H5iToPmfl8zAuoVeZJBXpvb/tYn0YLg5wHxX
 yCpLyP0bqOInpZgclOfKi+kUsBB+Cf1RP156dGoD02VCYgJ9WGgK9SXLsjuUXNFm/njMRoCpGsU
 CYQ4nhGX52JoglkQbaUWMnBzbiN5gzWPyt2o=
X-Google-Smtp-Source: AGHT+IHm98EZhsCpKGK4d/3yncxbSavJGKb/3lF7mV3RH9b8aJtcNEVS8qHKNlMKfU/a4XKgwplwcIUeNCO5cZCB/9A=
X-Received: by 2002:a50:9509:0:b0:57a:3046:1cd8 with SMTP id
 4fb4d7f45d1cf-57a8b697867mr2250112a12.7.1717594654342; Wed, 05 Jun 2024
 06:37:34 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 5 Jun 2024 16:37:13 +0300
Message-ID: <CAAu4aPFeKaEargaUNJedgwfQqoJ7dzaZUC8Su7tbypN-c4+a3Q@mail.gmail.com>
Subject: Failed to bind to uuid NT_STATUS_LOGON_FAILURE secrets.keytab broken
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Omnis ludis - games via samba-technical <samba-technical@lists.samba.org>
Reply-To: Omnis ludis - games <sergey.gortinsc17@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good afternoon, tell me, this error occurs on the domain controller samba v
4.19.0, I paired the domain controller with sssd so that authentication
occurs under domain accounts on the domain controller, but as you know,
sssd changes the machine password every 30 days if this option is not
disabled
ad_maximum_machine_account_password_age =3D 0
I haven=E2=80=99t disabled it for 30 days and as I understand it, the passw=
ord has
changed and when I call samba-tool drs showrepl the following error occurs
samba-tool drs showrepl -d 5
INFO: Current debug levels:
lpcfg_load: refreshing parameters from /opt/samba/etc/smb.conf
ldb_wrap open of secrets.ldb
GENSEC backend 'gssapi_spnego' registered
GENSEC backend 'gssapi_krb5' registered
GENSEC backend 'gssapi_krb5_sasl' registered
GENSEC backend 'spnego' registered
GENSEC backend 'schannel' registered
GENSEC backend 'ncalrpc_as_system' registered
GENSEC backend 'sasl-EXTERNAL' registered
GENSEC backend 'ntlmssp' registered
GENSEC backend 'ntlmssp_resume_ccache' registered
GENSEC backend 'http_basic' registered
GENSEC backend 'http_ntlm' registered
GENSEC backend 'http_negotiate' registered
GENSEC backend 'krb5' registered
GENSEC backend 'fake_gssapi_krb5' registered
Using binding ncacn_ip_tcp:dc1.red-soft.biz[,seal]
Mapped to DCERPC endpoint 135
added interface ens3 ip=3D10.81.0.250 bcast=3D10.81.0.255 netmask=3D255.255=
.255.0
added interface ens3 ip=3D10.81.0.250 bcast=3D10.81.0.255 netmask=3D255.255=
.255.0
resolve_lmhosts: Attempting lmhosts lookup for name dc1.test.dom<0x20>
startlmhosts: Can't open lmhosts file /opt/samba/etc/lmhosts. Error was No
such file or directory
Mapped to DCERPC endpoint 49153
added interface ens3 ip=3D10.81.0.250 bcast=3D10.81.0.255 netmask=3D255.255=
.255.0
added interface ens3 ip=3D10.81.0.250 bcast=3D10.81.0.255 netmask=3D255.255=
.255.0
resolve_lmhosts: Attempting lmhosts lookup for name dc1.red-soft.biz<0x20>
startlmhosts: Can't open lmhosts file /opt/samba/etc/lmhosts. Error was No
such file or directory
Starting GENSEC mechanism spnego
Starting GENSEC submechanism gssapi_krb5
Received smb_krb5 packet of length 294
Received smb_krb5 packet of length 203
Failed to get kerberos credentials: kinit for DC1$@TEST.DOM failed
(Preauthentication failed)
Wrong username or password: kinit for DC1$@TEST.DOM failed
(Preauthentication failed)
gensec_update_done: gssapi_krb5[0x55d227285240]: NT_STATUS_LOGON_FAILURE
gensec_spnego_create_negTokenInit_step: gssapi_krb5: creating
NEG_TOKEN_INIT for ldap/DC1.TEST.DOM failed (next[ntlmssp]):
NT_STATUS_LOGON_FAILURE
Starting GENSEC submechanism ntlmssp
Got challenge flags:
Got NTLMSSP neg_flags=3D0x62898235
  NTLMSSP_NEGOTIATE_UNICODE
  NTLMSSP_REQUEST_TARGET
  NTLMSSP_NEGOTIATE_SIGN
  NTLMSSP_NEGOTIATE_SEAL
  NTLMSSP_NEGOTIATE_NTLM
  NTLMSSP_NEGOTIATE_ALWAYS_SIGN
  NTLMSSP_TARGET_TYPE_DOMAIN
  NTLMSSP_NEGOTIATE_EXTENDED_SESSIONSECURITY
  NTLMSSP_NEGOTIATE_TARGET_INFO
  NTLMSSP_NEGOTIATE_VERSION
  NTLMSSP_NEGOTIATE_128
  NTLMSSP_NEGOTIATE_KEY_EXCH
NTLMSSP: Set final flags:
Got NTLMSSP neg_flags=3D0x62088235
  NTLMSSP_NEGOTIATE_UNICODE
  NTLMSSP_REQUEST_TARGET
  NTLMSSP_NEGOTIATE_SIGN
  NTLMSSP_NEGOTIATE_SEAL
  NTLMSSP_NEGOTIATE_NTLM
  NTLMSSP_NEGOTIATE_ALWAYS_SIGN
  NTLMSSP_NEGOTIATE_EXTENDED_SESSIONSECURITY
  NTLMSSP_NEGOTIATE_VERSION
  NTLMSSP_NEGOTIATE_128
  NTLMSSP_NEGOTIATE_KEY_EXCH
NTLMSSP Sign/Seal - Initialising with flags:
Got NTLMSSP neg_flags=3D0x62088235
  NTLMSSP_NEGOTIATE_UNICODE
  NTLMSSP_REQUEST_TARGET
  NTLMSSP_NEGOTIATE_SIGN
  NTLMSSP_NEGOTIATE_SEAL
  NTLMSSP_NEGOTIATE_NTLM
  NTLMSSP_NEGOTIATE_ALWAYS_SIGN
  NTLMSSP_NEGOTIATE_EXTENDED_SESSIONSECURITY
  NTLMSSP_NEGOTIATE_VERSION
  NTLMSSP_NEGOTIATE_128
  NTLMSSP_NEGOTIATE_KEY_EXCH
dcerpc: alter_resp - rpc fault: DCERPC_FAULT_SEC_PKG_ERROR
Failed to bind to uuid e3514235-4b06-11d1-ab04-00c04fc2dcd2 for
ncacn_ip_tcp:10.81.0.250[49153,seal,target_hostname=3Ddc1.test.dom,abstract=
_syntax=3De3514235-4b06-11d1-ab04-00c04fc2dcd2/0x00000004,localaddress=3D10=
.81.0.250]
NT_STATUS_LOGON_FAILURE
ERROR(<class 'samba.drs_utils.drsException'>): DRS connection to
dc1.test.dom failed - drsException: DRS connection to dc1.test.dom failed:
(3221225581, 'The attempted logon is invalid. This is either due to a bad
username or authentication information.')
  File "samba/netcmd/drs.py", line 55, in samba.netcmd.drs.drsuapi_connect
  File "samba/drs_utils.py", line 78, in samba.drs_utils.drsuapi_connect


even if you can tell me the direction why this could happen, I will be
grateful, here is my samba config
# Global parameters
[global]
        netbios name =3D DC1
        realm =3D TEST.DOM
        server role =3D active directory domain controller
        server services =3D s3fs, rpc, nbt, wrepl, ldap, cldap, kdc, drepl,
winbindd, ntp_signd, kcc, dnsupdate
        workgroup =3D TEST
        idmap_ldb:use rfc2307 =3D yes
        map acl inherit =3D yes
        allow dns updates =3D nonsecure
        dsdb:schema update allowed =3D true
        ldap server require strong auth =3D no
        dedicated keytab file =3D /etc/krb5.keytab
        kerberos method =3D dedicated keytab


[sysvol]
        path =3D /opt/samba/var/locks/sysvol
        read only =3D No

[netlogon]
        path =3D /opt/samba/var/locks/sysvol/red-soft.biz/scripts
        read only =3D No


I also tried using krb5.keytab instead of secrets.keytab but the situation
did not change, I would like to know more about the insides of samba and
how to force it to accept the changed password of its own domain
controller, maybe this can be done somehow through the database
