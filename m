Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A748AC840
	for <lists+samba-technical@lfdr.de>; Mon, 22 Apr 2024 11:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=K6ZYJnM52Y/SjgnocrXxcXei2ReHIgpTeZJFFOAop8w=; b=Fj4gbjsTBCugA95W64y2m975un
	lgo/9NooUxCbP+vtAcOMbqVhxtieS3QdddLMlNIwk1pLvKuFxe35bUxhR7rIcKHC+NYiWj1+cb6j7
	thpaiNr2K/jkZhpf+qSZaJv63TLzh6P4oLY8SKqB/bNVZ2BlJNNhqtQbOI7CkPTtzAQzeIrh3cU78
	KrG1FqHi7lAgsjycRc8uBZojN0beInqD4a01IbGIm5V/KoVDpWRqql33MWyeUXwpzp3D95maHBwyz
	KdqrDxGfYwCb6rrYdap1vjKEzFM+IgNCkMxA1P7J+WYm3COcERCnaMapTs31fYyaSnKGNz5rUsXjQ
	+JFJkPhw==;
Received: from ip6-localhost ([::1]:49254 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rypYx-005M2z-SN; Mon, 22 Apr 2024 09:02:11 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:60911) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rypYp-005M2s-L4
 for samba-technical@lists.samba.org; Mon, 22 Apr 2024 09:02:08 +0000
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6ed32341906so3971757b3a.1
 for <samba-technical@lists.samba.org>; Mon, 22 Apr 2024 02:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713776513; x=1714381313; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MiF5cYXcs2XczhhlVTBaIW2G750tVhccIIGQbzm9pA4=;
 b=OTawrJMBfIeYmDeWGju0ZFWXUZ5yIf7VxRGEP+bUcwLVqQ8aC/vcWelpp3X+9ZY4BA
 j18GMdYrBLfZalZd3JIVeVeZkCFnhL6pwlyYep0mznYdIqQzgguzK/Oro8gGqBKIdjYv
 f/uOwFqOSnvf2FS5JAU32FVrEsYO8WM5AkQ2P0OHlvTPrH/86ORu6NhOlLQ06g29fpzo
 amC3HbuRE2URkB9fIravXX5BaJYxa4cgmxIvYY4EbArW/tI8dUG6/HnjowLFcygapM+J
 sc9JvAyaFHJWrsfBtlw0qMMj7hsBEKhjAyVioYPBNvLpj6zD17lQfOUBZGFsYsnkTmDP
 t71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713776513; x=1714381313;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MiF5cYXcs2XczhhlVTBaIW2G750tVhccIIGQbzm9pA4=;
 b=vyuJw43a+/auPkm249qU7uJM9C10mcLZDRni77Je4A/vDiqwait1N+xKQ8D71CenMb
 wI7SxRx4gnIYbRQQwvMH8lHU6g6F2hud0jQ4xEjGQkpxS2LM7Q3XySn4597Jmak7oxeR
 v7et6y5aAoDHqubwxx/FOPKKgftOmSmtufEfIeRdKi90/V+hTLnmB/sT6k3A3FbVeglG
 S4Zz9Gs6Pl9GEQ2RBrxgIAg4Rk+br/CwCHPtf3gARXy5At9KUHxbMJ5VwrzjQp2KZFWX
 OfR1aNjbr7AO7qhjPLgvSoMtzFTuRD5gZN+b0J2YaxlozEU42RJGfHzzf7ZefCk98yz5
 gkMw==
X-Gm-Message-State: AOJu0YzHeIQcH8etQc8wQfeGnHG4gH8uUn8IX327AY/MLE61hTZelDlr
 2YRaFkY3i5OQgIn8FTT1mQrt4sadzr8S6ykGnE2gR6gQKLFec/l9hPkUEPz/Fq1G+ihQH6JCND8
 o39nbgH3HX2gxqC8ZEqwfTFjqkZvUu8kd
X-Google-Smtp-Source: AGHT+IGCGuv0+r7yBUGLXQ23gZxHqVGxq6MojDr8erPfLQgc2CByhxQsTmUZLR95v0Sd6Civ/pPPbSvUWZu1X0RtUx8=
X-Received: by 2002:a05:6a20:6f0e:b0:1ad:1cae:a0b3 with SMTP id
 gt14-20020a056a206f0e00b001ad1caea0b3mr2992744pzb.12.1713776512649; Mon, 22
 Apr 2024 02:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9H7P_SpZ0fGDvTc_2XDLRiR1rSdy-2ztBv07h1ECmj_mnoHw@mail.gmail.com>
 <8e5edd50-f29a-4bed-9878-2b1b293ff2e8@catalyst.net.nz>
