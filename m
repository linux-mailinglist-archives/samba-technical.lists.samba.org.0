Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC2E60128
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jul 2019 08:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6z9JIUZwtuaOY1CgIIl1xDa2RqIopSgJwob9CpcVftM=; b=KHAr59oW1bSrrbIL/eDWs/lVco
	rbnbKiUFoDjiNPqqjEjpc/DKJ3LHVGs1sJtfxycPHNGxcoDTaisnoBGyDZQgoL2UqkMQAh4aYhNX/
	aTGxEOPbbYHyZR62k8v2aXkd5XAZWUgiRdKKoO4xJcHW7LjC0uH8QuXVlBSBSrwR2FO0+z9d9aJUf
	0Kz1fsmOu0jYNEgEjWNKa+MfcJUwepVWWdajmZxZzSOa63o2FMgv9Jbvd6x0SKQefb6c+3J6kgoTz
	IQUapDJFYA+tVYSOcUKXJIsU4nE7U84PIz8YeU7I1KySRYRNmy4i1TFzuxpZ5um3z4uJIeYfGCRpp
	HRrWMHMg==;
Received: from localhost ([::1]:25576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hjI2h-005I8u-Kx; Fri, 05 Jul 2019 06:49:59 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:46035) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hjI2Z-005I7C-08
 for samba-technical@lists.samba.org; Fri, 05 Jul 2019 06:49:54 +0000
Received: by mail-oi1-x244.google.com with SMTP id m206so6417704oib.12
 for <samba-technical@lists.samba.org>; Thu, 04 Jul 2019 23:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6z9JIUZwtuaOY1CgIIl1xDa2RqIopSgJwob9CpcVftM=;
 b=krYpsSbEbRC6YZThjRRR3agjASEd/VKN5fvCsOL2/sDd9ADAWovu7XlcLy8sWYpkrU
 +Jdu6i5OI1/SODsdYlL6fAOonX1szZdNrW31gcHvO/UvtyX6BDOyQUr1oD/wMcXMQaRG
 qr8p6ZM1Oenxc6u+TNL1MknlPN0VQotMMHv38xzZ/vlktiqP5mYSxWF48KpXDIKfuC9h
 4/f7LMfk39TJ122tyUKrt/JSc6g8rjO7h9Ac/keDWqVWsF7QXER1HCXjb0sE+LDeSmK6
 kGEm2uXLvB0iXXPTCSBZ+tOwg79MuD5wJ3vf7jYCsVXK6ElE4pq1isaf58Pgedj7cBn7
 9B0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6z9JIUZwtuaOY1CgIIl1xDa2RqIopSgJwob9CpcVftM=;
 b=aPhOrA17p2iS1s1zbDiIayGs3Yc1NRglqYt/ULIxXxrGUkr5CTjzZ+lM1CEMbbkTes
 lSmAKODYy3LzvBpp28n69H5jQjbt322h77pCwPfWYHIwsFjk75KkWvZBwp8XnO9Ha9O5
 AX3qmreYpC/7S4wm6kpWWS7Zi29dcYqQC2JLU00RnVBe/y+QtLPUIEFXt+Wl/5+dPHE6
 QRmJjQ4uZDgE2CZmYZ++k04aQpNn3Z7Eab0y+N4Hakm0d05iYDydGAkinbRYyTaby/eo
 FUKTa1/IwitbFIPUamQvD3IHSvN/s57sP/Nun6TwL5BCIAhEQm7BrJfYF2aahgWyZazl
 5SHQ==
X-Gm-Message-State: APjAAAXA2IAWEls0CWLa/o1LwXfDpCKrwWLIaBnyfsg39V9+QGfH0MK6
 WlWUhC9mUuWzIDJ58EOODtzJScO04nGqiafRR7TMTg==
X-Google-Smtp-Source: APXvYqxRtsUS4Wba60H2njFhXsa2PC+Bl3QREBVpXa1UWQXQeRyX2e5G8eRLfgPJ1xK1v53N0mMNQEuMV9Om+gu99tw=
X-Received: by 2002:aca:aad3:: with SMTP id t202mr1261370oie.158.1562309386117; 
 Thu, 04 Jul 2019 23:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190705141350.39b099d4@martins.ozlabs.org>
In-Reply-To: <20190705141350.39b099d4@martins.ozlabs.org>
Date: Fri, 5 Jul 2019 16:49:35 +1000
Message-ID: <CAJ+X7mTQtJANFpps7=Lp8B7OunSNXmU-7XTPnvztqTxTD028Fg@mail.gmail.com>
Subject: Re: [PATCH] ctdb-tools: CID 1449530 - Negative loop bound
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

On Fri, Jul 5, 2019 at 2:14 PM Martin Schwenke via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Regression introduced by commit
> 2558f96da1f9be8034f26736c8050bb38a1f82a8.  count should be signed
> because list_of_connected_nodes() returns -1 on failure.  Variable i
> is used in both signed and unsigned contexts, so add new signed
> variable j for use in signed context.
>
> Please review and maybe push...
>
> peace & happiness,
> martin

Pushed to autobuild.

Amitay.

