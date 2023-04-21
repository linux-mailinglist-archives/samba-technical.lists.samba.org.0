Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B306EB1C2
	for <lists+samba-technical@lfdr.de>; Fri, 21 Apr 2023 20:40:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Xu/A0sGZABzTtCZ5T1EI8r0dy3MZmrDAsQUyPMNdKJ8=; b=FoupyCcDfRwdGyR4rTmqO7uF5q
	iW7nODf7KTmRszqGuJOe41iJoc9gRAPcMV9H64HKDPDlt3ySAnhTBERazd8qZ6NJ2tPGQB2IuNQV0
	G3r/DlbHrhl2s49jeC4t+ROVb9YdJZ8JzDyo4ecfXKquT4j5HYwFuSIfXfdaIP8Yn9Wz+6p5HCZMz
	Klp0q1Z1TgZ3lV9xtzvyzVj7Ygdwu4GFtzH5uo0zGFwzYVHO9NCQMj76I3KgZgJwGFMuQwZJinxVq
	HBfoVGLpi56fm6R/bPu/U0CqTFRMBTAQrudyXlE9pSuCYv9BPoYQNgadH86FQSdGs63rVoSXsPfSi
	KvEEx4vA==;
Received: from ip6-localhost ([::1]:40946 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ppvfE-003Jwh-1x; Fri, 21 Apr 2023 18:39:20 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:42166) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ppvf8-003JwY-M9
 for samba-technical@lists.samba.org; Fri, 21 Apr 2023 18:39:16 +0000
Message-ID: <b6dfbc63d89715a1298117bc0afeb436.pc@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1682102343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xu/A0sGZABzTtCZ5T1EI8r0dy3MZmrDAsQUyPMNdKJ8=;
 b=od/6EJKJcn1yXwsU4vEpxhv++WsIFIwBxgLe2VSqk1MeH0oeGEKs2vgK7+7yh2ZmBNxZue
 tV9O3qB7eKPXoQfLxH50blDVQej7/vWfU1kKHPdQpPHcmk7TpESqT4fE3ZUCHNcEB5jriz
 Cbk7SPDRI5PjX7n1IcWNOoUmK5PqcZxllosU+sY1xuUxvVhsYWFvRZOIyQv8B+kAuCWh6m
 g98Pk8NC6kGphI5St5683Rj6hX8X0rRBdcuONOx+N+xxVNHG7e0Dg/60fUC4XmHDXK16eh
 cbHxZ+2dDlnBGStncBw8d00RFYq549Fts6wYfo//+UewYhNpOsoCOZor7tyPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1682102343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xu/A0sGZABzTtCZ5T1EI8r0dy3MZmrDAsQUyPMNdKJ8=;
 b=fXzXe3Gu1UkMJVoUdfLFJoMA8wATq2vY3FLKJh0yRyRNYi0ofDuN8Qqp6piSG8f9dxllsM
 rnQggNgCylYnLvsTS3lHYY+k59Kdvcv8vAONUt8aTQGsXAEikJX+CwJoqpHMcpEJlOWii3
 ZTffFHRn0VD3zXIMwEzdLgRIxCYEEG33HFA6gTc5Dd8ab85xKn9/bV+fUJ2ExLBwJPNiPb
 mUO4VdOtvJ0yXsWjN5jLfnGv6W8af6ahk4qESjXFJmaAul5Sv4ui5uBe1GLNMvUxTXCCrO
 dADfD+QWdM6jqgKz/T+mfWAi3r4Zg6Xc6iEoUvqVkYJET+cssJ7JUHBC33Bk2w==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=pc@manguebit.com smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1682102343; a=rsa-sha256; cv=none;
 b=CcghgD5TFQ9bquEGIUo3Cd1UvctPVoaIo8l501jebbUbUY7XjxeXPssmjZ4SHKgK4XcXLB
 s2qOzvI7KBOT2PQ/lMVuy9XZJ8SI4/BnCHiSOgGsx63m2VPQXS3ntZqqqoQ+8lmscrOwbT
 EcvDRl2khXG8z4Tum/Yz8AwKcJBXnvfkeq53LsT8DalBiZE7PiUuZfM3Tfi4uc6BFmCiRm
 4ARwfkjpYJe4mUxvtg0RtDsQy+2ChxZwr0A1RXrC8zmiohxd/0JvGI7ibX4PPsA1n7hySX
 jdwOKzsgJuZOHmEc1Ms5wH12+eykvcKU8A802psCx/7AIAcb8+YqRSqH078E0Q==