In-Reply-To: <8e5edd50-f29a-4bed-9878-2b1b293ff2e8@catalyst.net.nz>
Date: Mon, 22 Apr 2024 11:01:41 +0200
Message-ID: <CAO9H7P-7XyuptwYrftk1Sm+uiYWN0h+K1kGTKFBk5YdQqK2XDA@mail.gmail.com>
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

On Mon, Apr 22, 2024 at 7:26=E2=80=AFAM Douglas Bagnall <
douglas.bagnall@catalyst.net.nz> wrote:

> On 19/04/24 21:04, Xavi Hernandez via samba-technical wrote:
> > The first question is why Samba uses two tables while Windows only
> requires
> > one ?
> > For what purpose is the lowercase translation table in Samba used ?
> > Is the Samba's case-insensitive comparison method actually equal to
> Windows
> > ?
>
> I don't have real answers, but I think the current mappings date back to
> this 2001 commit:
>
>
> https://gitlab.com/samba-team/samba/-/commit/9bcd133e9e7b0cfe974f273fb234=
09d660af8358
>
> The Windows sorting weight tables change often.
> On https://www.microsoft.com/en-us/download/details.aspx?id=3D10921 we se=
e:
>
>    Windows Vista Sorting Weight Table.txt
>    Windows 8 and Windows Server 2012 Sorting Weight Table.txt
>    Windows Server 2008 Sorting Weight Table.txt
>    Windows 7 and Windows server 2008 R2 Sorting Weight Table.txt
>    Windows 8 Upper Case Mapping Table.txt
>    Windows NT 4.0 through Windows Server 2003 Sorting Weight Table.txt
>    Windows 10 Sorting Weight Table.txt
>
> That is not exactly the same thing as case mapping (apart perhaps from
> the one called "Windows 8 Upper Case Mapping Table"). It seems likely tha=
t
> a lot of the changes are for new Unicode characters beyond the 16 bit
> plane.
>
> "Windows 8 Upper Case Mapping Table.txt" has at least some of the changes
> in
> your differences.txt.
>
> This Gitlab thread is related:
>
>
> https://gitlab.com/samba-team/sam.txtba/-/merge_requests/3258#note_157634=
1163
> <https://gitlab.com/samba-team/samba/-/merge_requests/3258#note_157634116=
3>
>
> I have never got to the bottom of why we do what we do and how it differs
> from Windows, but I suspect the answer is it works well enough most of
> the time. That's worrying, but not enough to make it a priority.
>

Thanks for taking a look and for the valuable links.

I think we are dealing with two different things here. On one side we have
locale-based case-insensitive comparisons. This is the most common
situation for applications where they need to be able to compare two
strings based on the specific rules for the user location, so that the
result of the comparison yields what the user would expect. The same exact
strings for another user in another location (with another locale) may have
different rules for comparison and return a different result.

On the other side we have case-insensitive NTFS file accesses. In this case
the rules need to be a bit different. I see 2 major things to consider:

1. The comparison cannot be locale-related

When a file is saved to the filesystem, it cannot depend on the locale of
the user (or even the server) whether a file name is "equivalent" to
another or not, because changing the locale can cause the appearance of
duplicated files in a directory.

2. Only comparison for equality is required

To find a file by name in a directory we just need to compare
case-insentitively for equality (normally a hash is used to find the bucket
where the file resides and then a case-insensitive comparison for equality
is enough). We don't care about the relative order of the existing name and
the name we are looking for. Another very different thing is, after having
listed all directory entries, to sort them by name to show them to the
user. This later comparison depends on the locale and is made on the client
side.

I think that NTFS implements the $UpCase table just for this purpose: It's
locale-independent and it's used just for equality, and this is independent
of the generic NLS-aware functions that Windows provides.

From what I understand (though I may be wrong), it seems like Samba is
using a mix of both things: it uses fixed tables to convert the string
case, which is locale-independent, but then it does relative comparisons
(i.e. greater/less than, instead of just equality). I don't know how NTFS
works exactly, and most of the information I've found is quite old, so
maybe I'm completely wrong here, but I think it makes sense to do
case-insensitive comparisons for a filesystem in the way I've explained,
and it would also explain why NTFS still has the $UpCase file.

Does this make any sense ?

Best regards,

Xavi
