Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5513F8ADFF2
	for <lists+samba-technical@lfdr.de>; Tue, 23 Apr 2024 10:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=P4G81CuPLz7P1byIk7mhuDAFgbBMfF6jYe9fhFiyHhs=; b=N6aVfx0n8LdP06oiPHekY+NINJ
	Nca9OpLcvIq77Co+pQ61bKJ7uYcqCS5e1BOeGwpU+Up8u1yWvpj2kVzcT5NDQTXxPD9dHeuoVjUOv
	+rSFvrpZ3gfGW9dWfLyD7lcnlvvtrOXyEqGpwOzn4fSvca/9qaJAQJmaJSV8i60kqhuQJGmAC1jow
	eXVRcjjqfESzfzC7uwircE/9Yj0XHqWP3qRgQb9JhRVqhEC169E5Fu7X1HcXstWfnOAxOIFzxmQQc
	BnDmNTFD/3FlCCvJlaXsD2RcxPr7L/HBVhM47N492YjNDGuRdiEXN9kT1HHmGbXx42Glq6Rg6yRUI
	1pQcaTDw==;
Received: from ip6-localhost ([::1]:43414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rzBhV-005Q5k-Qn; Tue, 23 Apr 2024 08:40:29 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:48632) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rzBhO-005Q5c-Gy
 for samba-technical@lists.samba.org; Tue, 23 Apr 2024 08:40:27 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2ab1ddfded1so4439470a91.1
 for <samba-technical@lists.samba.org>; Tue, 23 Apr 2024 01:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713861608; x=1714466408; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=41wUQIwA5eWZ4purMjM98jTIwVO1N6qMGt14I1c9VRc=;
 b=JBwHeuLWIvVVkqghvDxq3MOWHxiKjBq82VrlsH9eRY964LBUCElJSTlA0aivSiCyHu
 kT3LMZQpIDJ8WP1WzeI7eSS6P4XfWw0ljrjgm523+6k0Axw1O0TitWUQz6anVa1gjFOa
 KXqwxsj0odCLm75gaw7P+TvGaCoj8GXIBaVW4ilgCr6gJZQW7MGKlWO5ZxHfenGWllkq
 2oLWE2esfBKksFLSfB1ejz+af1UIPoCSCr1B70k/zrAEmK6XlQ0YGiyjMHLflci9gC4Z
 imCXATwQBPJ1wt3/IfLgcUN8JA5bn+ReDg6302e0dz3anAQM48AGGhq68jJc/q+JiFr+
 ZX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713861608; x=1714466408;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=41wUQIwA5eWZ4purMjM98jTIwVO1N6qMGt14I1c9VRc=;
 b=c0jQNHuGNJAvCw4Lqh82RhsMgXd7nOOtOuWOVpW0Dy5JvqBZFvD1qcQ1MobK1MLOx4
 3n28tCU4wkv4Xg0u5oqzEQUtYHzvou/aQkteFPJkMuXYWj34XbX/mEJyoXWHwjnSYsIo
 yjmqOfsJjFDdf7yB8Ip61bOk3YJem/2Db1+PtofF7jpIG7hs5n7cS5i5aJh7WOc5wCx1
 9ZzlKQtsyB0VnF2uqzD9UKhEou9jgIZaQBeqAknqvdQzjZTwbTDq92o95UU8TLb5HGhV
 ZhuWrEMLqz60cMqR8tipdvE2eJFS0tLIekOR/O/9n5RcXRsIi2V/unroWUpCr5yFNDFv
 /z9g==
X-Gm-Message-State: AOJu0YxgjQZLvnlwa2nS+ExFYoVFsdaUJsYJqnIpJ/jxq5VG3GEVlDHe
 LhqiGmS7jrEc17qcP0NRJATu92XfBRDmMpoUlM3pCC3G6oCsVR6P1PekSoOjVL6kyl4GUgAudMM
 SuUXQsizba9eqjXNtfYtsQwzSXUE=
X-Google-Smtp-Source: AGHT+IH0xQbHF2YaJgllta280zHKUyYWDDbDmlBJRUjltKMT0YItiIZwvnbMtuKX/3QsIZKtYDxl7xuZpPajv1ld/SQ=
X-Received: by 2002:a17:90b:1c81:b0:2ad:5b69:3ba4 with SMTP id
 oo1-20020a17090b1c8100b002ad5b693ba4mr6603526pjb.22.1713861607718; Tue, 23
 Apr 2024 01:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
 <8e5edd50-f29a-4bed-9878-2b1b293ff2e8@catalyst.net.nz>
 <CAO9H7P-7XyuptwYrftk1Sm+uiYWN0h+K1kGTKFBk5YdQqK2XDA@mail.gmail.com>
 <2c0bcd14-b0eb-4226-97d0-f141b6c20e4f@catalyst.net.nz>
