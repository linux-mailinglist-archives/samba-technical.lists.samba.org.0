Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47916E6D76
	for <lists+samba-technical@lfdr.de>; Mon, 28 Oct 2019 08:45:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=1PUNmVB82qXc7ZRW9bHTRco8IsrWHzjaQnC4kV/dWHI=; b=4xM5xtxd829tLBWNaxKQa3Vhg/
	hfevMKWi5gVJ80ugN5jWJbaYt5SB3l+BIBc7uPNJKoL4K6+psCeKNI08GVTPGd9qzgBY/XbrFfzcl
	CU8/RkGDvEjd0s0onXjiaw4SIMoFq6jzbO1+lpiUmHgF5lVj8mCZxQTTY4KlLCzeRA6TmBoEC2rwD
	2UfkMbOW4gpKQD5nYldnfhSz/e4Sj2IPcvrXHsSb1GeAkFBCti4UyRb2Lej4jBOt4KH9Pww5IYe1S
	8AWaeRFYa/Zj8RuqoZCfpaDjBwFFiaxhYqiOq3NhEtRyT+Txeg367Ukg2EGeJ//RdXKQe8Iuxksq1
	YC4v+AXg==;
Received: from localhost ([::1]:40790 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iOzi7-002w5a-6Z; Mon, 28 Oct 2019 07:45:07 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:56208) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iOzi1-002w5P-Dk
 for samba-technical@lists.samba.org; Mon, 28 Oct 2019 07:45:04 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id B6AAED3F33250;
 Mon, 28 Oct 2019 10:44:58 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id F7LGo-gB5qu1; Mon, 28 Oct 2019 10:44:58 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id E826AD3F33253;
 Mon, 28 Oct 2019 10:44:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru E826AD3F33253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1572248697;
 bh=1PUNmVB82qXc7ZRW9bHTRco8IsrWHzjaQnC4kV/dWHI=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=d0qCqqweQp1JMBqQdwU9FnmXvKNM1lRJNzPrDp7WDbK23W8wiY5/0WwFvQvl1FzbO
 YLonBEBJDNBmuKsGPkTchQfN1haT4+GOBE1nHou74HhuOxmVBO3T6hLWOV8s6pmAV/
 f/69tPJaXC8ZmRmFsSWIZ44vLKpalkqiDrgePZkqCihIkJYZoQSc2aB/PAXt7BW/Ab
 HWXVSNs8dL+uJ5jMfoIT0wSvSqXlNnWDo9b61zMhSF/D0zEo/rJfhi8RDp5hGda4a6
 dp0jEOYzRzWnnkM0SYDjSG9psb+wXdLUeOXeJhAZ3IYkYgqz4donBNbK6VogPGig7V
 BXM0y7Td463WQ==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 0KhO2tLW6LyH; Mon, 28 Oct 2019 10:44:57 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-115.ip.moscow.rt.ru
 [90.154.70.115])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id B53C3D3F33250;
 Mon, 28 Oct 2019 10:44:57 +0300 (MSK)
Subject: Re: Automating usage of smbspool_krb5_wrapper
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <2538732.qaAAVzzFgV@magrathea>
Message-ID: <dda32395-9ac0-9dad-5528-7f284f5101df@rosalinux.ru>
Date: Mon, 28 Oct 2019 10:44:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2538732.qaAAVzzFgV@magrathea>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru-RU
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

28.10.2019 10:12, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Monday, 28 October 2019 07:32:13 CET Mikhail Novosyolov via samba-te=
chnical
> wrote:
>> Currently there are 2 alternatives for /var/lib/cups/backend/smb:
>> - /usr/bin/smbspool for printing to an SMB printer
>> - /usr/lib(64)/samba/smbspool_krb5_wrapper
>> for printing to an SMB printer with Kerberos authentication (e.g. insi=
de
>> Active Directory domain). It makes use of Kerberos ccache of a user wh=
o
>> made the printing task instead of ccache of ldp daemon user.
>>
>> In Fedora, as I could understand from samba.spec
>> (https://src.fedoraproject.org/rpms/samba/blob/master/f/samba.spec),
>> package samba-krb5-printing has to be installed when it is needed to
>> switch from smbspool to smbspool_krb5_wrapper.
> Samba only provides smbspool and smbspool_krb5_wrapper. Installing it a=
s a
> CUPS backend is done by downstream, e.g. Fedora.
>
> You should discuss it there. However there is probably a historic reaso=
n for
> smbspool_krb5_wrapper being in a separate package. Maybe the package co=
uld be
> installed by default or as a recommondation.
>
> So open a bug downstream :-)

I want to do this in ROSA package of samba, not in Fedora. Currently it=20
has neither update-alternatives, nor something else. I wrote about=20
Fedora because many samba developers are familiar with it.

The question to this mailing list was how ready is smbspool_krb5_wrapper=20
for being the default for /usr/lib/cups/backend/smb for all systems,=20
both with and without Kerberos authentication. /usr/lib/cups/backend/smb=20
must be something, either smbspool or smbspool_krb5_wrapper, otherwise=20
CUPS will not understand where to find smb backend. Currently=20
smbspool_krb5_wrapper does:

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

But AuthInfoRequired (AUTH_INFO_REQUIRED) =3D=3D "none" or=20
"username,password" in /etc/cups/printers.conf in most cases.

At least this check for=C2=A0 AUTH_INFO_REQUIRED being null or empty but =
not=20
"none" or !=3D "negotiate" makes smbspool_krb5_wrapper makes not ready to=
=20
be /usr/lib/cups/backend/smb for systems without kerberos authentication.

There are 2 possible solutions:

1) either patch source3/client/smbspool_krb5_wrapper.c to "goto=20
smbspool;" if env does not contain "negotiate" instead of chekcing to be=20
either null or 0 - how correct will this be?

2) or make a shell script /usr/lib/cups/backend/smb that will try to=20
guess when to call smbspool and when to call smbspool_krb5_wrapper

=E2=84=961 is a seems to be a much better solution. I wanted to hear opin=
ions=20
how right it seems to be.


