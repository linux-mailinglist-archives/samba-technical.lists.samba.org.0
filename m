Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E29A31D36A3
	for <lists+samba-technical@lfdr.de>; Thu, 14 May 2020 18:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mEKdkb224Y+6uwp/g2xAfAMY363iCg9pDRDlCdS+FVQ=; b=mNXAMaMuZI4BoxonSg7fmRIPF1
	WABZ8G+UNUoYPOJakB7iunCl1IyO1GohplGUIqkye5+clD/58IrIdKF0fPZOxtGxX/R/ic06f83Yq
	6ItDdFP1bbjUlSWORGaMI2gQjPL4OIpT9+274BPvytOkEYuhwwytLl1FkGXvTYrLNdJrFFuDxligb
	nuQ2PugbayqCuscDc+vlRB8r74yEMwX2GGoklmrCZTtDtTtn8I2cG+gMNGijHa7AYiS1QSThQJnrJ
	+qwbCTIMKOJZumEn5Nis1CDFwIZO1GP1RBnEu/EjoMpEWcg9BziLnUbrAEy60DRRkCJsEPloegrTn
	OvM+IKQQ==;
Received: from localhost ([::1]:27354 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZGqv-004LPZ-4v; Thu, 14 May 2020 16:36:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47500) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZGqo-004LPS-26
 for samba-technical@lists.samba.org; Thu, 14 May 2020 16:36:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=mEKdkb224Y+6uwp/g2xAfAMY363iCg9pDRDlCdS+FVQ=; b=wXEdSOCdJbmMK1vvxD3xaeSesO
 NJhdrGGikuuh0726IMNCRCd1EM+TapHtbP4/eGfja62WsmRvCDUY1SHlNl3kpCIBZ8kEbp5cSTtdX
 sm6l1qX+6Jna0rJbebZyPCdARfXojmmH97tejTsL5y3mO8UozHCbWvy8aimuXu+Coxk5byiXx7JeH
 VxURlFLygzrm5YUZn/V+5s7Fcc7e7L7yVy2eYLGREbJHZFrgGGTRmoHJd6HKMGpQ2Ds+5bwDmuJMR
 AkVzJ9D/T7pFCj01jGbIGr/f0KoVgH3ykObFRyQp1sBoxS05hkOX6CM/9IhvI2HuquZtTLNwEztqB
 RgMggJue3SvqXLqtyP/qb1suQJLBmyvfTXUxlYJP1iK52wq31Ckn+EuMYs9GxFEr/Ll6tOGs7xLce
 CY7TIO4Nf4+dL7Ru7ZMNBRVadB5UJEFktF4TtwYKFXEs1p6G+fe7TRbygLrmAuyKUUFpb1dEGZQRs
 FYqiIu4qFh+FMUCj8T9nX3cv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jZGqn-0005Dd-1G; Thu, 14 May 2020 16:36:49 +0000
Date: Thu, 14 May 2020 09:36:42 -0700
To: Anoop C S <anoopcs@cryptolab.net>
Subject: Re: Behaviour mismatch between "store dos attributes" and "map
 archive" from man smb.conf(5)
Message-ID: <20200514163642.GB5564@jeremy-acer>
References: <e0d86c0fb92046e0f201cc14a112701ca891196a.camel@cryptolab.net>
 <20200513184233.GB9585@jeremy-acer>
 <20200513221431.GA7185@samba.org>
 <20200513225131.GG9585@jeremy-acer>
 <20200513233612.GB7185@samba.org>
 <20200514005508.GA21149@jeremy-acer>
 <edbc6471b5cfbeae515111411ea5f0e49228f5b7.camel@cryptolab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edbc6471b5cfbeae515111411ea5f0e49228f5b7.camel@cryptolab.net>
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
Cc: samba-technical <samba-technical@lists.samba.org>,
 Michael Adam <obnox@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 14, 2020 at 01:40:06PM +0530, Anoop C S wrote:
> On Wed, 2020-05-13 at 17:55 -0700, Jeremy Allison via samba-technical
> wrote:
> > On Thu, May 14, 2020 at 01:36:12AM +0200, Michael Adam wrote:
> > > Right, and this is done unconditionally in open_file_ntcreate(),
> > > I mean without checking lp_store_dos_attributes() first. So the
> > > manpage is clearly wrong. store-dos-attributes disables none of
> > > the map options. We only see the effect for map archive since
> > > the other three default to "no" anyway...
> > 
> > Yep.
> > 
> > > What I am wondering is this:
> > > If the file is created with SEC_RIGHTS_FILE_ALL, shouldn't it
> > > get execute permissions, even if "map archive = no"?
> > > After all, "map archive = no" does not prevent execute from
> > > being set, it just doesn't set it because of archive...
> > 
> > No. SEC_RIGHTS_FILE_ALL is only to do with the access permissions
> > on the handle, not the permissions on the file.
> 
> But what if file does not exist and is being created? Consider
> smb2.read.position where it starts with an already existing file. If we
> remove the file prior to executing this sub-test, it passes even with
> "map archive = no"(of course without execute bit set). What does that
> mean?

This is only the case where files are being created. Remember,
SEC_RIGHTS_FILE_ALL is *nothing* to do with the permission on
the file being created, it *only* concerns the rights on the
handle (the fd).

