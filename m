Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C01AA4347
	for <lists+samba-technical@lfdr.de>; Wed, 30 Apr 2025 08:45:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7LsOhU1Anrr8kAA3Nw7HpYJMtWhJ4ZlQ87phyQ3lTEM=; b=vrCxwjPNifREsMeT833AtFKZmz
	bY/nLqYwXAZwsqQAsR+dxE4fHMDMRYDage+oXmdolJEzroPw8bBQdwQ1yBhHZhi3v3xGEp4zSdf5P
	t0avmqkzXbjRJSpkbcL7PUUi3WRJj8MrB54RQx47OkqqVaFggkWVcTSGm9922jvI8LekW2OMJRLfF
	Pfpz8o1XeLZ/ki1GsV2LiYzCSOTALtiHeRLHS9pTDqfKTA6I1172SX6/b10ET8XvjMmg/zowqIhSz
	EoX/nSISkg9O6rCfHARB3fMlKHtM8ohgun0zba4r9UoAsVU01iDiLVa4AwL6w7q1Ngrq9wsg5Qw7B
	T8GqDtYg==;
Received: from ip6-localhost ([::1]:57666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uA1BA-0011Se-Nr; Wed, 30 Apr 2025 06:44:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40526) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uA1B4-0011SX-Ud
 for samba-technical@lists.samba.org; Wed, 30 Apr 2025 06:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=7LsOhU1Anrr8kAA3Nw7HpYJMtWhJ4ZlQ87phyQ3lTEM=; b=YidtfoQ+bBxgtZzbjWryE2ASsC
 03rAmc4PJugGuKQt2YP//6nHMcj5bkznpSnmBu98zj3sJ7+sr0e/sAdxrUD2zemYmbaFz3K3bHOmC
 5fxVZMG6Vn/z5D8p1btwgecuqBDfPvLM/Ky20P1gqh9xlCSc/zuLYYOOzM/fu5VQ9cxa3n91GFGtD
 jcDf6rTGNQeEqNAPjHEh+lGx31sxRSvfRILqaTPiyIuWtdEGXnMrOPTYSbaw/jucGfNSjIGJ70daW
 FbLwRzRtUEy4ptYJABNPmcGpcnyARe9y9CQQr9OknVvBrhN9J4L//TzVoLJX+2ClHRBkPa7hcKywx
 JWNuWRsh1EQOyrSGSb55iqYST0h/4mQhFFuPxhtLY2nApEhcaJqTHm1lIxrD/fndIUDZt5qMjgZXw
 5xYQ+79q3tjHT/3h29joOJICoLqnWUs2Ur7BYTTxdyYkWqFYBv/LZywj+hU6INBYACp6uxyYdqeeX
 u9ZRH7RdrjKL/j7g/NGnaUA1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uA1B3-002ioh-2s for samba-technical@lists.samba.org;
 Wed, 30 Apr 2025 06:44:18 +0000
Date: Wed, 30 Apr 2025 07:44:15 +0100
To: samba-technical@lists.samba.org
Subject: Re: restoring winbindd_idmap.tdb file
Message-ID: <20250430074415.19f2431f@devstation.samdom.example.com>
In-Reply-To: <CAJQD4dc=sLoPhVkUqSauJ+bZhKh9Dpb6b1qAdbH1HavNYMqiAw@mail.gmail.com>
References: <CAJQD4dc=sLoPhVkUqSauJ+bZhKh9Dpb6b1qAdbH1HavNYMqiAw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 29 Apr 2025 22:17:38 -0400
Chris Chupela via samba-technical <samba-technical@lists.samba.org>
wrote:

This isn't really the place for this, in my opinion you should have
posted to the samba mailing list, but you are here now.

> I recently had to remove and re-add a RH 6.10 server 

You have re-added a dead distro (presumably with an equally dead
version of Samba) ?
 
> (ad domain
> joined with winbind), due to a failed server replacement. Problem I
> ran into is that domain accounts that had permissions on the file
> system (home directories) were assigned new UID/GID's when I rejoined
> the domain, thus blocking access to files/dirs they previously had
> access to.

This shouldn't have happened, provided that the smb.conf file was setup
correctly, the only users & groups that could have got different IDs
would be ones from the BUILTIN domain.

> 
> (did not make any changes to the smb.conf file during all of this).
> 
> I did copy /var/lib/samba/*.tdb to a backup directory, and cleared the
> cache prior to re-adding the server back to the domain.  If I was to
> do the following:
> 
> 1. stop winbind and smb
> 2.  dump the contents of the old winbindd_idmap.tdb file to a text
> file 3.  make another backup of /var/lib/samba
> 4. delete the existing winbindd_idmap.tdb file from /var/lib/samba
> 5.  start winbind and smb back up
> 6. restore the dump file created in step 2 with net idmap restore
> (feeding it the dump file)

Why did you do that, there is no need and it probably has something to
do with your problem, winbind would have created it again.

> 
> Could I expect that this will restore access to the homedirs/files
> with the correct UID/GID's from the copy of winbindd_idmap.tdb that I
> made? Thx.

I have no idea, I haven't seen your smb.conf , so have no idea just how
you are running Samba. I suggest you post your smb.conf (preferably to
the samba mailing list) and lets take it from there.