To: Tejun Heo <tj@kernel.org>, jiangshanlai@gmail.com
Subject: Re: [PATCH 17/22] cifs: Use alloc_ordered_workqueue() to create
 ordered workqueues
In-Reply-To: <20230421025046.4008499-18-tj@kernel.org>
References: <20230421025046.4008499-1-tj@kernel.org>
 <20230421025046.4008499-18-tj@kernel.org>
Date: Fri, 21 Apr 2023 15:38:57 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 kernel-team@meta.com, linux-cifs@vger.kernel.org, Paulo Alcantara <pc@cjr.nz>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Steve French <sfrench@samba.org>,
 Tejun Heo <tj@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Tejun Heo <tj@kernel.org> writes:

> BACKGROUND
> ==========
>
> When multiple work items are queued to a workqueue, their execution order
> doesn't match the queueing order. They may get executed in any order and
> simultaneously. When fully serialized execution - one by one in the queueing
> order - is needed, an ordered workqueue should be used which can be created
> with alloc_ordered_workqueue().
>
> However, alloc_ordered_workqueue() was a later addition. Before it, an
> ordered workqueue could be obtained by creating an UNBOUND workqueue with
> @max_active==1. This originally was an implementation side-effect which was
> broken by 4c16bd327c74 ("workqueue: restore WQ_UNBOUND/max_active==1 to be
> ordered"). Because there were users that depended on the ordered execution,
> 5c0338c68706 ("workqueue: restore WQ_UNBOUND/max_active==1 to be ordered")
> made workqueue allocation path to implicitly promote UNBOUND workqueues w/
> @max_active==1 to ordered workqueues.
>
> While this has worked okay, overloading the UNBOUND allocation interface
> this way creates other issues. It's difficult to tell whether a given
> workqueue actually needs to be ordered and users that legitimately want a
> min concurrency level wq unexpectedly gets an ordered one instead. With
> planned UNBOUND workqueue updates to improve execution locality and more
> prevalence of chiplet designs which can benefit from such improvements, this
> isn't a state we wanna be in forever.
>
> This patch series audits all callsites that create an UNBOUND workqueue w/
> @max_active==1 and converts them to alloc_ordered_workqueue() as necessary.
>
> WHAT TO LOOK FOR
> ================
>
> The conversions are from
>
>   alloc_workqueue(WQ_UNBOUND | flags, 1, args..)
>
> to
>
>   alloc_ordered_workqueue(flags, args...)
>
> which don't cause any functional changes. If you know that fully ordered
> execution is not ncessary, please let me know. I'll drop the conversion and
> instead add a comment noting the fact to reduce confusion while conversion
> is in progress.
>
> If you aren't fully sure, it's completely fine to let the conversion
> through. The behavior will stay exactly the same and we can always
> reconsider later.
>
> As there are follow-up workqueue core changes, I'd really appreciate if the
> patch can be routed through the workqueue tree w/ your acks. Thanks.
>
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: Steve French <sfrench@samba.org>
> Cc: Paulo Alcantara <pc@cjr.nz>
> Cc: Ronnie Sahlberg <lsahlber@redhat.com>
> Cc: Shyam Prasad N <sprasad@microsoft.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> ---
>  fs/cifs/dfs_cache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Paulo Alcantara (SUSE) <pc@manguebit.com>

