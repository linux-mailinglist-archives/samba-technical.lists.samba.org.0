Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A7041436ABD
	for <lists+samba-technical@lfdr.de>; Thu, 21 Oct 2021 20:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=WO3TYZ4C4X/gncJcMbTdkB09TE90S2S4LSk620WwxR0=; b=rLkKjwG41oPzRPJd14Sx3zH/v1
	ChVynGcRS1GS/HqlZXJF8qLO7K01XIO0V3gxtGKg45uo1J7gmLK5ssAVClPD67WfP4yp0FZaxzl2c
	Ln3k+xuaEO+tibb+blMCW3bHbmBzKbIqJVKIqxeA0QORid9g5QEjte05UPp2Q4q+TDMSDlnfnzd6b
	FZzvu7XToMw/d3SjT8sRt+ZH+dxR+8U5UQf8JcxtXz0ei2qcgZM2w8GqodfZgpeyaRBpGYFtHHblr
	3ktNaRoP/BMvK4IwyF7xJMQ9cUXNhM5YZj1p9miFyG3ocIkyEF+zwWFKZLJHujkeLqrl6SuWtjHdQ
	EgiOfwqg==;
Received: from ip6-localhost ([::1]:61560 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mdd0U-00Azm8-TX; Thu, 21 Oct 2021 18:41:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56570) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mdd0P-00Azlz-Fi
 for samba-technical@lists.samba.org; Thu, 21 Oct 2021 18:41:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=WO3TYZ4C4X/gncJcMbTdkB09TE90S2S4LSk620WwxR0=; b=l5m1sV7fLg8U+lCjGIBj4BWmCc
 fO6nZ+2MhD2M7iMag2uWDbEAlNKGC6MwMTpv6Db61Jao4/EaXaW/+5Fva3o40uMjXiZWZpqt7u+o6
 M4Pq7pwEp0b8hzTZV5g/ytg3Kydi6G/Gt1WXr07g4Y3AJqrMXla2CUZbkEEHnimugdfoha1a4tcmq
 VDPMEHYMrLW5NiqK0dcZTe5TmMdzmMuh/9vU3Fe7OVVUxJvK0PMatiDehtJKJDGNlSlALYAnWK/uI
 XoAi+aluBNE1v921AxFbsMnyWShLr1IKVY6vP9J+tGf/URMvn58kFvNEsiEymXABC9GO+ulK8uv17
 yvoOxzxEaMF/qeMCvR2HAoLF/w3E9o138b0GxZPYJKqryZtDyGyGk7oJeUr9Ynqv+B6F58fzKA8EU
 p54KxMnFqsQaTypJzmvidPdkLE+ConIpjamI4oJO5LlhfDttpghO1b+IJGgLjbUDxG3KqhIzCfiKo
 X7dDskZiJL36lfWpfyLVgTYD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mdd0O-002aJZ-GR; Thu, 21 Oct 2021 18:41:32 +0000
Date: Thu, 21 Oct 2021 11:41:29 -0700
To: Pavel Filipensky <pfilipen@redhat.com>, samba-technical@lists.samba.org
Subject: Re: directory with a symlink pointing to non-existing file
Message-ID: <YXG0WUXsDFpmFVZr@jeremy-acer>
References: <CAEcb10tdLGRKeBs-D+n=JMFGbtNMk6815TA09QQyWXUcnSAsEw@mail.gmail.com>
 <YXGd6x6nxD4pHj6l@jeremy-acer> <YXGh+Mp1s/oMnHzU@jeremy-acer>
 <YXGyEPiGNwaXyPln@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YXGyEPiGNwaXyPln@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 21, 2021 at 11:31:44AM -0700, Jeremy Allison via samba-technical wrote:
>
>Done lots more investigation on this, and it looks like
>recursive directory deletion with veto files is broken in 4.15.0.
>
>I'll log a bug and fix..

The second bug here is that when "delete veto files" is
set that you can't delete a directory with dangling symlinks
as a dangling symlink is an implicit vetoed file (it's
never shown to Windows clients).

That's a second bug, which I also have a fix for, but
I need a regression test first.

