Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5755F02A5
	for <lists+samba-technical@lfdr.de>; Fri, 30 Sep 2022 04:15:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oytTmM9h9dHfzGVi6wz+HC7RmNmm9+5e7chmw0NHV9g=; b=zHPtFzDuQgZAmct4LxfWFLq9dH
	LfW/PYr/WTT9Pz8eLtWYlzLJ88dFRQ78Tp0lsG50W9dGDW1qUm5U2iI0eEu9ZdDVsouiHcSHzIxhL
	2MWUjLTC4xTijt9w/JxL1Jg2CK0+okVWJCkb5RyK0qjsMap+AUwuFil19jU8ylaZUvUO2Ur7NUQQA
	13y6OFdjLQ1YxkZIMhJH1UczF9NtkRfKfV6Ly5OqjVlYM/7lGL5oOdB0+hegSRdOJwQno5w+hsisQ
	3Zzm2aHVkI1w046HgNFRSX5ASm5YrmL//FADi22yfqo/y76RRqgHpQC1jxwhGYl4POdAZJTzoLYUK
	W6I6R4LA==;
Received: from ip6-localhost ([::1]:31764 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oe5Wm-004utx-0B; Fri, 30 Sep 2022 02:13:24 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37570) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oe5Wh-004uto-Gt
 for samba-technical@lists.samba.org; Fri, 30 Sep 2022 02:13:22 +0000
Received: by mail-ej1-x633.google.com with SMTP id a26so6267126ejc.4
 for <samba-technical@lists.samba.org>; Thu, 29 Sep 2022 19:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=oytTmM9h9dHfzGVi6wz+HC7RmNmm9+5e7chmw0NHV9g=;
 b=TRVUwlZGAqLr4sSZfYozXc3zYwssLWF5z6Y0Fa1x4jmLxhQz6rn+ZzsMPXsaG3t1uT
 VNJwy8ABSkuQvujnx4I+2vZs4ojnb4TK7BKFuEy10Ps+87WvvbjfzqdSdc67sYQCKHhY
 32JaMmn9rnNOSnuoVHWzAMkrZZ+cSWRABp8u59i9RsVnYlzH3wP7bs4WCbpWY9yhPNR+
 FuKHt3JqNKMT1iPYVTuCOTzQw5ElV4c6FodHlNCbt/k+4nne+w1ceXJsvd7wUjDADKQ4
 gP3oDRj1mCwunSj+J1PK3DErshiMu12w8OncbQIn0r61h2DUkP5g5KP2BLSUkCWXPPEu
 y8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=oytTmM9h9dHfzGVi6wz+HC7RmNmm9+5e7chmw0NHV9g=;
 b=fCCGkem8Hz2lD1qhniPZFFE2d4dY22dJ23S6/PRdU8WUP4/FwRuReiQh7T6eIJ9WNO
 Bi8e8/3QF4nhIFNID33sNWgRqKso4fbOeNstal1p9QZFhJsemuVr2ASx1SkFx6oAHOA8
 g+BH8E4S3AiTW+y16TCXpeiwpdZ7O9rucDaCNsYXjAn+sVjpXVo4K4qjEuwA6YgyET2I
 6G2hPzkbZb3DBpLO4W1nYeXyn1jYegzf2Q4UATCf0hJUDNDPdc5tb2KpLX606F1Rkdpw
 xTLIBA5LVex+XdJ/eY9o9C5vcuj/RKrKZ0NJ8ZN/QMDSh3qwdvSKEYPvSS0VLyJSGuk7
 XHjQ==
X-Gm-Message-State: ACrzQf3i/M0UN2ZNcUjKTa4nRuc5+t3ZJbVOgzKqouD/Ph9shMgskhTG
 NSmb13hfMXqcmTAGiIDvtktX0A6Y+fsPoMLCCvZawjwx
X-Google-Smtp-Source: AMsMyM7LTANdEuXcUNNhyp2eONzPS3vddyx58b93R6DgekvT/F6pWvWrC5jh/svyjlocOE8kWE9xNV76s//slu91+yA=
X-Received: by 2002:a17:907:320a:b0:741:72ee:8f3 with SMTP id
 xg10-20020a170907320a00b0074172ee08f3mr4897453ejb.168.1664503998202; Thu, 29
 Sep 2022 19:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <d0c713564b3c9f848bab99ba74f3ce79a5add2f6.camel@samba.org>
 <CAN05THQKM_UvvHGcNVexgNNZmPHvwezdiABPU1F=vGp5CaiCPA@mail.gmail.com>
In-Reply-To: <CAN05THQKM_UvvHGcNVexgNNZmPHvwezdiABPU1F=vGp5CaiCPA@mail.gmail.com>
Date: Fri, 30 Sep 2022 12:13:06 +1000
Message-ID: <CAN05THQwdmwXm9o+NOcWRuj7W3f9z2bm+O9K=NshfZ4bVg3U+w@mail.gmail.com>
Subject: Re: How to detect a client-closed connection during a write from our
 LDAP server?
To: Andrew Bartlett <abartlet@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 30 Sept 2022 at 11:53, ronnie sahlberg <ronniesahlberg@gmail.com> wrote:
>
> On Fri, 30 Sept 2022 at 11:28, Andrew Bartlett via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > I've been trying to chase down the CPU spins reported by our users in
> > the writev() codepath from our LDAP server.
> >
> > A private mail the the strace output shows the sockets are in
> > CLOSE_WAIT state, returning EAGAIN over and over (after a call to
> > epoll() each time).  That alone would be enough to keep things
> > spinning.
> >
> > But they are being shut down, however our LDAP server won't be
> > triggering a read any time soon, it is waiting to flush the response
> > out.
> >
> > Technically even after our server OS has got the FIN, there is
> > potentially data in the read buffer (so a read() might not return 0
> > anyway), but perhaps most of the time that would be 0.
> >
> > So how can we detect this?  Can we at least put a timeout on a writev()
> > call via tsocket et al?  If so, how do we do that?
>
> Do I understand this right?
> Your process has a socket that is in CLOSE_WAIT state. When the process tries to
> writev() to this socket it gets -EAGAIN and not a more "hard" error?
>
> I wonder if getsockopt(fd, SOL_SOCKET, SO_ERROR,  could be useful here
> or would that also return EAGAIN.

And if that fails, you might be able to test it by the much messier
poll() and check for POLLIN and then read() into a buffer.
Once poll() returns POLLIN and read() returns 0 then you know the
socket is closed.
Once poll() no longer returns POLLIN then you know the socket is still
open and you will have
a mess to sort out how to "un-read()" all the bytes you read from the
socket to check if it was open or not :-(


>
>
> >
> > Mailing list threads:
> >
> > https://lists.samba.org/archive/samba/2022-September/241869.html
> > https://lists.samba.org/archive/samba/2022-September/241873.html
> >
> > Andrew Bartlett
> > --
> > Andrew Bartlett (he/him)       https://samba.org/~abartlet/
> > Samba Team Member (since 2001) https://samba.org
> > Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
> >
> > Samba Development and Support, Catalyst IT - Expert Open Source
> > Solutions
> >
> >

