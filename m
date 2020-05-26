Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 487911E28CC
	for <lists+samba-technical@lfdr.de>; Tue, 26 May 2020 19:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=btUzi3/ARkwbFcdTXUUZYKwv3GFhERSS/mra98IPS40=; b=bLa0DbA35v2HFN40hpwHtwPTO1
	rbszzbKr7Z0uPfH4d3qTAts0ZjjLZpbLamWiVe7JU1d8fb4Qi9kX97+NhrAzvLuSshYSX2Yk2DGAM
	RHL8b2jIauI3PW3iZVfMbQ0C2VDP5VnWCt/sLxVhC9z1s5PJu4o5ANF2pMhso8ot2yBr49JexBfKl
	9pADnCS8i/2jJKpT074XZiQscTscGGU0KlHl6moDnLXB3zpnqugMmFwx68ga0M5qmbpMog1Eq7wfd
	HfazgAjgVx+vwU13zNstltE6ZbPdJJDfteJBohX6Rb36xd4xM0/yhwhpkijJNsG2fDwBSUe29XEsB
	kSPRtGqQ==;
Received: from localhost ([::1]:31162 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jddLL-005zK0-Iq; Tue, 26 May 2020 17:26:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35014) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jddLG-005zJt-Pl
 for samba-technical@lists.samba.org; Tue, 26 May 2020 17:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=btUzi3/ARkwbFcdTXUUZYKwv3GFhERSS/mra98IPS40=; b=cnnPA37L7XNsJ6JOtPMijDUYhz
 WvnHGPRTr7NLfbPt0k4IgdAiNqJZN8QXIHrpVSzzS8zY7x3s7t1qfgyKf3uNrMLb63741jsERXpd5
 pz9n62jZU8ZlEBjE9DB2prDXWwLEIGFIPKyuAdKGNTvmsLvU3FMaLrBg+cSBJwasMCDqjhtEz8Vd+
 URiRP6OuIsZJgFoLHf0ZSam5X8azeU/w0yxxulRi5Ruu4AUmGwZKnQs20taB5kVEK4o/z05unzXUI
 QYOgpxI+MlqVnQiREQxFhpqESzRWvIFqIjIyxwy6OjuTu7oqpQMp2be4cRJCglkGmVFRaEmg6AAuF
 JfOBS4kT+BPoSA1/LeCC4zGQQI4X1TQUyRqquteJGDCZsStJ8jrWZ3YmPTpBsGU/xeV4xmnxcfMSn
 +ZZZPcQp6E40Z1dyBp9HYonwG1PvBP11q9Td9bDawIwH6MgyP4AF02u/+4hnhhdkuNCJGPMewzMNm
 dfbKmXwFpaFT84aE072j2n8K;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jddLF-0005h6-PM; Tue, 26 May 2020 17:26:18 +0000
Date: Tue, 26 May 2020 10:26:11 -0700
To: David Mulder <dmulder@suse.com>
Subject: Re: New Contribute page on the wiki
Message-ID: <20200526172611.GG18267@jeremy-acer>
References: <8b444948-cef4-74d8-a455-958446832aaa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b444948-cef4-74d8-a455-958446832aaa@suse.com>
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

On Tue, May 26, 2020 at 08:13:09AM -0600, David Mulder via samba-technical wrote:
> We've started hashing out a new Contribute page for the samba wiki.
> You can view it here: https://wiki.samba.org/index.php/Contribute_New
> 
> The old Contribute page doesn't match the current process, so it seemed
> writing a new page from scratch was in order.
> 
> I want to start a discussion here so we can hopefully improve the page.
> Please comment and also contribute to the Contribute page!

David, this is really good ! Thanks a lot for this one.

The only thing I'd add is a link to the (C) statement
and an explaination of why we need it for contributions
of big (more than a few lines) patches.

Thanks a *LOT* for this !

Jeremy.

