Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D9C186AB
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 10:19:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=X0FPGCxoAWkbT/YLNl9JBuuPUfDkk4b7kMKez7xRyJI=; b=yu6msSSvKue/qcNat9oGl10SU/
	xKe1TtoJwqmgPfO1nOd2ljPxeZmUeWEgKhsT9X1lfiagrOTUHehDEr6nWvJHTZv3qP/Py/ucp30Wc
	2UXaO9GNxg/P+nQX7YhbgSg0T5o91suV3UT6E3ztWU9Mqno0pAZR7pkLrycddtxin5rPOu2pUIirM
	NWCPFwwtCZ8hz4WdkSevVOMPgsPXxTRi3cyOVJmJe3Jaex3TEOrad/Qg99cmGtH3HDLtu5OVWi+BH
	Wd9uoA/W+3py2XOaXM4Hhrd4jHhqGupgggPQmii8hHXF08dLdz741iIp6Prv4jxe4uicOvxMxreVz
	yqPMhc1w==;
Received: from localhost ([::1]:39638 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOeGK-0033qi-CL; Thu, 09 May 2019 08:18:44 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:48298) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOeGC-0033qZ-Vc; Thu, 09 May 2019 08:18:39 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1557994712.73143@H/vyprmpw/d6S60pLri5rw
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 985A911F2FC.AB57A
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 985A911F2FC;
 Thu,  9 May 2019 10:18:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1557389912;
 bh=tJzVUyQi8vGi4da/YuN0YTfHkawEXRaqgFFmvRKRfJQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=a9WwnQVSbLva3eLXj+7hYtcPq8rpNbQQRPA6HfknHITnxqLqMAy8pNVKcGv6m29HP
 +EjMDCx/haHBg+nCCrfnl2qq96CaJInFqr+0qJoNmujnSn1+BCesnuX7wl6O6SoCFE
 dXj+SY7VRz2VAJqHv547P97nzagwhQCW8rLVFx30jiTAem4ZmDcje0cNR9ijgMCO3K
 2v5iKC29OdbuLF13EK40S/wLk5OMltSaJ5CsUhehbd6EVGLkY+x9oOiSW0r3rNG4HS
 pNh53Kq5q7d1lxvpLjyCGbfq3lKgDAmLRlOnAz31xNgLNYsgjG7GEmLbOy/J9TPbeU
 GlkMB3C2BccVg==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id E6ABA3AF8C;
 Thu,  9 May 2019 10:18:30 +0200 (CEST)
Subject: RE: debian 10: I can not integrate a linux machine into a Samba Ad
To: =?windows-1252?Q?nathalie_ramat?= <nathalie.ramat@univ-littoral.fr>, 
 =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Thu, 9 May 2019 10:18:30 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ed478625-1c87-295f-bff2-e579f0f919f6@univ-littoral.fr>
References: <ed478625-1c87-295f-bff2-e579f0f919f6@univ-littoral.fr>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdUGP8kP/Hr6RhSxT0m9BWy08lBgcw==
Message-Id: <vmime.5cd3e256.2db2.3d2ac5a7c3148b6@ms249-lin-003.rotterdam.bazuin.nl>
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
From: "=?windows-1252?Q?L.P.H._van_Belle?= via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Cc: "=?windows-1252?Q?samba=40lists.samba.org?=" <samba@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai,=20

Im reposting this in the normal samba list, these are config errors, not software errors.=20
Please continue there.

Your seeing these problems because your mixing domain member and AD-DC settings in smb.conf

The DC config by example.=20
       workgroup =3D LENZSPITZE
       realm =3D LENZSPITZE.CALAIS.FE
       netbios name =3D NORDEND
       server role =3D active directory domain controller
       server services =3D s3fs, rpc, nbt, wrepl, ldap, cldap, kdc, drepl,winbindd, ntp_signd, kcc
       log level =3D 1
       log file =3D /var/log/samba/log.%m
       max log size =3D 1000
       template shell=3D/bin/bash
       idmap_ldb:use rfc2307 =3D yes


I suggest you read these to start with.=20
https://wiki.samba.org/index.php/Setting_up_Samba_as_an_Active_Directory_Domain_Controller=20
And  https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Domain_Member=20
Your member settings are also wrong, these are using absolete settings.=20

The member config by example.=20
 [global]
       security =3D ADS
       realm =3D LENZSPITZE.CALAIS.FE
       workgroup =3D LENZSPITZE
       netbios name =3D TESTBURGERS

