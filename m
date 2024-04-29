Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8CA8B635C
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2024 22:16:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=h6vOmGXp0bW2Rs5TlI84aeVIutzI85dxGVuQRe7OFnc=; b=08b5B6hjySW3RvA8pacvQVVyBW
	qeCAkUxwvTO30iVlqsxdGbvb2lb/KH4g/J0uVGiiXXgqOxdqmtFf9QzDHOVqOOhoirxxw27Eb6BjH
	VbDz8lfrY53d+tWMkln33JeDqIDN+unTnlRiNxcdTHAihA68Wahl8hlxnuHUH6GsOW6XCzW7WU69B
	cbYEInsyy+naeSyDJCA45cjzJ/dRpNhuPd47rGCIx4NIgO0NDB1vX2XlDIf7mF1gRktVX1RJ1BqA2
	9hLlesQMO9U9d00ojoSL80RRIKshLJ9Z6fsi+0YFg0P5d64ZRThxNDKJsnlKNlEvX0wKZ3YtfL8d/
	GZtlFcDg==;
Received: from ip6-localhost ([::1]:58370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s1XQD-0061v6-1d; Mon, 29 Apr 2024 20:16:21 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:59641) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s1XQ7-0061uz-Kp
 for samba-technical@lists.samba.org; Mon, 29 Apr 2024 20:16:18 +0000
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2df9af57b5eso41366591fa.2
 for <samba-technical@lists.samba.org>; Mon, 29 Apr 2024 13:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714421774; x=1715026574; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h6vOmGXp0bW2Rs5TlI84aeVIutzI85dxGVuQRe7OFnc=;
 b=cPuthY02tnlMsBmyCOXzcgBL5rwIQBSFdn5Vfwv+eYn558w3mIPZnSRQDd5x6UA5MX
 si9EL0w/ldXcD6DTYu5AJhg5tOsTIc7hYUuPUJPN+LOkv8hQFaLgEI9DaKOGOrwpmJae
 t7+/p1kxGOVzU+sTORzzANHf8q8426FKFdpSfEyMV2dgmMK3mUXDCCiLAIDWlEbh9PVZ
 NgA3Jid50MZ+nep+LkHFe47/elCPfBHBi7NFFnJUBvRw4KoDzLOo0p/eGVa+pJKdBBVv
 Gq2Kgd9AH3Saayf6zKvSTUDM8wL3cTm4bQ9LMs4Xv9RiK1npGQbFSLjjSCRObjHv0JtI
 0LlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714421774; x=1715026574;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h6vOmGXp0bW2Rs5TlI84aeVIutzI85dxGVuQRe7OFnc=;
 b=uzKeZjk8zwpIGUnKVDIXE37BjYhkA3g6rSEuybWyi8UOCb+Fc3X26zBLGJ9UZBdt6p
 7Mtwy372C0B3r1HLX42bMHHNorslycEVi77wYjP67g/ERaOsSzVn102jjR5BRWrKAHej
 Pi4ZxUx043aMSv3tBDsf4ZNm1Bhp2LuWsqXu3n6M84TQ/ES6vK4LRXlsCfX3tzewi47A
 fuOm/eFZauM1lOmtxyuVfL2DyRBa0UH4OfI+oBC9tSrhWj7SoapD2ksjatgn6Ofkp1SQ
 xo9+6/aKqi6MkDrcYGtDWpYGqvDsuLV0RY2MgZfccOonuTN6vMZId4mR8Q9+EYOFrmM8
 BkXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfxAcVTn1ZCGFidTecMnZU2KV3wvbuJi/AsJiGVpyEzfrgm7SCZ46iXZVTBzVZjQb3v9Oyesbe4Cg8GMEWmK7NPyaFgbae328NGhTrwaTy
X-Gm-Message-State: AOJu0Yw7pohtk0SnRkkousZnDl4GBrI/9YHcvH3H6oHsy7jOgjPh0ZeV
 zQZHxfnCNelGcWguY9GErhttO58/CTrm1EHBVAclEFdLAYne53+OshuyHuBkQvaYReg0ISCFcA4
 5dFt75DlsiZ5eLt7JZ7XKoKXPp6dfQw==
X-Google-Smtp-Source: AGHT+IHi2rKIsmr/2uzfklN8ur/dhS20ps7ru0MTBPfpyf3k0b74pYZVhPiureoEYY5J603Qib2V33B77zv1e4+ukrE=
X-Received: by 2002:a05:651c:a0d:b0:2dd:d3a0:e096 with SMTP id
 k13-20020a05651c0a0d00b002ddd3a0e096mr11212815ljq.31.1714421774094; Mon, 29
 Apr 2024 13:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5muXqpZN1mu=WAhaxXe0yRB7Rib_CaoGo3h15wwcSPZFuw@mail.gmail.com>
 <b40a9f3b-6d2d-4ddc-9ca3-9d8bb21ee0b9@samba.org>
 <Zi/WD7EsxMBilrT0@jeremy-HP-Z840-Workstation>
 <d9f60326-9ddf-485f-81c8-2012b7598484@samba.org>
 <Zi/8DEo+ZiF24LLw@jeremy-HP-Z840-Workstation>
In-Reply-To: <Zi/8DEo+ZiF24LLw@jeremy-HP-Z840-Workstation>
Date: Mon, 29 Apr 2024 15:16:02 -0500
Message-ID: <CAH2r5mu2Qr5W1eUOz-JFyf4X6Wk9X2Jr4XFza4tJmH+mVVZqLw@mail.gmail.com>
Subject: Re: Samba ctime still reported incorrectly
To: Jeremy Allison <jra@samba.org>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Apr 29, 2024 at 2:59=E2=80=AFPM Jeremy Allison <jra@samba.org> wrot=
e:
>
> On Mon, Apr 29, 2024 at 09:27:15PM +0200, Ralph Boehme wrote:
> >On 4/29/24 7:17 PM, Jeremy Allison wrote:
> >>
> >>If you look closely at that commit, you'll see
> >>that it's actually not changing the logic that
> >>previously existed :-).
> >
> >yeah, sure, but it was a decent refactoring so I was wondering whether
> >you'd considered the actual logic you were touching was correct. :)
>
> That wasn't the point of the change I'd guess (although
> it's from 2009, so who can remember :-).
>
> >Hm, so what do we do? MS-FSA seems to indicate NTFS ctime has pretty
> >much the same semantics as POSIX ctime:
> >
> >2.1.1.3 Per File
> >
> >LastChangeTime: The time that identifies when the file metadata or
> >contents were last changed in the FILETIME format specified in
> >[MS-FSCC] section 2.1.1.
> >
> >Let's see how many tests complain:
> >
> ><https://gitlab.com/samba-team/devel/samba/-/pipelines/1272333543>
>
> Yep. This is the right thing to do going forward. Let's
> see what breaks. Remember, 2009 was way before we had
> any good time tests.

Another test to try is xfstest generic/728 (which checks that ctime is
updated on setxattr)
and xfstest generic/236 (checking that ctime is updated when hardlink updat=
ed,
where I originally found this bug)

--=20
Thanks,

Steve

