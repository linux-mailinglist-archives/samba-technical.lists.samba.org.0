Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8FE262DA2
	for <lists+samba-technical@lfdr.de>; Wed,  9 Sep 2020 13:05:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=cQTw9g13ZYnhlzkxBfbUx37jWAKBnjJMrA6Ks1b8Ks8=; b=llUmI1IM6icJH4OHU5jW4tlf12
	rlEHJjiQnf1n3n3GlACaMgue72rT+3Vpta5d57RGNRlAHmhwzYxEWS5sGCcerP8DtQ61UMCRX6ElW
	t45knyT6kB5DEF2rbjnTB6kRO1QHLmSHtlaNdA9sAeiDxvycpGnZw+ClNpBl49JUGlP66loQd8NY0
	yr1h3Vz0qLp/yE7sz7Sehutjab/voDbuayW5ASqh41kC3E8QC+b3DRWSd8w+3X/IiB16HqI0QHw8x
	DnxgWl3iiRGJh6yNv6g78MbDPIVMcZP9+Yzvk2vbicjSUo4WZWiu4FdqwqS5b7rXn13seOntlCpd5
	OnUDUO+g==;
Received: from localhost ([::1]:25080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kFxu9-004lVx-8Y; Wed, 09 Sep 2020 11:04:45 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:35545) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kFxu2-004lVq-C4
 for samba-technical@lists.samba.org; Wed, 09 Sep 2020 11:04:42 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id s92so1512692ybi.2
 for <samba-technical@lists.samba.org>; Wed, 09 Sep 2020 04:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cQTw9g13ZYnhlzkxBfbUx37jWAKBnjJMrA6Ks1b8Ks8=;
 b=qagrnJLSfTf/8PpVAANah4qIYkX1CQBks0+j3zR9MhDrFuLb+E+yaOS6GIN76Dho4t
 YTfTfHH2y+WNUH0sBQD3Vfpyo/cjCfyjiaGDbpsvYwts4A2CcCvVwWjI+arxFahRUFp2
 2V3NdSXNwWEk4tVLFXFh4LH3129uhD+rPuruxhHRB2EpWSAymb7qFoZTGnIIXsoQDAHx
 NuERFAknZ7Pr1aLq12r0wx1pjfL7MvbpB4k2FA9Hc1jjszdU1N6vD4woYR4GGDNgVZzp
 aW2S1Xu6ihYwTMBwt+ZP75zegmYJHramDG7iIc6ugz/CWO00/qz8yofFlzcLQFB09Mtu
 6RcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cQTw9g13ZYnhlzkxBfbUx37jWAKBnjJMrA6Ks1b8Ks8=;
 b=LftXjvum/6DlUhkZXyIQIrudQsbaYmAFaaQAo5qavWZUSsc+h5qpsGBAN3XWY4YgbI
 KvPA06Vz9Ex8GAxbtSXjTybZhTflkM0MolZPiEj8gHEll+VS8T7gn1t7NB7R4e3jbJPD
 zq5U7qrc47gHysledXUfCim/BLA9xJSlIMi28mWIFlhr3yTtnKccozJ7znYZBlE02SSe
 k1lIeB4fNh5FXgCowrqz7jC0Jb46jdUgUGqxOZFehJpI1b497wr/OkdCaUUpVM2zfp9/
 Ou3bLfnVah86nfB7/LV/7Kk7wb8lhuY1h/ZStw8Jr5ClVV7SsX3fbDq9a4wu2NzhZGwD
 n+VA==
X-Gm-Message-State: AOAM530WrXnwjeAMgi8wHC6wUo2P9VmjbNd+EOwI0Tt54GzQpCcPSWg/
 Qeyf09jwOS9AmtF/KwX84YUJvrkMFmbbnNmjbv4=
X-Google-Smtp-Source: ABdhPJyOBQsKtSkg3R7s3XBSzqEXwpu91xjJ7V9f7CfN3rMHxoiHN0ZqB6QflXiVlsizLHjvoEezgRbAz3XEY6RAWaw=
X-Received: by 2002:a25:750a:: with SMTP id q10mr4714594ybc.185.1599649474723; 
 Wed, 09 Sep 2020 04:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <CANT5p=pxPsBwAv3oJX6Ae9wjpZoEjLvyfGM1sM9DEhS11RNgog@mail.gmail.com>
 <87pn7t4kr9.fsf@suse.com>
 <CANT5p=oeY91u17DPe6WO75Eq_bjzrVC0kmAErrZ=h3S1qh-Wxw@mail.gmail.com>
 <87eeo54q0i.fsf@suse.com>
 <CANT5p=rxp3iQMgxaM_mn3RE3B+zezWr3o8zpkFyWUR27CpeVCA@mail.gmail.com>
