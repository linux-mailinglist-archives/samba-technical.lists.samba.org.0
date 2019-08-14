Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C3C8CA32
	for <lists+samba-technical@lfdr.de>; Wed, 14 Aug 2019 06:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=NTVMIFLC86JitlNlcdxOYD0BWgCKUOE+c/759SboCUI=; b=zIYrF66D6ORas3RaeLhsKsYB7u
	vC+WHvI/Qz6pVI7R5uW27EybHAX4AVcyYAswWmi3pgYitd0+MgCjX5ur2P3CRItd9dgBy7wIIzuey
	jBPoZwpfgZupLj0sSVZmoiEAWTangS6PBHedEHIPbChkZ6e7bcDt01of04rUV+w4tToVlRoAN0sdV
	sSmnII9cLFgkhCJ+UXGALztGnXruw1Ywy7UL8LHfGbp54pnAWDIviA4waYPJkr610kL2v6pNsZ93o
	ZIfYLK3//dG78dtA7BNuhBlOssHy26AQrRSUM3o01sRvKpwtVLjYsnHrLBi5mCcrrWADK29hbebOw
	IUIoUxiw==;
Received: from localhost ([::1]:41550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hxko9-006EMi-G2; Wed, 14 Aug 2019 04:22:45 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:40233) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hxko5-006EMb-9Q
 for samba-technical@lists.samba.org; Wed, 14 Aug 2019 04:22:43 +0000
Received: by mail-ot1-x32e.google.com with SMTP id c34so39334885otb.7
 for <samba-technical@lists.samba.org>; Tue, 13 Aug 2019 21:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NTVMIFLC86JitlNlcdxOYD0BWgCKUOE+c/759SboCUI=;
 b=ohFeg9noqw6/983QYz5SCYgDYojeja3jegWgzHc3bcz7Rc5yZpHZWr9AvXCz+tqe9c
 lZ+gSiCbqubrSwyIbUbukdsbZm3WeWf7y2WELR9BqJVRgilPZiBpQt2BgExREGT3FI9q
 fw6poI+Hoa+KpbZ9zj1Cv0g8rcT8ge5YFg/BYYJFB554egVZTWw+ElbvgN6VEN9k+hxb
 ekJfmoVkgwnr197eOmKRUs8dwZdm/v2U2WIOxWEf9bal+KOnMCj0MjiNW+AfSIbxDzWg
 +eGcKMNqqHTdM35dp0iKEwaB8tn53fKhR934dR9LLg4D/r3l5LUGBXpQqJAPvzwGa/pF
 sN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NTVMIFLC86JitlNlcdxOYD0BWgCKUOE+c/759SboCUI=;
 b=YfweZgL6d+k9Al3Kye3n0lBQrrbUfKmIA2lc4j4ZCsOMNaDgAj8e5aXYT3bRlAtIk0
 e6JWJmOxQyPv/7vW0DTlMQxYHegOAc5OG8fF6niV2AOotU0rNraMYUEUPyj+yhS5eW6W
 uPj8vp6tg4VnHESLbLobWIKVHR440tAi7GE9LC5YUouC4WQYkcBDNi7/8WUTcNNxQo8M
 QWNgAcGnB49BHtR2iKKesrosngOYCtCcqR0bmOge3ldKvo3IvgVdsOjCo7wZtorNScJS
 0UG2n+Ea0aL+LVUbl7ZnziXMDJ843jO3subrnW/hTU7xaXbX1O5gXAyiTWgan6zrs3Sq
 QVGg==
X-Gm-Message-State: APjAAAVMXw9H8fiHzPLX8L5cH4qI5puAtgaS8EdZORDRjMOHSSHWpCjL
 Zvf7FR1JhYO6+0vG2a0G2CBjlNgAxwNUGvbX/pZa4Q==
X-Google-Smtp-Source: APXvYqxAQof+DIcgpP04IcdxUKABks3EwzhhpTbIrgOb/LoOL0MX0Fin/oOaEtTHl5IXaLQPQJ/1EM7EeEinUexY02s=
X-Received: by 2002:a9d:6256:: with SMTP id i22mr7762395otk.139.1565756559198; 
 Tue, 13 Aug 2019 21:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190814135302.7cae603f@martins.ozlabs.org>
In-Reply-To: <20190814135302.7cae603f@martins.ozlabs.org>
Date: Wed, 14 Aug 2019 14:22:27 +1000
Message-ID: <CAJ+X7mQRwy7Uwe4nAMKxxUgDno0HsJPxxj0_Lf48eOngo6EBaQ@mail.gmail.com>
Subject: Re: [PATCH] CTDB TCP transport connectivity fixes (bug 14084)
To: Martin Schwenke <martin@meltin.net>
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
From: Amitay Isaacs via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amitay Isaacs <amitay@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Aug 14, 2019 at 1:54 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Fix for:
>
>   https://bugzilla.samba.org/show_bug.cgi?id=14084
>
> The solution is to only mark nodes as connected when both incoming and
> outgoing connections are up.
>
> Included in this pipeline:
>
>   https://gitlab.com/samba-team/devel/samba/pipelines/76265339
>
> Please review and maybe push...

In the last patch, there is no need to add "node" element to "tnode".
"tnode" already includes "ctdb" for upcalls.

Amitay.

