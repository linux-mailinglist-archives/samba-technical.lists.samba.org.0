Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F119F711
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2019 01:50:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Sl4MIGd6owV80UD2IcwHUssJKD/I59CAWEfquEOtMTA=; b=EK5vxAzDXFXXySa4D4mknoGQi7
	ufErw+PYhSzGGLvnhaQBXO3UHKIC8kYHHjlRV4qHCm/J4RT5ZII+LjybvlL4BhfBjQAoJzlYYxFzE
	PJo2jUaLr7IIINzq/IH8MaEvqn/iAVA28H3/8JPoINBLg2K9PCEXOhrgnsD1xVew9ZYZzlVt6DNge
	2PKzAzK1bBo+mTn67WEJd3a1XuidmmPvhfitoamJyOMWA94EwU29Z6pUnjQJhux4ekyyi3N7bWK+1
	TRZgTTrZb2v9iHFhuLAUMHQErGHjLk/gpVCFFRXlbBvKddD3mYGKiWKLmNB8GUSWkp5xydNY6dPHc
	MuJ/5KPg==;
Received: from localhost ([::1]:45782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i2lED-008qF6-Ap; Tue, 27 Aug 2019 23:50:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12288) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2lE9-008qEz-O8
 for samba-technical@lists.samba.org; Tue, 27 Aug 2019 23:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Sl4MIGd6owV80UD2IcwHUssJKD/I59CAWEfquEOtMTA=; b=E9lO2lp8Y0gNgwneUc6iEYzIVw
 M2EwRqWKHBH/ZRtTHZYnc+cD0aGKwFzjwABDLnoVp4369Wfe4dW1o1WSa/ui5HLTOAD1Dyg2a/EdZ
 Mwpr8wNt78XxZHyOwKwaLGn+1GDp2eOiVeAmrzYanZuDEi3+filMloUntXko5J7/KS3w=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i2lE9-0007XS-4s; Tue, 27 Aug 2019 23:50:17 +0000
Date: Tue, 27 Aug 2019 16:50:14 -0700
To: Abhidnya Joshi <abhidnyachirmule@gmail.com>
Subject: Re: Query about slow read performance
Message-ID: <20190827235014.GB219881@jra4>
References: <CALmqtCXzTfqrOX_rSoR5nbEqGvcO1Xeuk7a+56+uoC0nh_-Kmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALmqtCXzTfqrOX_rSoR5nbEqGvcO1Xeuk7a+56+uoC0nh_-Kmg@mail.gmail.com>
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

On Fri, Aug 23, 2019 at 12:24:34PM +0530, Abhidnya Joshi via samba-technical wrote:
> Hi All,
> 
> Recently while doing single file read testing on SMB2 from our product to
> Win2008 (as client), we saw some performance degradation.
> 
> Although we are finding out causes in our SMB server, we can somehow see
> this degradation when the Win2008 got security patch applied.
> 
> *2019-03 Servicing Stack Update for Windows Server 2008 R2 for x64-based
> Systems (KB4490628)*
> 
> The performance drop is not observed for write but only for reads and the
> cap seen is around 260-280 Mbps. (Earlier it was around 520 Mbps). The
> security patch does not have anything directly related to I/O or SMB but
> this is what we are observing.
> 
> My question here is, has anyone observed any of such problem recently with
> Win2k8 used as client?

Nope, this is the first I've heard of it. Can you do a comparative
wireshark trace between an unpatched client and a patched client
to look at the differences in how they're driving the server.

Any credit changes ?

