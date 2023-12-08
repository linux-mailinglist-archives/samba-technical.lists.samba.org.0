Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 702FD80A516
	for <lists+samba-technical@lfdr.de>; Fri,  8 Dec 2023 15:04:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9GHg9mYYhpYtHkFtfDiPVVWry+U9bmV1TJtlDIch/n8=; b=3jc9CyMIXx2ZAW8qU/WhUfOY8R
	sOGfJMHM/9McMD/k/o6PGzlsy22dqu7hu/giTLqtKsNEhMfLR5SiSZzOTIBg+7kNQht/vy0jNPZ+2
	0QrThgR+svlBJ+L9sPPRLA/+FDmTbszO95p8O2cdXBmo4k7WEjwvdM6SZWtgFHWYq4FXxrPNNVeuw
	4g0aG6l2rK11UdaCGd9S8i0gV8SDT3nkW3LvzKwutUAsgZRSrmskKNXg2fgmRd5AqO762G5onmvyl
	P7Srcj9Yycr38WVJRFGWCg+WxYW4DTCObz/gHd442Nr7PBKFdxLsiToRGChosArQQ57W6S0rZQKOy
	7hj/kEWg==;
Received: from ip6-localhost ([::1]:51744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rBbSR-005Aro-VT; Fri, 08 Dec 2023 14:04:00 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:42355) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rBbSM-005Ard-Dr
 for samba-technical@lists.samba.org; Fri, 08 Dec 2023 14:03:57 +0000
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50be10acaf9so2008933e87.1
 for <samba-technical@lists.samba.org>; Fri, 08 Dec 2023 06:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702044231; x=1702649031; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9GHg9mYYhpYtHkFtfDiPVVWry+U9bmV1TJtlDIch/n8=;
 b=gRfKQj5V1OhidGRswmEnIeVVBb6FcV0WGDDg/WjDXJ7mlo8IwAt0jDD6TaMJhnNYRa
 WiBT8K+/jqCz9Ox3qohMz8nRZtrqSxySfeJpB2azR5ASdZVw2tm+NY+/b8nJ9q1jh/ew
 zVaPgQl80+o+MDQtILNz/H8GaREjyaLok6F/wo7hSaNCAkjWCttftJZWT1ZHZjlB/XoU
 A+YsG1I2rJ3q4b9wB0PV8Pe5aWiBm3fvSwPsU2ckUA0Tc8NHMPdH2PKXTOkSun7ZoFUW
 JeNPRoEz0RU8UjFApnWKDYf7rhA75Sgnr4nrksFmdAo712KS5/yoB5MWLKxN4gl41y+E
 /tZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702044231; x=1702649031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9GHg9mYYhpYtHkFtfDiPVVWry+U9bmV1TJtlDIch/n8=;
 b=kZ5JnmGcmkvWsH9YR3abcE7zZ3RNs6yIlD3MsMcmJBgn6saYjeQfWdBJhUJ+p98lus
 lzPeBHO2xezmFcKpl+Onx1Obu76OhO/2k7WDRJvatVGo/k7tNEDy/flNgfwYDVVxPhl0
 5TNLupN6p5E+OrQQmS4lBEs2EMlS9ssf0D4DYGlB+mkkc4C5HI0291FxgLbr86cFdgfX
 8hZH8fZFySdqSyh620IMe/8I6DPUfMIu7/APZ1PtDyM5kzW0jo4aq0WuXPHPWBsPUshx
 shEyg3ovGxkuQjlR8xaSEKkKdPQ/1rNQ7kl7V0QChgNuzEknCC05fkQhDUe7Ws6lpfsi
 Fijg==
X-Gm-Message-State: AOJu0YxU0VnxMKkp90cvHRAub8i5JLWCV4RF08+j1GsPAA77p9Uvwxwl
 bdCZ5pOZOhIGUylbZ35/si6O6j4CIpp+Z+MD37Q=
X-Google-Smtp-Source: AGHT+IFiYtAB4DX4Xl8v9W/TkeIy/J1MYZ8yoUrp6F848N4KQ4bwfn0Am8DcmxryW7xOyBVf7qDSUREBGXeIxAhGwo0=
X-Received: by 2002:a05:6512:4894:b0:50c:1047:5a04 with SMTP id
 eq20-20020a056512489400b0050c10475a04mr102899lfb.15.1702044231052; Fri, 08
 Dec 2023 06:03:51 -0800 (PST)
MIME-Version: 1.0
References: <700923.1701964726@warthog.procyon.org.uk>
 <ZXIDgvZ8/iBhYXwy@jeremy-HP-Z840-Workstation>
 <1215461.1701971450@warthog.procyon.org.uk>
In-Reply-To: <1215461.1701971450@warthog.procyon.org.uk>
Date: Fri, 8 Dec 2023 08:03:39 -0600
Message-ID: <CAH2r5mvM0+Py7bjahBfwpUnFPGJkZJL9KnwX5Pbw5QUGDv-0rw@mail.gmail.com>
Subject: Re: Can fallocate() ops be emulated better using SMB request
 compounding?
To: David Howells <dhowells@redhat.com>
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
Cc: Stefan Metzmacher <metze@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, jlayton@kernel.org,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> What do you think about the idea of having the server see a specifically
> arranged compounded pair and turn them into an op that can't otherwise be
> represented in the protocol?

That makes sense for some cases (open, queryinfo e.g.) and has been
done in the past for SMB3 servers.

On Thu, Dec 7, 2023 at 11:50=E2=80=AFAM David Howells <dhowells@redhat.com>=
 wrote:
>
> Jeremy Allison <jra@samba.org> wrote:
>
> > >Further, are the two ops then essentially done atomically?
> >
> > No. They are processed (at least in Samba) as two separate
> > requests and can be raced by local or other remote access.
>
> So just compounding them would leave us in the same situation we are in n=
ow -
> which would be fine.
>
> What do you think about the idea of having the server see a specifically
> arranged compounded pair and turn them into an op that can't otherwise be
> represented in the protocol?
>
> Or is it better to try and get the protocol extended?
>
> David
>


--=20
Thanks,

Steve