In-Reply-To: <2c0bcd14-b0eb-4226-97d0-f141b6c20e4f@catalyst.net.nz>
Date: Tue, 23 Apr 2024 10:39:55 +0200
Message-ID: <CAO9H7P8-EyJWwGyYpehrcgkAaZ7j1KA=_bF9JYFMHyRmRuDypA@mail.gmail.com>
Subject: Re: Doubts about Samba's unicode translation tables
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
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
Cc: Stefan Metzmacher <metze@samba.org>, gd@samba.org,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Douglas,

On Tue, Apr 23, 2024 at 3:56=E2=80=AFAM Douglas Bagnall <
douglas.bagnall@catalyst.net.nz> wrote:

> On 22/04/24 21:01, Xavi Hernandez wrote:
>
> > I think we are dealing with two different things here. On one side we
> have
> > locale-based case-insensitive comparisons. This is the most common
> situation for
> > applications where they need to be able to compare two strings based on
> the
> > specific rules for the user location, so that the result of the
> comparison
> > yields what the user would expect. The same exact strings for another
> user in
> > another location (with another locale) may have different rules for
> comparison
> > and return a different result.
> >
> > On the other side we have case-insensitive NTFS file accesses. In this
> case the
> > rules need to be a bit different. I see 2 major things to consider:
> >
> > 1. The comparison cannot be locale-related
> >
> > When a file is saved to the filesystem, it cannot depend on the locale
> of the
> > user (or even the server) whether a file name is "equivalent" to anothe=
r
> or not,
> > because changing the locale can cause the appearance of duplicated file=
s
> in a
> > directory.
> >
> > 2. Only comparison for equality is required
> >
> > To find a file by name in a directory we just need to compare
> case-insentitively
> > for equality (normally a hash is used to find the bucket where the file
> resides
> > and then a case-insensitive comparison for equality is enough). We don'=
t
> care
> > about the relative order of the existing name and the name we are
> looking for.
> > Another very different thing is, after having listed all directory
> entries, to
> > sort them by name to show them to the user. This later comparison
> depends on the
> > locale and is made on the client side.
> >
> > I think that NTFS implements the $UpCase table just for this purpose:
> It's
> > locale-independent and it's used just for equality, and this is
> independent of
> > the generic NLS-aware functions that Windows provides.
> >
> >  From what I understand (though I may be wrong), it seems like Samba is
> using a
> > mix of both things: it uses fixed tables to convert the string case,
> which is
> > locale-independent, but then it does relative comparisons (i.e.
> greater/less
> > than, instead of just equality). I don't know how NTFS works exactly,
> and most
> > of the information I've found is quite old, so maybe I'm completely
> wrong here,
> > but I think it makes sense to do case-insensitive comparisons for a
> filesystem
> > in the way I've explained, and it would also explain why NTFS still has
> the
> > $UpCase file.
> >
> > Does this make any sense ?
>
> Yes. A sorting compare will give you equality (in a given locale), but it
> won't
> give you a canonical version for hashing.
>
> In Samba we may conflate things because we are not just a remote NTFS, we
> are
> also Active Directory and RPCs.
>

Yes. I understand that some string comparisons need to return relative
order, but I'm wondering if we shouldn't use a specific and more simple
comparison function just for file names.


> I am curious whether "Windows 8 Upper Case Mapping Table.txt" from
>
> >>     On https://www.microsoft.com/en-us/download/details.aspx?id=3D1092=
1
>
> matches the $UpCase table you find, and whether that means we just have a=
n
> old
> one from win2k days. I don't see a change in Linux's fs/ntfs/upcase.c
> though, so
> I suspect not.
>

I've done a bit more research. Actually, the kernel ntfs driver doesn't
generate the upcase table, it just loads it from the $UpCase file in the
NTFS filesystem and uses it for filename comparisons. The comparison
function uses the table to convert both strings to uppercase (maybe not
strictly uppercase, but a canonical value) and compares it. Nothing else.

I've looked at the code that creates NTFS filesystems (mkfs.ntfs in
ntfsprogs package) and I've seen that it supports 3 different upcase tables
for 3 different Windows versions. I've extracted all 3 tables from
ntfsprogs (winxp, vista, win7), the table from the "Windows 8 Upper Case
Mapping Table.txt" file (win8), the table from Samba code (samba), and the
table from a Windows 11 machine (win11).

What I've seen is that win7, win8 and win11 are identical, vista is
different from all the others, and winxp and samba are equal.

The ntfsprogs package also has code to generate a lowcase table. I
generated the lowcase table for winxp and compared it to the lowcase_table
from Samba. They are equal.

So it seems that Samba is using Windows XP tables.

Some questions:

Should we update the table to the latest Win8 ?
Should we support different tables and make it configurable ?
Should we dynamically load the table from the shared filesystem itself
(similar to accessing an existing NTFS) ?

Should we differentiate regular case-insensitive comparison from filename
comparison ?

Thanks,

Xavi
