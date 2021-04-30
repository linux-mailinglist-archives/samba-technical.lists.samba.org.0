Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4089436F829
	for <lists+samba-technical@lfdr.de>; Fri, 30 Apr 2021 11:53:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=mcytQ+8PaOj6/NyrhpKNq6YDm6Ajek2MVTQbCB6ruI8=; b=M08j2oLbdh/ZimbVQGsPiNdQOz
	GL+zhcaWP3eae0YwgDYpvx/J9wCFsNyEkzwlAswNXSgFsiRzaqqTUgWDWObnXGpFbi4iGKJlO+STT
	rE3j3oTAt31hvX7u3HhRWT7YC2Jl0+mUfXoLKH6pWfLzAHTnrKVcLd5wEhI5hTfbtnw0wppxTx4bs
	1HT9vQBTWuCPD87sATbwDr3wbdnzxp+qS/BbxMymuCf5YOHbcbDAOoPc1cvA+g5UXLzWecsu1uBsZ
	iRsytz/egZs+Bj98B4xpS62eWLfzT6xB4BD/Ljix1Jp7A9RlJzBbNGrtBnPM8RQQQmXTUriSUVRQZ
	ecRwqvtw==;
Received: from ip6-localhost ([::1]:41968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcPpq-00DILO-U6; Fri, 30 Apr 2021 09:53:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15024) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcPpm-00DILG-Ad
 for samba-technical@lists.samba.org; Fri, 30 Apr 2021 09:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=mcytQ+8PaOj6/NyrhpKNq6YDm6Ajek2MVTQbCB6ruI8=; b=DhuWT6NF40tBhMs1KrAhCKhpzK
 h06nfmlVjTmqNyc0QZJTKvTInGEB51q0HEIuio+QhWm4jGWFOihmDTKFpGYTDJXWyL9N+BJB2uVKD
 M7LYWpzRRAtHuj0rbgO3NekDUeqy6QyRhntm5w+oEl+/PxB4lDuYsrqHSz324RAb1zPiQio217KeU
 PuVrN+3wSgfY1bZoe59hfY371qE8GchLEuNY8PkHzl/QFpFbMEX/K6MoWbnoF4FdQ4hUQWGjN1I6j
 XJbFFIuHbZwssC4Me5UBzJu4csCyV06mkOY6UutS3fPAGaT9uJBfDnIEz3Y5SSwAQiUnpxzfKgUlQ
 z1bDlJpFtvSLTkFbBYMdbW9KAB1+X1k0/c9HF+Z89fvxv72lRrSgX9g/hASF9heYjJwojBd8NqDLV
 ROWQVMPZEfA72qo6/JgF3l1G4pa0dekpB42y3XrlGuGWTk7ye6fUOTNrJ3BSeJjug/oX/RbLrLIm3
 /PU4g2IIqRKg+RgQ5aWmsiLz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcPpl-00086y-9y; Fri, 30 Apr 2021 09:53:17 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: Fallback to NTLMSSP allowed if KDC is not reachable?
Date: Fri, 30 Apr 2021 11:53:17 +0200
Message-ID: <17822891.NNXsROtQf7@magrathea>
In-Reply-To: <CAHbM3qj_N3XKNC0q3nfmkqjDsGis+rRd8eSRUjs2LWYrUNZZyg@mail.gmail.com>
References: <CAHbM3qj_N3XKNC0q3nfmkqjDsGis+rRd8eSRUjs2LWYrUNZZyg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: Shilpa K <shilpa.krishnareddy@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 30 April 2021 03:38:44 CEST Shilpa K via samba-technical wrote:
> Hello,
> 
> In one instance, port 88 was blocked while port 445 and port 139 were
> allowed on the DC. In this scenario, when we tried to execute 'net ads join
> -k', it was not working. But, with the below code modification, it will
> fallback to NTLMSSP and works. Is it expected to fallback to NTLMSSP in net
> ads commands if krb does not work?

'net ads join -k' without specifying a user/password, means that kerberos is 
required!

If you specify a username/password it will fall back to an alternative.

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



