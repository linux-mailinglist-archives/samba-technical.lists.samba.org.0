Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE3218669
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 09:55:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=cJ4qRlIpeq87xYbo/X1uVEjZ49Rj1UiVHwxl79mczCQ=; b=scsHw6AP8Q/7V8Jv4N/8meHwf2
	t1nkva3VOH8mXi/eOvsmjSN6WqK/lA9odKg8Wzdf677vLC4piYbRaxfwWcUcQ9LdxYqCSK1ZlxfC1
	iiPTCt68cmg8hqhLJWj3c614pxLHua7rb8PMzuI0tqQUVcHPcgqBEQMHkCdqvwuEL8/jTCzCaom7I
	B3Isd3sSa2yXpl0uzAN8r0QlU1I2vrsFlyEaK0WxQR5ImV9nU4Myhu8eCOM6YQsI1mis05MPgEHWJ
	TuGXGtae6A0aZ1/MU88c4bEAC4iPEYSmyP11h9/nDpe5t+2B3nY8mQL43B2wOpQZS9OBggtgt5W5L
	zMifflZw==;
Received: from localhost ([::1]:38878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOdsi-0033iX-L4; Thu, 09 May 2019 07:54:20 +0000
Received: from zmmta2.univ-littoral.fr ([195.220.130.148]:59198) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOdsX-0033iQ-0k
 for samba-technical@lists.samba.org; Thu, 09 May 2019 07:54:12 +0000
Received: from localhost (localhost [127.0.0.1])
 by zmmta2.univ-littoral.fr (Postfix) with ESMTP id 401EE135145
 for <samba-technical@lists.samba.org>; Thu,  9 May 2019 09:29:09 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -3.009
Authentication-Results: zmmta2.univ-littoral.fr (amavisd-new);
 dkim=pass (1024-bit key) header.d=univ-littoral.fr
Received: from zmmta2.univ-littoral.fr ([127.0.0.1])
 by localhost (zmmta2.univ-littoral.fr [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 9khuT3zvinJY for <samba-technical@lists.samba.org>;
 Thu,  9 May 2019 09:29:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zmmta2.univ-littoral.fr (Postfix) with ESMTP id 5B832135538
 for <samba-technical@lists.samba.org>; Thu,  9 May 2019 09:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.9.2 zmmta2.univ-littoral.fr 5B832135538
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=univ-littoral.fr;
 s=08AB4CC0-EC74-11E6-899C-5B0ECAA5E567; t=1557386947;
 bh=uDEftTXRNYJokzhToJDq1LqQ7GXBrgIxc1v3pQvqXSI=;
 h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type;
 b=YkK+amG/TmfJp1uNYIo3uT/eywScopAwt4eX3sVonZV3izdmjkhsysS50I/34Xw8k
 lIGR1A/3QvZxlI82jRpjpZfUInt29nkIOKhXoI4BWGapgnAbS67IsPSyp0i/HV7+tA
 ke+i5yj2D2wfpxsclxaIB71OLL+ZCesaph1CQ7K0=
Received: from zmmta2.univ-littoral.fr ([127.0.0.1])
 by localhost (zmmta2.univ-littoral.fr [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fnZALnQP7fPX for <samba-technical@lists.samba.org>;
 Thu,  9 May 2019 09:29:06 +0200 (CEST)
Received: from [193.49.201.237] (grizzly.univ-littoral.fr [193.49.201.237])
 by zmmta2.univ-littoral.fr (Postfix) with ESMTPSA id D46F8135145
 for <samba-technical@lists.samba.org>; Thu,  9 May 2019 09:29:06 +0200 (CEST)
To: samba-technical@lists.samba.org
Subject: debian 10: I can not integrate a linux machine into a Samba Ad
Message-ID: <ed478625-1c87-295f-bff2-e579f0f919f6@univ-littoral.fr>
Date: Thu, 9 May 2019 09:29:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: fr-FR
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: nathalie ramat via samba-technical <samba-technical@lists.samba.org>
Reply-To: nathalie ramat <nathalie.ramat@univ-littoral.fr>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello



I have a old version of samba which communicate with users windows 7 and =
user debian Linux.I have to integrate new machines under Windows 10.

I am testing the samba version 4.9.5.
I am use the packages of debian testing (debian 10) for a server and the =
user.


I want to use samba as AD. I have generated my AD with the following comm=
and : samba-tool domain provision --use-rfc2307 --interactive
everything was generated correctly apparently


But when I execute the commande samba -i I have the following errors :

/usr/sbin/smbd: pid_to_procid: messaging_dgm_get_unique failed: Aucun
fichier ou dossier de ce type
/usr/sbin/smbd: send_all_fn: messaging_send_buf to 16162 failed:
NT_STATUS_OBJECT_NAME_NOT_FOUND
/usr/sbin/smbd: pid_to_procid: messaging_dgm_get_unique failed: Aucun
fichier ou dossier de ce type
/usr/sbin/smbd: send_all_fn: messaging_send_buf to 24980 failed:
NT_STATUS_OBJECT_NAME_NOT_FOUND
/usr/sbin/smbd: pid_to_procid: messaging_dgm_get_unique failed: Aucun
fichier ou dossier de ce type
/usr/sbin/smbd: send_all_fn: messaging_send_buf to 16173 failed:
NT_STATUS_OBJECT_NAME_NOT_FOUND
/usr/sbin/smbd: pid_to_procid: messaging_dgm_get_unique failed: Aucun
fichier ou dossier de ce type
/usr/sbin/smbd: send_all_fn: messaging_send_buf to 31019 failed:
NT_STATUS_OBJECT_NAME_NOT_FOUND




  Nevertheless, I can to integrate my windows machines (7 and 10) into my=
 domain.


But for my linux machines - impossible

if I use  the command net rpc join -S nordend.LENZSPITZE.CALAIS.FR -U adm=
inistrator  .The client wait and doesn't ask the password

or  if i use net ads join -S nordend.LENZSPITZE.CALAIS.FR -U administrato=
r the linux client asks for the password - and  wait for the answer of th=
e server

In the logs of the server , I realized that he was trying to identify the=
 machine via the kerberos database.

However, the machine could not generate a kerberos ticket because I can=20
not join her to the domain.


Kerberos: AS-REQTESTBUGSTER$@LENZSPITZE.CALAIS.FR  from
ipv4:192.168.22.xxx:59861 for
krbtgt/LENZSPITZE.CALAIS.FR@LENZSPITZE.CALAIS.FR
Kerberos: UNKNOWN --TESTBUGSTER$@LENZSPITZE.CALAIS.FR: no such entry
found in hdb
Auth: [Kerberos KDC,ENC-TS Pre-authentication] user
[(null)]\[TESTBUGSTER$@LENZSPITZE.CALAIS.FR] at [Fri, 26 Apr 2019
12:39:14.537545 CEST] with [(null)] status [NT_STATUS_NO_SUCH_USER]
workstation [(null)] remote host [ipv4:192.168.22.xxx:59861] mapped to
[(null)]\[(null)]. local host [NULL]
{"timestamp": "2019-04-26T12:39:14.537598+0200", "type":
"Authentication", "Authentication": {"version": {"major": 1, "minor":
0}, "status": "NT_STATUS_NO_SUCH_USER", "localAddress": null,
"remoteAddress": "ipv4:192.168.22.xx:59861", "serviceDescription":
"Kerberos KDC", "authDescription": "ENC-TS Pre-authentication",
"clientDomain": null, "clientAccount":
"TESTBUGSTER$@LENZSPITZE.CALAIS.FR", "workstation": null,
"becameAccount": null, "becameDomain": null, "becameSid": null,
"mappedAccount": null, "mappedDomain": null, "netlogonComputer": null,
"netlogonTrustAccount": null, "netlogonNegotiateFlags": "0x00000000",
"netlogonSecureChannelType": 0, "netlogonTrustAccountSid": null,
"passwordType": null, "duration": 2589}}

/usr/sbin/smbd: ldb_wrap open of secrets.ldb
/usr/sbin/smbd: Got NTLMSSP neg_flags=3D0x62088215
/usr/sbin/smbd: Got user=3D[TESTBUGSTER$] domain=3D[LENZSPITZE]
workstation=3D[TESTBUGSTER] len1=3D24 len2=3D356
/usr/sbin/smbd: auth_check_password_send: Checking password for unmapped
user [LENZSPITZE]\[TESTBUGSTER$]@[TESTBUGSTER]
/usr/sbin/smbd: auth_check_password_send: user is:
[LENZSPITZE]\[TESTBUGSTER$]@[TESTBUGSTER]
/usr/sbin/smbd: sam_search_user: Couldn't find user [TESTBUGSTER$] in
samdb, under DC=3Dlenzspitze,DC=3Dcalais,DC=3Dfr
/usr/sbin/smbd: auth_check_password_recv: sam authentication for user
[LENZSPITZE\TESTBUGSTER$] FAILED with error NT_STATUS_NO_SUCH_USER,
authoritative=3D1
/usr/sbin/smbd: Auth: [SMB2,NTLMSSP] user [LENZSPITZE]\[TESTBUGSTER$] at
[ven., 26 avril 2019 12:39:14.561942 CEST] with [NTLMv2] status
[NT_STATUS_NO_SUCH_USER] workstation [TESTBUGSTER] remote host
[ipv4:192.168.22.xxx:58998] mapped to [LENZSPITZE]\[TESTBUGSTER$]. local
host [ipv4:192.168.22.xxx:445]
/usr/sbin/smbd: {"timestamp": "2019-04-26T12:39:14.562671+0200", "type":
"Authentication", "Authentication": {"version": {"major": 1, "minor":
0}, "status": "NT_STATUS_NO_SUCH_USER", "localAddress":
"ipv4:192.168.22.xxx:445", "remoteAddress": "ipv4:192.168.22.xxx:58998",
"serviceDescription": "SMB2", "authDescription": "NTLMSSP",
"clientDomain": "LENZSPITZE", "clientAccount": "TESTBUGSTER$",
"workstation": "TESTBUGSTER", "becameAccount": null, "becameDomain":
null, "becameSid": null, "mappedAccount": "TESTBUGSTER$",
"mappedDomain": "LENZSPITZE", "netlogonComputer": null,
"netlogonTrustAccount": null, "netlogonNegotiateFlags": "0x00000000",
"netlogonSecureChannelType": 0, "netlogonTrustAccountSid": null,
"passwordType": "NTLMv2", "duration": 11627}}
/usr/sbin/smbd: gensec_spnego_server_negTokenTarg_step: SPNEGO(ntlmssp)
login failed: NT_STATUS_NO_SUCH_USER

When I execute on the server : smbclient -L localhost -U administrator

I get the following answer

Sharename       Type      Comment
      ---------       ----      -------
      homes           Disk
      profiles        Disk
      print$          Disk      Printer Drivers
      IPC$            IPC       IPC Service (Samba 4.9.5-Debian)
      Administrator   Disk      Home directory of LENZSPITZE/Administrato=
r
Reconnecting with SMB1 for workgroup listing.

      Server               Comment
      ---------            -------
      NORDEND              Samba 4.9.5-Debian

      Workgroup            Master
      ---------            -------
      LENZSPITZE


I think the client and the server do not use the same protocols=20
communications  (net rpc --> SMB1/CIFS ? ).
How can I add my linux Machine to my AD ?



I configured smb.conf at my server :


# global parameters
[global]
      workgroup =3D LENZSPITZE
      realm =3D lenzspitze.calais.fr
      netbios name =3D NORDEND
      server role =3D active directory domain controller
      server services =3D s3fs, rpc, nbt, wrepl, ldap, cldap, kdc, drepl,=
winbindd, ntp_signd, kcc
      log level =3D 3
      log file =3D /var/log/samba/log.%m
      max log size =3D 1000
      template shell=3D/bin/bash
      idmap_ldb:use rfc2307 =3D yes
      winbind enum users =3D yes
      winbind enum groups =3D yes
      winbind use default domain =3D yes
      winbind separator =3D /
      idmap config *:backend =3D tdb
      idmap config *:range =3D 1000-19000=C3=83=C2=A9r=C3=83=C2=A9 correc=
tement semble-t-il.
      host msdfs =3D no
      security =3D user
      name resolve order =3D host
#    ntlm auth =3D yes
#     raw NTLMV2 auth =3D yes
#    lanman auth =3Dyes
#    vfs objects =3D acl_xattr
      map acl inherit =3D Yes
#    store dos attributes =3D Yes


[netlogon]
      path =3D /var/lib/samba/var/locks/sysvol/lenzspitze.calais.fr/scrip=
ts
      read only =3D no
      browsable =3D no

[sysvol]
      path=3D /var/lib/samba/var/locks/sysvol
      read only =3D no
      browsable =3D no

[homes]
      path=3D/home/%G/%U
      read only =3D no
      writable =3D yes


[profiles]
      path=3D/resultats/profiles
      read only =3D no
      writable =3Dyes


[printers]
     comment =3D All Printers
     browseable =3D no
     path =3D /var/spool/samba
     printable =3D yes
     guest ok =3D no
     read only =3D yes
     create mask =3D 0700

# Windows clients look for this share name as a source of downloadable
# printer drivers
[print$]
     comment =3D Printer Drivers
     path =3D /var/lib/samba/printers
     browseable =3D yes
     read only =3D yes
     guest ok =3D no



and my linux user :


[global]
      security =3D ads
      realm =3D lenzspitze.calais.fr
      workgroup =3D LENZSPITZE
      netbios name =3D testbugster
      winbind separator =3D /
      ntlm auth =3D yes
      idmap uid =3D 0-50000
      idmap gid =3D 0-50000
      winbind enum users =3D yes
      winbind enum groups =3D yes
      idmap config LENZSPITZE : backend =3D rid
      idmap config LENZSPITZE : base_rid =3D 0
      template homedir =3D/etudiants/%U
      template shell =3D/bin/bash
      encrypt passwords =3D yes
      winbind nss info =3D rfc2307
      kerberos method =3D  secrets and keytab
      winbind use default domain =3D yes
      log file =3D/var/log/samba/log.%m
      log level =3D 3



Thank you for your help


Sincerely yours

--=20
Nathalie RAMAT-LECLERCQ

Service Informatique

Universite du Littoral-C=C3=B4te d'Opale
SCoSI - Service Commun du Syst=C3=A8me d'Information
P=C3=B4le Syst=C3=A8mes et r=C3=A9seaux

Centre de Gestion Universitaire de Calais
50 rue ferdinand Buisson
C.S 80699
62228 CALAIS CEDEX





