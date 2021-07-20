Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E13233D0224
	for <lists+samba-technical@lfdr.de>; Tue, 20 Jul 2021 21:24:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=xdB4wIPCckvfLoEZ0KuGyNLGP8ZsBz8FCmcR3HB/Ce0=; b=MWO2NdEiDh0xSHhd8duOPfMsqB
	zS8WJag/iP0IJ6YdiaZb8f8KzuXk6uA7sbzpnsRS3VsDj5CRdAyZ43hAWS+9DHoUKbYC1R0voqlhP
	oAylgh1uOtrWV0vyVOpLZ4Kbt3fLNp04hDOSusvh5aUAXgPj6OhPySZGq6nTGR1eer9GCVKs60q/l
	r6ULW2cRONUibn8iPmjJzAVj1FcNZwNx6RCOL+uR4inILEKuh1rvv0ayjDmc6kuK0NldQHQTDzzGS
	hQhinhCd6PBRlHab7qN1IYXf78rtru/MBN+guql1lF7tG63ry+ySlZ09rec7uovC9IlwT/3B50nf5
	n6935XAA==;
Received: from ip6-localhost ([::1]:27944 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m5vLE-00FdYQ-Oi; Tue, 20 Jul 2021 19:23:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48124) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m5vL9-00FdYH-8Z
 for samba-technical@lists.samba.org; Tue, 20 Jul 2021 19:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=xdB4wIPCckvfLoEZ0KuGyNLGP8ZsBz8FCmcR3HB/Ce0=; b=apFlOKyo8s/CnlqQofK6lE5f5G
 KtLwipQifMrXFG3zOqdNHMutZn2twwpVStw01fE8wvV7tD3w539L+0ppj5m+yEZB/8K6LprtS3qNC
 /RYS8R1t9ZQstIfhgWl74LJoGs5y+ptQSAZOdPUqjWMMJMgq5yfT1uJKABSf+GWvLoDdie+GI5D1Q
 m8c/RYS/MW7glpwOfTjzLehdequXCnNwbAdvJ2vp65FVDG/QRJPhJoMaI/onS1cXjk3n1oobaiARO
 2Z07l857WbGqKx3qENmWDmM4IkpwgRAJmCr6/IHJ0XDrpAgIihOZOhEbQu9C/d+nsIPkt2ALvoM3h
 f/EWWXQR8ftXY4NPOfgIL5cI2wljExo9UhqMr64XW8IL7uxg5OkZwPAYSRRDiMYWIBlDZ+b6qCqjx
 KIj446GIXsgmX4KNe3DcNmlV0CNsaudriM2GvP55XtO/jpvZR62q1qagcWrJVz5IZjmlP2c6rL7B5
 KL+qHe51YrDh4e+h4V0Iq9Bh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m5vL7-0002ri-Qt; Tue, 20 Jul 2021 19:23:38 +0000
Date: Tue, 20 Jul 2021 12:23:35 -0700
To: "L.P.H. van Belle" <belle@bazuin.nl>
Subject: Re: [Samba] Has anyone checked ceph with 4.15.rc1 ?
Message-ID: <20210720192335.GB2945898@jeremy-acer>
References: <20210719161147.GA2806846@jeremy-acer>
 <vmime.60f66ff3.3736.797a1da540303ba3@ms249-lin-003.rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <vmime.60f66ff3.3736.797a1da540303ba3@ms249-lin-003.rotterdam.bazuin.nl>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jul 20, 2021 at 08:40:51AM +0200, L.P.H. van Belle via samba-technical wrote:
>Good Morning Jeremy,
>
>Im building 4.15rc0 today if everything goes as it should here.
>Already started on it's build depends...
>
>I'll include it in the build.
>Do you have a bug nr so i can add it to the changelog.

Not yet. I was going to create the bug once you
confirmed that ceph doesn't work :-).

Let me know if you need one first.

