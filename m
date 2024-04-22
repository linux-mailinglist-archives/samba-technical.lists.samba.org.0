Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E56448ACB30
	for <lists+samba-technical@lfdr.de>; Mon, 22 Apr 2024 12:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UYNpCTnTS3X9kfFJ5QgIm7p6J72YOqo0sdbZniTnsWg=; b=nXk3KVOKyaLICKVyQnnuJqPIIC
	G7ujD7j12j6MeUa2BVtNcuJ9tu6IgByFRY+Xe/o5sO9qf84/IMldN2msG7o+BI9klXEbiHwl7JyAa
	O/z3H7IKeyanKNeFbyc89ap+woYnK7tV0Lv3xpXoKgrUOztqLuv97nzGA/1MDp4WD5NGWlARToDvD
	Qjpybw4N4JYW2+jU7u+CIQILdcFZ7rIgx0VpmMpgBnP2mcWd5dwofPnNoGgEWbJ/LEEQO4b8xzhjT
	dtyYVFkpVa2N7S8tnMiv0KNuSdYfWnrpeLNOyZMItHGsOeGsnfkebBrDXlbrsMIdobonvEKxyHHr9
	mcPZAvGg==;
Received: from ip6-localhost ([::1]:37512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ryrCE-005MSA-N0; Mon, 22 Apr 2024 10:46:50 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53749) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ryrC8-005MS3-Mg
 for samba-technical@lists.samba.org; Mon, 22 Apr 2024 10:46:47 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2a7e19c440dso2897815a91.3
 for <samba-technical@lists.samba.org>; Mon, 22 Apr 2024 03:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713782802; x=1714387602; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l6DS82kso6XytMTsWU6VKpsuPa9U+SK63mlGvuXnXEM=;
 b=BCL9OpwU1IEPv9YPid9DeHI2AyxEFD2qgMctsz/cJOhMQm989puFweVIeW/FOQMwh6
 aLtSYv5yw/8EMgfHqVU0fSMnHlyRvULIquAhQtoqUg3qJpOIsbg1s7XaB/2GkGKC0Qii
 QQRHgeKJ5MneQePsO/bPP7W7oVMxxBt2vhUNtC0r7o7TzL8qYTekXY4egY95GeiLFlNj
 kG3ny9aXpe4UteyOSA0FidkyyQCqzboyvY+9LMaeA1SpIfpgzH5tcL6Li6jxM2oKQngY
 a26SQEIU6vU6YFiZSG+YB6YIsenThTxb+VrAaiXaOs1CykzwdXojtE5WJmTY/F9g+juD
 cRuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713782802; x=1714387602;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l6DS82kso6XytMTsWU6VKpsuPa9U+SK63mlGvuXnXEM=;
 b=hCXq47yeacPZeD2BPRCOFYFa6rs/jacBG9d/bGJrluVlQJjqBVurb6HoRfdnEB+hRO
 3Kk9rO6fbdM7kTF5QkIBGfghV42tIdss8wJNPYE1BCcA9c+0hK/t7PnySD9Tn2y0TAF6
 rsC9ejHZ90lP9a1CCH+HgbzJFrDYIfVlLLV/I+ylJfD0A9sWE9V2BSp0r5Dj3LV6/V6Y
 peMlrhk0Ny7o0tHFY1s/7MAH5e7oMMSh/ZXIDmEoDOsmR5CDmOEniLLkRs8fR425ymKD
 y+ewaUI0+T8V8hVcMVv/RUoGmnoVOtz/mD0WVn5PSxbxvb9N98h1+pMnCBMNB1348vjo
 lvlQ==
X-Gm-Message-State: AOJu0YwwaTR4wwrA6EYBW40wyC9WS6T7dlPuIgUWAmacf89Njs2fygkN
 KSYTTRpiEhHbyiGz2FvXMY6C92Xx47lqjVuAhp8UJ3Pzo/gqV7hxososJv9EAcKz9f8Jr0LYZ9v
 kiHXHIAMMDd6adde/RKtkX3D9DAM94vxq
X-Google-Smtp-Source: AGHT+IHGYuIs7mRfn+I4TF+WvzzG1Zj2tJ0Hqh4CD+a7bYVpMCQhuMib3Uj2hUcbk0o4J/dgY4XV+YBP95twbuoXMuk=
X-Received: by 2002:a17:90a:df82:b0:2ac:360d:b36c with SMTP id
 p2-20020a17090adf8200b002ac360db36cmr7490465pjv.33.1713782802119; Mon, 22 Apr
 2024 03:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
 <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
In-Reply-To: <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
Date: Mon, 22 Apr 2024 12:46:30 +0200
Message-ID: <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>
Subject: Re: Proposal for changes in become root
To: Ralph Boehme <slow@samba.org>
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
From: Xavi Hernandez via samba-technical <samba-technical@lists.samba.org>
Reply-To: Xavi Hernandez <xhernandez@gmail.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Ralph,

On Mon, Apr 22, 2024 at 12:30=E2=80=AFPM Ralph Boehme <slow@samba.org> wrot=
e:

> Hi Xavi
>
> On 4/22/24 11:11, Xavi Hernandez via samba-technical wrote:
> > What do you think ?
> the future plan is to move the impersonation to the VFS by passing an
> abstract impersonation object to all VFS functions and then let the VFS
> modules do the impersonation.
>
> metze and I have designed and implemented 75% of what would be needed her=
e:
>
> <
> https://git.samba.org/?p=3Dslow/samba.git;a=3Dshortlog;h=3Drefs/heads/imp=
ersonation
> >
>
> The top commit has a few notes and TODO.
>
> <
> https://git.samba.org/?p=3Dslow/samba.git;a=3Dblob;f=3DImpersonation_Plan=
.org;h=3Dea6fe04825ec57ba4c0a7e6476255129e3f3133a;hb=3Df4ca9ebfc1269bbe7c33=
19eb991e1d0ea44a08a9
> >
>
> This is probably not what you were asking for, but I'm afraid tunneling
> become_root() through the VFS would further complicate the current logic
> and also doesn't allow avoiding all impersonation changes, eg the logic
> around change_to_user_and_service_by_fsp() and
> become_user_without_service_by_fsp().
>

That's very interesting. I wasn't aware of this work.

I've just started to take a look, but if I understand it correctly, the
user credentials will be set just before doing the system call. I've not
seen any reference to become_root() (I may have missed something, though),
but I guess it needs to integrate with that and, in this case, it won't
issue any syscalls to change the current process owner, right ?

That approach could be very useful for what I really wanted to do. If I see
it correctly, the credentials switch happens in vfs_default, so modules are
free to implement the credentials as they want.

See also the recent problems caused by trying to use capabilities
> instead of become_root(). Adding more logic to this is going to
> massively hurt us in the long run.
>
> Just throwing this out quickly here, we can provide more details and
> help with the design, rebase or answer any questions you may have.
>

I'll take a deeper look into this to understand it better, and come back
with more questions if needed.

Thank you very much !!!

Xavi
