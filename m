Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DB056ABF284
	for <lists+samba-technical@lfdr.de>; Wed, 21 May 2025 13:15:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1h+QDEXjl+6Uj3sYQGXpGxXO533DIPweohyulNA0m4Y=; b=M/AOOOSBWcqgHnbK4bw/+yahRw
	4jUznaOYn25RaG97MnwgUr3J1Sj6Fq9eESTimDIR9/MVtfkt+mpENQy174B949qrgFAIBGrvwUBkG
	mch6AI8/J9Y7ImcMPCmrUquvwODzC3ibbNKJSih1ckbz2F13I7VWMjWKjjlTiCXYOLkWjft5k1AFV
	u/0lEfmY4AInMQN3G67hqjZtvG9uAT9Zcxbk87/D7E8eZ6bbwt16OSGryOzJ6guxxX7CQg4TOF5Yy
	ZRFTDsL5jLlAevlaK7VAbFBttev0pOSQtwx0stGqhHeFwIcXk7D4VYUwQq8FIfXPud/pbJm+bcN5b
	lUOroY4w==;
Received: from ip6-localhost ([::1]:48406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uHhPK-003ypx-7v; Wed, 21 May 2025 11:14:46 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:56346) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uHhPC-003ypp-US
 for samba-technical@lists.samba.org; Wed, 21 May 2025 11:14:43 +0000
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-af51596da56so5032279a12.0
 for <samba-technical@lists.samba.org>; Wed, 21 May 2025 04:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747826076; x=1748430876; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=F+zdTgRsoA5ltOcvBAPa/sPnp7DNX9MKAtDp4oMFg1M=;
 b=lu6WmSa0RXsr9whv8feh0vsIIPGqoV251J10ls2IgRHDVGrgGA1MgmXr0neLMugkRw
 yHjB9/XrvPzstUPgoQeDU/lF40vEIpTBuMXY/1A5LDY8T7D1uvdvhrIcuAQs4QygLc/Y
 z41nxIyUTtja6Vt+wI7mvXihICnanbofpJxmlDBv2PBrx4UrRZR95rAvkB19JcwzT8fl
 PH7OPIo/Kn/cxKJnBWzS9YtwWSWItvAaXZ20dWBeIND6PYESDtJuZv50JmuhWRyNMhDU
 tkZAIdAmWrLBRlcgreCtimLsWKVMknSkRdYDDnx+1hByjLu7osaB7/JppXFsh5KN0kf1
 uVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747826076; x=1748430876;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+zdTgRsoA5ltOcvBAPa/sPnp7DNX9MKAtDp4oMFg1M=;
 b=vMCADJYU91EG+g6FOVHPZqxt9V7PD99VEuHpgijIK9lf3XJFFHGIqz13erKzi7NWA9
 /YhVHtRT8CfVIIN+g7iNDKHVWF446K5iVq+MOt3P8/7piQ/A8SOfhIQJ/yC4Q/1k1Ld/
 xDyd9kA1lmK8aOkEkOgYVwQ6zA9tnHZhKQPFJJoTHhQ1fOeUb0+ke3IwoC95Pwn7ViZb
 PYXEVZI9yva3WnkxCnBRv4XVo32LydaCrzsyODYEXUFU1IQ1A8Nh5imoImnsgQR8HSnT
 ydQ1R4f1iWPXenDUEu+R9h7w/gwJ4FmlshDzPgHfny9KR0tNuC7+eoNF7lYOYoJt7Z1b
 qfZQ==
X-Gm-Message-State: AOJu0YyjubwCVlKogCP+SqIZt/Y3SS9kFF106QAhhxPFAKyC5tnjWpFr
 PjWMSBIzUbXkk7CU32eCAG5vc6EXsPRaKX2LFRfWn0JI0meDnLxqce2M8tILwKrCHb3stTPbHXk
 t0sOL4x026wiLZWjjyQHm3SIx6+IVuYt32Q==
