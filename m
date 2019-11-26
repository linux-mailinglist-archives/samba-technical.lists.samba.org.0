Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A74010A1E3
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2019 17:20:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Kk0TqNbqtZg8/R/Y6w6CVtr/eflFSCEDQIseJL/cIOI=; b=h/SAKaeRhRuIhjdhCLn2jgy8XC
	10wjlSQurleCoU0Fzds9W+oK+47iZK1mKr1JrBu0TvR5KNlO7R0Am8Hdw6xxDJiiO+TbsuL51lfLs
	/SWeyCA4q5TW8+LK8tjyRH4UEmLjf/vfz22NEuiN5iSvhUxZI9Qv+pJ6xZRcMSSdLXLzu6NibCGK9
	iSXiwNMPBxwdb1Dvhab5T/0+weILdkrspzg5SGOLPexH5PG0SfpTK6RJPHuernOQgg+YJmNNLYtIk
	tiPmxaR0MGUrjdNHQvk6/VAXTbBs8C5zQRn8BPLjVixIYXzbXtF8XJ99R5dK5WRgKK58qZ4Q7QQx5
	vcxMMHMg==;
Received: from localhost ([::1]:54088 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZdZO-002SiY-Vw; Tue, 26 Nov 2019 16:20:07 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:34912) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZdZK-002SiQ-TT
 for samba-technical@lists.samba.org; Tue, 26 Nov 2019 16:20:05 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1575390000.38415@Ttw2UCHTRuWN8KmfnoY/8w
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 215AD11F2FD.A771A
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 215AD11F2FD;
 Tue, 26 Nov 2019 17:20:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1574785200;
 bh=akjSOidLd0UceoDrQhNpfweCVep6uKCTa5HSMcs38JU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=WY63mqLp6nX4pznP3C0359lZNF0PgfVOxyPP4UUUq2DFbuIdYFmPhQi+t3+WOtNM8
 +iev8mhF4v5Q7ZsbH8PJ0WRRSwVrBwdhUsYoz51OHnFQDmJbQPfRpcvzEz9gjrllqr
 qDEt/Zwi20L/sgeTGEboP3oZTD1t5EMSzoW8FKPfvIaokpixNRROc/7Q+fuE7lCdgl
 PoFiwMqrizhxN1aGDNPA5DzDcs9eO1nFn7AB2D6MQbxT1jwpOePCY5vAG8JhjmueEn
 lI0VbpFtDPDci4XYkpcLK7NDynHrYwEB75O72RmA9MQLfYCZbxXiQEWU0tGTcFYrcf
 FZrNy5bmjDXXA==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 330DC3AF8C;
 Tue, 26 Nov 2019 17:19:57 +0100 (CET)
Subject: RE: [Samba] moved DM config to new server : gids different etc
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Tue, 26 Nov 2019 17:19:57 +0100
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dd441242-3a01-dcbf-f112-1efeeeab1d2f@xunil.at>
References: <dd441242-3a01-dcbf-f112-1efeeeab1d2f@xunil.at>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdWkdVdtnrnBYBPnTUGQzqCB+eV+2g==
Message-Id: <vmime.5ddd50ad.6cee.6bf466bb7a847efd@ms249-lin-003.rotterdam.bazuin.nl>
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Cc: "=?windows-1252?Q?Stefan_G._Weichinger?=" <lists@xunil.at>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai Stefan,=20

Remove the netbios alias and then put that as CNAME in the DNS
Verify if the server its PTR is set also.=20

And yeah, your totaly correct that your ACL is messed up..
Because your using backend RID.=20

The "advantage" of backend AD.
Consistent IDs on all Samba clients and servers using the ad back end.=20

Which is also the DISAVANTAGE of RID.
IN-Consistent IDs on all Samba clients and servers with RID.


Maybe im bit wrong here, with recent updates, .. Then Rowland will correct me.. ;-)=20
But this is exactly why i ONLY use AD backends.=20

I suggest, setup a folder, correct the rights, and use get-set facl to apply them again on the filesystem/folders/files.=20

So far,

Greetz,=20

Louis



> -----Oorspronkelijk bericht-----
> Van: samba [mailto:samba-bounces@lists.samba.org] Namens=20
> Stefan G. Weichinger via samba
> Verzonden: dinsdag 26 november 2019 17:01
> Aan: samba
> Onderwerp: [Samba] moved DM config to new server : gids different etc
>=20
>=20
> Last week the mobo in a DM server died, so we had to set up a fallback
> machine and reinstall Debian 10.2 including Samba
>=20
> I had smb.conf but not /var/lib/samba in backups.
>=20
> Restored krb5.conf and smb.conf, rejoined.
>=20
> Things work mostly ...
>=20
> but for example I get gid 10006 for "domain users" instead of=20
> 10513 before.
>=20
> and getent group doesn't show the AD groups, btw
>=20
> -
>=20
> I have:
>=20
> # /etc/nsswitch.conf
>=20
> passwd:         compat winbind
> group:          compat winbind
> shadow:         compat
> gshadow:        files
>=20
> hosts:          files dns
> networks:       files
>=20
> protocols:      db files
> services:       db files
> ethers:         db files
> rpc:            db files
>=20
> netgroup:       nis
>=20
> ---
>=20
> # cat /etc/samba/smb.conf
> # Samba config file
> # from sgw 2018/jun/15
> # with help from Rowland
>=20
> [global]
> unix charset =3D iso8859-15
>=20
> security =3D ads
> realm =3D XYZ.INTRA
> workgroup =3D XYZ
>=20
> dedicated keytab file =3D /etc/krb5.keytab
> kerberos method =3D secrets and keytab
>=20
> netbios aliases =3D u1XYZ
> server string =3D U1XYZ
>=20
> winbind cache time =3D 10
> winbind use default domain =3D yes
> winbind refresh tickets =3D Yes
>=20
> template homedir =3D /mnt/MSA2040/smb/Homes/%D/%U
>=20
> restrict anonymous =3D 2
> domain master =3D no
> local master =3D no
> preferred master =3D no
> invalid users =3D root bin daemon adm sync shutdown halt mail news \
> =09=09uucp
> obey pam restrictions =3D yes
>=20
> interfaces =3D 192.168.100.4/24 127.0.0.1
> bind interfaces only =3D Yes
>=20
> idmap config * : range =3D 3000-7999
> idmap config * : backend =3D tdb
> idmap config XYZ : range =3D 10000-20000
> idmap config XYZ : backend =3D rid
>=20
> # For ACL support on domain member
> vfs objects =3D acl_xattr full_audit
> map acl inherit =3D Yes
> store dos attributes =3D Yes
> inherit acls =3D yes
>=20
> unix extensions =3D no
> follow symlinks=3D yes
> wide links=3D yes
>=20
> load printers =3D no
> printcap name =3D /dev/null
>=20
> acl allow execute always =3D True
>=20
> # Audit settings
> full_audit:prefix =3D %u|%I|%m|%S
> full_audit:failure =3D connect
> full_audit:success =3D mkdir rmdir read pread write pwrite rename unlink
> full_audit:facility =3D local5
> full_audit:priority =3D notice
>=20
> ---
>=20
> wbinfo -u and -g work afaik
>=20
> But permissions and ACLs are screwed up.
>=20
> I might be missing some package to install ... or what ever ...
>=20
> pls advise, Stefan
>=20
> --=20
> To unsubscribe from this list go to the following URL and read the
> instructions:  https://lists.samba.org/mailman/options/samba
>=20
>=20


