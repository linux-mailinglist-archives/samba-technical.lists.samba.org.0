Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BE6545676
	for <lists+samba-technical@lfdr.de>; Thu,  9 Jun 2022 23:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=GQtnguqOiM+AzLROpdjCe1fC6LDdA1HneD72sQgMico=; b=5hLBZeBI3suk06yB3ZEg0a/4e6
	wdc/c6cb3PdqXxJOl+qwBVIZG/cloyBT6nRqeSqdAQP11s0q9k5RXhdAvk/cAzHzNy4wAm7luDlQT
	H9pN+XaU099W7CWLeNAFpItNRhTilFeU62RA/0UNUuRmsIh6TWbmK9y4xRmcU84P0TQj9TaUaJrjQ
	K0ou8B9bcnR0yBxiUQKGv3C5bXtXT8IGG+mmj8qh7BSsstN7GukE18X9WaEB/YNCPsS4jOF2f6fm3
	ozaBY9BS7vn+NgJmVIG46CUaSiJ4kYl5WCjEqyT+hBpDnB2v+KubUqGGOhhDYurNHPI1cXVQWCUMj
	kHA/fMQA==;
Received: from ip6-localhost ([::1]:42982 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nzPfl-008wLY-Fr; Thu, 09 Jun 2022 21:26:33 +0000
Received: from [104.200.28.160] (port=45098 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1nzPfg-008wJV-AY
 for samba-technical@lists.samba.org; Thu, 09 Jun 2022 21:26:30 +0000
Received: from pretzel.localnet (nat-pool-bos-t.redhat.com [66.187.233.206])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id B69E86A9;
 Thu,  9 Jun 2022 21:26:24 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Re: [Samba] Samba in Kubernetes (and Containers) - Release v0.2
Date: Thu, 09 Jun 2022 17:26:24 -0400
Message-ID: <26648066.1r3eYUQgxm@pretzel>
In-Reply-To: <6fd92c53-4f64-ecff-6568-9a01908d958b@samba.org>
References: <3245098.9o76ZdvQCi@pretzel>
 <6fd92c53-4f64-ecff-6568-9a01908d958b@samba.org>
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
From: John Mulligan via samba-technical <samba-technical@lists.samba.org>
Reply-To: John Mulligan <phlogistonjohn@asynchrono.us>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, June 9, 2022 4:15:00 PM EDT Ralph Boehme wrote:
> Hi John,
> 
> On 6/9/22 19:40, John Mulligan via samba wrote:
> 
> > The team behind the "Samba in Kubernetes" project is happy to announce
> > our
> > first set of releases. Release v0.2 means we're confident that more people
> > can
 use the samba-operator, the samba-container images, or any of our
> > many other projects without having to be a developer deeply involved with
> > these code bases.
> 
> 
> congrats and thanks to you and anyone involved in the effort!
> 
> Fwiw, it seems we're finally able to help you and the SINK project by 
> settling on an viable approach how to manage the NTACLs in xattrs in 
> containers.
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/2557
> 
> I'll try to wrap this up and request for review in the next days, stay 
> tuned.
> 
> Cheers!
> -slow

Indeed, thanks a ton for making this happen so quickly. I can't wait to try it 
out.  I'll need to make good use of our 'nightly' builds that consume pre-
release samba versions.

Thanks again!
--John M.



