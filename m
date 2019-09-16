Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C657B32C3
	for <lists+samba-technical@lfdr.de>; Mon, 16 Sep 2019 02:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Kqyc+LpJxuMW9FrQDhssrLzitkPtIdU7xcOkDA3Cjec=; b=DCU3iWhElEE5JM12PP0KTjhrQw
	uP+peFzuAfoUSmmItVLUD98l1WZX7sRF3Kef8Z55FsMg/xv3SKTJEDNeLRUdwBziie2vr9U2ixbNC
	STzJYjHFsdW8kZDycqcNZdhNIoG1F09e0jIXQOHM7Ib6XEec2ph/SgfhKYooLbUPTqThbJtp1yTbv
	u6qMFnY/tRy/h2p62duoftqGHG+BzJiEVUToiHrPxgWq969PGbOBlGl8A9rSltZD8wj7YlsTVP4Cc
	1hEjq97CoBReLW+Oxmn0qcTLCcFa8Hx1RhhbOaRvddwaYAqtt24Z8hLcvdC3AahFdFkmu1+D/uFQj
	RhBRKg8A==;
Received: from localhost ([::1]:45514 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i9eg5-005pHB-PL; Mon, 16 Sep 2019 00:15:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41914) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i9eg1-005pH1-Sh
 for samba-technical@lists.samba.org; Mon, 16 Sep 2019 00:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Kqyc+LpJxuMW9FrQDhssrLzitkPtIdU7xcOkDA3Cjec=; b=LWydggHxmYxpVyZu2vpevVtmWb
 KkwxpkY3EnnbF/2YGM9bzqfHoxbnXlOp6UAK9Ee27GXodIwV8c6jg/nSy9Wtb7Fu8iEAJEK+8gdIh
 rZ/CaulmqvExd5itxj8peiky1tBxkNueyUuxW6402ozVkYzkfL9QVZKWywcJlzh5+v5Q=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i9eg1-0001jv-36; Mon, 16 Sep 2019 00:15:33 +0000
Date: Sun, 15 Sep 2019 17:15:15 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Is it correct to have an INHERIT_ONLY, CI, OI ace with
 GENERIC_ALL as the only perm set?
Message-ID: <20190916001515.GA18760@jeremy-acer>
References: <CACyXjPxfTd-DOVA3L1eqF_RZa_iKnnPEtiwX7dQP3jRr9kx3tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACyXjPxfTd-DOVA3L1eqF_RZa_iKnnPEtiwX7dQP3jRr9kx3tw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Sep 15, 2019 at 05:04:17PM -0700, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> I have a capture from a GET INFO SEC INFO from a NetApp C-Mode
> simulator where one of the two ACEs on a dir is an IO, CI, OI ACE with
> GENERIC_ALL as its only permission bit set.
> 
> Is this legal?
> 
> If so, I guess it maps to 0x1f01ff

Isn't that the equivalent of a POSIX directory
inheritance ACE of wrx ?

