Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2285C857F98
	for <lists+samba-technical@lfdr.de>; Fri, 16 Feb 2024 15:42:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=wSCy6bUyb+5Lf26M8bgMUCBOQzAcOOuQlnyUvp7omTg=; b=q//gFD7kz0DKUh3dl1dOgd2NzU
	HqlrxBPFsxarA6ALfqsxwaZtnVqmZoiHm6YY17QV9xrJiNClym7n/wWS5pmTL2yKn8sBCKjqyazl+
	Eu88gnrEdDaUmBK+VU72N3QBcA7X5C6/Op+wvVDijTcqj7+4FQ4A9lmQKUAPMCMOJuiFHOieRn0tL
	/SFBwmvVX6iTC6iJAKJH0a+LKnvRTk+wIq8rNaxTdPCQzr88Dr+zcvn+5cLZ3PZUEI5vQsHwRwwZe
	QZ9DWhlM2FgzW2GbTcwQjJelX6Pq8igVwRJBzS218ga2VMn5FrAnVOqaW+FISujdZ4n+Tpaqccu8B
	fW6HRmHg==;
Received: from ip6-localhost ([::1]:28894 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1razPT-008i8V-Gt; Fri, 16 Feb 2024 14:41:51 +0000
Received: from mx.manguebit.com ([2a01:4f8:1c1e:a2ae::2]:41166) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1razPP-008i73-J4
 for samba-technical@lists.samba.org; Fri, 16 Feb 2024 14:41:49 +0000
Message-ID: <bc2eaf5b9eafe2134820d1ea8c07e43f@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1708094496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wSCy6bUyb+5Lf26M8bgMUCBOQzAcOOuQlnyUvp7omTg=;
 b=GxJ7MuPktNCL+1SpjlAHZ0LEX1T//G6BHYpsKTXBSnD2L/w5fUyhrlscc9SP8HIra9dHij
 avzSDI5cRgRAGFoKIgKgARDIQSM8Fg9ZXWbP4GynU+qyqJ5MN/yU2mVGt9RxB9NdVPuiO/
 ca4xXfiBtvzGk2+NIxUfuKBVV5JQJvowWAcwrJzW4cLGtUT2mVHUuaLgGmh6gsg2MxC7B7
 61OXNH11usQ47NtfaTqoLOUi/kgvjilzaauKUkIhwS4M+IQjySCITS5c4LUogm3C5Roz23
 5wj/E/YFi2OB9AgId09q78ca4JnGCrcjGhLaWL7aJeUrquHP2TP4Qyr3c62SBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com; 
 s=dkim; t=1708094496;
 h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wSCy6bUyb+5Lf26M8bgMUCBOQzAcOOuQlnyUvp7omTg=;
 b=b+tL+NrlPlAs9AxYLXribplHiqkAFnUqBPFfM03yTlkQ7RzRSWABYr/VTcZ8QZl7fKCIIl
 wy8RFEv5G7u8CBJFvh+nRqV6XX8kD8Ou+yGN2eAK8hzOc/8Tl9SzPQ3RAMecRlvpZ92rxg
 ffOBb8WcTID7Wmv+35kBqTweyyzfd7d1J48m99S+H2MFMv6VxJnSo57xt6uWzNoRZ7VJ04
 kBKNzBYeLWozGcsOYc7LMmxasZHP4MQR4vl9bAoqiLsrD0TPNFbu6UqGtjK+jdK1QQSTjc
 yhhwukaLwyZKXeG1FjPlpK3Om65QR/4C4bIyBgimjN1rflGV/xTk39d5HaY0XQ==
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1708094496; a=rsa-sha256; cv=none;
 b=MkfU8ZzD0nvb7BSpM/ixVQeTYfPO/LdyJqNO7Ocrb6nanCfmb3RbJhffrI3YMb5tefkv6l
 o64YIejAjtUrxfZJ0+RGcx9I+vpcv2reB7qAj6zrt+tEbRnoRhsB4iiA9MH79SJ7S6aKgg
 5pUPU4011R852ypY76nm26CHdqDiXt84MONl11gKCn/kvwWFYF7/5lYysdaLgvNYrZQOh2
 SZ+9aG4RWGGhgSq1dyfkByDugZFfdGbcybvfbGZ3veaZ7FahfTwxeXHlHfZvo7cMFEBLvr
 Phm3p0HzZV460i1ekneWBqsxtYOsAlcL7fKRuVXGuq38GpLsCG+c4FT2fk/oDg==
To: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <smfrench@gmail.com>
Subject: Re: [WIP PATCH] allow changing the password on remount in some cases
In-Reply-To: <CANT5p=oNRF9BAgybCX7dE+KvYj=k2G3tERa+fMJOY6tsuZ00Hw@mail.gmail.com>
References: <CAH2r5mtUnLDtwbW7or=Uc+AXkzLpHsJoPuoLE7yyjPVYjvZCow@mail.gmail.com>
 <CANT5p=oNRF9BAgybCX7dE+KvYj=k2G3tERa+fMJOY6tsuZ00Hw@mail.gmail.com>
Date: Fri, 16 Feb 2024 11:41:33 -0300
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>, Bharath S M <bharathsm@microsoft.com>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Shyam Prasad N <nspmangalore@gmail.com> writes:

> need_recon would also be true in other cases, for example when the
> network is temporarily disconnected. This patch will allow changing of
> password even then.
> We could setup a special flag when the server returns a
> STATUS_LOGON_FAILURE for SessionSetup. We can make the check for that
> flag and then allow password change on remount.

Yes.  Allowing password change over remount simply because network is
disconnected is not a good idea.  The user could mistype the password
when performing a remount and then everything would stop working.

Not to mention that this patch is only handling a specfic case where a
mount would have a single SMB session, which isn't true for a DFS mount.

> Another option is to extend the multiuser keyring mechanism for single
> user use case as well, and use that for password update.
> Ideally, we should be able to setup multiple passwords in that keyring
> and iterate through them once to see if SessionSetup goes through.

Yes, sounds like the best approach so far.  It would allow users to
update their passwords in keyring and sysadmins could drop existing SMB
sessions from server side and then the client would reconnect by using
new password from keyring.  This wouldn't even require a remount.

Besides, marking this for -stable makes no sense.

