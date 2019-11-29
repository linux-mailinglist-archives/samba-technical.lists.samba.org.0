Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1051D10D5E1
	for <lists+samba-technical@lfdr.de>; Fri, 29 Nov 2019 13:52:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fdU5ptGWQDzWT5SE8TWL7gR8uqXTXj0ebQIANZAwKMY=; b=P6Vd780GKM4W9bsysGfq67KRkA
	KLsyLaAyEhtvSu3yv0kkOYUkyz7um1kWymPDBWjtKIWxzsEi8wRGhXmEF0SrqMsTVdnV5RDBpU23l
	K44zZpPt1xL+jtKS72MB84cOgn/iLsRPq4ZQT4rIjefUhZjrRKH1azVuarZsFFUgngrQBmMDIzodF
	7WghIaLvY99cLNnCR495s6ZNG0VPjZKGtdIij2fVAHZ6AtTWkEJb6QcRhOrITbMNAJb/zOdO913eL
	Ho/OuquX9ArVjPE8YmihFlmpwlKbZ/oIgC0PZEVpnnFWaIVrM56t3tPIEWSBkKZxO1Mw+iMmyfafZ
	z+Etqihg==;
Received: from localhost ([::1]:18198 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iafkW-003L2I-J7; Fri, 29 Nov 2019 12:51:52 +0000
Received: from youngberry.canonical.com ([91.189.89.112]:35360) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iafkR-003L2A-0S
 for samba-technical@lists.samba.org; Fri, 29 Nov 2019 12:51:49 +0000
Received: from mail-oi1-f200.google.com ([209.85.167.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andreas.hasenack@canonical.com>) id 1iafkM-0001ky-LX
 for samba-technical@lists.samba.org; Fri, 29 Nov 2019 12:51:42 +0000
Received: by mail-oi1-f200.google.com with SMTP id k15so1697397oik.11
 for <samba-technical@lists.samba.org>; Fri, 29 Nov 2019 04:51:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fdU5ptGWQDzWT5SE8TWL7gR8uqXTXj0ebQIANZAwKMY=;
 b=khAEhghtTPjz3Yxl9dGddIl7lZ2UNf0wWdjempD2Ynra/drsJWyNO86EWh3bOLfh9E
 5NcFQL0ZfgsiaNw++hbZH7QpdiN5ay8DDLWSTHumpMnAKRl4MdTXuXiLysa1AN6SOHhD
 M27YzMStfdPl1k6sNm0B+AllZGk7QibE3IFDrSv0C8I0BCE+CvQSMaGKeS6U1yNXrLiI
 P/3qsFGyn8gwgxhZZSQCebDclt/9IJYtamsXX5iP+Tq1/10k79cGSuI2I3/I8ZsEqw+N
 O9c9/u6pMcqZ/EK7VA1a4serVr0ZShAw7DU4xVrNUlSUX9yPvkpf1wKW0Jn3+ivcmc4B
 y2Sw==
X-Gm-Message-State: APjAAAV9pDjcTEMJWrifPKLwth/C2r/lawoMW4A4lvkogbQW+pbPw3GT
 XA2cdE1p+A9lZ1oDxqv7Cw46CJ6mjlFaOuM5HlaJK+jxZ/rEHVZu4z7/uzxBt0TQvunn1lKM+sh
 LvOtwyICKqm5zZnqn4EjG2Kiw4O+CO1+qiG9IR+sFLs2bsWdK6Vz4DCQqHMGDAg==
X-Received: by 2002:aca:cf83:: with SMTP id f125mr432595oig.15.1575031901431; 
 Fri, 29 Nov 2019 04:51:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxqqxmZL1JToURliJ8fZ/8pzHROv8BPSDhayqd6WZis7zJz0uMaZQfghFy8RsXuJy2x8VhPS/qUsH2lAudbNB0=
X-Received: by 2002:aca:cf83:: with SMTP id f125mr432579oig.15.1575031901071; 
 Fri, 29 Nov 2019 04:51:41 -0800 (PST)
MIME-Version: 1.0
References: <CANYNYEEyavNVwax-aWu+qLZYMw+f=hFNA=6WH2gREh9WjHQ8oQ@mail.gmail.com>
 <94f7c58e-ee8e-9aaa-d442-2f589d2c2767@rosalinux.ru>
In-Reply-To: <94f7c58e-ee8e-9aaa-d442-2f589d2c2767@rosalinux.ru>
Date: Fri, 29 Nov 2019 09:51:30 -0300
Message-ID: <CANYNYEHKv7Gszw=Wb0mA_oqnDMKdhW=_1xq1jkUdgn4QDgME7Q@mail.gmail.com>
Subject: Re: smbspool without authentication no longer works?
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Content-Type: text/plain; charset="UTF-8"
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
From: Andreas Hasenack via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Hasenack <andreas@canonical.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Mikhail,

thanks for your reply!


On Thu, Nov 28, 2019 at 5:03 PM Mikhail Novosyolov
<m.novosyolov@rosalinux.ru> wrote:
>
> 28.11.2019 21:11, Andreas Hasenack via samba-technical =D0=BF=D0=B8=D1=88=
=D0=B5=D1=82:
> > Hi,
> >
> > is smbspool supposed to work without authentication, in the case the
> > printer is shared like that?

> It was fixed in Samba 4.10 but was not backported to samba 4.9:
> https://bugzilla.samba.org/show_bug.cgi?id=3D13939

The commits in master, and the provided patches for older releases,
don't seem to address the unauthenticated case, i.e., guest printing,
which worked in 4.7.6.


> Yes, people report that it worked in 4.7 and broke in 4.9. But now it
> works in 4.10.

Maybe there are many similar scenarios here. What I was testing is
unauthenticated printing with smbspool, i.e., no username or password
specified in the URL or any env variable. cups is also set to allow
printing from anyone, i.e., AuthInfoRequired is none. I tested that
with 4.10.7 and debian's 4.11.1 and it doesn't work.

> "Failed to get default principal from ccache: FILE:/tmp/krb5cc_0" - this
> means that ccache of root user is being looked for. You should symlink
> /usr/lib/cups/backend/smb to smbspool_krb5_wrapper, then ccache of the
> printing task creator will be found and used.

I'm not trying to use kerberos authentication. Since
auth_info_required is none/NULL, the code skips these (and username is
NULL too):
    if (strcmp(auth_info_required, "negotiate") =3D=3D 0) {
...
    } else if (strcmp(auth_info_required, "username,password") =3D=3D 0) {
...
    } else {
        if (username !=3D NULL) {
...
        } else if (kerberos_ccache_is_valid()) { <--- no kerberos ticket
...
        } else {
            fprintf(stderr,
                "DEBUG: This backend requires credentials!\n");
            return NT_STATUS_ACCESS_DENIED;

So it doesn't even get to try passwordless NTLMSSP later on:
    /* give a chance for a passwordless NTLMSSP session setup */
    pwd =3D getpwuid(geteuid());
    if (pwd =3D=3D NULL) {
        return NT_STATUS_ACCESS_DENIED;
    }

    nt_status =3D smb_complete_connection(&cli,
...

or guest/anonymous:
    /*
         * last try. Use anonymous authentication
         */

    nt_status =3D smb_complete_connection(&cli,
                        myname,
                        server,
                        port,
                        "", <--- username
                        "", <--- password
                        workgroup,



>
> Please read a recent thread
> https://lists.samba.org/archive/samba-technical/2019-October/134470.html
> "Automating usage of smbspool_krb5_wrapper" from start to end, in the
> first email problem is explained and in the last patches are attached. I
> would appreceate if you test them in Ubuntu: they allow to symlink
> /usr/lib/cups/backend/smb -> smbspool_krb5_wrapper instead of smbspool
> and make printing work out of the box both with and without Kerberos.

Thanks for the pointer.

https://git.samba.org/?p=3Dasn/samba.git;a=3Dcommitdiff;h=3Dd5e8813b1f8219d=
a231e82735780e3e6c35c66e2

and

https://git.samba.org/?p=3Dasn/samba.git;a=3Dcommitdiff;h=3D20dd0308aa072ed=
656550af487338b50cda9b59f

Seem to be going in the direction of fixing the present issue. Has
anybody tried those yet, or what is their state?

