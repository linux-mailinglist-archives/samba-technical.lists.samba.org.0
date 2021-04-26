Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB32C36B68A
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 18:13:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mCQIKu29zNr6buVzF2SR8Ezkw2x52heVt36mAEmjfeo=; b=qvhnU0Ohv970e81+mQdzVEcwwK
	aCTwjYHSgpmsy5CQLiAU7apGQ1qaRkTiguCPtLd5S5Hqh79fgU/2gxg72Ijz6watYJ3iFJmKn1ngq
	ZcbM5gGtYTmo7ZitXXjGPQBe1OOKDbhkaGK8VrMx/eEY31XQbTwTyI3OaUCD9s6JmW/pH7EowoY45
	3a5ixw4CwVI0ODTzPl3tuOwXlo7EvJ20Bc8YN9jsq+Tprr12sMq8fqEv7la2cK6VqKF+bSEmeJqRJ
	12T/x5ZBMYvH5Zx2IVdHZnvV7rOG/5R8ySPLD6Mtx11oQPaCZRdkTfrJ1t6R6C9zufXTJkJMfKdjK
	dR0QnfFQ==;
Received: from ip6-localhost ([::1]:64212 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lb3r8-00CVk7-VQ; Mon, 26 Apr 2021 16:13:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53028) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lb3r1-00CVk0-Fr
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 16:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=mCQIKu29zNr6buVzF2SR8Ezkw2x52heVt36mAEmjfeo=; b=u1CcDpuF3fwpdSQyctIVDc9rtn
 klhYNGZYDWhFGIL21RC5ge9Tfigw7jdbX2Rj0O831Og3hMZnKAYti0wfz9je84w5PlSBuRUFhmKQA
 gbJoapysPpsQjLwAeq63/HgILxcExokHGR7oKpSBPygXf8Pqh0ZNKQVU0YXUMwv+dz61d+k2qMBXr
 8kmJu060U/cvZRqQsz6WtHhCbjapKuhiPzKYq/HAbQfFhCnHWD64hElCLtwc2wHvOZrrZYz5m7GdX
 I5NxaUpe0MkGyT6v3EnyrZ/zb5DPsgaftqEaQVdzVYpONnDxylrVE4xv64eZMgDQZbCYdnqpa2LWS
 A6H1JSondoWgFU+HKSgKDruUjaRsNLNU/sxXM+34YiZ2V2K0S4zEsBf8//YfLQPd/AD6i+7rcii9c
 Oxg8j7j58FWXA5fE4BBT/fi+0fu2ZhcSAS1XpsVj8VNzswnTRaJKn+inMBuRRw7Gt3Bt2GXjm2/nA
 M9VD7nF/O1eDg28PxMWTvCQB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lb3qy-0000cv-M8; Mon, 26 Apr 2021 16:12:57 +0000
Date: Mon, 26 Apr 2021 09:12:52 -0700
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: Ubuntu's ADSys
Message-ID: <20210426161252.GA414366@jeremy-acer>
References: <cb13856c-400b-7670-03d3-4db23248baca@catalyst.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cb13856c-400b-7670-03d3-4db23248baca@catalyst.net.nz>
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

On Mon, Apr 26, 2021 at 10:27:23PM +1200, Douglas Bagnall via samba-technic=
al wrote:
>I noticed that Ubuntu 21.04 was announced with "native Microsoft Active
>Directory integration":
>
>https://ubuntu.com/blog/ubuntu-21-04-is-here
>
>It looks like this is based on a project called "ADSys" (GPLv3, written in
>Go), that works as a GPO client.
>
>https://github.com/ubuntu/adsys
>
>They use Samba in their tests, as far as I can tell.

It also uses Samba libsmbclient to fetch the GPO files
=66rom the server.

Go bindings for libsmbclient are here:

https://github.com/mvo5/libsmbclient-go

