Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4885890AA1F
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jun 2024 11:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PC7aAeX2ycYP1h1lxbHcdAVFb6u+6Kh+YhwR5x6zPUk=; b=DC6ud6JHUQF6VPgfQ8zIyQN5Hs
	0R/8sDShrLUYRBtf/ftJIQ6erh26ASf4OXZKDbMBuGexbsjiYp3L6M5HRbRImavWVjHaM/N2eH89Q
	gbkRI0dz0vp9Rz1Ai8yqAeqlM7HX50PCd2E22hcGKOOEeKnRqs+1WI+0vLQpVVbIqDe94sjqZGyb7
	UCc7R3BkolvMkpJn4UJ3kgtwHRJc0VniIkdXDNGLh1L0AKw70GWckfHM8m/pYBYFF0J2sJEfxhbGJ
	q09pYoLtM/HjjOkPrMoQzNRnLA0wd0w4k34rjUy/a44Y10tiVrgadB+QLUHZDQBPR/Op23K2sT14l
	EBmaoQHg==;
Received: from ip6-localhost ([::1]:56052 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sJ8xE-00E74H-7k; Mon, 17 Jun 2024 09:47:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:52227) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sJ8x9-00E749-EB
 for samba-technical@lists.samba.org; Mon, 17 Jun 2024 09:47:09 +0000
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1f6fabe9da3so34677045ad.0
 for <samba-technical@lists.samba.org>; Mon, 17 Jun 2024 02:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718617625; x=1719222425; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gtIrhYLEaaZk9YWJfpNwpauV16tUayKy6qweSIuM3rA=;
 b=KLG+EvGisBmN0n00WkboL3U7j9pNcg2cNSq1QAmzLZn4PoKgQSMNO+jEOjWtdlSF1a
 QbkqmT8ZDkso6Yyc2FbxoXG5f2O8Wat5shGOT6iwArDchokUOD5ZIGyiiavs7nId44Pz
 gwWe27+BLIY3MOp5kbJFncPeBYY3fkWBOboDcdFLIbxqGsDshmLlhFUTG866OvGIf7A7
 cSN5m481JPW5B1ikwFSYL70sZrL8wWIAtV9kmBYIhPNVka8nZycqLMMLmc+TXeRFyWC8
 nR1voM7WgqpGiKqsGSlMZPzceLI0+E8O5d2wnJa1gHIfRpOhwQGYRqsKGlSC6o+pLbff
 po8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718617625; x=1719222425;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gtIrhYLEaaZk9YWJfpNwpauV16tUayKy6qweSIuM3rA=;
 b=lfvM6zH3zLwHkFBen0/ccc2Wdt5d45ekWeiLVDdAxQqq4uPzISNSghCHPUQrvIu7gR
 B1ASH82gKXN5/gmpzdAaJK3OfwSZyoAU1Vn3LAFLVYcHfkl84vSj7Z0iclfmzGXKVZsx
 /q7OuX7+57Y0zcILb3HD7oIQkVdNJgEOXc2eFwrWPaD6C2EgcXRbHyUE/PQc6Qi5Ce1r
 r1swHSA2rtHQUdjAJXJw+YzmfBpdmtdrVDEtcuwzsOrinMK2s12+MMxMxq8rvquOpSCA
 538ydqSyRwxGSxanDyqWUEG/kQzT6Wyino5vYFTloTROvfLWAVlF8fXF3HptHbhnnabn
 JPmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/Ab19bEuIyUxjKohrdDAvAuQTZyM2B0+B+qNo/0I6OuX0Mbpsgv+/R3e6v+BYotE1x10VJ3BBWQSuY3byawDTN5EB5GmD/h9RIxrbu+bd
X-Gm-Message-State: AOJu0YwPasEoLTInmQVO33zHAjyiq+plwm6wKoonMNQu3Ie0YZj2TR12
 KN+Zxu0K5+ba7iB6R4xTYEKMKjakAVzObvrvY0xRT3qz6Tz2IUF+kq94P/LTUCT9PKdi+jGlanG
 MzIHgPf+W2kbi1uhGP4O7RnNwpadZnw==
X-Google-Smtp-Source: AGHT+IH9k1SD7s0Kx6y9kn8jeKfj88TcKzUliIsF/i0pBAbUx9EhtHG+aE/MNFlPtOSRGV21ycbpD94qgN25BZOU8dQ=
X-Received: by 2002:a17:902:f611:b0:1f6:e003:1c62 with SMTP id
 d9443c01a7336-1f862a0926dmr97907665ad.60.1718617624636; Mon, 17 Jun 2024
 02:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <d5a2f19e8e319d29cbae169da4c0d33b7edf3a9e.camel@redhat.com>
 <6e9a8ade-8357-4c35-8d1b-c0749503011d@samba.org>
In-Reply-To: <6e9a8ade-8357-4c35-8d1b-c0749503011d@samba.org>
Date: Mon, 17 Jun 2024 11:46:52 +0200
Message-ID: <CAO9H7P876Qx8wEN_kfYQKUW7XqMWevfqx7A0kAbf_1UJkmu=zw@mail.gmail.com>
Subject: Re: smb2.session.reauth4: UID/GID to use as anonymous user when
 modifying DACL
To: Stefan Metzmacher <metze@samba.org>
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

Hi Stefan,

On Sun, Jun 16, 2024 at 9:21=E2=80=AFAM Stefan Metzmacher via samba-technic=
al <
samba-technical@lists.samba.org> wrote:

> Hi Sachin,
>
> > At the same time, I can also see that getuid()/getgid() returns 0/0 and
> > geteuid()/getegid() also returns 0/0. Does the default plugin use
> > uid/gid 0/0 while performing this operation?
> >
> > I have the following questions
> > 1) What are we testing for with this smbtorture test?
> > 2) Is the anonymous user allowed to modify the DACL of the file as done
> > in the test? This would obviously lead to access denied errors as we
> > see currently.
>
> It checks the reauthentication has no effect on open file handles
> only on new file handles. After the SMB2 Create only fsp->access_mask
> matters for access checking.
>
> > 3) What uid/gid should be set when performing this action as the
> > anonymous user?
>
> Maybe you need to remember the low level token at open time
> and use that.
>

I'm not sure if this will work in all cases. When the acl_xattr vfs module
is used, the Windows ACLs are stored in "security.NTACL". To correctly set
this xattr, the process needs to become root on a kernel mounted filesystem
because the kernel doesn't allow a regular user to modify that xattr, even
if the user has permissions to modify the file.

If a share uses a vfs module instead of a kernel mount to export the
filesystem, and that filesystem also requires root privileges to modify the
"security" namespace, then using the cached permissions at the time of
opening the file won't be enough.

I think that the unix token should be kept consistent with the effective
owner of the process at all times to avoid this problem or similar ones.

Xavi
