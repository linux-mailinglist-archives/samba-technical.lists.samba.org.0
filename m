Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5966B67A8DF
	for <lists+samba-technical@lfdr.de>; Wed, 25 Jan 2023 03:39:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=LF1I/eUJ9dASCcGcgp8rOJSaKcuY07mcGyU5McPNQv8=; b=IvnU72IHKFoewIBAPRLLs5lbQD
	2uPEUTzIbluWIwpsjZ5diFm8yEIIpPe3YDRdk3AJukU6S8rokCtUmHc30EuVDbD+soFqAv4H2tPa0
	Zl2OW44eLwu8iBUk+kzFW+MxVMJMn7uJEptfgR1kpzIDIctB260/pMG73Ae8zDWolCEyZHeQye6Rn
	9HuTntNNxSO9KoWnlJqTg5t6ahV86h2XmhsomK/vXbfAkCX4tPQBZGUeG3sAe9w2dLHoz4CmzjYzK
	yB92lRwtQfqGMmAoIbKZsoct4ZG1RX5/yj7qfc9HwpwBKiBVLvLKSDyj0M6eWAIZ01G5n77vPXjTZ
	O2oE/SWg==;
Received: from ip6-localhost ([::1]:20864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pKVgx-002fuM-4u; Wed, 25 Jan 2023 02:39:15 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:53351
 helo=gandalf.ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pKVgs-002fuC-Du
 for samba-technical@lists.samba.org; Wed, 25 Jan 2023 02:39:13 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4P1p1v4bymz4xZb;
 Wed, 25 Jan 2023 13:38:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1674614339;
 bh=LF1I/eUJ9dASCcGcgp8rOJSaKcuY07mcGyU5McPNQv8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IEtpcQvXwJLuIjEFWr5sUNqjav25oiDwZD9j1QKOL+zjbgCr3InsBUXa5cbM/6zxy
 NaNh1jYEOgAemO1LYghMilNpQvR8VLlg7KrdD/orZELRQPPrkvOqXzYbT05U/fAK/o
 q83Gp1wKncSXAWzWkLgxcUAsDWdSMpHAVjghtZzjvU68cB3uGgcqaluNxRjPX0UtKa
 UC48j2jG5uW+6eOAD8D0BKnjtQhCFhpQCABujidk/vbD7iXDAfZtuDmvGOnfiSx4IM
 HfQnDvuPZcr6DG0kGum/2MkQqm6RtLknok/62zS4tQ1YoSWJmSD+lKzvxTtxEAASKX
 TYwcEr06aZFtw==
Date: Wed, 25 Jan 2023 13:38:58 +1100
To: samba-technical@lists.samba.org
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Message-ID: <20230125133858.2108cdc8@martins.ozlabs.org>
In-Reply-To: <3744464.kQq0lBPeGt@magrathea>
References: <E1pKFPN-006HUv-Jj@hrx0.samba.org>
 <c08b0b3f-8ef5-1063-5412-18e96a1809e9@samba.org>
 <1869592.tdWV9SEqCh@magrathea> <3744464.kQq0lBPeGt@magrathea>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 2404:9400:2221:ea00::3
 (mail.ozlabs.org) incorrectly presented itself as gandalf.ozlabs.org
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 24 Jan 2023 17:54:30 +0100, Andreas Schneider via
samba-technical <samba-technical@lists.samba.org> wrote:

 
> Oh and I have a review check in for my 'autobuild' command.
> 
> https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/.gitconfig#n113
> 
> line 113-119
> 
> This will warn you if there are unreviewed patches.

I think this will error with no possibility of override.

I agree that a review check in a hook is a good idea.

However, before doing that, we need to clarify our rule:

  Each commit in master should have been reviewed by at least two samba
  team members. For this purpose, involvement in patch creation is
  considered as reviewing.

  - https://wiki.samba.org/index.php/CodeReview#policy

There is also this:

  Outside contributors are welcome to review patches also, this is a
  good way to learn more about Samba! 

  - https://wiki.samba.org/index.php/Contribute#Review_process

To me, a sane understanding of is that each patch must contain 2
Signed-off-by: and/or Reviewed-by: tags by different Samba team members.
Checking for 1 Reviewed-by: tag isn't sufficient (for non-team
submissions and if there are non-team reviews) and we will occasionally
still mess up.

What we really need is a script that has access to a list of Samba Team
email addresses (which are already public knowledge), and counts the
number of Sign-off-by: and Reviewed-by: tags containing those addresses.

However, there is still a corner case.  :-(  Notice I said "different"
above?  I have many WIP commits in branches that are years old.  If I
update and contribute some of those now, they will have my personal
Signed-off-by:, to acknowledge the circumstances under which they were
initially written, and a DDN Signed-off-by:, to acknowledge current
circumstances. In this case, we could de-dupe using the name, so the
process would become:

1. Get Signed-off-by: and Reviewed-by: lines
2. Keep the name for those with a Samba team email address
3. Count the number of unique names
4. Is it 2 or more?

Any other corner cases?  :-)

peace & happiness,
martin