X-Gm-Gg: ASbGncs6S6z6loLhvVMv77LS9+4IYXsKNbJ8DnR69oXDAi13V95W/eMmUkCVVwHIEnf
 +05WR7OZmjw5ZoXqUey0icXxCr+D9QeMwG++GBLOzU/InIjzwyKQysmRTxV4rlU7SodrEB+8I6H
 2XzXcfttDZEQE7H4oifQAhdugEzghmggMF
X-Google-Smtp-Source: AGHT+IGPOk3aDvazgHZ8shwOabkIoANR7xlaZQvI3eyXZ8nCq/SPyAj4gyLB8k2gRmBRD5uZhAAAv6WC+KwIfvxm07g=
X-Received: by 2002:a17:902:da86:b0:220:cb1a:da5 with SMTP id
 d9443c01a7336-231d4596c6cmr305937795ad.40.1747826075886; Wed, 21 May 2025
 04:14:35 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 21 May 2025 13:14:24 +0200
X-Gm-Features: AX0GCFv5L8ILrfNQfqWKNROoT9lZCgc3CkVNLXLQAy_jm4XaoPlsUDdBQ9VPJms
Message-ID: <CAO9H7P8386LOjJPbxSicuDFO-yQ+ofZyFv+Vz_28JnntkMrkcQ@mail.gmail.com>
Subject: CTDB performance issue
To: Samba Technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Xavi Hernandez via samba-technical <samba-technical@lists.samba.org>
Reply-To: Xavi Hernandez <xhernandez@gmail.com>
Cc: gd@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I've been analyzing a problem where CTDB does many leader reelections
because it loses the leader broadcast messages.

It's not always the same node that loses the broadcast, and it has been
confirmed with a network capture that the leader is actually sending the
broadcasts, and the nodes are receiving them.

Based on the data we have collected, I think the problem is caused by the
lock helper processes that CTDB starts to wait for a mutex in case of
contention. The data shows that there's a lot of requests requiring TDB
access (mostly create and close), in the order of 1000 per second. However
we have seen that under normal circumstances, very few lock helpers are
started, which means that there's little contention and most of the mutexes
can be acquired immediately.

The problem starts when a global operation, like vacuuming, is started. It
acquires the global lock of the TDB, causing all requests to contend. This
triggers the execution of many lock helpers, which get blocked. When 200
(default value for tunable LockProcessesPerDB) lock helpers are started,
CTDB stops creating new processes, but queues them in a list.

Meanwhile the vacuuming operation is running. It could take a few seconds,
but every second ~1000 new requests are queued to run a lock helper. Once
vacuuming completes, the global lock is released and all 200 lock helpers
are unblocked at the same time.

This seems to cause a lot of context switches. CTDB needs to handle the
termination of each process and starting a new one from the queue.
Additionally, there are many smbd processes doing work. During this time,
it looks like CTDB is not able to process the incoming queue fast enough,
and even though the leader broadcast message is present in the socket's
kernel buffer, CTDB doesn't see it for several seconds. This triggers the
timeout and forces a reelection. The reelection itself also takes the
global lock (TDBs are frozen), which could cause the problem to repeat.

We are still collecting data to try to find more evidence, but right now
this seems to be what's happening.

Does this make sense ?
Any recommendations to fix (or at least minimize) this problem in the
short-term ?

Besides tweaking some parameters to reduce the frequency of operations that
require the global lock, could it help to reduce the LockProcessesPerDB ?
It looks like less processes would cause less context switches and less
overhead to ctdb, so it would be able to process the queue faster. Does
that make sense or this could cause slowness in other cases ?

If this issue is really caused by the execution of the lock helpers, I'm
wondering if we couldn't get rid of them. I have an idea on that side, but
first I prefer to be sure that what we have seen is valid and I haven't
missed something else that could explain the problem.

Thanks and best regards,

Xavi
