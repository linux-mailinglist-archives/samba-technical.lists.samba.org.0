Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB804DE58
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 03:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=gQBisMtFz6dVHCgim5v1hFT3qR9PRGz+k1gk++VnIAg=; b=F4KHtT9ks20ghi2HF3lF8RlySf
	v1I7rKIasJUNSaJK6GfWH8s7YWQMWBnqASInljgH+CdDMpjmA4UlgS3oDplB8UXGSeuH2pcL8QSkl
	tSOphd/+WO5YbtQtJyEQwbAvpbtZ94zkwu+NiVKYR7en7I476hrXWRlxvBk1lZSyJfM1/Yfo0sLdC
	hiB/CsjZ3tzxzakgzSYYUvnZS1HVY/RIbI5nx97J+AVgpFmXGZZRvdQE2T6CRQnr8NHo0+fM1z4VT
	I4Ku5PwL4eEdokcHCMZ0DjcfOsEPlaGl02i7iz76jsMfTMmCKqrv+p3L3T6pAZJUwVqeQjgV67Lio
	bgxQ4IvA==;
Received: from localhost ([::1]:47684 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1he88f-000qQ6-Ev; Fri, 21 Jun 2019 01:14:49 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:36581 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he88a-000qPz-R9
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 01:14:48 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45VLM12VTXz9s6w;
 Fri, 21 Jun 2019 11:14:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=201810;
 t=1561079677; bh=4bwT6jxqj7KGm08Mr1ydgQFK3sCcigriSpCbBqKZ3f4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=muLu3NGqOOqCenoondbpBdkLX57Rbn2ZCR9rjEeOBoLOMCKyIBE8ZZtaJtWz4dqbL
 kiUiSuANdGq8T7eclBteJuPcGaOZeGctsqJQJlAdsbFQqe+8dv1O5YjT5V6uKu3xlv
 lstCV6oro4uCq7ITEhx9Z4pg0hDVw40/Rkra2NTEFchjxQR2cCQodr3HdH5pzqi6cG
 9XlRzj3CIGMtENqshVNJZ+uGhlshqr8VqGBsLTMAENQwOUG5/pHD/cfGBSyQP5f4AE
 akmpv7jwxmkN1/dOSoncEJVWPUcjQicdt2EPNs6V1fWs/HhEl9kevg6mFvF0+64t7a
 zwWEBqZpCAFrQ==
Date: Fri, 21 Jun 2019 11:14:36 +1000
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
Message-ID: <20190621111436.342f713e@martins.ozlabs.org>
In-Reply-To: <1561079117.28284.21.camel@samba.org>
References: <1561079117.28284.21.camel@samba.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 21 Jun 2019 13:05:17 +1200, Andrew Bartlett via samba-technical
<samba-technical@lists.samba.org> wrote:

> I gave a talk at SambaXP about our first year with GitLab, and one
> point I made is that it is *not OK* to have public contribution
> documentation that does not match our actual practice.
> 
> I was talking about GitHub, which we advertised but did not embrace
> (and which by the end caused new contributors to be told off,
> essentially).
> 
> I've recently found myself doing the same thing!  But now I'm berating
> contributors who follow our public documentation and so innocently send
> patches to samba-technical, or attach them to bugzilla. 
> 
> So, I would like to propose this.  That given the practice of the Samba
> Team and almost all contributors is to contribute via a merge request
> against https://gitlab.com/samba-team/samba that we document this, and
> only this, as how to contribute to new patches to Samba.
> 
> This is only one tiny step in a process to have clear, practical
> contribution instructions, but I would like to ensure we agree on this
> much.
> 
> Essentially it would mean a better version of this being prominently
> placed:
> 
> https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Creating_a_merge_request
> 
> and updates to:
> https://wiki.samba.org/index.php/Using_Git_for_Samba_Development
> 
> Non patch, meta and broader architectural discussions still belong on
> samba-technical of course. 
> 
> Any thoughts?

I don't think it is the practice of the whole Samba Team.  I haven't
managed to get into the GitLab workflow, though I have used it.

Perhaps I'm the only one, but I don't think we should be mandating this
(yet?)...

peace & happiness,
martin

