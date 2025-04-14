Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EAAA88C07
	for <lists+samba-technical@lfdr.de>; Mon, 14 Apr 2025 21:16:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wTy0hufwaKzH8e6rbLpI8eQ1C2L9E/6pu+YXhbo4w6I=; b=x9hj29SOgZLwVgwGyqQ42KWfcG
	DnI5eZNLYXdCgWRjDLp+/H3GQz/M/04hWgR91E7tMaYx1O+bPQO+VMubGqyPlzQL1c7fiILc++Znn
	k6dq5ycNjNAVm8u4ytX8rlgskf7LQ3ZlSUBkqUfB9nuQZPFK3J4s0MhYEI22XpJ69EaDsepDwYzLg
	Y56FtYxiUvO7GQT1Cgb4KzepCyBah19h8Nf6WTiwMiamroVelR/Mpoz0318S6I4JDQrKWdoGp7dyG
	OfODAOeZDW3XQZzxVyTG+LO5nMnOSYq25u6RuBpiS7UNoeAlf9ZFQJzkTQ6QtYKYCoeVesuZ+yRGa
	aOPyJHrw==;
Received: from ip6-localhost ([::1]:30708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1u4PIJ-002Ot5-T5; Mon, 14 Apr 2025 19:16:35 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:53312) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1u4PID-002Osx-B0
 for samba-technical@lists.samba.org; Mon, 14 Apr 2025 19:16:32 +0000
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54996d30bfbso4201615e87.2
 for <samba-technical@lists.samba.org>; Mon, 14 Apr 2025 12:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744658175; x=1745262975; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wTy0hufwaKzH8e6rbLpI8eQ1C2L9E/6pu+YXhbo4w6I=;
 b=UNBScwr+oQ6VvbJ4x/lSpJ7cNr/ZQZmbqtPp7/nVcKUVFi53UL+x6W13O/AF7fpFD+
 BgZX5zEDTC34n/BmrTBURNiKIINOjAxq+WqmaddUXkCK/UKGBeHqxu85GV1GCfMeaqad
 91UmFMIU3cUUp1UPVKGtR8xjMdrGXZFcA+1GmlTpvS3gszyE1aENsbztszV6ic8PPdEX
 qSB4L0m1ZRcDWoE2KU0vrTmyApm9vk7rubfR+5A+PZPRXU9rGlTvZLQCaCMVVm4/eSz1
 7jx0jz//7AjmhP4BkgEsUCzERX3hADXVUfWFAF8pVUiV4WQyglUrCG+glVTlXNetkPaN
 qq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744658175; x=1745262975;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wTy0hufwaKzH8e6rbLpI8eQ1C2L9E/6pu+YXhbo4w6I=;
 b=wecOotx7yGLIY3dhdW+v2kU7gA3PcP81vxFdWh3VgohvBPjyxWAOrL39L0hZ4jDw28
 KywCNAf74QHb88gAbGUSX/KKzh0rh8Sty7FEzFXF9X3hVocZ8l/48lwxchES0jJV2FHg
 kRGLu2xOwgDUZ8UBRSkTdDe3kMhXxh0AogSQ772KTMwgqYl6WJif45+RJowBCgli0NTJ
 TNbXGASDdTZfh41GDiSkc8AC4UwjXFM6kbawZKccStT8L3a2/5vcKiclQffxMLvQIEBB
 Xtdfd/GngoI6nrImpwVMRG1RVGWqr2W2qgwQlDu6p4hAfZGQxeKWD7S17cJEIT5cmF11
 L4Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0JBhLqqcpzKGpVVKfSGBRO7NJII1caOI5bg8kUU4lLSsLMopSX97AGTGNpaeGp73VopudPphGtRzfiRLQxkU=@lists.samba.org
