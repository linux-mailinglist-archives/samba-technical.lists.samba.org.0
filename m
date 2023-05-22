Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F170B422
	for <lists+samba-technical@lfdr.de>; Mon, 22 May 2023 06:34:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NfEjapVm/XiaT5JlpMM0Qmx8SWMflzWyhL2TfVTNWzA=; b=jccOybiwDU8hDihXapX/z6JHx8
	vvSmJEIcKy6IWkX3m7xs7r6HPZRatcJMG4RicOMoHAwClRktzcnUZ1j7+na526U7th+JepY8qd/t3
	Go02pxxrTntGiURi8VwM4Ke2ZByN12QrcD/rxp4a8JnuYle2w3bf8PfngRZWa03XwxWhj4a3tltjc
	TedF2MR2uSLrUDhZmGQ1IJYOVIUyUGKVs228aPg0rbWzyB26y21Q+L7p5atc2c0Fqlj2GeSaXppC7
	rQqWcKTWpehqXH5iNqLaZ0XeeP9WAKqA9JcxewEsJQdNkvjCE7N2InC+Pp8uLZJwOXB+cj98BXSCB
	GPv0c5BA==;
Received: from ip6-localhost ([::1]:23022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q0xEn-00B7TH-De; Mon, 22 May 2023 04:33:37 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:56456) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q0xEj-00B7T8-EV
 for samba-technical@lists.samba.org; Mon, 22 May 2023 04:33:35 +0000
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50db91640d3so8712393a12.0
 for <samba-technical@lists.samba.org>; Sun, 21 May 2023 21:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684730012; x=1687322012;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NfEjapVm/XiaT5JlpMM0Qmx8SWMflzWyhL2TfVTNWzA=;
 b=ppK1asf8CGo2Crk+79+eT4JRxCwqAB+0euq5YNyX/KzkgVxOuEyaTi+gWNO9Ptxfkl
 mt69uKKX4+n4n9wEw9UG42UN+FOwHw8wIDa9fd47wlIYAKX7MU5pfEvUPEA2OCfwVype
 gXUwA0fuZLwRZLwq5rqDD6wl70LesqvhomW48rCmu9I/sAdRE7fORnl0tDpBrj5uNw9R
 oDx47wNZcU5gYlHZjezf/mvzE1clXpVIPMa8sDhEWr4f0yGpEjLOtwRJbxB+y67p8Afg
 IYWBhUiWRDzGCGVd9WJT4ph/rDKdc3aS+v1PkBJVmR3Gz2IXuBCyWUyEwLrAAktG0u35
 Jb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684730012; x=1687322012;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NfEjapVm/XiaT5JlpMM0Qmx8SWMflzWyhL2TfVTNWzA=;
 b=Titjpc4sLh0jg3HlR9hMwc36nGmyq/LvuJW1g4wG2xRzHTL4difeUhRI5q6JVb6SCf
 3hSgrNjk/PXzxx9+arACgbL77x10M15FdVgWu6ShIgzhZPidAOZcwxNww/WBBOIj0xc0
 JLWOb4QXWtZ53Dh5hywvmlYuu4CJM3cA+56BmIl2f8SfM0/ziqqtP1auQnMMDWexV4u2
 0H4uJH90hEBW1vYynBr2+kWltaIkjpjoLLJPB2/7bmSEckBojvwxIAGVwgxEewy3KsE5
 1zObPXU+aocaKjM9QUG4jIfG6sic2RKjeWyX/Moq0Ideq4pbVnU72M7i+PkytHzOmQPB
 i+iQ==
X-Gm-Message-State: AC+VfDyuADk7rZ9F9+u2wpuyXSzaYA6Wn1EbzqQ+yET8ZS22I1bJF9j7
 L1bYJpN7v1wDJAHjYSYmw9ZY1L+x2lFMsMcwH38=
X-Google-Smtp-Source: ACHHUZ6J+hQ+ajoWrs/8/kteyvtzZ4ipek8fzQUGoqc32NMx4/6ahFrv8mA/+eloDcxg7QUk4fC8Yos0L8gNqGsoCSw=
X-Received: by 2002:a17:906:b044:b0:96f:4927:7a96 with SMTP id
 bj4-20020a170906b04400b0096f49277a96mr7750096ejb.70.1684730012165; Sun, 21
 May 2023 21:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
In-Reply-To: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
Date: Mon, 22 May 2023 14:33:19 +1000
Message-ID: <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

A problem  we have with xattrs today is that we use EAs and these are
case insensitive.
Even worse I think windows may also convert the names to uppercase :-(
And there is no way to change it in the registry :-(

On Mon, 22 May 2023 at 12:09, Steve French via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Looking through code today (in fs/cifs/xattr.c) I noticed an old
> reference to returning alternate data streams as pseudo-xattrs.
> Although it is possible to list streams via "smbinfo filestreaminfo"
> presumably it is not common (opening streams on remote files from
> Linux is probably not done as commonly as it should be as well).
>
> Any thoughts about returning alternate data streams via pseudo-xattrs?
> Macs apparently allow this (see e.g.
> https://www.jankyrobotsecurity.com/2018/07/24/accessing-alternate-data-streams-from-a-mac/)
>
>
>
>
>
> --
> Thanks,
>
> Steve
>

