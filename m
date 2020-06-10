Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9AC1F4D58
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jun 2020 07:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=88bOK1k+zDBqrbeMYsLaJt0+seRzXQf4Lj4CE/r//qA=; b=MzCzKWmfAnfNvQKoEsOi6PUHWo
	qEgZ/5doqAT8IuTDV5XXC2PNQGtomdYMnHvB5Z76aGQfeOiqmzuZX43c7Vh/f3RMyEYDspJP/3gbD
	uL5HohE8eExMLy5ok4Jgv01cIqOX2OLxseQWKr/ZVDWX3BHtuknMvI7GIy2WChwXfx+FBGjWY1tE+
	BARb//kX8isYIiRkJ7zePS+KxE5NCC4L3YLvuiaCZ0ZRyMSIArqglotlXjuUIJyZ3NmcnqlcDGPc0
	4rMMO2P0O7UZOoyxlnNI9JEZS5UALIV1AdWMpFJHyj6IN040hMPPeIugF/Eh3SX50myP5p1AxOoIZ
	xin3e3Jw==;
Received: from localhost ([::1]:18802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jith9-009hYP-UL; Wed, 10 Jun 2020 05:54:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62036) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jith5-009hYI-Eg
 for samba-technical@lists.samba.org; Wed, 10 Jun 2020 05:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=88bOK1k+zDBqrbeMYsLaJt0+seRzXQf4Lj4CE/r//qA=; b=H/fmPS6kbzPHdK9dB+ULPm1pFX
 c3OnJOB+mtOCVaYErV6Q0sE59uLNs/5a90a1THLWMkz4GS5V7hlmy52MOHOS4crkpxIU+9jVXiYji
 wDjdTeVLXHgDNKXzV95ZKIt6nlhF6NnVmu/wKoVydIgCreaMR8Sf5Ew6JCZIdCnFAGH2AHX8cJps4
 tfLvP9CjjqXBjm1r3vxsj67PpPBHH80Xp+uy1nXDlFsOBhm9fslw5eyii9I/uzqT0QSA9iChJ9j9T
 at22PjOq7nnOp2LJUBcXSYkRUYC38QPJpfL/n4WY1seEpZHSjIYhTTwysbjDzelfb5UX7RJnkTJRI
 q/uBnUCJidy3sIS9PtIu8ymXjrVbdy1pIFw6Vx0YyD549glDh3IY2g3YOS1Up2IXh8MpYv3fpLdvj
 GUdflIujWaDGNGL5xnXNd8EJFi1P+BUiGBYOEUqR9qoL101sG9JDgTaia+2nqy3swm1AX2I/X6HJc
 4wDMuAe/CK/eJ+MBnpPiEWs7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jith4-0003Sv-AD; Wed, 10 Jun 2020 05:54:34 +0000
Date: Tue, 9 Jun 2020 22:54:28 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: Accidential push of patch was: [SCM] Samba Shared Repository -
 branch master updated
Message-ID: <20200610055428.GA24503@jeremy-acer>
References: <20200609172503.C9CF014037C@sn.samba.org>
 <12540524.HQrcsopkBd@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12540524.HQrcsopkBd@magrathea>
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
Cc: metze@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 10, 2020 at 07:26:10AM +0200, Andreas Schneider via samba-technical wrote:
> On Tuesday, 9 June 2020 19:25:03 CEST Andreas Schneider wrote:
> 
> > commit b458f8fbb7febf3584fa648128b4e1dc764059f7
> > Author: Stefan Metzmacher <metze@samba.org>
> > Date:   Wed Aug 7 12:11:58 2019 +0200
> > 
> >     s3:libsmb: add a cache for cli_session_creds_prepare_krb5()
> > 
> >     Signed-off-by: Stefan Metzmacher <metze@samba.org>
> >     Reviewed-by: Andreas Schneider <asn@samba.org>
> >     Reviewed-by: Volker Lendecke <vl@samba.org>
> 
> Ups, this was pushed by accident. Should I revert this or do we deal with this 
> later?

What effect does it have ?

