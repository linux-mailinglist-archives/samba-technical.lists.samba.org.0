Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2DD6243C5
	for <lists+samba-technical@lfdr.de>; Thu, 10 Nov 2022 15:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=jCNgCc7rWxVxBCQrymvbrTr8yI7N9FHw9/iPoRHZA2A=; b=vC5fgucwqErmpSHTZLxqIMn2ab
	DjtEAYytFTImV1btDTQ8vwrRGNaAKRA150Agry4i4896YReaiClWlV3O2b6p29rcjPWGnHxSn9nhc
	mHsvVOKcurVu/2EH5S71P7MQaxzCBiREulFSSvOwVODBn4Rt/417LjU2iPMgVX2u4AIr9+g5WYKdy
	fF50RSCQMv0/SoxVOdQr8TOOHcQ2dCv30XMj5sX50UgmTiO58FTe+Iqe/gX226LmjTVFSK7GyoRgu
	j9/7Pc0/Rge34A323X8Ugv/tuhqv/JxWfsRIhsUa+ldjJ8PXVVFAn+pv+rb27vJ7ilSg+r864rSMP
	FXv33HSg==;
Received: from ip6-localhost ([::1]:60210 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ot85V-00C0Bg-Jc; Thu, 10 Nov 2022 13:59:25 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:3::133]:34824) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ot85O-00C0BV-Pt
 for samba-technical@lists.samba.org; Thu, 10 Nov 2022 13:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jCNgCc7rWxVxBCQrymvbrTr8yI7N9FHw9/iPoRHZA2A=; b=Eyf5hKo8bpT1S0SaG+7aKuOgxg
 pO4cMp9tdtSf6dz9KBChgxdpsDVCtsiuUeP5yqs2OS22bG9WttFyvgNb6DUS/mUIxVIbz6352559+
 nO1BfIMN1polhhuUIaKVDPX3nXO8NTCqJp195voaWugEX207v8LmSnqSlCpKw7d+XV6oqiqOd59Dn
 bquwA7Kjs0RfWC3sO7rqd0mg78jf4UulBXvCaP9PopWS7QrEqpsr25s3rjT+mHSxGfpzAoAQPXpsf
 fhseWtAZmWDkvxfSPhkD0h/rj1CX8MAEKZ76OPd7NXUqFQqehF2uvTjK23QAJ6WHeI81mbCFpQwmG
 wXcqU6IQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1ot5wy-005SWo-SC; Thu, 10 Nov 2022 11:42:28 +0000
Date: Thu, 10 Nov 2022 03:42:28 -0800
To: David Disseldorp <ddiss@samba.org>
Subject: Re: reflink support and Samba running over XFS
Message-ID: <Y2zjpE6f6WLtkqiz@infradead.org>
References: <CAH2r5mtc6rHC=zfWCjmGMex0qJrYKeuAcryW95-ru0KyZsaqpA@mail.gmail.com>
 <Y2molp4pVGNO+kaw@jeremy-acer> <Y2n7lENy0jrUg7XD@infradead.org>
 <Y2qXLNM5xvxZHuLQ@jeremy-acer>
 <CAOQ4uxgyXtr6DU-eAP+kR1a7NsS-zDhXi5-0BJ7i=-erLa3-kg@mail.gmail.com>
 <Y2vzinRPFEBZyACg@jeremy-acer> <Y2v1zQbnPoqg+0aj@jeremy-acer>
 <Y2v+au3rvWOUOr1t@jeremy-acer>
 <20221109233055.43b26632@echidna.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109233055.43b26632@echidna.suse.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
From: Christoph Hellwig via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christoph Hellwig <hch@infradead.org>
Cc: CIFS <linux-cifs@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 Jeremy Allison via samba-technical <samba-technical@lists.samba.org>,
 metze@samba.org, Steve French <smfrench@gmail.com>, vl@samba.org,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Nov 09, 2022 at 11:30:55PM +0100, David Disseldorp via samba-technical wrote:
> I think it's doable too :-). As indicated in my other mail, I think
> FICLONERANGE will need to be used for FSCTL_DUP_EXTENTS_TO_FILE instead
> of copy_file_range().
> I'm not sure how to best handle FILE_SUPPORTS_BLOCK_REFCOUNTING -
> ideally we'd set it for Btrfs and XFS(reflink=1) backed shares only.
> Another option might be to advertise FILE_SUPPORTS_BLOCK_REFCOUNTING and
> then propagate errors up to the client if FICLONERANGE fails for
> FSCTL_DUP_EXTENTS_TO_FILE. Client copy fallback would work, but the
> extra request overhead would be ugly.

We could probably add a bit to struct statx if that is helpful for
samba.

