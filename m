Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADF9325482
	for <lists+samba-technical@lfdr.de>; Thu, 25 Feb 2021 18:25:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EK02vbDhS3wbLOl6TYczf2PM3ezTw7wQjxU6JZk2d0k=; b=XldNlUQvbjOl7klmZmxhJ2+pnb
	MlYu91Yy0f2q2SItDMgjIGqG6uFWoeIjti9iaC224bBGfbLASsq74yN9DMQerYoj+7jKXvfOE/YWW
	xSp9XGecpBMsAtCYK+RpLsTl6ibbbljDxhnxXeTOai7y6NkTMJi29OSL9TIijebECWueE/F16wHI6
	WSVvbFDCbapb03SlikRF7ONjk4OxzRiBPL2elr9qnUWxtnKcuUNJ4s7jnSCSE8H7PmNzRBtoXOqSc
	pNKPiEwU9/FF0i7KepDzSI6R52Zw1K1PQSaTR/Yf84j0aHSkmS5b5BnSV7nuchxyHCE08bGSpx0tI
	eSJXSCJQ==;
Received: from ip6-localhost ([::1]:50030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFKNV-001SnO-Rm; Thu, 25 Feb 2021 17:24:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54055) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFKNP-001SnH-Ar
 for samba-technical@lists.samba.org; Thu, 25 Feb 2021 17:24:37 +0000
Received: by mail-wm1-x334.google.com with SMTP id x16so5276844wmk.3
 for <samba-technical@lists.samba.org>; Thu, 25 Feb 2021 09:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EK02vbDhS3wbLOl6TYczf2PM3ezTw7wQjxU6JZk2d0k=;
 b=SAevHF6hhs7FjUAOc9IrLTm5nvkmoTyjLrOAFH47mlAv/nASmwLYW0xYjzCOpfHCJf
 VlxnKgSpNrXn6v6IsEXXbZ4ulhrDlH5znaGwXIHXuKhy5chse6FM82D6HK0FrQiJVGfl
 f7breI+//LALSEC99fmG+SIzr1wJA9gli7DGqlfA9yBA7oE6ZodHKr0U+msdvKJgUQ7X
 sBU0W6bHaZHO/hdgoe3FeUP3Jdn+0lMkmkdV9W0yClq826SL8pFRk3HZpbQlTD7oRTRH
 VzCBVmpAO1raQmvuMPjKhRv9zwCVn6Z6q5V0a1nm1KCewRUnu9x1l3Bk09oi8hxWADPQ
 x3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EK02vbDhS3wbLOl6TYczf2PM3ezTw7wQjxU6JZk2d0k=;
 b=JraIyRIfMdEJORY2+GzzA2taCt84jdkHsLB7H6pX98/lnfqesbQbwu3jcIR6ahx5WA
 twHcCQ9JipUjxUt0YOLyq5KBNLI6BDEba2kziQIwsCzvPlVDdfxAk1hny/FNxdOrcIlN
 AAtJKzOgOqewt6O4/hxH/kpnGK6uH1BqPbEHWDA89X1J2UKwSmOgoo+4mZUJZh06srUp
 ZERYohYxdQtbT845+xEgi29IB8VRnHWDHbb9+/vR3EeoL89dGruIn7KANPy0jWRhwKmS
 3nYWFoBxxZNQO8nlEGZRoqWDQNAI0B/HwliNHi2yrMjrys7lbsKZxyqCwEv1ZDjgP/E9
 jYpg==
X-Gm-Message-State: AOAM533ONOEqsaE8V9FvjhEfj7o92cThmYjWPmmQbc8qnt+koE/E4t/p
 02Cid2CRyzZFb3E6cPXzirVRqG1/Nro+xkr7HT0=
X-Google-Smtp-Source: ABdhPJxOcCtzSPwg7yP3l3wsDoxAiIo+4zlc8JoAElQd+4Nya2+hYUrm5ATBMy2MZWqkcEpTBAoHraQSVdUR+fSp2fI=
X-Received: by 2002:a1c:7e4e:: with SMTP id z75mr4269599wmc.168.1614273873949; 
 Thu, 25 Feb 2021 09:24:33 -0800 (PST)
MIME-Version: 1.0
References: <0736dea6-ab54-454d-a40b-adaa372a1f53@www.fastmail.com>
 <CAN05THRTEXjZ+TQB+X2kA_i8CgKctBDB1UhbifAu0WzqHOuNmw@mail.gmail.com>
 <cd9f90aa-53f0-43a2-9683-b5730d01ca90@www.fastmail.com>
 <CAN05THQfXstKOvVMN-KGBk6bdkUaQCa_4CY9o5oXn_qDhdW9-w@mail.gmail.com>
In-Reply-To: <CAN05THQfXstKOvVMN-KGBk6bdkUaQCa_4CY9o5oXn_qDhdW9-w@mail.gmail.com>
Date: Thu, 25 Feb 2021 11:24:23 -0600
Message-ID: <CAH2r5muZ0Dc=1dR9oO5+N0wZ5KM1KjePk_yD-f5SpodS9eZmXw@mail.gmail.com>
Subject: Re: Using a password containing a comma fails with 5.11.1 kernel
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 Simon Taylor <simon@simon-taylor.me.uk>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 25, 2021 at 3:34 AM ronnie sahlberg via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Thu, Feb 25, 2021 at 7:18 PM Simon Taylor <simon@simon-taylor.me.uk> wrote:
> >
> > On Thu, 25 Feb 2021, at 7:37 AM, ronnie sahlberg wrote:
> > > Hi Simon,
> > >
> > > Looks like the special handling of escaped ',' characters in the
> > > password mount argument was lost when we
> > > switched to the new mount api.
> > >
> > > I just sent a patch for this to the list,  can you try that patch?
> > >
> > > Thanks for the report.
> >
> > Hi Ronnie,
> >
> > Thanks. Your patch resolved the issue.
> >
>
> That is good to hear.
>
> Steve,  can you add a Tested-by for Simon and maybe we should have cc
> stable so it gets into 5.11 ?

Yes - agreed


-- 
Thanks,

Steve

