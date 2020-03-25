Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BC6192182
	for <lists+samba-technical@lfdr.de>; Wed, 25 Mar 2020 08:03:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=0u6N6+HsNeAaU5TmvWyL9kDd3kE9/f6hWvjGnX1Xy8g=; b=jq7nHWdqjiha+RkBAafDtiHqzH
	Fg1vKpPUsAiiyqg3wsH8zGJmLzlEzIjmb9iflM9yO1LPcPm3T/PVPjPQ8aw+8SDjhPJ2Pl0Smd1pC
	93wnYK8aaEx7mZxbRmQwtL2A6dq7EGsqIr2EmYW5TkZTKbr4PeLl5uwMee8QYXeXUEe8pR8jqtUI4
	mXqdrgWh14Et4RIVlJ3zYtP3v0mkfJmVv4SvJFRMTwFlO1B4ZBtINY8pvQZ/nqPJrZA0G45H0OWWk
	3tvOnNvVafQvmL1+BBqqIkV3eI/Z+J0KOYtBIFc+AHkEmDnBiOU4NXjKU6xRtaWbleVvQYnyixgg/
	ysYrTZqA==;
Received: from localhost ([::1]:27158 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jH03d-000exc-Pa; Wed, 25 Mar 2020 07:02:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60134) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jH03R-000exV-0l
 for samba-technical@lists.samba.org; Wed, 25 Mar 2020 07:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=0u6N6+HsNeAaU5TmvWyL9kDd3kE9/f6hWvjGnX1Xy8g=; b=GcVuM1e4IydPiCVa+2mFWWbfCq
 MYsvAQLKj6So5XtES/fXUbz+HwJLxq7COJhYKbrI9h4EFfLlxLHaJEM+W6EDXlgtdott0zCy+a56I
 Dx5veD6k1ywnoD8omdBPluFy1NAEQn8dLIcJN/lxugdODgNDoejkHhRnUfdK1RltI/lR9CD5lhcq0
 LpK4emD6Uy25YAlkAOxPVLQD0axMMIqHIZNsXPi2l9AvDJKj/n0yDOqPpRg00fJuvY7Y++RCgH+Nw
 vBQ/QADV67SOntJ2YQMRHhIu9g/wwE60P/+B9lFEaEnFyrkXCUWPk8QMcnmoJkyAv89XZN3UtAXn3
 SJpfHrd/qI7ETnqIlKSURmQ6xlNdaW/Px2vCUvYYUQ6gTyq4GF7f2vJN7PZqACVoEkLNCG2I47A3P
 STFWZHF6TBLsu4EZJ8IiLNI1t6WCKtPuPqpKpnfmLWRyxC7FOb+t++uIApgd86FZLfLfnhbpp217P
 dHa6S1T8KGOZ4sK/y8dLaQvl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jH03P-0005bq-Mv; Wed, 25 Mar 2020 07:02:19 +0000
To: samba-technical@lists.samba.org, David Disseldorp <ddiss@samba.org>
Subject: Re: git signoff+ and review+
Date: Wed, 25 Mar 2020 08:02:19 +0100
Message-ID: <3108280.U1x5aBp6Oi@magrathea>
In-Reply-To: <20200324125146.0479f8a0@samba.org>
References: <2070261.IvKQ8U6GgO@magrathea> <20200324125146.0479f8a0@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 24 March 2020 12:51:46 CET David Disseldorp wrote:
> Hi,
> 
> On Tue, 24 Mar 2020 11:00:11 +0100, Andreas Schneider via samba-technical 
wrote:
> > Hello,
> > 
> > as a daily task I have to sign commits and also add my review tag after
> > inspection.
> > 
> > As git-filter-branch has been deprecated and the replacement is
> > git-filter-
> > repo [1], I've written some really nice python tools to make my life
> > easier.
> > 
> > In a git repository I and do:
> > 
> > git signoff+            # Add my signoff to commits I authored.
> > git signoff+ --by metze # Sign commits authored by metze,
> > 
> >                         # because he forgot :-)
> > 
> > git review+             # Add my RB tag to commits I'm not the
> > 
> >                         # author of or which has my sign tag
> > 
> > git review+ --by metze  # Add review by metze
> 
> These look helpful. Keep in mind that git comes with a built-in
> interpret-trailers command, which is also pretty useful for this (and
> handles duplicates, etc.). I have the following in my git config:
> 
> [alias]
>   # add a Reviewed-by: David Disseldorp <ddiss@samba.org> trailer to top
> commit msg rbm = "!f() { \
>     t=\"Reviewed-by: $(git config --get user.name) <$(git config --get
> user.email)>\"; \ GIT_EDITOR=\"git interpret-trailers --trailer \\\"$t\\\"
> --in-place\" git commit --amend; \ }; f"
> 
>   # add a trailing Reviewed-by: $1 trailer to top commit msg
>   rbo = "!f() { \
>     t=\"Reviewed-by: $1\"; \
>     GIT_EDITOR=\"git interpret-trailers --trailer \\\"$t\\\" --in-place\"
> git commit --amend; \ }; f"
> 
> For batch reviewed-bys, I use "git rebase -i" and run "git rbm" via
> execute hook.

'git review+' is doing that for you in one go. It is also really fast. Also I 
don't see that intper-trailers checks e.g. the author of the commit.


git-repo-filter is available on Fedora and openSUSE as a package.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



