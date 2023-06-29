Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD44742045
	for <lists+samba-technical@lfdr.de>; Thu, 29 Jun 2023 08:20:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=O4yR/e2q/KgjEvjSb/i9W3FBO61XVsnQD7IA3I3zfdw=; b=0tFrIJHde8qBU1/6K48JXtiP9m
	j/kHqSI8DuuELu/JbVG5/z+1F84Dgxxp+9SfuKJnbx3x8qhiU3L2yBK1NNVWV7P0IFnYOq0mHnoge
	NJ1e62JaJOvn+2FLhGSqm3imLXPReK18gQ8Skj/fMlRlcyfkwd0h1fhry/vV6BU9e7rGaUYf4XHBl
	7rJpASg5GyzmsO++Kqmb1EkO1/dmj8ycFPNuC6Dy8q3Fla/zmrvaINuiCPlujvnJ2EOYdCmmqDZQb
	Bxd5DWmGkAF2O/uZwKdEc5StOQcf7KRv/RJZFrPU5zr2GwS9oRJbxhIawuERxPmAeOQCOt7alfLEJ
	GIABICTg==;
Received: from ip6-localhost ([::1]:53898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qEkzu-0057fQ-3L; Thu, 29 Jun 2023 06:19:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qEkzl-0057fH-L3
 for samba-technical@lists.samba.org; Thu, 29 Jun 2023 06:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=+n4VXz6y7FgFieGe08zUMd5NaTZLk1W16hBgkTH7lHI=; b=LzBoxgZVGbWkq4aILWZHwnXnV2
 yR0loJcCzmC+Sor00CTmXGib4tRlIbFTVchNmXcQRSvippTopRquAIGNyd/WxHTlb5vSCwTLTRdwG
 4uimTx3rMXV6LdC4ZDRSYnTaaN1GibM50K3uSJ8K/ZJu/u07xzHxhCNb8kX29Nz3g/zEfOZvv9Hfg
 eVH/D7/aLjrl0Fkwz/o7H7NLMfxdGapXPWzogSdKq967gm37/TtHqXQNh4xdf9VmN/w4zrVMesBYd
 hKXsCLNWxPosL5hKXhGo3gQwlhwVaAuH4um7Fp1LTyMQwd/4I5BTE5lq4XWaQQ6P7yoJt6aGlLHvH
 X+uKVUlnzT/3/eel1eew1T206RVrDqQEDfZVp90WKcpfWLRznMVRWGhMbXyamPzQTlSoCzUadw3r6
 VV58R//IoUYWVNAHUWrds3/LYo/0pjqn+ylD86Hj3jHV1fnsZvjbweEP+U5mAKjphXuQhj6RFg1FT
 JzRcSeMaXXMyPhnfUo2foclz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qEkzj-00573A-01; Thu, 29 Jun 2023 06:19:07 +0000
Message-ID: <a3c4ee58797d4348533a6822cf8fe4588cecc0ae.camel@samba.org>
Subject: Re: Replication USN semantics around Azure AD Connect
To: Stefan Metzmacher <metze@samba.org>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>
Date: Thu, 29 Jun 2023 18:19:02 +1200
In-Reply-To: <c0d06c41-8513-8592-06dc-a9d7af46a412@samba.org>
References: <21696bbbc739934d20fd4198682fd44b63b17d46.camel@samba.org>
 <c0d06c41-8513-8592-06dc-a9d7af46a412@samba.org>
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

On Wed, 2023-06-28 at 10:15 +0200, Stefan Metzmacher wrote:
> Hi Andrew,
> > I've been working to make Azure AD connect work with Samba.
> > This is working for small domains, but for larger domains we hit
> > aproblem.
> > Our USN handling in GetNCChanges can sometimes return the
> > sametmp_hightest_usn, so we have this code:
> > 			/*			 * We need to make sure
> > that we never return the			 * same highwatermark
> > within the same replication			 * cycle more than
> > once. Otherwise we cannot detect			 * when the
> > client uses an unexptected highwatermark.			 *		
> > 	 * This is a HACK which is needed because our			
> >  * object ordering is wrong and set tmp_highest_usn			
> >  * to a value that is higher than what we already			
> >  * sent to the client (destination dsa).			 */		
> > 	r->out.ctr->ctr6.new_highwatermark.reserved_usn += 1;
> > 
> > To make a new higher USN for this case.
> > However, Azure AD connect comes back only with the tmp_highest_usn,
> > egreserved_usn is always zero.  This means we declare the client-
> > suppliedhighwatermark as being older, and start replication from
> > scratch.
> > Starting from zero then means we give the same data, end in the
> > sameplace and the client has an infinite loop against us.
> > Do you have any clues, other than a revamp of our replication
> > logic, tofix this both sort-term and to remember for the longer
> > term?
> > In the meantime I've suggested 'drs max objects sync = 100000' and
> > 'drsmax link sync = 100000' in the smb.conf to avoid multiple
> > chunks.
> > Thanks for any clues,
> 
> I think I hit some similar when migrating large samba domains
> toWindows 2008R2. But I don't remember it 100%.
> Currently we're using these branches to avoid it:
> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/v4-10-drsuapi
> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/v4-13-drsuapi
> 
> They are also in 
> https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master-drsuapi,as
> the top 16 commits, but that also contains a lot of unfinished
> unrelated stuff, e.g. implementing timed group memberships.

Thanks.  I've taken a look over those, but I don't see how it would
impact on the USN or the highwatermark.  
Am I missing something in those changes that would help ensure the USN
keeps moving or could this be a different loop?
Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd


Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions



