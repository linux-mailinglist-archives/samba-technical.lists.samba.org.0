Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2859AC421D
	for <lists+samba-technical@lfdr.de>; Tue,  1 Oct 2019 22:56:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=laVh2fEssHvx+tYqlq+WIZdGar+xe/bxjHTUFyDvR5o=; b=AiN7noanqJc5Joh6VJQ7CzZDXm
	Lkposm/sjXk2JvTITmyr8N5f5/90xjs4f5Xn1UeNK/bGoBk65TqXwB1Lt+1QG6mYPyIuHQl7tUvGR
	w1msRKmg/Y27kudgPNzQRMsWFxyhzPz9SWO6UEL6cvYZHetCN/nkl4xppQWPJLenQNjWixuakXA4u
	kY3GoHcTXV7aiYEqDIwYqQ7xDyIuu/Q+QKyidOgyHkMF8x2bWUM4Dw9hIT8gXS3M30tcI+DnP2vVz
	8fHZp9gL/qE7nZ0San+KLEAxcDDxIEZTOXFPW3LoxTxxG1WtLVYywj/LcJ+s3WdAZ9Eh0Kj3rsdRv
	nD6Kkn1w==;
Received: from localhost ([::1]:47586 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iFPBO-000B7Q-KN; Tue, 01 Oct 2019 20:55:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37250) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFPBK-000B7J-Cq
 for samba-technical@lists.samba.org; Tue, 01 Oct 2019 20:55:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=laVh2fEssHvx+tYqlq+WIZdGar+xe/bxjHTUFyDvR5o=; b=bNbEY6/SM6qdzOZk/CLqqtKEno
 LWsU386TY8uTHpjPi9JN7zsh4VmDAsPjnN5lvTlRPDdB3ZYpQW25VLB3W573I56xMYwOX6LFANaNN
 0QBL7Wu2/fUqe9nzp21LYdn7YPnolJlzzB2GGlMRbMZHdMdSUVCf8/9s+vzaIbcFoIUs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFPBJ-0006Ei-Bc; Tue, 01 Oct 2019 20:55:37 +0000
Date: Tue, 1 Oct 2019 13:55:35 -0700
To: David Mulder <dmulder@suse.com>
Subject: Re: Converting SMB1 tests to SMB2
Message-ID: <20191001205535.GC4074@jra4>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 27, 2019 at 02:54:08PM +0000, David Mulder via samba-technical wrote:
> Noel and I are looking at converting any old SMB tests that target the SMB1 protocols to SMB2+. Is anyone else already working on this? Does anyone have some pointers?

"Congratulations, you've decided to clean the elevator... !" (from
the movie Dark Star :-).

No, no one else is working on this I'm afaid. As I add
new tests I usually make sure they're SMB2+ only, as
that's what we want to target going forward.

Best advice I can give is to move them over one
at a time, probably starting with the isolated
ones.

As you move them, take the opportunity to clean
up some of the old failure paths - ensuring they
start and end with a clean and empty directory
tree. Some of our flaky tests have been caused
by 'old' data being left from a previous test.

