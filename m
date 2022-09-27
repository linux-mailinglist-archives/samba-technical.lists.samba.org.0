Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19D5ECF61
	for <lists+samba-technical@lfdr.de>; Tue, 27 Sep 2022 23:38:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=dysYwis0gM+ti1UtjthxbpTXpCak1eFwlYJaNUmBn2w=; b=KvaQcxqVyARYL8xrV6VYFxfB41
	McmgsxjlFCqDpLDofKMhKU9yEvruvjAg8r+kY7UGizB4l75ITTO8oV8cYA9Yx0PbABLGwy79pB6Cq
	XclfHH2P0L4jZp8Q3IygpLM/KBYHIbMaqH2bGUBQf2dtvuhCJ+6FR71VDzuNigZT8O0nxdu8rC5tE
	852gBPdjmlsK9KBvlUGRsl32YSqFhKTcvzC+9vGLz8HXBZVCCopss+qJSqPBmeAerjm4FsmprGHM7
	UFzzqao0F7IFym0hWJUsZYkYDxj+s4FDMzmTHDT2im4xA0C6zzcHSgbX/LGkDmwxQM3kUMRbJSPJn
	XMBd/amA==;
Received: from ip6-localhost ([::1]:34742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1odIH4-004TPH-DH; Tue, 27 Sep 2022 21:37:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24336) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1odIGz-004TP8-1X
 for samba-technical@lists.samba.org; Tue, 27 Sep 2022 21:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=dysYwis0gM+ti1UtjthxbpTXpCak1eFwlYJaNUmBn2w=; b=QbeIQFBq3IaXIpjohrYmXrYS/S
 3fEDIzbtyonvKd9/DlhfeN6vSvvWJ+XFl8K4Bwt1aqCf70x6FZ6Gj9VrUk3HJ1yqji3ePn0o75bz8
 9ZMNHH4E7SFqUhvqn06konffahx4OlFqn8alcU6PqKMzpWuIwyDZgQywETrCNWl4IdrHminUnQGRm
 Kd6W/S/dyD5+DRIe8TUz6pMSTRmAgtijBMUgj5aZMy2PEB/sx6mPcWIlb+eakasRIVG5OJfPPh7uY
 5XMqLdbs3dOCxtNQoA/LXfiZ3uCZwQVEA/QlhKnO5209vri7xgN3VZiavufqqKwP1Huwfa73c2XL/
 toeRvab9P6m6ViCh2o9x5hUqCqm9WNynkzwXzewQ1zdpAF0ewmezgTz4ccVZSIZvaDQsqYcE54Z1u
 PKWLWeleFwzYGMyMquAAW629+5cR7dx8Ba02bNA77WFzVIKSA9M9EPI7w4N08Omn/IWrBq9x01WgR
 s6oLOBiFruXWGY9OezA4mi1i;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1odIGw-0028zI-Kn; Tue, 27 Sep 2022 21:37:47 +0000
Message-ID: <d1cd76d317998a3dd4456e7877b3950901019c14.camel@samba.org>
Subject: Re: [PATCH RFC] s3: smbd: Consistently map EAs to user namespace
To: Daniel Kobras <kobras@puzzle-itc.de>, samba-technical@lists.samba.org
Date: Wed, 28 Sep 2022 10:37:41 +1300
In-Reply-To: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
References: <d9c11a44-538d-963e-46b5-37fa24bf5bb9@puzzle-itc.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Michael Weiser <michael.weiser@atos.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I honestly can't think of a way out of this that doesn't break
something. 

Mapping the EAs from multiple namespaces by stripping the prefix really
seems to be a bad idea - if only because information is lost.

Also, I just don't see what business a windows client would have in
reading the non-user EAs, and if a client should read them they should
be read in their own namespace. 

Andrew

On Tue, 2022-09-27 at 22:10 +0200, Daniel Kobras via samba-technical
wrote:
> Hi all!
> 
> 
> The attached patch restricts the extended attributes that Samba
> exposes
> to clients as Windows EAs to the 'user' namespace in the local
> filesystem. This is a potentially user-visible change, and Jeremy
> suggested I put this up here for comments and discussion first.
> 
> Gory details can be found in a recent thread on the samba list[0],
> and
> the related bug report[1], quick summary here:
> 
> Samba maps all Windows EA to EA names below the 'user' namespace in
> the
> local filesystem, but in the opposite direction, it exposes all EA
> namespaces (except 'system' and some EAs reserved for internal use)
> to
> Windows EAs. The 'user.' prefix is stripped, all other names are
> passed
> verbatim. For EAs outside the 'user' namespace, this leads to
> potential
> collisions ('foo.bar' and 'user.foo.bar' map to the same Windows EA),
> and renames those EAs if a file is copied via Samba ('foo.bar' on the
> original file becomes 'user.foo.bar' in the clone). The latter may
> lead
> to subtle and misleading errors if the 'user' EA namespace is
> disabled
> (mount option 'user_xattr' not set).
> 
> The issues can be avoided with a consistent mapping between Windows
> EAs
> and the 'user' namespace in both directions, ie. no longer present
> EAs
> outside of 'user' as Windows EAs in SMB_INFO_QUERY_ALL_EAS and
> friends.
> Do you agree with this approach? Are there applications that rely on
> the current mapping of non-user EAs? Please let me know if I should
> submit the patch as a proper MR.
> 
> Kind regards,
> 
> Daniel
> 
> [0] 
> https://lists.samba.org/archive/samba/2022-September/241918.html
> 
> [1] 
> https://bugzilla.samba.org/show_bug.cgi?id=15186
> 
> -- 
> Daniel Kobras
> Principal Architect
> Puzzle ITC Deutschland
> +49 7071 14316 0
> www.puzzle-itc.de
> 
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source 
Solutions






