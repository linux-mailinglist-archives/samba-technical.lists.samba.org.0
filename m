Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEB0812A87
	for <lists+samba-technical@lfdr.de>; Thu, 14 Dec 2023 09:38:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=zJv4oEdfvKMo8UOgDCNjxbJxhmhFA9OLrgz2NVmTxJs=; b=JHjAdd3OWu2NKCuYBA5n9H8aNv
	nbN+HC7y9WhrWPeDv4QmMXORCU5Vy/hcjHc66VXGQnTcQjCGt/qbVKFcHOWTeDvk7l1vQEaMUFr+P
	dpz+lhOWfkPbmWfd2XREOolxY8+8SBzKQNzlk/es04t/FchJMzWJGPdQ7YgIrfo4YgNkgsJSdyLic
	V6+Fv79Ac4jCfJNfA0ao0gAVGN6laHclBf6PKV2BqE/ld3Dxy5IZZltsr9htdjVT8T5m3HGnZbgqW
	XtAZ0h06y2BDt0ckfVuujIz4AZiK6YeVvYvHADw30lBsarkP+UYbTndhXGcweBN9zSAdGu6JaVQCb
	mbX8MgPw==;
Received: from ip6-localhost ([::1]:25998 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rDhEn-007C7r-Na; Thu, 14 Dec 2023 08:38:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58816) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rDhEj-007C7h-4H
 for samba-technical@lists.samba.org; Thu, 14 Dec 2023 08:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ixYMeSSpJjaugP7j+zvcniwZ+Q6xxMiHAzM2axO9iU0=; b=L0oPcRcrqXYp5Mqr5bOSwb1obU
 nGbMi6F4hIrXP9MSYd9jU3XEWmFauoRvhWVXsDIvpdkLndTupdjTGs+iG+ii3BZQeGga+EDogjYdU
 GKa1oLS49VPldQ9NJdc9fF9DN93PGfVfwkdzsRaOmK8vD1j3UwsRcfGK/Fr6dt2+h+umh7HGM2wX1
 /vrhMG3Q+PULtYEBkfN+J/Maoz7xfTEpm198Np6aADRMxWMtfB0F/WGz4+PyzSBTFagjL3Wk+aPJL
 UIjOxEHWcYzhlZE7Ho7EP+56D8WaWnnGfDeeopkfKSc15kvsbDVO2pw8mlcNoqotsSl6KZjFKfNq3
 VwjKeGhChAI0uWUqZYtZiRjt24cRdbTmJLdwOJGg4IjIKKEkgCVVKJQWlEUvDUUPgoYRGba8KZNiW
 I/3urZnW7iWxaHXJvkf9FKu1+pFGsmLRyuKLHiuhfKF3VB7VzhZ/L2RrsEnsfdsp4CkPOht0Ntseo
 m8yEwmYU+KDkw8hkTGNB7AwB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rDhEh-003bpJ-0Q; Thu, 14 Dec 2023 08:38:27 +0000
Message-ID: <80b5ed1715aadc11a1ce1cb025b7e53c4c7d6992.camel@samba.org>
Subject: Re: Is Samba AIO affected by recent Linux data corruption bug?
To: Bram Matthys <syzop@vulnscan.org>, samba-technical@lists.samba.org
Date: Thu, 14 Dec 2023 21:38:22 +1300
In-Reply-To: <aee71586-ab0b-409d-a375-75fb7fd6b223@vulnscan.org>
References: <aee71586-ab0b-409d-a375-75fb7fd6b223@vulnscan.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2023-12-14 at 08:38 +0100, Bram Matthys via samba-technical
wrote:
> Hi everyone,
> In relation to the recent Linux filesystem corruption bug with
> O_DIRECT [1]. I read that to trigger this, an application needs to
> use O_DIRECT and that the bug is that the file position is not
> updated properly. So the bug does not happen with pwrite(), or if
> lseek() is always called prior.

No, Samba does not use O_DIRECT (and it would be a lot of work to make
it do so, I investigated this once!) in the file server.
An incredibly rarely used client tool, cifsdd, uses it optionally with
--direct
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