In-Reply-To: <CANT5p=rxp3iQMgxaM_mn3RE3B+zezWr3o8zpkFyWUR27CpeVCA@mail.gmail.com>
Date: Wed, 9 Sep 2020 16:34:24 +0530
Message-ID: <CANT5p=qMHxq_L5RpXAixzrQztjMr8-P_aO4aPg5uqfPSLNUiTA@mail.gmail.com>
Subject: Re: [PATCH][SMB3] mount.cifs integration with PAM
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, sribhat.msa@outlook.com,
 samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I did some code reading on samba-winbind (and sssd to some extent),
and here are a few things I noticed.
1. Both today have almost "no-op" handlers for open and close of PAM sessio=
ns.
2. However, the login and logoff do have some functionalities. PAM
setcred is done both on log-on and log-off, so that the cred cache is
deleted on the last logoff.
3. Login and logoff have ref counts associated with a user. But I do
notice that a kinit is done on every login (even if the user is
already logged on).

So it looks like (at least as of today) we don't break much by
authenticating with PAM. One additional change needed would be to
introduce umount.cifs, which deletes PAM credentials for the user.

Alternatively, another option is to not rely on winbind/sssd for
authentication (or maintaining krb5 tgt up-to-date), but instead let
cifs-utils deal with it separately. Today, cifs.upcall has a way to
kinit if the cred cache file is missing. But that needs the keytab
file to be populated with the key for the user in question. We could
also try a kinit based on password in mount.cifs (if the cred cache is
missing), and if that works, populate the keytab file with the key for
this user (for cifs.upcall to use later, when necessary).

Thoughts?

Regards,
Shyam

On Mon, Aug 17, 2020 at 2:42 PM Shyam Prasad N <nspmangalore@gmail.com> wro=
te:
>
> Thanks Aur=C3=A9lien. Good points.
> Let me take a closer look at this and see how to proceed.
>
> Regards,
> Shyam
>
> On Mon, Aug 17, 2020, 14:18 Aur=C3=A9lien Aptel <aaptel@suse.com> wrote:
>>
>> Shyam Prasad N <nspmangalore@gmail.com> writes:
>> > Agreed. But since we're not dealing with krb5cc file directly in
>> > mount.cifs, I don't see it influencing this change. However, I will te=
st it
>> > out too.
>>
>> When reconnecting or accessing DFS links (cross-server symlinks) the
>> client opens a new connection to the target server and has to auth
>> again. Since there are no ways to ask for a password at that moment
>> (we're in the middle of some syscall) cifs.ko does an upcall to
>> cifs.upcall and passes the pid of the process who initiated the
>> syscall. cifs.upcall then reads that proc env (via /proc/<pid>/environ)
>> and looks for KRB5CCNAME, uses it and returns the required data for
>> cifs.ko to proceed with the SMB Session Setup.
>>
>> So it is important to have this env var set if the location of the
>> credential cache is not the default one. If you do PAM login from
>> mount.cifs, the env var might be set for that process but it will only
>> persist in children processes of mount.cifs i.e. most likely none.
>>
>> I still think this patch is a good idea but we should definitely print
>> something to the user that things might fail later on, or give
>> instructions to set the env var in the user shell or something like that=
.
>>
>> > That does make sense. I was thinking of including a mount option to en=
able
>> > this path. But let me explore the retry-on-failure path as well.
>>
>> Mount option sounds good regardless.
>>
>> > Yeah. I didn't get the complete picture on session maintenance after
>> > reading the pam application developer's guide.
>> > Was hoping that somebody on samba-technical would have some idea about=
 this.
>>
>> The keyring docs have some info on it too but it's still not clear to
>> me.
>>
>> https://man7.org/linux/man-pages/man7/session-keyring.7.html
>>
>> Cheers,
>> --
>> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
>> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
>> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg=
, DE
>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)



--=20
-Shyam

