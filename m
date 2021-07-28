Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 286E53D95D9
	for <lists+samba-technical@lfdr.de>; Wed, 28 Jul 2021 21:06:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Wo0YZSe3Qs6OVQGEx40HJyS8WcyB4lhcBurd+t+h8gc=; b=G6e9+wB6zZgrA3phxBoPkMLHVD
	4wkmnh48wxZu94Ycri0pRwJbbvKAbOf4tHrfhOiecl8svih2ryA9JVZ3CQL9tMe3Nc0DVF+uUkvWK
	CymPyhi8/EtFM3tIWrtf6rk5fHp70gQbXpnKlCRJd6AEFDurniiJjBjucSO/9cUEJx0mfZ4mQyuWn
	DfhHUzveMj+LprO2I8RbWH6I0nklLPk9btqmCDbDbcEhEi+JYO9TMmzOIdaSPT2FJbx/7fxpRdcsG
	mdzsmMB5mvB5/PDcj19nTvgfS98pl9IBH2bYjKbxKHT0pNK4pjNxdJBtMcwWka3D6fL7oQYPC46Bd
	hfXeMZXw==;
Received: from ip6-localhost ([::1]:20244 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8osZ-001Oko-As; Wed, 28 Jul 2021 19:06:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35960) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8osU-001Okf-1o
 for samba-technical@lists.samba.org; Wed, 28 Jul 2021 19:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Wo0YZSe3Qs6OVQGEx40HJyS8WcyB4lhcBurd+t+h8gc=; b=ELjmUnVNyo59xObQ3T8GthsVOa
 fxXLDA58gXRVmnbA0ywXs/An72obNxrqcvHjdbLMtcqgiAWZRJsQfKOe9/3voSJPYpx+BSU5fUtB/
 Do01iWsCgUJFt7cmUH+YNQfWZh3gx/5cQppsxQXXMPv3w04to2TEuA/v8G+4+QlXKUBrX1BLHdYPX
 LnvYKa/tDUUH6HJZ9bbgzEthKgkSYcJTZUvIKnhIAQ2qpq8rk5yRXgnzEUXGATyumuOiLP2II1J7N
 U7tpXnLp6T4V/pjAvVkz1LPJssc8dnYZi3CeD+tVQVqXhpfgimkoELG1I07bBGXJ6hLGK93TCvr1d
 WXh70kavQkeA/IN/+RirL8myOYDRIU4EtjBv7GY5YAILTsJE+Pl7ilXvwUkHeI7imoCVYV96YIZ7W
 Wr4VfrGp12pp3ErzGN1S+kUmJwDf0Qh4djADLcDY4/ibMBY7xeT9OQbPzCHDxoYNbX7xkFIxdhGGK
 6KtKwF8s/LQhFEEaoSrZysUC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8osS-0007VA-E2; Wed, 28 Jul 2021 19:06:00 +0000
Date: Wed, 28 Jul 2021 12:05:56 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: CTDB issues with locking.tdb with some workloads
Message-ID: <20210728190555.GA35148@samba.org>
References: <CACyXjPyWrBpuLspUO4tYP_Qxf=av8Hzu5B-gdsrnQ1yn_gtrRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACyXjPyWrBpuLspUO4tYP_Qxf=av8Hzu5B-gdsrnQ1yn_gtrRQ@mail.gmail.com>
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 28, 2021 at 11:11:36AM -0700, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> One of the issues I have seen with CTDB relates to certain media workloads.
> 
> For this workload, the customer has several hundred Windows clients
> that are processing data and writing to separate files. Each client
> typically writes to a different file and rarely writes to shared
> files. They sometimes do read the same files however.
> 
> Unfortunately, this creates problems with CTDB where we see lots of
> logging messages saying that CTDB is having problems getting chain
> locks, often taking between 5-10 seconds to get a chain lock.
> 
> As a result the workload slows down intolerably and some sites switch
> off clustering altogether and run the risks of corruption.
> 
> One site I am aware of switched off clustering and joined each of
> their Samba servers as separate member servers. They also had their
> Windows client connect using something like DNS round robin.
> 
> In this case they were not protected against multiple clients writing
> the same file but since they felt that was a rare occurrence they felt
> the risk was acceptable.
> 
> The problem seems to be that there is a single locking.tcb file that
> handles all files that need locking coordination. If there is a lot of
> write activity there will be a lot of activity on locking.tdb and it
> will move to Samba node to Samba node.
> 
> Perhaps one way to alleviate this issue would be to separate the
> locking.tdb into one per file. Unfortunately, if the workload involves
> millions of files there will be millions of TDB files.
> 
> Perhaps the workload is such that each client operates in a separate
> directory, in which case we might have separate locking.tdb files per
> directory, which should be several orders of magnitude lower than
> per-file.
> 
> Has anyone thought of these issues before? Is there a sollution?

A likely scenario is that all Windows clients open the share root
directory for notifications, and that creates contention on a single
locking.tdb record. The time_audit vfs module can help somewhat
pin-pointing that. If that contention on the share root directory is
actually the problem, a workaround would be setting:

  fileid:algorithm = fsname_norootdir

Christof