X-Gm-Message-State: AOJu0Yy4BFx5UxDH0yKsqsTeDrLg1Szx02kF9ZUO5Rgv64Ae/XSXqHGn
 vwpGllxurY9q4b4L2p/wWMhUFNZRaKfkjp2IQp1r6G7ff2YqRwW0nfhHv41gvLCCEiHtA2cucn8
 6gpyOh601G/1X/Th9Oo83WUD3OqSsmg==
X-Gm-Gg: ASbGncsex1uikUgb8qupweaxNWLxZEm3gzbC0xhQZhomrlxNcQf8aNKF8ioVysQzNas
 tn1ZC/+4oK5kSRbj01LfghK1OJWUVifPaPjCLR5xXTgp/ZfuO+NSdYZtnweWaUehJgjlo8H1Pex
 Ky4Geb7fJPGYyIfrPlbkDTZQRJSbUbfKEHA7jkp8RN5A7n0A0NeeTSMa5ikuW1WhfX6Q==
X-Google-Smtp-Source: AGHT+IFjEWDG1eENnZoy+8gcW96gdUQ7ayMhUYTIjxD8Kde43Cp9n2w5iQJB+LKOKNn9bSjxIAyRlchVZO2LFyoucCk=
X-Received: by 2002:a05:6512:308d:b0:549:4e88:2e6a with SMTP id
 2adb3069b0e04-54d4528bae9mr3195487e87.6.1744658175096; Mon, 14 Apr 2025
 12:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <32f7a0c2-32cd-4ccd-b471-7cba98cc30f3@samba.org>
 <bfe46e3d-5c7c-42ec-987d-d70b4f513e85@samba.org>
In-Reply-To: <bfe46e3d-5c7c-42ec-987d-d70b4f513e85@samba.org>
Date: Mon, 14 Apr 2025 14:16:03 -0500
X-Gm-Features: ATxdqUHLvw5QfwYJbQUy5KoEoX5aswH1BLVBqTNzBFdyVXs6uKZosRyPhAXZc3g
Message-ID: <CAH2r5mu+sYcx6rtoq=P_b+0_rSoRsoUCrUrfaAjfOFvswuGtqQ@mail.gmail.com>
Subject: Re: SMB3 POSIX and deleting files with FILE_ATTRIBUTE_READONLY
To: Ralph Boehme <slow@samba.org>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>, Stefan Metzmacher <metze@samba.org>,
 Steven French <Steven.French@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>, Tom Talpey <tom@talpey.com>,
 "vl@samba.org" <vl@samba.org>, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Looks fine to me

On Mon, Apr 14, 2025 at 2:03=E2=80=AFPM Ralph Boehme <slow@samba.org> wrote=
:
>
> As discussed at SambaXP, what about this?
>
> https://gitlab.com/samba-team/smb3-posix-spec/-/merge_requests/6/diffs
>
> On 4/9/25 8:18 PM, Ralph Boehme via samba-technical wrote:
> > Hi folks,
> >
> > what should be the behavior with SMB3 POSIX when a POSIX client tries t=
o
> > delete a file that has FILE_ATTRIBUTE_READONLY set?
> >
> > The major question that we must answer is, if this we would want to
> > allow for POSIX clients to ignore this in some way: either completely
> > ignore it on POSIX handles or first check if the handle has requested
> > and been granted WRITE_ATTRIBUTES access.
> >
> > Checking WRITE_ATTRIBUTES first means we would correctly honor
> > permissions and the client could have removed FILE_ATTRIBUTE_READONLY
> > anyway to then remove the file.
> >
> > Windows has some new bits FILE_DISPOSITION_IGNORE_READONLY_ATTRIBUTE to
> > handle this locally (!) and it seems to be doing it without checking
> > WRITE_ATTRIBUTES on the server.
> >
> > <https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-
> > fscc/2e860264-018a-47b3-8555-565a13b35a45>
> >
> > Thoughts?
> >
> > Thanks!
> > -slow
>


--=20
Thanks,

Steve

