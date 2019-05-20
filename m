Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247F123FE8
	for <lists+samba-technical@lfdr.de>; Mon, 20 May 2019 20:05:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=QCsy8zLtHjemoiqFtwk26HSuHIeetTNYi1259ZSdeSI=; b=Qc9vq2OXPtfk3oSXJQ6Q2QdZ4o
	llUefAvWuWWcpYnADbjYDuDkPwXiA3enkfPLo/frG+1hiF/XDHhonIVzUYuszO30t4polxKLE4XnQ
	wBzCog1LHBPoigqD4c8wuOa9Zw3504ywDTHMaxPxzE01bgBRMDzdb+f9uZZkjIyryCX3uWso31887
	p+EF84juTkBXWWxiDADs0S3CPOcEfh2G9AGcuR4/2m8IPIeDzFGswo0lgwF9eu3S2o8vHGO4tSeV1
	cQTENxCXc37F7IoqhHnU41A7QbfH5OBD0ItdnrkSM/gpMmzO+7A0M4Cu+H+WzFw/kD50ePXIrEGUn
	JzX4imgg==;
Received: from localhost ([::1]:25802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSmfI-000l8R-Sv; Mon, 20 May 2019 18:05:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:36034) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSmfD-000l8K-TE
 for samba-technical@lists.samba.org; Mon, 20 May 2019 18:05:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=QCsy8zLtHjemoiqFtwk26HSuHIeetTNYi1259ZSdeSI=; b=sDYMA97LEgER9gDNGwrrNzzfqG
 YPHKMOHPOXvetNax68Hqx6P0ExEMP8cz29AKTHmATEzBqQTAyoMWyZY2bfIU33Jwx7RN3YkJIGxdn
 25jrYlxONOZ/0ixrNk2kOyt5AtFo85hf8M4iJwcHGvA0MmppvWJJQfa4dM2Ro/z9gS5c=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hSmfD-0002eH-Dd; Mon, 20 May 2019 18:05:31 +0000
Date: Mon, 20 May 2019 11:05:29 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Patch: Make sure we log an error if we are exiting from the
 server when there is a problem
Message-ID: <20190520180529.GC257371@jra4>
References: <CACyXjPyno0BH-9WCcTkYaUVpZK03Hog2pZEhwiPBQCJd8JR+6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACyXjPyno0BH-9WCcTkYaUVpZK03Hog2pZEhwiPBQCJd8JR+6A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On Mon, May 20, 2019 at 10:56:44AM -0700, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> Here is a signed-off-by patch for the problem I saw last week:
> 
> Hope this helps.

I already pushed this as 1078b273f84cf216b50ddec18ee6a2b3c8c17bc6.

You should type 'git pull --rebase' more often :-).