=09 idmap config LENZSPITZE : backend =3D rid
       idmap config LENZSPITZE : schema_mode =3D rfc2307
       idmap config LENZSPITZE : range =3D 10000-3999999
       idmap config LENZSPITZE : unix_nss_info =3D yes

       template homedir =3D/etudiants/%U
       template shell =3D/bin/bash

       winbind nss info =3D rfc2307

       kerberos method =3D secrets and keytab
       dedicated keytab file =3D /etc/krb5.keytab
       # renew the kerberos ticket
       winbind refresh tickets =3D yes       winbind use default domain =3D yes

 =09 # user Administrator workaround, without it you are unable to set privileges
  =09 # not needed if you only run winbind
 =09 # Set on member and DC.
  =09 username map =3D /etc/samba/samba_usermapping

    # For ACL support on member servers with shares
    vfs objects =3D acl_xattr
    map acl inherit =3D Yes
    store dos attributes =3D Yes


Read through these howtos, these are optimized for Debian.=20
https://github.com/thctlo/samba4/blob/master/howtos/stretch-base-2.0-samba-minimal-ad.txt=20
That shows howto setup a DC, its getting old and needs an update but it still correct.=20
This shows the setup of a AD-backend not RID, the difference can be found in the wiki link above.=20

And for a member=20
https://github.com/thctlo/samba4/blob/master/howtos/stretch-base-3.2-samba-member-fileserver.txt



Greetz,=20

Louis


> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> nathalie ramat via samba-technical
> Verzonden: donderdag 9 mei 2019 9:29
> Aan: samba-technical@lists.samba.org
> Onderwerp: debian 10: I can not integrate a linux machine=20
> into a Samba Ad
>=20
> Hello
>=20
>=20
>=20
> I have a old version of samba which communicate with users=20
> windows 7 and user debian Linux.I have to integrate new=20
> machines under Windows 10.
>=20
> I am testing the samba version 4.9.5.
> I am use the packages of debian testing (debian 10) for a=20
> server and the user.
>=20
>=20
> I want to use samba as AD. I have generated my AD with the=20
> following command : samba-tool domain provision --use-rfc2307=20
> --interactive
> everything was generated correctly apparently
>=20
>=20
> But when I execute the commande samba -i I have the following errors :
>=20
> /usr/sbin/smbd: pid_to_procid: messaging_dgm_get_unique failed: Aucun
> fichier ou dossier de ce type
> /usr/sbin/smbd: send_all_fn: messaging_send_buf to 16162 failed:
> NT_STATUS_OBJECT_NAME_NOT_FOUND
> /usr/sbin/smbd: pid_to_procid: messaging_dgm_get_unique failed: Aucun
> fichier ou dossier de ce type
> /usr/sbin/smbd: send_all_fn: messaging_send_buf to 24980 failed:
> NT_STATUS_OBJECT_NAME_NOT_FOUND
> /usr/sbin/smbd: pid_to_procid: messaging_dgm_get_unique failed: Aucun
> fichier ou dossier de ce type
> /usr/sbin/smbd: send_all_fn: messaging_send_buf to 16173 failed:
> NT_STATUS_OBJECT_NAME_NOT_FOUND
> /usr/sbin/smbd: pid_to_procid: messaging_dgm_get_unique failed: Aucun
> fichier ou dossier de ce type
> /usr/sbin/smbd: send_all_fn: messaging_send_buf to 31019 failed:
> NT_STATUS_OBJECT_NAME_NOT_FOUND
>=20
>=20
>=20
>=20
>   Nevertheless, I can to integrate my windows machines (7 and=20
> 10) into my domain.
>=20
>=20
> But for my linux machines - impossible
>=20
> if I use  the command net rpc join -S=20
> nordend.LENZSPITZE.CALAIS.FR -U administrator  .The client=20
> wait and doesn't ask the password
>=20
> or  if i use net ads join -S nordend.LENZSPITZE.CALAIS.FR -U=20
> administrator the linux client asks for the password - and =20
> wait for the answer of the server
>=20
> In the logs of the server , I realized that he was trying to=20
> identify the machine via the kerberos database.
>=20
> However, the machine could not generate a kerberos ticket=20
> because I can=20
> not join her to the domain.
>=20
>=20
> Kerberos: AS-REQTESTBUGSTER$@LENZSPITZE.CALAIS.FR  from
> ipv4:192.168.22.xxx:59861 for
> krbtgt/LENZSPITZE.CALAIS.FR@LENZSPITZE.CALAIS.FR
> Kerberos: UNKNOWN --TESTBUGSTER$@LENZSPITZE.CALAIS.FR: no such entry
> found in hdb
> Auth: [Kerberos KDC,ENC-TS Pre-authentication] user
> [(null)]\[TESTBUGSTER$@LENZSPITZE.CALAIS.FR] at [Fri, 26 Apr 2019
> 12:39:14.537545 CEST] with [(null)] status [NT_STATUS_NO_SUCH_USER]
> workstation [(null)] remote host [ipv4:192.168.22.xxx:59861] mapped to
> [(null)]\[(null)]. local host [NULL]
> {"timestamp": "2019-04-26T12:39:14.537598+0200", "type":
> "Authentication", "Authentication": {"version": {"major": 1, "minor":
> 0}, "status": "NT_STATUS_NO_SUCH_USER", "localAddress": null,
> "remoteAddress": "ipv4:192.168.22.xx:59861", "serviceDescription":
> "Kerberos KDC", "authDescription": "ENC-TS Pre-authentication",
> "clientDomain": null, "clientAccount":
> "TESTBUGSTER$@LENZSPITZE.CALAIS.FR", "workstation": null,
> "becameAccount": null, "becameDomain": null, "becameSid": null,
> "mappedAccount": null, "mappedDomain": null, "netlogonComputer": null,
> "netlogonTrustAccount": null, "netlogonNegotiateFlags": "0x00000000",
> "netlogonSecureChannelType": 0, "netlogonTrustAccountSid": null,
> "passwordType": null, "duration": 2589}}
>=20
> /usr/sbin/smbd: ldb_wrap open of secrets.ldb
> /usr/sbin/smbd: Got NTLMSSP neg_flags=3D0x62088215
> /usr/sbin/smbd: Got user=3D[TESTBUGSTER$] domain=3D[LENZSPITZE]
> workstation=3D[TESTBUGSTER] len1=3D24 len2=3D356
> /usr/sbin/smbd: auth_check_password_send: Checking password=20
> for unmapped
> user [LENZSPITZE]\[TESTBUGSTER$]@[TESTBUGSTER]
> /usr/sbin/smbd: auth_check_password_send: user is:
> [LENZSPITZE]\[TESTBUGSTER$]@[TESTBUGSTER]
> /usr/sbin/smbd: sam_search_user: Couldn't find user [TESTBUGSTER$] in
> samdb, under DC=3Dlenzspitze,DC=3Dcalais,DC=3Dfr
> /usr/sbin/smbd: auth_check_password_recv: sam authentication for user
> [LENZSPITZE\TESTBUGSTER$] FAILED with error NT_STATUS_NO_SUCH_USER,
> authoritative=3D1
> /usr/sbin/smbd: Auth: [SMB2,NTLMSSP] user=20
> [LENZSPITZE]\[TESTBUGSTER$] at
> [ven., 26 avril 2019 12:39:14.561942 CEST] with [NTLMv2] status
> [NT_STATUS_NO_SUCH_USER] workstation [TESTBUGSTER] remote host
> [ipv4:192.168.22.xxx:58998] mapped to=20
> [LENZSPITZE]\[TESTBUGSTER$]. local
> host [ipv4:192.168.22.xxx:445]
> /usr/sbin/smbd: {"timestamp":=20
> "2019-04-26T12:39:14.562671+0200", "type":
> "Authentication", "Authentication": {"version": {"major": 1, "minor":
> 0}, "status": "NT_STATUS_NO_SUCH_USER", "localAddress":
> "ipv4:192.168.22.xxx:445", "remoteAddress":=20
> "ipv4:192.168.22.xxx:58998",
> "serviceDescription": "SMB2", "authDescription": "NTLMSSP",
> "clientDomain": "LENZSPITZE", "clientAccount": "TESTBUGSTER$",
> "workstation": "TESTBUGSTER", "becameAccount": null, "becameDomain":
> null, "becameSid": null, "mappedAccount": "TESTBUGSTER$",
> "mappedDomain": "LENZSPITZE", "netlogonComputer": null,
> "netlogonTrustAccount": null, "netlogonNegotiateFlags": "0x00000000",
> "netlogonSecureChannelType": 0, "netlogonTrustAccountSid": null,
> "passwordType": "NTLMv2", "duration": 11627}}
> /usr/sbin/smbd: gensec_spnego_server_negTokenTarg_step:=20
> SPNEGO(ntlmssp)
> login failed: NT_STATUS_NO_SUCH_USER
>=20
> When I execute on the server : smbclient -L localhost -U administrator
>=20
> I get the following answer
>=20
> Sharename       Type      Comment
>       ---------       ----      -------
>       homes           Disk
>       profiles        Disk
>       print$          Disk      Printer Drivers
>       IPC$            IPC       IPC Service (Samba 4.9.5-Debian)
>       Administrator   Disk      Home directory of=20
> LENZSPITZE/Administrator
> Reconnecting with SMB1 for workgroup listing.
>=20
>       Server               Comment
>       ---------            -------
>       NORDEND              Samba 4.9.5-Debian
>=20
>       Workgroup            Master
>       ---------            -------
>       LENZSPITZE
>=20
>=20
> I think the client and the server do not use the same protocols=20
> communications  (net rpc --> SMB1/CIFS =3F ).
> How can I add my linux Machine to my AD =3F
>=20
>=20
>=20
> I configured smb.conf at my server :
>=20
>=20
> # global parameters
> [global]
>       workgroup =3D LENZSPITZE
>       realm =3D lenzspitze.calais.fr
>       netbios name =3D NORDEND
>       server role =3D active directory domain controller
>       server services =3D s3fs, rpc, nbt, wrepl, ldap, cldap,=20
> kdc, drepl,winbindd, ntp_signd, kcc
>       log level =3D 3
>       log file =3D /var/log/samba/log.%m
>       max log size =3D 1000
>       template shell=3D/bin/bash
>       idmap_ldb:use rfc2307 =3D yes
>       winbind enum users =3D yes
>       winbind enum groups =3D yes
>       winbind use default domain =3D yes
>       winbind separator =3D /
>       idmap config *:backend =3D tdb
>       idmap config *:range =3D 1000-19000=C3=A9r=C3=A9 correctement semble-t-il.
>       host msdfs =3D no
>       security =3D user
>       name resolve order =3D host
> #    ntlm auth =3D yes
> #     raw NTLMV2 auth =3D yes
> #    lanman auth =3Dyes
> #    vfs objects =3D acl_xattr
>       map acl inherit =3D Yes
> #    store dos attributes =3D Yes
>=20
>=20
> [netlogon]
>       path =3D=20
> /var/lib/samba/var/locks/sysvol/lenzspitze.calais.fr/scripts
>       read only =3D no
>       browsable =3D no
>=20
> [sysvol]
>       path=3D /var/lib/samba/var/locks/sysvol
>       read only =3D no
>       browsable =3D no
>=20
> [homes]
>       path=3D/home/%G/%U
>       read only =3D no
>       writable =3D yes
>=20
>=20
> [profiles]
>       path=3D/resultats/profiles
>       read only =3D no
>       writable =3Dyes
>=20
>=20
> [printers]
>      comment =3D All Printers
>      browseable =3D no
>      path =3D /var/spool/samba
>      printable =3D yes
>      guest ok =3D no
>      read only =3D yes
>      create mask =3D 0700
>=20
> # Windows clients look for this share name as a source of downloadable
> # printer drivers
> [print$]
>      comment =3D Printer Drivers
>      path =3D /var/lib/samba/printers
>      browseable =3D yes
>      read only =3D yes
>      guest ok =3D no
>=20
>=20
>=20
> and my linux user :
>=20
>=20
> [global]
>       security =3D ads
>       realm =3D lenzspitze.calais.fr
>       workgroup =3D LENZSPITZE
>       netbios name =3D testbugster
>       winbind separator =3D /
>       ntlm auth =3D yes
>       idmap uid =3D 0-50000
>       idmap gid =3D 0-50000
>       winbind enum users =3D yes
>       winbind enum groups =3D yes
>       idmap config LENZSPITZE : backend =3D rid
>       idmap config LENZSPITZE : base_rid =3D 0
>       template homedir =3D/etudiants/%U
>       template shell =3D/bin/bash
>       encrypt passwords =3D yes
>       winbind nss info =3D rfc2307
>       kerberos method =3D  secrets and keytab
>       winbind use default domain =3D yes
>       log file =3D/var/log/samba/log.%m
>       log level =3D 3
>=20
>=20
>=20
> Thank you for your help
>=20
>=20
> Sincerely yours
>=20
> --=20
> Nathalie RAMAT-LECLERCQ
>=20
> Service Informatique
>=20
> Universite du Littoral-C=F4te d'Opale
> SCoSI - Service Commun du Syst=E8me d'Information
> P=F4le Syst=E8mes et r=E9seaux
>=20
> Centre de Gestion Universitaire de Calais
> 50 rue ferdinand Buisson
> C.S 80699
> 62228 CALAIS CEDEX
>=20
>=20
>=20
>=20
>=20
>=20


