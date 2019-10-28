Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 20455E6C78
	for <lists+samba-technical@lfdr.de>; Mon, 28 Oct 2019 07:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=3I2uzyiYnqFCm8gdnq2Nc7+cLYKFs/RvNsAnxuDBsSQ=; b=ziVzJIXC32Xmo4EAkSKTLaSCaf
	iTr3RZIt0ZZTxgcvr0sgyeeDV94Gclb2uhOr6wjt/Ut73rVfO5buzWvDvGda/QdDshJ1H86ZhAn/L
	VATnWUQvAYikNa9+NkCfD3MSZJm4NgKFd1jYrpJBSJU4qNy9jti8+huvAwxSmF7oUAlnuAhbtVWLi
	EOPV3nqW4Ez+cHX5wEjSkj/Ta8Gg1wnKEMoy3iNpAvTrkEwMdmgP55mw12UMY9zRVbYG/PGllTbqJ
	6rPZ7KJoO2OKnieL5SgI/Vu0/pC/l9D5aaRm7sNRrLcVoDonOyWqP2Y2mdMKiMqYEd8HdhG1A7o4U
	KFGGvLpA==;
Received: from localhost ([::1]:37960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iOyZs-002vRh-IU; Mon, 28 Oct 2019 06:32:32 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:47874) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iOyZe-002vRa-MJ
 for samba-technical@lists.samba.org; Mon, 28 Oct 2019 06:32:23 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 5F4AFD3E7F790
 for <samba-technical@lists.samba.org>; Mon, 28 Oct 2019 09:32:15 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id xK73B0l7OoE2 for <samba-technical@lists.samba.org>;
 Mon, 28 Oct 2019 09:32:14 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id A8FBFD3EC3BB0
 for <samba-technical@lists.samba.org>; Mon, 28 Oct 2019 09:32:14 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru A8FBFD3EC3BB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1572244334;
 bh=3I2uzyiYnqFCm8gdnq2Nc7+cLYKFs/RvNsAnxuDBsSQ=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=IQ46J6gKXlXhlFYfEBpNQPaBtFbZ1Lk7UKMxt7wpdBU0dPnoyp3Hi9iZxTFUWrfKC
 yVWRZMdvONKQ9JVWiRbnSXvHChxCsTgFl1zTQjitjj3O6xN3JO4ntUgydrusZWV/D/
 Ya5yie7+kSQ6X3AwESmK+Ptwc9+2/93HnAO98rtyVIgEigkrGuSHCdTBmfUoHtDW4x
 aUKIwwZw6FvLTb7V97QJTVpi+dL5F3rm2dZy6rDbWwJBvLM6K6S2mqPv5gLl3AZ9EY
 lTaDJ3Mge3+p0XcHZDBpRXXeESfrlQpZ4DA6jmJlsJKx8gYe7UXRJMOnBr3I1uewPB
 PGQ8tC9fm/ZMw==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fwj_AE5xUVAk for <samba-technical@lists.samba.org>;
 Mon, 28 Oct 2019 09:32:14 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-115.ip.moscow.rt.ru
 [90.154.70.115])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 87355D3E7F790
 for <samba-technical@lists.samba.org>; Mon, 28 Oct 2019 09:32:14 +0300 (MSK)
To: samba-technical@lists.samba.org
Subject: Automating usage of smbspool_krb5_wrapper
Message-ID: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
Date: Mon, 28 Oct 2019 09:32:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Currently there are 2 alternatives for /var/lib/cups/backend/smb:
- /usr/bin/smbspool for printing to an SMB printer
- /usr/lib(64)/samba/smbspool_krb5_wrapper
for printing to an SMB printer with Kerberos authentication (e.g. inside=20
Active Directory domain). It makes use of Kerberos ccache of a user who=20
made the printing task instead of ccache of ldp daemon user.

In Fedora, as I could understand from samba.spec=20
(https://src.fedoraproject.org/rpms/samba/blob/master/f/samba.spec),=20
package samba-krb5-printing has to be installed when it is needed to=20
switch from smbspool to smbspool_krb5_wrapper.

This has to be done manually. When a workstation is a member of an AD=20
domain, printing with negotiate authorization in CUPS ("AuthInfoRequired=20
negotiate" in /etc/cups/printers.conf) does not work, because=20
/tmp/krb5cc_<UID_of_lp_user> is looked for instead of=20
/tmp/krb5cc_<UID_of_printing_task_creator>. If access to printing server=20
is restricted to domain users only, nothing can be printed.=20
smbspool_krb5_wrapper is aimed to solve this problem and use Kerberos=20
credentials cache (ccache) of a correct user, if I understood correctly.

Recently some work has been done on smbspool and krb5 wrapper=20
(https://bugzilla.samba.org/show_bug.cgi?id=3D13939).

I tried to investigate if it can be automated (to eliminate need in=20
installing samba-krb5-printing in other words).

source3/client/smbspool_krb5_wrapper.c has following code:

 =C2=A0=C2=A0=C2=A0 /* Check if AuthInfoRequired is set to negotiate */
 =C2=A0=C2=A0=C2=A0 env =3D getenv("AUTH_INFO_REQUIRED");

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* If not set, then just call=
 smbspool. */
 =C2=A0=C2=A0=C2=A0 if (env =3D=3D NULL || env[0] =3D=3D 0) {
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED=
 is not set - "
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "execute smbspool");
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 goto smbspool;

Can't /var/lib/cups/backend/smb be ALWAYS symlinked to=20
smbspool_krb5_wrapper?

I think that checking for AUTH_INFO_REQUIRED being null or empty can be=20
replaced with a check that it contains "negotiate". Currently this=20
condition will not work in most cases, because AUTH_INFO_REQUIRED will=20
be set to "none" or "username,password". Then /var/lib/cups/backend/smb=20
can always be symlinked to smbspool_krb5_wrapper without=20
update-alternatives.

What do you think?


