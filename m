Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9C1ECC0
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 00:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=sA09FBoPpkVYPV7VhhcEiSYhFqzxSh8nr0nNddyztyk=; b=Up9+ytAFtYDMT4KF1WYKPO7nh3
	ZXXbzb5n1Hz6mKgJbTY7O4+1Uew8I+Zh8fPZU7xWFIJWpRSrGvgol0XbL1IXdgXTrEuVyWSf+cTmf
	0XfiKD69GnBhVMrDGg0LDo/V6bVmQdoIl1vEg2sq0Ye8Dde3bPLBdGdjwQW7y4XJbPVXvNajZmjJz
	bOuAVBZ0zvmMu1nq6Vei/VPxg03aQDnw61i2QYywTNycMYLfhD+GJhl9EDpoEIHNFa5mKpMLiXsfM
	hqLocaaWdzaikSEV4FswtZJJ1hrPMDJF/0yycmdH0kPwrgiN8LgwFFU+2nizUl4OCErS/+0LIp+RV
	usV1gucg==;
Received: from localhost ([::1]:61044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLEkD-003lWs-GT; Mon, 29 Apr 2019 22:27:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:57914) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLEk9-003lWl-S2
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 22:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=sA09FBoPpkVYPV7VhhcEiSYhFqzxSh8nr0nNddyztyk=; b=dd9gISvtb/ih5s/pM9NsRphFIw
 sA67MU9HTbr71hn9DBNBKIj1OH15yLJxJ7Gcg/pTjvFtLPlPytWACcGtT7KGJ/7C1VvD5vKN11xrD
 mcgxEYUya4rxHj1zL8jAs8h8Et3MPi0z8VvcUsqvBVM0MtN2m0fQKWvWg54AooPoxZj8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLEk8-0001Ys-Rz; Mon, 29 Apr 2019 22:27:25 +0000
Date: Mon, 29 Apr 2019 15:27:21 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: [PATCH] Revert "wafsamba: Enable warnings for missing field
 initializer"
Message-ID: <20190429222719.GB18192@samba.org>
References: <20190429193555.GA28948@samba.org>
 <1556575702.25595.75.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556575702.25595.75.camel@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Apr 30, 2019 at 10:08:22AM +1200, Andrew Bartlett via samba-technical wrote:
> On Mon, 2019-04-29 at 12:36 -0700, Christof Schmitt via samba-technical 
> wrote:
> > Revert the patch adding the warnings since that causes problems when
> > compiling master on RHEL7. Many C99 initializers of nested structs are
> > flagged as problematic, so it seems easier to remove the additional
> > compiler checks.
> 
> Shouldn't older OS versions just not be compiled with --picky-
> developer?
> 
> I don't mind if a test is added to wscript to detect and fail --picky-
> developer on such hosts, but RHEL7 is actually just as old as Ubuntu
> 14.04 which we just retired. 

The main difference between Ubuntu 14.04 and RHEL7 seems to be the
support cycle. I still see RHEL7 in commonly used.  I was wrong about
"picky developer", the option is currently added for all developer
builds.

For the time being, I would like to keep the ability to build and test
master on RHEL7. If others object, this is ok with me.

> Hopefully RHEL8 is just around the corner.

Maybe, but due to the long support cycle, RHEL7 will likely still be
in common use for the next year or two.

Christof

