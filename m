Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB53826BC25
	for <lists+samba-technical@lfdr.de>; Wed, 16 Sep 2020 08:06:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=QMR0aerBK9R2Qhly3tk9gABokEtf/Sj3N6MAFEpIE7E=; b=PsRsbOSVECyDJBlwm1sEzxjbT1
	yQ46xPsYSFOmP0pREkpdnxjWL4HEzjg1duMxN5qLCNhUdsWoEoe6kHGklbAI//CHXiI+EbqmhGMeK
	b8cPxOiemBoOILLRl8zPnMz+T3jkhyAycB9F1f2ES/LShdsIOhlirYPAZjR4y4EMvD43Qdu5BpVcu
	CVXlhK5xBAf6X+KoRLWR3m0fBVo84dW8XieTGgUWXfJx1mNBEtLBVedvEuzwWj18hM6FNeJIUNn64
	2KRoq+ESQ/jxg0ErcRHyLWWNivvHsJORJLAXFKrJaIO4VxwIykztvQb0dzdzesDZsI60as3gC8ejU
	NL/Udcsw==;
Received: from localhost ([::1]:41110 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kIQZu-005esd-Tj; Wed, 16 Sep 2020 06:06:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63072) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIQZp-005erb-2s
 for samba-technical@lists.samba.org; Wed, 16 Sep 2020 06:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=QMR0aerBK9R2Qhly3tk9gABokEtf/Sj3N6MAFEpIE7E=; b=LQcAmaa6tWAneSO5jxjn2udgKg
 2NAj0AyWBMWfeMLHew7t7FEQBQNezo1rrxxeuFaMYTLQF4robpmC7bh/G7JBKONYkCwOgTDZwy2LK
 RBxaJe+6eUKyl4WO9UQVlSDU9qAZnV1d/cZvwtTzecivIgBn/1DkDxlzXaH3JOBRxgCp6DGqy9ZSj
 UEsOGBS2AZeUzrKCFs1/iIsNPeBbP3kHr0ohYbgqO5CW+dEooUITVtJI2Ywflqeqy2tnwGMKscCYi
 7PXQ3o+K2P5Tb7P/ElC7QqQ3klQVa2jSmOTkMFo4XjGNv0UB/5EHxblDZvKNTYRrrjfpg7oyUkZ7K
 ORNMcZkAtxLtqgBF1z+qWv4YL5+pATi84rHhx3K8BPxGZT2E7KmNNh/EWZAvnwYPdEZqcaLETodUz
 M2CpM/0ayVhoejH/j1UmnnU7BcVSTudT1lUU9vpHxiw1SJoqQi5ywZZ7LyK17yguOHmQFhpYB/4W7
 aGY/G50rjMjxR3wShX3i7oO6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kIQZo-0007u4-8r
 for samba-technical@lists.samba.org; Wed, 16 Sep 2020 06:05:56 +0000
Message-ID: <9d9c4df7515cb1c42b00e935effd3b91c6c576ff.camel@samba.org>
Subject: Re: Ideas (other than just mandetory schannel) for ZeroLogin
 CVE-2020-1472
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 16 Sep 2020 18:05:52 +1200
In-Reply-To: <d415684468ce9d140f570791f6a4d560df9bb7da.camel@samba.org>
References: <d415684468ce9d140f570791f6a4d560df9bb7da.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-09-16 at 17:51 +1200, Andrew Bartlett via samba-technical
wrote:
> This isn't on the bug
> https://bugzilla.samba.org/show_bug.cgi?id=14497
> because it isn't at that point yet, and isn't a MR as I've not even
> compiled it, but ideas (done with Gary) for mitigation for those who
> must run with schannel are:
> 
> Ensure that the password set via ServerSetPassword2 is of non-zero
> length.
> 
> Check the password does not have zero bytes in it.
> 
> Check that the challenge in ServerAuthenticate3 does not have
> repeating
> patterns in the first 3 bytes and repeating 0s in the computed
> response.
> 
> This should make false positives pretty rare, while working with the
> failure mode of the cipher.
> 
> See https://www.secura.com/pathtoimg.php?id=2055 for a really
> readable
> description of the issue.
> 
> I'm going home shortly but will keep looking at this and will be
> available tonight.
> 
> I think Samba 4.13 should ship without the option to turn off
> schannel
> - just remove it, assuming we can make the tests still go.

We could also make ServerSetPassword2 absolutely require schannel for
'server schannel = auto', impacted servers would still be able to
ServerAuthenticate3, just not rotate their passwords.

Andrew Bartlett

> Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







