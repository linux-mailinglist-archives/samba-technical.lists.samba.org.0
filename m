Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8861DCCE64
	for <lists+samba-technical@lfdr.de>; Sun,  6 Oct 2019 06:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=hP0SPGxoScI1PqRZk5FwpIWUfiuxN3A0LgsUMGV76Rk=; b=mIBWnBOgW7hQhrDP/ur698rL4M
	FEVqKrI7eazRoDdEjbpoAjcbHTUF5CGCo51inQO/8xih+u1D3SiJCOU5ZUV67ODh7eLTU9R7s8hUz
	kaxKAHYLfxHxMrjCnEfsK9Bm5aR3j9tKvbT3P0lCh3jZjn2MHbt4mTZwbmW5HzT6nTELTGY6osHit
	1dvYuH9HY6BdRa0FvMOrvC8vzKZZR6hVocgU6Tx4/+ekz9OEuCkBentOAFRmJ8UJQOe2yqDLSH6os
	ra+yTT2d3w56ZGoP2/wXlNw/8X2htepns6T0c+RYLTFLTMncrnjIuTw0u3q/sxQllDYLVenUucLr4
	HZdxGvPQ==;
Received: from localhost ([::1]:44732 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGyMT-001Y6W-Rh; Sun, 06 Oct 2019 04:41:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25384) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGyMP-001Y6P-Lp
 for samba-technical@lists.samba.org; Sun, 06 Oct 2019 04:41:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=hP0SPGxoScI1PqRZk5FwpIWUfiuxN3A0LgsUMGV76Rk=; b=taU1ZTQ7QYqZMc9ekO3bMyrBT3
 6+uVTVBZZm9VjvdPGvzPOY1VkW4CeYTGEhZ31p9rjwlEH9ZSaKkUMSb1WIL2MC6t38IkGp0E1yjMM
 YWMaF/cxq4AfXOebl9ckZQrEXzzBNhWxSe9vZHa+LrA84QikezE3fcdCZd27JOtYRz/8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGyML-00038C-5N; Sun, 06 Oct 2019 04:41:29 +0000
Date: Sat, 5 Oct 2019 21:41:24 -0700
To: Rowland penny <rpenny@samba.org>
Subject: Re: How to turn on SMB3 POSIX extensions in Samba server?
Message-ID: <20191006044124.GA12220@jeremy-acer>
References: <CADvhK2uJgKcNsxJwT4eGHV=4pH_qJZm0u_GkFMAwQ87vBsSpMw@mail.gmail.com>
 <20191005212851.GA8068@jeremy-acer>
 <942a44f9-a3bf-f5ec-0444-04a65c3e6138@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <942a44f9-a3bf-f5ec-0444-04a65c3e6138@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Oct 05, 2019 at 10:49:59PM +0100, Rowland penny via samba-technical wrote:
> > 
> > Jeremy.
> > 
> Hi Jeremy, I advised the OP over on the samba mailing that unix extensions
> for SMBv3 do not exist yet, but he seems to think that something similar
> should work with mount.cifs and the kernel.

Yeah, that's Steve pushing experimental stuff into
released kernels for you :-(. The client side of the
SMBv3 UNIX extensions is being developed in the
SMB3 Linux kernel client code, the server side isn't
in any released Samba (or even upstream master) yet.

