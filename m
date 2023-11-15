Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B357EBCB6
	for <lists+samba-technical@lfdr.de>; Wed, 15 Nov 2023 06:15:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=z7pAMSl3cct7C8E2+QriIekL7CZjl1/WLUi3BGbJJ8g=; b=TEBZdmeHjf3+emoHoNcdp8Y1aQ
	1K661eYI4XpFksMaTJQbQG6knl1tRj5SQeKYZf7KZ+fBhtpH/LzPsF6EsdA+DvByK5E7aCemXPE7n
	sL59mScQfl3Q3f9p8vMgNDHS+Hpe+r42PMbVtScn8k+cDRmfu6p1iMvdUSN+ljAnXeJdnX6BCTVLk
	17ue041dNFuaUX3qh2oTL4NnW2u47nnkeaMbI4p4D2hIZpSfrUG3oLHufQcChxEVx0jElLWSjiXPz
	eUoIue8bCEy4BraFQvqLx0b3Y+9w5qWclHNf0P7CB4BHhb56HdJxCb0gmz+aTw7ClvYsg6u7Xxhso
	pUK5Ugdw==;
Received: from ip6-localhost ([::1]:38096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r38Ej-008OVj-UY; Wed, 15 Nov 2023 05:14:50 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c]:43375) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r38Ee-008OVa-Hb
 for samba-technical@lists.samba.org; Wed, 15 Nov 2023 05:14:47 +0000
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-507c1936fd5so504129e87.1
 for <samba-technical@lists.samba.org>; Tue, 14 Nov 2023 21:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700025283; x=1700630083; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7pAMSl3cct7C8E2+QriIekL7CZjl1/WLUi3BGbJJ8g=;
 b=RXhZrzWZsUF6EfTD6RcUNzsT4iaEYwY5D4Kg3EPa8FnHHVEp7tib4abg4ROdhx8+SM
 3nrdsryun+tR19D9KBoP1O5PwFwMCtDXoHO9wWJxGF7ZZHC9gEKt78rGgfK48FYl3ma7
 RMJD5yvvIobA1mhleC5WExxOjYGGnNp6+EUTTLw05bbps+tKgUerL+fwZ0opQb4rwRPB
 vRRqQWQRaJNSClVChoKWQlPDlIZJ6K6mPZ2y+dgI+qoW0WTkyrm63x9v6V63Sowe13wK
 n6obx9isTX+x9KchWPSKHIgyy2GgpJAXd97DritesXrOO18Vsl2Wq/kynePkP7kbdLFp
 KD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700025283; x=1700630083;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z7pAMSl3cct7C8E2+QriIekL7CZjl1/WLUi3BGbJJ8g=;
 b=iJMaeXPQsXzy8ZyA8p+B0OAhoyWRNuYDFEXoDlE7dphVpZf5xgfh633k+QNGCEXlcj
 xZn8EbOk/tH3OFsdw+P6HgrfmNsTWmwLOD9LTzrOTenMRfEWCROnZgZApCiMV7E8RTub
 lH1/YfCPriiDFXAg1vH+VYC/mNv69YYlsGaemi6yh1fVWFAP/9fieJHZwEryag669Tyz
 9UqVn2mgotVQk8E1vqfn3Ybkhl5NA4u546deD8SExMJZyByp8NiVhqymGixV5cBEwDad
 n/vEo2sn/vvFFZIz+/aGVif0kTQEFqo1B4fydY511Z9itCg+rsFgmUeTHPzGIwh3kRFG
 f8IQ==
X-Gm-Message-State: AOJu0YyoFlRMnlb86hrTFjEbgLiVH2fjPexjgoojXcoIPffL4RDlZZbN
 tCI6FaL9YrKkG/3qko0C9AOi4bUPFSWn7V+NT2xI6zsK
X-Google-Smtp-Source: AGHT+IF6q7971As6IKQTvx08M7jnFd56EJNZYVYvrOan4yAdQupWQO2FLRe86WZCqv2LjQeagu57Qxd4uCOV8VdCJv0=
X-Received: by 2002:a19:f704:0:b0:509:489f:5b6f with SMTP id
 z4-20020a19f704000000b00509489f5b6fmr1531857lfe.11.1700025282653; Tue, 14 Nov
 2023 21:14:42 -0800 (PST)
MIME-Version: 1.0
References: <e916bdea-4197-4372-a15b-cea41c8ebe03@samba.org>
 <ZVJh3X9GQ5L9mLS0@jeremy-HP-Z840-Workstation>
 <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
In-Reply-To: <e6bd562a-296c-44f2-8164-8a90d98fa6e2@samba.org>
Date: Tue, 14 Nov 2023 23:14:30 -0600
Message-ID: <CAH2r5mvqcwUfGD2c0e+oR=2V-dGroJK0_GKvoEzAc1tpNFRXcw@mail.gmail.com>
Subject: Re: [SMB3POSIX] File attributes
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
Cc: Tom Talpey <tom@talpey.com>, Volker Lendecke <vl@samba.org>,
 Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

interesting question - worth looking into.

This reminded me that one POSIX feature that is problematic running to
Samba server is that Samba (unlike other servers not just Windows)
doesn't update ctime on hardlinks and doesn't update ctime on set or
remove xattr (it looks like Samba server is returning the ctime from
mtime not the ctime from the ctime)

On Tue, Nov 14, 2023 at 3:15=E2=80=AFAM Ralph Boehme <slow@samba.org> wrote=
:
>
> On 11/13/23 18:50, Jeremy Allison wrote:
> > On Mon, Nov 13, 2023 at 12:28:18PM +0100, Ralph Boehme wrote:
> >> We had support for file atttributes in the CIFS UNIX extensions, this
> >> is currently not in the spec (or code) for SMB3 POSIX.
> >>
> >> Is this intentional? What is the reason?
> >
> > Do you mean the attributes listed by:
> >
> > man chattr.
>
> yes.
>
> > chattr - change file attributes on a Linux file system
> >
> > This was at the insitence of Steve as I recall.
>
> adding Steve to the loop.
>
> > We never implemented this.
> >
> > Might be done via a tunnelling ioctl ? Other thoughts ?
>
> well, it's a rabbit hole of its own and still seem to be rarely used on
> Linux and the BSDs. It's not POSIX anyway so just declare it out of
> scope for now?
>
> The Linux interface is via ioctls so doing it over the wire via SMB2
> IOCTLs looks like a good way forward allowing us to ignore this for now
> and possibly add it later if there's demand and resources to implement it=
.
>
> -slow



--=20
Thanks,

Steve

